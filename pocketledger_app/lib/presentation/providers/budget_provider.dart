import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/envelope.dart';
import '../../domain/models/transaction.dart';
import '../../domain/models/transfer.dart';
import '../../domain/models/recurring_bill.dart';
import '../../domain/services/budget_engine.dart';
import '../../domain/repositories/envelope_repository.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/repositories/recurring_repository.dart';
import '../../data/repositories/sqlite_transfer_repository.dart';
import '../../services/iap_service.dart';
import '../../core/constants.dart';

class BudgetProvider extends ChangeNotifier {
  final EnvelopeRepository envelopeRepo;
  final TransactionRepository transactionRepo;
  final RecurringRepository recurringRepo;
  final SqliteTransferRepository transferRepo;
  final BudgetEngine budgetEngine;
  final IapService iapService;

  List<Envelope> _envelopes = [];
  List<Transaction> _transactions = [];
  List<Transfer> _transfers = [];
  List<RecurringBill> _recurringBills = [];
  double _totalRemaining = 0;
  double _savingsRate = 0;
  double _dailyBurnRate = 0;
  bool _isLoading = false;

  BudgetProvider({
    required this.envelopeRepo,
    required this.transactionRepo,
    required this.recurringRepo,
    required this.transferRepo,
    required this.budgetEngine,
    required this.iapService,
  });

  // Getters
  List<Envelope> get envelopes => _envelopes;
  List<Transaction> get transactions => _transactions;
  List<Transfer> get transfers => _transfers;
  List<RecurringBill> get recurringBills => _recurringBills;
  double get totalRemaining => _totalRemaining;
  double get savingsRate => _savingsRate;
  double get dailyBurnRate => _dailyBurnRate;
  bool get isLoading => _isLoading;
  bool get isPremium => iapService.isPremium;

  bool get canCreateEnvelope =>
      isPremium || _envelopes.length < kFreeEnvelopeLimit;

  bool get canUseRecurringBills => isPremium;
  bool get canExportImport => isPremium;

  /// Uncleared transaction count (for reconciliation)
  int get unclearedCount =>
      _transactions.where((t) => !t.isCleared).length;

  /// Sum of uncleared transaction amounts (expenses positive, income negative)
  double get unclearedSum => _transactions
      .where((t) => !t.isCleared)
      .fold(0.0, (s, t) => s + (t.isExpense ? t.amount : -t.amount));

  static const _uuid = Uuid();

  Future<void> loadAll() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Process recurring bills first
      await budgetEngine.processRecurringBills();
      await budgetEngine.recalculateBalances();

      _envelopes = await envelopeRepo.getAll();
      _transactions = await transactionRepo.getAll();
      _transfers = await transferRepo.getAll();
      _recurringBills = await recurringRepo.getAll();
      _totalRemaining = await budgetEngine.getTotalRemaining();
      _savingsRate = await budgetEngine.getSavingsRate();
      _dailyBurnRate = await budgetEngine.getDailyBurnRate();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Envelope CRUD
  Future<void> addEnvelope({
    required String name,
    required double budgetAmount,
    required int colorValue,
    String icon = 'account_balance_wallet',
  }) async {
    final envelope = Envelope(
      id: _uuid.v4(),
      name: name,
      budgetAmount: budgetAmount,
      colorValue: colorValue,
      icon: icon,
      sortOrder: _envelopes.length,
      createdAt: DateTime.now(),
    );
    await envelopeRepo.insert(envelope);
    await _refreshData();
  }

  Future<void> updateEnvelope(Envelope envelope) async {
    await envelopeRepo.update(envelope);
    await _refreshData();
  }

  Future<void> deleteEnvelope(String id) async {
    await transactionRepo.deleteByEnvelopeId(id);
    await envelopeRepo.delete(id);
    await _refreshData();
  }

  // Transaction CRUD
  Future<void> addTransaction({
    required String envelopeId,
    required double amount,
    String description = '',
    DateTime? date,
    String? receiptPath,
    bool isExpense = true,
    bool isCleared = false,
  }) async {
    final transaction = Transaction(
      id: _uuid.v4(),
      envelopeId: envelopeId,
      amount: amount,
      description: description,
      date: date ?? DateTime.now(),
      receiptPath: receiptPath,
      isExpense: isExpense,
      isCleared: isCleared,
    );
    await transactionRepo.insert(transaction);
    await budgetEngine.recalculateBalances();
    await _refreshData();
  }

  Future<void> updateTransaction(Transaction transaction) async {
    await transactionRepo.update(transaction);
    await budgetEngine.recalculateBalances();
    await _refreshData();
  }

  Future<void> deleteTransaction(String id) async {
    // Delete associated receipt file if present
    final tx = await transactionRepo.getById(id);
    if (tx?.receiptPath != null) {
      try {
        final file = File(tx!.receiptPath!);
        if (await file.exists()) await file.delete();
      } catch (_) {
        // Ignore file deletion errors
      }
    }
    await transactionRepo.delete(id);
    await budgetEngine.recalculateBalances();
    await _refreshData();
  }

  Future<void> clearTransaction(String id, bool isCleared) async {
    final transaction = await transactionRepo.getById(id);
    if (transaction == null) return;
    await transactionRepo.update(transaction.copyWith(isCleared: isCleared));
    await _refreshData();
  }

  // Transfer
  Future<void> addTransfer({
    required String fromEnvelopeId,
    required String toEnvelopeId,
    required double amount,
    String? note,
  }) async {
    final transfer = Transfer(
      id: _uuid.v4(),
      fromEnvelopeId: fromEnvelopeId,
      toEnvelopeId: toEnvelopeId,
      amount: amount,
      note: note,
      date: DateTime.now(),
    );
    await transferRepo.insert(transfer);

    // Create transactions for both envelopes
    await transactionRepo.insert(Transaction(
      id: _uuid.v4(),
      envelopeId: fromEnvelopeId,
      amount: amount,
      description: 'Transfer out${note != null ? ': $note' : ''}',
      date: DateTime.now(),
    ));
    await transactionRepo.insert(Transaction(
      id: _uuid.v4(),
      envelopeId: toEnvelopeId,
      amount: -amount, // Negative = adds back to budget (reduces spent)
      description: 'Transfer in${note != null ? ': $note' : ''}',
      date: DateTime.now(),
    ));

    await budgetEngine.recalculateBalances();
    await _refreshData();
  }

  // Recurring bills
  Future<void> addRecurringBill({
    required String envelopeId,
    required String name,
    required double amount,
    required int dayOfMonth,
  }) async {
    if (!isPremium) {
      throw PremiumRequiredException('Recurring bills require Premium.');
    }
    final bill = RecurringBill(
      id: _uuid.v4(),
      envelopeId: envelopeId,
      name: name,
      amount: amount,
      dayOfMonth: dayOfMonth,
      createdAt: DateTime.now(),
    );
    await recurringRepo.insert(bill);
    await _refreshData();
  }

  Future<void> updateRecurringBill(RecurringBill bill) async {
    await recurringRepo.update(bill);
    await _refreshData();
  }

  Future<void> deleteRecurringBill(String id) async {
    await recurringRepo.delete(id);
    await _refreshData();
  }

  Future<void> toggleRecurringBill(RecurringBill bill) async {
    final updated = bill.copyWith(isActive: !bill.isActive);
    await recurringRepo.update(updated);
    await _refreshData();
  }

  // Monthly reset
  Future<void> monthlyReset() async {
    await budgetEngine.monthlyReset();
    await _refreshData();
  }

  // Filtering
  Future<List<Transaction>> getTransactionsByEnvelope(
      String envelopeId) async {
    return transactionRepo.getByEnvelopeId(envelopeId);
  }

  Future<List<Transaction>> getTransactionsByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    return transactionRepo.getByDateRange(start, end);
  }

  Future<List<Transaction>> getTransactionsByEnvelopeAndDateRange(
    String envelopeId,
    DateTime start,
    DateTime end,
  ) async {
    return transactionRepo.getByEnvelopeAndDateRange(
      envelopeId,
      start,
      end,
    );
  }

  Future<void> _refreshData() async {
    _envelopes = await envelopeRepo.getAll();
    _transactions = await transactionRepo.getAll();
    _transfers = await transferRepo.getAll();
    _recurringBills = await recurringRepo.getAll();
    _totalRemaining = await budgetEngine.getTotalRemaining();
    _savingsRate = await budgetEngine.getSavingsRate();
    _dailyBurnRate = await budgetEngine.getDailyBurnRate();
    notifyListeners();
  }
}

/// Thrown when a free-tier user attempts a premium-only operation.
class PremiumRequiredException implements Exception {
  final String message;
  const PremiumRequiredException(this.message);

  @override
  String toString() => 'PremiumRequiredException: $message';
}
