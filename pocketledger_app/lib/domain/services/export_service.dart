import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import '../models/envelope.dart';
import '../models/transaction.dart';
import '../models/transfer.dart';
import '../models/recurring_bill.dart';
import '../repositories/envelope_repository.dart';
import '../repositories/transaction_repository.dart';
import '../repositories/recurring_repository.dart';
import '../../data/repositories/sqlite_transfer_repository.dart';

class ExportService {
  final EnvelopeRepository envelopeRepo;
  final TransactionRepository transactionRepo;
  final RecurringRepository recurringRepo;
  final SqliteTransferRepository transferRepo;

  const ExportService({
    required this.envelopeRepo,
    required this.transactionRepo,
    required this.recurringRepo,
    required this.transferRepo,
  });

  /// Export all data as JSON backup
  Future<String> exportJson() async {
    final envelopes = await envelopeRepo.getAll();
    final transactions = await transactionRepo.getAll();
    final transfers = await transferRepo.getAll();
    final recurring = await recurringRepo.getAll();

    final data = {
      'version': 1,
      'exportDate': DateTime.now().toIso8601String(),
      'envelopes': envelopes.map((e) => e.toJson()).toList(),
      'transactions': transactions.map((t) => t.toJson()).toList(),
      'transfers': transfers.map((t) => t.toJson()).toList(),
      'recurringBills': recurring.map((r) => r.toJson()).toList(),
    };

    final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final file = File('${dir.path}/pocketledger_backup_$timestamp.json');
    await file.writeAsString(jsonStr);
    return file.path;
  }

  /// Import data from JSON backup
  Future<void> importJson(String filePath) async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final data = json.decode(jsonStr) as Map<String, dynamic>;

    // Import envelopes
    final envelopeList = data['envelopes'] as List<dynamic>;
    for (final e in envelopeList) {
      final envelope = Envelope.fromJson(e as Map<String, dynamic>);
      await envelopeRepo.insert(envelope);
    }

    // Import transactions
    final txList = data['transactions'] as List<dynamic>;
    for (final t in txList) {
      final tx = Transaction.fromJson(t as Map<String, dynamic>);
      await transactionRepo.insert(tx);
    }

    // Import transfers
    final transferList = data['transfers'] as List<dynamic>? ?? [];
    for (final t in transferList) {
      final transfer = Transfer.fromJson(t as Map<String, dynamic>);
      await transferRepo.insert(transfer);
    }

    // Import recurring bills
    final recurringList = data['recurringBills'] as List<dynamic>? ?? [];
    for (final r in recurringList) {
      final bill = RecurringBill.fromJson(r as Map<String, dynamic>);
      await recurringRepo.insert(bill);
    }
  }

  /// Export transactions as CSV
  Future<String> exportCsv() async {
    final envelopes = await envelopeRepo.getAll();
    final envelopeMap = {for (final e in envelopes) e.id: e.name};
    final transactions = await transactionRepo.getAll();
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    final buffer = StringBuffer();
    buffer.writeln('Date,Envelope,Amount,Description,IsRecurring');

    for (final tx in transactions) {
      final envName = envelopeMap[tx.envelopeId] ?? 'Unknown';
      final dateStr = dateFormat.format(tx.date);
      final desc = tx.description.replaceAll(',', ';').replaceAll('"', "'");
      buffer.writeln(
        '$dateStr,"$envName",${tx.amount},"$desc",${tx.isRecurring}',
      );
    }

    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final file = File('${dir.path}/pocketledger_export_$timestamp.csv');
    await file.writeAsString(buffer.toString());
    return file.path;
  }
}
