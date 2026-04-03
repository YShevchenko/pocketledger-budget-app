import 'package:uuid/uuid.dart';
import '../models/recurring_bill.dart';
import '../models/transaction.dart';
import '../repositories/envelope_repository.dart';
import '../repositories/transaction_repository.dart';
import '../repositories/recurring_repository.dart';

class BudgetEngine {
  final EnvelopeRepository envelopeRepo;
  final TransactionRepository transactionRepo;
  final RecurringRepository recurringRepo;

  const BudgetEngine({
    required this.envelopeRepo,
    required this.transactionRepo,
    required this.recurringRepo,
  });

  /// Recalculate spent amounts for all envelopes in the current month
  Future<void> recalculateBalances() async {
    final envelopes = await envelopeRepo.getAll();
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);
    final monthEnd = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    for (final envelope in envelopes) {
      final spent = await transactionRepo.sumByEnvelopeIdAndDateRange(
        envelope.id,
        monthStart,
        monthEnd,
      );
      await envelopeRepo.updateSpentAmount(envelope.id, spent);
    }
  }

  /// Process recurring bills that are due.
  /// Called on app open. Creates transactions for any bills that haven't
  /// been processed for the current month.
  Future<List<Transaction>> processRecurringBills() async {
    final bills = await recurringRepo.getActive();
    final now = DateTime.now();
    final createdTransactions = <Transaction>[];
    const uuid = Uuid();

    for (final bill in bills) {
      if (_shouldProcess(bill, now)) {
        // Determine the transaction date (bill day in current month)
        final txDay = bill.dayOfMonth > _daysInMonth(now.year, now.month)
            ? _daysInMonth(now.year, now.month)
            : bill.dayOfMonth;
        final txDate = DateTime(now.year, now.month, txDay);

        final transaction = Transaction(
          id: uuid.v4(),
          envelopeId: bill.envelopeId,
          amount: bill.amount,
          description: bill.name,
          date: txDate,
          isRecurring: true,
          recurringBillId: bill.id,
        );

        await transactionRepo.insert(transaction);
        await recurringRepo.updateLastProcessed(bill.id, now);
        createdTransactions.add(transaction);
      }
    }

    if (createdTransactions.isNotEmpty) {
      await recalculateBalances();
    }

    return createdTransactions;
  }

  bool _shouldProcess(RecurringBill bill, DateTime now) {
    if (bill.lastProcessedDate == null) return now.day >= bill.dayOfMonth;

    final lastProcessed = bill.lastProcessedDate!;
    // Already processed this month
    if (lastProcessed.year == now.year && lastProcessed.month == now.month) {
      return false;
    }
    // It's a new month and we're past the bill day
    return now.day >= bill.dayOfMonth;
  }

  int _daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Reset all envelope spent amounts to zero (monthly reset)
  Future<void> monthlyReset() async {
    await envelopeRepo.resetAllSpent();
  }

  /// Get total budget across all envelopes
  Future<double> getTotalBudget() async {
    final envelopes = await envelopeRepo.getAll();
    return envelopes.fold<double>(0.0, (sum, e) => sum + e.budgetAmount);
  }

  /// Get total spent across all envelopes
  Future<double> getTotalSpent() async {
    final envelopes = await envelopeRepo.getAll();
    return envelopes.fold<double>(0.0, (sum, e) => sum + e.spentAmount);
  }

  /// Get total remaining across all envelopes
  Future<double> getTotalRemaining() async {
    final budget = await getTotalBudget();
    final spent = await getTotalSpent();
    return budget - spent;
  }

  /// Get savings rate (percentage of budget not spent)
  Future<double> getSavingsRate() async {
    final budget = await getTotalBudget();
    if (budget <= 0) return 0.0;
    final spent = await getTotalSpent();
    return ((budget - spent) / budget * 100).clamp(-100.0, 100.0);
  }

  /// Get daily burn rate (average spent per day this month)
  Future<double> getDailyBurnRate() async {
    final now = DateTime.now();
    final daysElapsed = now.day;
    if (daysElapsed <= 0) return 0.0;
    final spent = await getTotalSpent();
    return spent / daysElapsed;
  }
}
