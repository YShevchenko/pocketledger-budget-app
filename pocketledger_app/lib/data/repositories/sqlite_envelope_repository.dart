import 'package:sqflite/sqflite.dart';
import '../../core/constants.dart';
import '../../data/database/app_database.dart';
import '../../domain/models/envelope.dart';
import '../../domain/repositories/envelope_repository.dart';

class SqliteEnvelopeRepository implements EnvelopeRepository {
  @override
  Future<List<Envelope>> getAll() async {
    final db = await AppDatabase.database;
    final maps = await db.query(kEnvelopesTable, orderBy: 'sortOrder ASC');
    return maps.map((m) => Envelope.fromMap(m)).toList();
  }

  @override
  Future<Envelope?> getById(String id) async {
    final db = await AppDatabase.database;
    final maps = await db.query(
      kEnvelopesTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Envelope.fromMap(maps.first);
  }

  @override
  Future<void> insert(Envelope envelope) async {
    final db = await AppDatabase.database;
    await db.insert(
      kEnvelopesTable,
      envelope.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> update(Envelope envelope) async {
    final db = await AppDatabase.database;
    await db.update(
      kEnvelopesTable,
      envelope.toMap(),
      where: 'id = ?',
      whereArgs: [envelope.id],
    );
  }

  @override
  Future<void> delete(String id) async {
    final db = await AppDatabase.database;
    await db.delete(kEnvelopesTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> count() async {
    final db = await AppDatabase.database;
    final result =
        await db.rawQuery('SELECT COUNT(*) as cnt FROM $kEnvelopesTable');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  @override
  Future<void> resetAllSpent() async {
    final db = await AppDatabase.database;
    await db.update(kEnvelopesTable, {'spentAmount': 0.0});
  }

  @override
  Future<void> updateSpentAmount(String id, double spentAmount) async {
    final db = await AppDatabase.database;
    await db.update(
      kEnvelopesTable,
      {'spentAmount': spentAmount},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
