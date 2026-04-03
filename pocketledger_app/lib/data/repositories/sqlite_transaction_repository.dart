import 'package:sqflite/sqflite.dart' hide Transaction;
import '../../core/constants.dart';
import '../../data/database/app_database.dart';
import '../../domain/models/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';

class SqliteTransactionRepository implements TransactionRepository {
  @override
  Future<List<Transaction>> getAll() async {
    final db = await AppDatabase.database;
    final maps =
        await db.query(kTransactionsTable, orderBy: 'date DESC');
    return maps.map((m) => Transaction.fromMap(m)).toList();
  }

  @override
  Future<List<Transaction>> getByEnvelopeId(String envelopeId) async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kTransactionsTable,
      where: 'envelopeId = ?',
      whereArgs: [envelopeId],
      orderBy: 'date DESC',
    );
    return maps.map((m) => Transaction.fromMap(m)).toList();
  }

  @override
  Future<List<Transaction>> getByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kTransactionsTable,
      where: 'date >= ? AND date <= ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: 'date DESC',
    );
    return maps.map((m) => Transaction.fromMap(m)).toList();
  }

  @override
  Future<List<Transaction>> getByEnvelopeAndDateRange(
    String envelopeId,
    DateTime start,
    DateTime end,
  ) async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kTransactionsTable,
      where: 'envelopeId = ? AND date >= ? AND date <= ?',
      whereArgs: [
        envelopeId,
        start.toIso8601String(),
        end.toIso8601String(),
      ],
      orderBy: 'date DESC',
    );
    return maps.map((m) => Transaction.fromMap(m)).toList();
  }

  @override
  Future<Transaction?> getById(String id) async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kTransactionsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Transaction.fromMap(maps.first);
  }

  @override
  Future<void> insert(Transaction transaction) async {
    final db = await AppDatabase.database;
    await db.insert(
      kTransactionsTable,
      transaction.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> update(Transaction transaction) async {
    final db = await AppDatabase.database;
    await db.update(
      kTransactionsTable,
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  @override
  Future<void> delete(String id) async {
    final db = await AppDatabase.database;
    await db.delete(kTransactionsTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteByEnvelopeId(String envelopeId) async {
    final db = await AppDatabase.database;
    await db.delete(
      kTransactionsTable,
      where: 'envelopeId = ?',
      whereArgs: [envelopeId],
    );
  }

  @override
  Future<double> sumByEnvelopeId(String envelopeId) async {
    final db = await AppDatabase.database;
    final result = await db.rawQuery(
      'SELECT COALESCE(SUM(CASE WHEN isExpense = 1 THEN amount ELSE -amount END), 0) as total FROM $kTransactionsTable WHERE envelopeId = ?',
      [envelopeId],
    );
    return (result.first['total'] as num?)?.toDouble() ?? 0.0;
  }

  @override
  Future<double> sumByEnvelopeIdAndDateRange(
    String envelopeId,
    DateTime start,
    DateTime end,
  ) async {
    final db = await AppDatabase.database;
    final result = await db.rawQuery(
      'SELECT COALESCE(SUM(CASE WHEN isExpense = 1 THEN amount ELSE -amount END), 0) as total FROM $kTransactionsTable WHERE envelopeId = ? AND date >= ? AND date <= ?',
      [envelopeId, start.toIso8601String(), end.toIso8601String()],
    );
    return (result.first['total'] as num?)?.toDouble() ?? 0.0;
  }
}
