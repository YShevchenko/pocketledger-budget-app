import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'domain/services/export_service.dart';
import 'l10n/app_localizations.dart';
import 'presentation/providers/budget_provider.dart';
import 'presentation/screens/dashboard_screen.dart';
import 'presentation/screens/ledger_screen.dart';
import 'presentation/screens/envelope_edit_screen.dart';
import 'presentation/screens/trends_screen.dart';
import 'presentation/screens/settings_screen.dart';

class PocketLedgerApp extends StatelessWidget {
  final ExportService exportService;

  const PocketLedgerApp({super.key, required this.exportService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PocketLedger',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: _MainShell(exportService: exportService),
    );
  }
}

class _MainShell extends StatefulWidget {
  final ExportService exportService;

  const _MainShell({required this.exportService});

  @override
  State<_MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<_MainShell> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load all data on startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BudgetProvider>().loadAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Index mapping:
    //   0 = Dashboard, 1 = Ledger, 2 = Envelopes (push-nav), 3 = Trends, 4 = Settings
    // IndexedStack children: [Dashboard, Ledger, shrink, Trends, Settings]
    int stackIndex;
    if (_currentIndex == 0) {
      stackIndex = 0;
    } else if (_currentIndex == 1) {
      stackIndex = 1;
    } else if (_currentIndex == 3) {
      stackIndex = 3;
    } else if (_currentIndex == 4) {
      stackIndex = 4;
    } else {
      stackIndex = 0;
    }

    return Scaffold(
      body: IndexedStack(
        index: stackIndex,
        children: [
          const DashboardScreen(),
          const LedgerScreen(),
          const SizedBox.shrink(), // Placeholder for Envelopes push-nav
          const TrendsScreen(),
          SettingsScreen(exportService: widget.exportService),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer.withAlpha(178),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(
            top: BorderSide(
              color: AppColors.outlineVariant.withAlpha(38),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(12),
              blurRadius: 40,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              if (index == 2) {
                // Envelopes tab pushes create envelope screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const EnvelopeEditScreen(),
                  ),
                );
                return;
              }
              setState(() => _currentIndex = index);
            },
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.account_balance_wallet_outlined),
                selectedIcon: const Icon(Icons.account_balance_wallet),
                label: l10n.ledger.toUpperCase(),
              ),
              NavigationDestination(
                icon: const Icon(Icons.receipt_long_outlined),
                selectedIcon: const Icon(Icons.receipt_long),
                label: l10n.activity.toUpperCase(),
              ),
              NavigationDestination(
                icon: const Icon(Icons.mail_outline),
                selectedIcon: const Icon(Icons.mail),
                label: l10n.envelopes.toUpperCase(),
              ),
              const NavigationDestination(
                icon: Icon(Icons.show_chart_outlined),
                selectedIcon: Icon(Icons.show_chart),
                label: 'TRENDS',
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                label: l10n.settings.toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
