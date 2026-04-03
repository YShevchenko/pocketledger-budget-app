import 'package:flutter_test/flutter_test.dart';
import 'package:pocketledger/domain/models/envelope.dart';
import 'package:pocketledger/domain/models/transaction.dart';
import 'package:pocketledger/domain/models/transfer.dart';
import 'package:pocketledger/domain/models/recurring_bill.dart';

void main() {
  group('Envelope', () {
    test('remainingAmount is budgetAmount minus spentAmount', () {
      final e = Envelope(
        id: '1',
        name: 'Groceries',
        budgetAmount: 500,
        spentAmount: 200,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(e.remainingAmount, 300.0);
    });

    test('isOverspent when spentAmount exceeds budgetAmount', () {
      final e = Envelope(
        id: '1',
        name: 'Dining',
        budgetAmount: 200,
        spentAmount: 220,
        colorValue: 0xFFFF716C,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(e.isOverspent, true);
      expect(e.remainingAmount, -20.0);
    });

    test('isOverspent false when under budget', () {
      final e = Envelope(
        id: '1',
        name: 'Transport',
        budgetAmount: 150,
        spentAmount: 65,
        colorValue: 0xFF7AE6FF,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(e.isOverspent, false);
    });

    test('spentPercentage clamps between 0 and 2', () {
      final e1 = Envelope(
        id: '1',
        name: 'Test',
        budgetAmount: 100,
        spentAmount: 50,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(e1.spentPercentage, 0.5);

      final e2 = Envelope(
        id: '2',
        name: 'Test2',
        budgetAmount: 100,
        spentAmount: 250,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(e2.spentPercentage, 2.0);
    });

    test('spentPercentage is 0 when budgetAmount is 0', () {
      final e = Envelope(
        id: '1',
        name: 'Zero',
        budgetAmount: 0,
        spentAmount: 0,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(e.spentPercentage, 0.0);
    });

    test('toMap and fromMap roundtrip', () {
      final original = Envelope(
        id: 'abc',
        name: 'Groceries',
        budgetAmount: 450.0,
        spentAmount: 123.45,
        colorValue: 0xFF3FFF8B,
        icon: 'shopping_cart',
        sortOrder: 2,
        createdAt: DateTime(2026, 4, 1),
      );
      final map = original.toMap();
      final restored = Envelope.fromMap(map);
      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.budgetAmount, original.budgetAmount);
      expect(restored.spentAmount, original.spentAmount);
      expect(restored.colorValue, original.colorValue);
      expect(restored.icon, original.icon);
      expect(restored.sortOrder, original.sortOrder);
    });

    test('toJson and fromJson roundtrip', () {
      final original = Envelope(
        id: 'xyz',
        name: 'Health',
        budgetAmount: 200,
        colorValue: 0xFFA78BFA,
        createdAt: DateTime(2026, 3, 15),
      );
      final json = original.toJson();
      final restored = Envelope.fromJson(json);
      expect(restored.id, original.id);
      expect(restored.name, original.name);
    });

    test('copyWith preserves unchanged fields', () {
      final original = Envelope(
        id: '1',
        name: 'Original',
        budgetAmount: 100,
        spentAmount: 50,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      );
      final modified = original.copyWith(name: 'Modified');
      expect(modified.name, 'Modified');
      expect(modified.budgetAmount, 100);
      expect(modified.id, '1');
    });

    test('equality based on id', () {
      final a = Envelope(
        id: '1',
        name: 'A',
        budgetAmount: 100,
        colorValue: 0xFF3FFF8B,
        createdAt: DateTime(2026, 1, 1),
      );
      final b = Envelope(
        id: '1',
        name: 'B',
        budgetAmount: 200,
        colorValue: 0xFFFF716C,
        createdAt: DateTime(2026, 2, 1),
      );
      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('Transaction', () {
    test('toMap and fromMap roundtrip', () {
      final original = Transaction(
        id: 'tx1',
        envelopeId: 'env1',
        amount: 42.50,
        description: 'Groceries at Publix',
        date: DateTime(2026, 4, 1, 14, 30),
        isRecurring: false,
      );
      final map = original.toMap();
      final restored = Transaction.fromMap(map);
      expect(restored.id, original.id);
      expect(restored.envelopeId, original.envelopeId);
      expect(restored.amount, original.amount);
      expect(restored.description, original.description);
      expect(restored.isRecurring, false);
      expect(restored.receiptPath, null);
    });

    test('serializes isRecurring correctly', () {
      final tx = Transaction(
        id: 'tx2',
        envelopeId: 'env1',
        amount: 100,
        date: DateTime(2026, 4, 1),
        isRecurring: true,
        recurringBillId: 'bill1',
      );
      final map = tx.toMap();
      expect(map['isRecurring'], 1);
      final restored = Transaction.fromMap(map);
      expect(restored.isRecurring, true);
      expect(restored.recurringBillId, 'bill1');
    });

    test('toJson and fromJson roundtrip', () {
      final original = Transaction(
        id: 'tx3',
        envelopeId: 'env2',
        amount: 99.99,
        description: 'Test',
        date: DateTime(2026, 3, 20),
        receiptPath: '/photos/receipt.jpg',
      );
      final json = original.toJson();
      final restored = Transaction.fromJson(json);
      expect(restored.receiptPath, '/photos/receipt.jpg');
    });

    test('copyWith', () {
      final original = Transaction(
        id: 'tx1',
        envelopeId: 'env1',
        amount: 50,
        date: DateTime(2026, 4, 1),
      );
      final modified = original.copyWith(amount: 75);
      expect(modified.amount, 75);
      expect(modified.envelopeId, 'env1');
    });
  });

  group('Transfer', () {
    test('toMap and fromMap roundtrip', () {
      final original = Transfer(
        id: 'tr1',
        fromEnvelopeId: 'env1',
        toEnvelopeId: 'env2',
        amount: 50.0,
        note: 'Rebalance',
        date: DateTime(2026, 4, 1),
      );
      final map = original.toMap();
      final restored = Transfer.fromMap(map);
      expect(restored.id, 'tr1');
      expect(restored.fromEnvelopeId, 'env1');
      expect(restored.toEnvelopeId, 'env2');
      expect(restored.amount, 50.0);
      expect(restored.note, 'Rebalance');
    });

    test('null note handled', () {
      final tr = Transfer(
        id: 'tr2',
        fromEnvelopeId: 'a',
        toEnvelopeId: 'b',
        amount: 100,
        date: DateTime(2026, 4, 1),
      );
      final map = tr.toMap();
      expect(map['note'], null);
      final restored = Transfer.fromMap(map);
      expect(restored.note, null);
    });
  });

  group('RecurringBill', () {
    test('toMap and fromMap roundtrip', () {
      final original = RecurringBill(
        id: 'rb1',
        envelopeId: 'env1',
        name: 'Netflix',
        amount: 15.99,
        dayOfMonth: 15,
        isActive: true,
        createdAt: DateTime(2026, 1, 1),
      );
      final map = original.toMap();
      final restored = RecurringBill.fromMap(map);
      expect(restored.id, 'rb1');
      expect(restored.name, 'Netflix');
      expect(restored.amount, 15.99);
      expect(restored.dayOfMonth, 15);
      expect(restored.isActive, true);
      expect(restored.lastProcessedDate, null);
    });

    test('isActive serialization', () {
      final active = RecurringBill(
        id: 'rb2',
        envelopeId: 'env1',
        name: 'Active',
        amount: 10,
        dayOfMonth: 1,
        isActive: true,
        createdAt: DateTime(2026, 1, 1),
      );
      expect(active.toMap()['isActive'], 1);

      final inactive = active.copyWith(isActive: false);
      expect(inactive.toMap()['isActive'], 0);
      final restored = RecurringBill.fromMap(inactive.toMap());
      expect(restored.isActive, false);
    });

    test('lastProcessedDate serialization', () {
      final date = DateTime(2026, 3, 15);
      final bill = RecurringBill(
        id: 'rb3',
        envelopeId: 'env1',
        name: 'With date',
        amount: 20,
        dayOfMonth: 10,
        lastProcessedDate: date,
        createdAt: DateTime(2026, 1, 1),
      );
      final map = bill.toMap();
      final restored = RecurringBill.fromMap(map);
      expect(restored.lastProcessedDate?.year, 2026);
      expect(restored.lastProcessedDate?.month, 3);
      expect(restored.lastProcessedDate?.day, 15);
    });
  });
}
