import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../providers/budget_provider.dart';
import '../widgets/envelope_card.dart';
import 'add_transaction_screen.dart';
import 'envelope_detail_screen.dart';
import 'envelope_edit_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();
    final currencyFormat = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: '\$',
      decimalDigits: 2,
    );

    return Scaffold(
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  floating: true,
                  backgroundColor: AppColors.surface.withAlpha(178),
                  title: Text(
                    'LEDGER',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 4.0,
                        ),
                  ),
                  centerTitle: false,
                  actions: [
                    Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.outlineVariant.withAlpha(38),
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 16,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                // Hero Balance
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.currentLiquidity.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                letterSpacing: 3.0,
                                fontSize: 10,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          currencyFormat.format(provider.totalRemaining),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -1.0,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              l10n.availableToBudget,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.primary),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Insights Bento Grid
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: _InsightCard(
                            icon: Icons.trending_up,
                            iconColor: AppColors.tertiary,
                            label: l10n.savingsRate.toUpperCase(),
                            value: '${provider.savingsRate.toStringAsFixed(0)}%',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _InsightCard(
                            icon: Icons.bolt,
                            iconColor: AppColors.secondary,
                            label: l10n.dailyBurn.toUpperCase(),
                            value: currencyFormat.format(provider.dailyBurnRate),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Envelopes header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.envelopes,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        if (provider.envelopes.isNotEmpty)
                          Text(
                            l10n.viewAll,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.outlineVariant,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
                // Envelope list or empty state
                if (provider.envelopes.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.outlineVariant.withAlpha(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.mail_outline,
                              size: 48,
                              color: AppColors.onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              l10n.noEnvelopes,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              l10n.createFirst,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () => _createEnvelope(context),
                              child: Text(l10n.createEnvelope.toUpperCase()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final envelope = provider.envelopes[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: EnvelopeCard(
                              envelope: envelope,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => EnvelopeDetailScreen(
                                      envelope: envelope,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        childCount: provider.envelopes.length,
                      ),
                    ),
                  ),
                // Bottom spacing
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
      floatingActionButton: provider.envelopes.isNotEmpty
          ? Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AddTransactionScreen(),
                    ),
                  );
                },
                elevation: 8,
                child: const Icon(Icons.add, size: 28),
              ),
            )
          : null,
    );
  }

  void _createEnvelope(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const EnvelopeEditScreen()),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _InsightCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.outlineVariant.withAlpha(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 9,
                  letterSpacing: 2.0,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
