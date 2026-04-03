import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/services/export_service.dart';
import '../providers/budget_provider.dart';
import 'export_screen.dart';
import 'recurring_bills_screen.dart';
import 'transfer_screen.dart';

class SettingsScreen extends StatelessWidget {
  final ExportService exportService;

  const SettingsScreen({super.key, required this.exportService});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: AppColors.surface.withAlpha(178),
            title: Text(
              l10n.settings.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                  ),
            ),
            centerTitle: false,
          ),
          // Premium section
          if (!provider.isPremium)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: _PremiumCard(
                  onUpgrade: () {
                    provider.iapService.purchasePremium();
                  },
                ),
              ),
            ),
          // Quick actions
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.general.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          letterSpacing: 4.0,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 16),
                  _SettingsTile(
                    icon: Icons.swap_vert,
                    title: l10n.moveMoney,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const TransferScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _SettingsTile(
                    icon: Icons.repeat,
                    title: l10n.recurringBills,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RecurringBillsScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _SettingsTile(
                    icon: Icons.restart_alt,
                    title: l10n.monthlyReset,
                    onTap: () => _confirmReset(context),
                  ),
                ],
              ),
            ),
          ),
          // Data management
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.dataManagement.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          letterSpacing: 4.0,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 16),
                  _SettingsTile(
                    icon: Icons.save_alt,
                    title: l10n.exportJson,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            ExportScreen(exportService: exportService),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _SettingsTile(
                    icon: Icons.upload_file,
                    title: l10n.importData,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            ExportScreen(exportService: exportService),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Purchases
          if (!provider.isPremium)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: _SettingsTile(
                  icon: Icons.restore,
                  title: l10n.restorePurchases,
                  onTap: () {
                    provider.iapService.restorePurchases();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Checking purchases...'),
                      ),
                    );
                  },
                ),
              ),
            ),
          // Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
              child: Column(
                children: [
                  Divider(
                    color: AppColors.outlineVariant.withAlpha(25),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '${l10n.versionLabel} 1.0.1',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${l10n.build} 1',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          l10n.privacyPolicy,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          l10n.termsOfService,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    kPublisher,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant.withAlpha(102),
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  void _confirmReset(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.monthlyReset),
        content: Text(l10n.monthlyResetConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await context.read<BudgetProvider>().monthlyReset();
            },
            child: Text(
              l10n.reset,
              style: const TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumCard extends StatelessWidget {
  final VoidCallback onUpgrade;

  const _PremiumCard({required this.onUpgrade});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withAlpha(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(12),
            blurRadius: 40,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.premium.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.premiumUnlock,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.premiumDescription,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${kPremiumPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  l10n.oneTimePayment,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryContainer],
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(51),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: onUpgrade,
                  child: Center(
                    child: Text(
                      l10n.upgradeNow.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        letterSpacing: 2.0,
                        color: AppColors.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
