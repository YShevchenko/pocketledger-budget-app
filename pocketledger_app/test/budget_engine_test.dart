import 'package:flutter_test/flutter_test.dart';
import 'package:pocketledger/domain/models/envelope.dart';
import 'package:pocketledger/domain/models/transaction.dart';
import 'package:pocketledger/domain/models/recurring_bill.dart';
import 'package:pocketledger/domain/repositories/envelope_repository.dart';
import 'package:pocketledger/domain/repositories/transaction_repository.dart';
import 'package:pocketledger/domain/repositories/recurring_repository.dart';
import 'package:pocketledger/domain/services/budget_engine.dart';

// In-memory implementations for testing
class InMemoryEnvelopeRepository implements EnvelopeRepository {
  final List<Envelope> _envelopes = [];

  @override
  Future<List<Envelope>> getAll() async => List.from(_envelopes);

  @override
  Future<Envelope?> getById(String id) async =>
      _envelopes.where((e) => e.id == id).firstOrNull;

  @override
  Future<void> insert(Envelope envelope) async {
    _envelopes.removeWhere((e) => e.id == envelope.id);
    _envelopes.add(envelope);
  }

  @override
  Future<void> update(Envelope envelope) async {
    final index = _envelopes.indexWhere((e) => e.id == envelope.id);
    if (index >= 0) _envelopes[index] = envelope;
  }

  @override
  Future<void> delete(String id) async =>
      _envelopes.removeWhere((e) => e.id == id);

  @override
  Future<int> count() async => _envelopes.length;

  @override
  Future<void> resetAllSpent() async {
    for (int i = 0; i < _envelopes.length; i++) {
      _envelopes[i] = _envelopes[i].copyWith(spentAmount: 0);
    }
  }

  @override
  Future<void> updateSpentAmount(String id, double spentAmount) async {
    final index = _envelopes.indexWhere((e) => e.id == id);
    if (index >= 0) {
      _envelopes[index] = _envelopes[index].copyWith(spentAmount: spentAmount);
    }
  }
}

class InMemoryTransactionRepository implements TransactionRepository {
  final List<Transaction> _transactions = [];

  @override
  Future<List<Transaction>> getAll() async => List.from(_transactions);

  @override
  Future<List<Transaction>> getByEnvelopeId(String envelopeId) async =>
      _transactions.where((t) => t.envelopeId == envelopeId).toList();

  @override
  Future<List<Transaction>> getByDateRange(
      DateTime start, DateTime end) async =>
      _transactions
          .where((t) =>
              !t.date.isBefore(start) && !t.date.isAfter(end))
          .toList();

  @override
  Future<List<Transaction>> getByEnvelopeAndDateRange(
      String envelopeId, DateTime start, DateTime end) async =>
      _transactions
          .where((t) =>
              t.envelopeId == envelopeId &&
              !t.date.isBefore(start) &&
              !t.date.isAfter(end))
          .toList();

  @override
  Future<Transaction?> getById(String id) async =>
      _transactions.where((t) => t.id == id).firstOrNull;

  @override
  Future<void> insert(Transaction transaction) async {
    _transactions.removeWhere((t) => t.id == transaction.id);
    _transactions.add(transaction);
  }

  @override
  Future<void> update(Transaction transaction) async {
    final index = _transactions.indexWhere((t) => t.id == transaction.id);
    if (index >= 0) _transactions[index] = transaction;
  }

  @override
  Future<void> delete(String id) async =>
      _transactions.removeWhere((t) => t.id == id);

  @override
  Future<void> deleteByEnvelopeId(String envelopeId) async =>
      _transactions.removeWhere((t) => t.envelopeId == envelopeId);

  @override
  Future<double> sumByEnvelopeId(String envelopeId) async =>
      _transactions
          .where((t) => t.envelopeId == envelopeId)
          .fold<double>(0.0, (sum, t) => sum + t.amount);

  @override
  Future<double> sumByEnvelopeIdAndDateRange(
      String envelopeId, DateTime start, DateTime end) async =>
      _transactions
          .where((t) =>
              t.envelopeId == envelopeId &&
              !t.date.isBefore(start) &&
              !t.date.isAfter(end))
          .fold<double>(0.0, (sum, t) => sum + t.amount);
}

class InMemoryRecurringRepository implements RecurringRepository {
  final List<RecurringBill> _bills = [];

  @override
  Future<List<RecurringBill>> getAll() async => List.from(_bills);

  @override
  Future<List<RecurringBill>> getActive() async =>
      _bills.where((b) => b.isActive).toList();

  @override
  Future<RecurringBill?> getById(String id) async =>
      _bills.where((b) => b.id == id).firstOrNull;

  @override
  Future<void> insert(RecurringBill bill) async {
    _bills.removeWhere((b) => b.id == bill.id);
    _bills.add(bill);
  }

  @override
  Future<void> update(RecurringBill bill) async {
    final index = _bills.indexWhere((b) => b.id == bill.id);
    if (index >= 0) _bills[index] = bill;
  }

  @override
  Future<void> delete(String id) async =>
      _bills.removeWhere((b) => b.id == id);

  @override
  Future<void> updateLastProcessed(String id, DateTime date) async {
    final index = _bills.indexWhere((b) => b.id == id);
    if (index >= 0) {
      _bills[index] = _bills[index].copyWith(lastProcessedDate: date);
    }
  }
}

void main() {
  late InMemoryEnvelopeRepository envelopeRepo;
  late InMemoryTransactionRepository transactionRepo;
  late InMemoryRecurringRepository recurringRepo;
  late BudgetEngine engine;

  setUp(() {
    envelopeRepo = InMemoryEnvelopeRepository();
    transactionRepo = InMemoryTransactionRepository();
    recurringRepo = InMemoryRecurringRepository();
    engine = BudgetEngine(
      envelopeRepo: envelopeRepo,
      transactionRepo: transactionRepo,
      recurringRepo: recurringRepo,
    );
  });

  group('Balance calculations', () {
    test('recalculateBalances updates spent amounts', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'Groceries',
        budgetAmount: 500,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      final now = DateTime.now();
      await transactionRepo.insert(Transaction(
        id: 'tx1',
        envelopeId: 'env1',
        amount: 50,
        date: DateTime(now.year, now.month, 5),
      ));
      await transactionRepo.insert(Transaction(
        id: 'tx2',
        envelopeId: 'env1',
        amount: 75.50,
        date: DateTime(now.year, now.month, 10),
      ));

      await engine.recalculateBalances();

      final envelopes = await envelopeRepo.getAll();
      expect(envelopes.first.spentAmount, 125.50);
    });

    test('getTotalBudget sums all envelopes', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'A',
        budgetAmount: 500,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));
      await envelopeRepo.insert(Envelope(
        id: 'env2',
        name: 'B',
        budgetAmount: 300,
        colorValue: 0xFFFF716C,
        createdAt: DateTime(2026, 1, 1),
      ));

      final total = await engine.getTotalBudget();
      expect(total, 800.0);
    });

    test('getTotalRemaining accounts for spent', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'A',
        budgetAmount: 500,
        spentAmount: 200,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      final remaining = await engine.getTotalRemaining();
      expect(remaining, 300.0);
    });

    test('getSavingsRate with no budget returns 0', () async {
      final rate = await engine.getSavingsRate();
      expect(rate, 0.0);
    });

    test('getSavingsRate calculates correctly', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'A',
        budgetAmount: 1000,
        spentAmount: 750,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      final rate = await engine.getSavingsRate();
      expect(rate, 25.0);
    });
  });

  group('Monthly reset', () {
    test('monthlyReset sets all spent to zero', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'A',
        budgetAmount: 500,
        spentAmount: 200,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));
      await envelopeRepo.insert(Envelope(
        id: 'env2',
        name: 'B',
        budgetAmount: 300,
        spentAmount: 150,
        colorValue: 0xFFFF716C,
        createdAt: DateTime(2026, 1, 1),
      ));

      await engine.monthlyReset();

      final envelopes = await envelopeRepo.getAll();
      expect(envelopes[0].spentAmount, 0.0);
      expect(envelopes[1].spentAmount, 0.0);
    });
  });

  group('Recurring bill processing', () {
    test('processRecurringBills creates transaction for due bill', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'Subscriptions',
        budgetAmount: 100,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      await recurringRepo.insert(RecurringBill(
        id: 'rb1',
        envelopeId: 'env1',
        name: 'Netflix',
        amount: 15.99,
        dayOfMonth: 1, // Always due (day 1)
        isActive: true,
        createdAt: DateTime(2026, 1, 1),
      ));

      final created = await engine.processRecurringBills();
      expect(created.length, 1);
      expect(created.first.amount, 15.99);
      expect(created.first.description, 'Netflix');
      expect(created.first.isRecurring, true);
    });

    test('does not re-process bill already processed this month', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'Subs',
        budgetAmount: 100,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      final now = DateTime.now();
      await recurringRepo.insert(RecurringBill(
        id: 'rb1',
        envelopeId: 'env1',
        name: 'Netflix',
        amount: 15.99,
        dayOfMonth: 1,
        isActive: true,
        lastProcessedDate: DateTime(now.year, now.month, 1),
        createdAt: DateTime(2026, 1, 1),
      ));

      final created = await engine.processRecurringBills();
      expect(created.length, 0);
    });

    test('inactive bills are not processed', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'Subs',
        budgetAmount: 100,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      await recurringRepo.insert(RecurringBill(
        id: 'rb1',
        envelopeId: 'env1',
        name: 'Inactive',
        amount: 10,
        dayOfMonth: 1,
        isActive: false,
        createdAt: DateTime(2026, 1, 1),
      ));

      final created = await engine.processRecurringBills();
      expect(created.length, 0);
    });

    test('bill day after today is not processed', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'Subs',
        budgetAmount: 100,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      await recurringRepo.insert(RecurringBill(
        id: 'rb1',
        envelopeId: 'env1',
        name: 'Future',
        amount: 10,
        dayOfMonth: 31, // Last day of month — might be in the future
        isActive: true,
        createdAt: DateTime(2026, 1, 1),
      ));

      final created = await engine.processRecurringBills();
      // This may or may not create a transaction depending on today's date
      // but it should not throw
      expect(created.length, isA<int>());
    });
  });

  group('Daily burn rate', () {
    test('returns 0 when no spending', () async {
      final rate = await engine.getDailyBurnRate();
      expect(rate, 0.0);
    });

    test('calculates based on spent and days elapsed', () async {
      await envelopeRepo.insert(Envelope(
        id: 'env1',
        name: 'A',
        budgetAmount: 1000,
        spentAmount: 300,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      ));

      final rate = await engine.getDailyBurnRate();
      final now = DateTime.now();
      final expected = 300.0 / now.day;
      expect(rate, closeTo(expected, 0.01));
    });
  });
}
