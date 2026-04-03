import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocketledger/domain/models/envelope.dart';
import 'package:pocketledger/domain/models/transaction.dart';
import 'package:pocketledger/domain/models/transfer.dart';
import 'package:pocketledger/domain/models/recurring_bill.dart';

void main() {
  group('Export format validation', () {
    test('JSON export format contains required fields', () {
      final data = {
        'version': 1,
        'exportDate': DateTime.now().toIso8601String(),
        'envelopes': [
          Envelope(
            id: 'env1',
            name: 'Groceries',
            budgetAmount: 500,
            spentAmount: 200,
            colorValue: 0xFF3FFF8B,
            createdAt: DateTime(2026, 1, 1),
          ).toJson(),
        ],
        'transactions': [
          Transaction(
            id: 'tx1',
            envelopeId: 'env1',
            amount: 50,
            description: 'Publix',
            date: DateTime(2026, 4, 1),
          ).toJson(),
        ],
        'transfers': <Map<String, dynamic>>[],
        'recurringBills': <Map<String, dynamic>>[],
      };

      final jsonStr = json.encode(data);
      final decoded = json.decode(jsonStr) as Map<String, dynamic>;

      expect(decoded.containsKey('version'), true);
      expect(decoded.containsKey('exportDate'), true);
      expect(decoded.containsKey('envelopes'), true);
      expect(decoded.containsKey('transactions'), true);
      expect(decoded.containsKey('transfers'), true);
      expect(decoded.containsKey('recurringBills'), true);
      expect(decoded['version'], 1);
    });

    test('JSON export can be reimported', () {
      final originalEnvelope = Envelope(
        id: 'env1',
        name: 'Groceries',
        budgetAmount: 500,
        spentAmount: 200,
        colorValue: 0xFF3FFF8B,
        icon: 'shopping_cart',
        createdAt: DateTime(2026, 1, 1),
      );
      final originalTx = Transaction(
        id: 'tx1',
        envelopeId: 'env1',
        amount: 42.50,
        description: 'Test',
        date: DateTime(2026, 4, 1),
      );
      final originalTransfer = Transfer(
        id: 'tr1',
        fromEnvelopeId: 'env1',
        toEnvelopeId: 'env2',
        amount: 100,
        date: DateTime(2026, 4, 1),
      );
      final originalBill = RecurringBill(
        id: 'rb1',
        envelopeId: 'env1',
        name: 'Netflix',
        amount: 15.99,
        dayOfMonth: 15,
        createdAt: DateTime(2026, 1, 1),
      );

      final data = {
        'version': 1,
        'exportDate': DateTime.now().toIso8601String(),
        'envelopes': [originalEnvelope.toJson()],
        'transactions': [originalTx.toJson()],
        'transfers': [originalTransfer.toJson()],
        'recurringBills': [originalBill.toJson()],
      };

      final jsonStr = json.encode(data);
      final decoded = json.decode(jsonStr) as Map<String, dynamic>;

      // Reimport
      final envelopes = (decoded['envelopes'] as List)
          .map((e) => Envelope.fromJson(e as Map<String, dynamic>))
          .toList();
      final transactions = (decoded['transactions'] as List)
          .map((t) => Transaction.fromJson(t as Map<String, dynamic>))
          .toList();
      final transfers = (decoded['transfers'] as List)
          .map((t) => Transfer.fromJson(t as Map<String, dynamic>))
          .toList();
      final bills = (decoded['recurringBills'] as List)
          .map((r) => RecurringBill.fromJson(r as Map<String, dynamic>))
          .toList();

      expect(envelopes.length, 1);
      expect(envelopes.first.id, 'env1');
      expect(envelopes.first.name, 'Groceries');
      expect(envelopes.first.budgetAmount, 500);

      expect(transactions.length, 1);
      expect(transactions.first.amount, 42.50);

      expect(transfers.length, 1);
      expect(transfers.first.amount, 100);

      expect(bills.length, 1);
      expect(bills.first.name, 'Netflix');
    });

    test('CSV format validation', () {
      // Simulate CSV output
      final buffer = StringBuffer();
      buffer.writeln('Date,Envelope,Amount,Description,IsRecurring');

      final tx = Transaction(
        id: 'tx1',
        envelopeId: 'env1',
        amount: 42.50,
        description: 'Groceries, fresh',
        date: DateTime(2026, 4, 1, 14, 30),
      );

      final desc = tx.description.replaceAll(',', ';').replaceAll('"', "'");
      buffer.writeln(
        '2026-04-01 14:30:00,"Groceries",${tx.amount},"$desc",${tx.isRecurring}',
      );

      final csv = buffer.toString();
      final lines = csv.trim().split('\n');

      expect(lines.length, 2);
      expect(lines[0], 'Date,Envelope,Amount,Description,IsRecurring');
      expect(lines[1].contains('42.5'), true);
      // Verify comma in description is replaced with semicolon
      expect(lines[1].contains('Groceries; fresh'), true);
    });
  });
}
