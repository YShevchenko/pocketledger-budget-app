import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/constants.dart';

class AppDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, kDatabaseName);

    return openDatabase(
      path,
      version: kDatabaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onOpen: (db) async {
        await db.execute('PRAGMA journal_mode=WAL');
      },
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $kEnvelopesTable (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        budgetAmount REAL NOT NULL DEFAULT 0,
        spentAmount REAL NOT NULL DEFAULT 0,
        colorValue INTEGER NOT NULL,
        icon TEXT NOT NULL DEFAULT 'account_balance_wallet',
        sortOrder INTEGER NOT NULL DEFAULT 0,
        createdAt TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $kTransactionsTable (
        id TEXT PRIMARY KEY,
        envelopeId TEXT NOT NULL,
        amount REAL NOT NULL,
        description TEXT NOT NULL DEFAULT '',
        date TEXT NOT NULL,
        receiptPath TEXT,
        isRecurring INTEGER NOT NULL DEFAULT 0,
        recurringBillId TEXT,
        isExpense INTEGER NOT NULL DEFAULT 1,
        isCleared INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (envelopeId) REFERENCES $kEnvelopesTable(id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE $kTransfersTable (
        id TEXT PRIMARY KEY,
        fromEnvelopeId TEXT NOT NULL,
        toEnvelopeId TEXT NOT NULL,
        amount REAL NOT NULL,
        note TEXT,
        date TEXT NOT NULL,
        FOREIGN KEY (fromEnvelopeId) REFERENCES $kEnvelopesTable(id) ON DELETE CASCADE,
        FOREIGN KEY (toEnvelopeId) REFERENCES $kEnvelopesTable(id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE $kRecurringBillsTable (
        id TEXT PRIMARY KEY,
        envelopeId TEXT NOT NULL,
        name TEXT NOT NULL,
        amount REAL NOT NULL,
        dayOfMonth INTEGER NOT NULL,
        isActive INTEGER NOT NULL DEFAULT 1,
        lastProcessedDate TEXT,
        createdAt TEXT NOT NULL,
        FOREIGN KEY (envelopeId) REFERENCES $kEnvelopesTable(id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE $kSettingsTable (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');

    // Create indices for performance
    await db.execute(
      'CREATE INDEX idx_transactions_envelope ON $kTransactionsTable(envelopeId)',
    );
    await db.execute(
      'CREATE INDEX idx_transactions_date ON $kTransactionsTable(date)',
    );
    await db.execute(
      'CREATE INDEX idx_transfers_from ON $kTransfersTable(fromEnvelopeId)',
    );
    await db.execute(
      'CREATE INDEX idx_transfers_to ON $kTransfersTable(toEnvelopeId)',
    );
    await db.execute(
      'CREATE INDEX idx_recurring_envelope ON $kRecurringBillsTable(envelopeId)',
    );
  }

  static Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion < 2) {
      // Add isExpense and isCleared columns (v1 → v2)
      await db.execute(
        'ALTER TABLE $kTransactionsTable ADD COLUMN isExpense INTEGER NOT NULL DEFAULT 1',
      );
      await db.execute(
        'ALTER TABLE $kTransactionsTable ADD COLUMN isCleared INTEGER NOT NULL DEFAULT 0',
      );
    }
  }

  static Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }

  /// For testing: allows injecting a database instance
  static void setDatabase(Database db) {
    _database = db;
  }
}
