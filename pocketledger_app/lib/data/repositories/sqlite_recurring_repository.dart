import 'package:sqflite/sqflite.dart';
import '../../core/constants.dart';
import '../../data/database/app_database.dart';
import '../../domain/models/recurring_bill.dart';
import '../../domain/repositories/recurring_repository.dart';

class SqliteRecurringRepository implements RecurringRepository {
  @override
  Future<List<RecurringBill>> getAll() async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kRecurringBillsTable,
      orderBy: 'dayOfMonth ASC',
    );
    return maps.map((m) => RecurringBill.fromMap(m)).toList();
  }

  @override
  Future<List<RecurringBill>> getActive() async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kRecurringBillsTable,
      where: 'isActive = 1',
      orderBy: 'dayOfMonth ASC',
    );
    return maps.map((m) => RecurringBill.fromMap(m)).toList();
  }

  @override
  Future<RecurringBill?> getById(String id) async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kRecurringBillsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return RecurringBill.fromMap(maps.first);
  }

  @override
  Future<void> insert(RecurringBill bill) async {
    final db = await AppDatabase.database;
    await db.insert(
      kRecurringBillsTable,
      bill.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> update(RecurringBill bill) async {
    final db = await AppDatabase.database;
    await db.update(
      kRecurringBillsTable,
      bill.toMap(),
      where: 'id = ?',
      whereArgs: [bill.id],
    );
  }

  @override
  Future<void> delete(String id) async {
    final db = await AppDatabase.database;
    await db.delete(kRecurringBillsTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> updateLastProcessed(String id, DateTime date) async {
    final db = await AppDatabase.database;
    await db.update(
      kRecurringBillsTable,
      {'lastProcessedDate': date.toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
