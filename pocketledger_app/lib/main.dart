import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'data/repositories/sqlite_envelope_repository.dart';
import 'data/repositories/sqlite_transaction_repository.dart';
import 'data/repositories/sqlite_recurring_repository.dart';
import 'data/repositories/sqlite_transfer_repository.dart';
import 'domain/services/budget_engine.dart';
import 'domain/services/export_service.dart';
import 'presentation/providers/budget_provider.dart';
import 'services/iap_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // Force dark status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFF1A1A1A),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // Initialize repositories
  final envelopeRepo = SqliteEnvelopeRepository();
  final transactionRepo = SqliteTransactionRepository();
  final recurringRepo = SqliteRecurringRepository();
  final transferRepo = SqliteTransferRepository();

  // Initialize services
  final iapService = IapService();

  // Initialize budget engine
  final budgetEngine = BudgetEngine(
    envelopeRepo: envelopeRepo,
    transactionRepo: transactionRepo,
    recurringRepo: recurringRepo,
  );

  // Initialize export service
  final exportService = ExportService(
    envelopeRepo: envelopeRepo,
    transactionRepo: transactionRepo,
    recurringRepo: recurringRepo,
    transferRepo: transferRepo,
  );

  // Initialize IAP (non-blocking)
  iapService.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BudgetProvider(
            envelopeRepo: envelopeRepo,
            transactionRepo: transactionRepo,
            recurringRepo: recurringRepo,
            transferRepo: transferRepo,
            budgetEngine: budgetEngine,
            iapService: iapService,
          ),
        ),
        Provider.value(value: iapService),
        Provider.value(value: exportService),
      ],
      child: PocketLedgerApp(exportService: exportService),
    ),
  );
}
