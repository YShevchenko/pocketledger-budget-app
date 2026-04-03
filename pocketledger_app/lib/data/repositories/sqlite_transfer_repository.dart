import 'package:sqflite/sqflite.dart';
import '../../core/constants.dart';
import '../../data/database/app_database.dart';
import '../../domain/models/transfer.dart';

class SqliteTransferRepository {
  Future<List<Transfer>> getAll() async {
    final db = await AppDatabase.database;
    final maps = await db.query(kTransfersTable, orderBy: 'date DESC');
    return maps.map((m) => Transfer.fromMap(m)).toList();
  }

  Future<void> insert(Transfer transfer) async {
    final db = await AppDatabase.database;
    await db.insert(
      kTransfersTable,
      transfer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(String id) async {
    final db = await AppDatabase.database;
    await db.delete(kTransfersTable, where: 'id = ?', whereArgs: [id]);
  }
}
