import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/models/transaction.dart';
import '../providers/budget_provider.dart';
import '../widgets/transaction_tile.dart';
import 'add_transaction_screen.dart';

class LedgerScreen extends StatefulWidget {
  const LedgerScreen({super.key});

  @override
  State<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  bool _showUnclearedOnly = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();
    final allTransactions = provider.transactions;
    final envelopeMap = {for (final e in provider.envelopes) e.id: e.name};
    final currencyFormat = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: '\$',
      decimalDigits: 2,
    );

    // Apply uncleared filter
    final transactions = _showUnclearedOnly
        ? allTransactions.where((t) => !t.isCleared).toList()
        : allTransactions;

    // Group transactions by date
    final grouped = _groupByDate(transactions);

    // Reconcile stats (always over the full set)
    final unclearedCount = provider.unclearedCount;
    final unclearedSum = provider.unclearedSum;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
              // Uncleared filter toggle
              Tooltip(
                message: _showUnclearedOnly
                    ? 'Show all transactions'
                    : 'Show uncleared only',
                child: IconButton(
                  icon: Icon(
                    _showUnclearedOnly
                        ? Icons.filter_list_off
                        : Icons.filter_list,
                    color: _showUnclearedOnly
                        ? const Color(0xFF3FFF8B)
                        : AppColors.onSurfaceVariant,
                  ),
                  onPressed: () =>
                      setState(() => _showUnclearedOnly = !_showUnclearedOnly),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.onSurfaceVariant),
                onPressed: () {},
              ),
            ],
          ),
          // Hero balance
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.currentLiquidity.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          letterSpacing: 3.0,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.0,
                          ),
                      children: [
                        TextSpan(
                          text: currencyFormat.format(provider.totalRemaining),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.spent.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      fontSize: 9,
                                      letterSpacing: 2.0,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '-${currencyFormat.format(provider.envelopes.fold(0.0, (s, e) => s + e.spentAmount))}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Reconcile summary
                  if (unclearedCount > 0) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF3FFF8B).withAlpha(60),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.pending_actions,
                            size: 18,
                            color: Color(0xFF3FFF8B),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RECONCILE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        fontSize: 9,
                                        letterSpacing: 2.0,
                                        color: const Color(0xFF3FFF8B),
                                      ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '$unclearedCount uncleared • ${currencyFormat.format(unclearedSum.abs())} pending',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          // Quick filter button within summary
                          GestureDetector(
                            onTap: () => setState(
                                () => _showUnclearedOnly = !_showUnclearedOnly),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: _showUnclearedOnly
                                    ? const Color(0xFF3FFF8B).withAlpha(40)
                                    : AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                _showUnclearedOnly ? 'ALL' : 'FILTER',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF3FFF8B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  // Filter active indicator
                  if (_showUnclearedOnly) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.filter_list,
                          size: 14,
                          color: Color(0xFF3FFF8B),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'SHOWING UNCLEARED ONLY',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontSize: 9,
                                    letterSpacing: 2.0,
                                    color: const Color(0xFF3FFF8B),
                                  ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _showUnclearedOnly = false),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Transaction groups
          if (grouped.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    const Icon(
                      Icons.receipt_long,
                      size: 48,
                      color: AppColors.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _showUnclearedOnly
                          ? 'All transactions cleared'
                          : l10n.noTransactions,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _showUnclearedOnly ? '' : l10n.addFirst,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          else
            ...grouped.entries.map((entry) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            _formatDateHeader(entry.key, l10n),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 3.0,
                                  fontSize: 11,
                                ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.surfaceContainer,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...entry.value.map((tx) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: TransactionTile(
                              transaction: tx,
                              envelopeName: envelopeMap[tx.envelopeId],
                            ),
                          )),
                    ],
                  ),
                ),
              );
            }),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: provider.envelopes.isNotEmpty
          ? FloatingActionButton(
              heroTag: 'ledger_fab',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddTransactionScreen(),
                  ),
                );
              },
              child: const Icon(Icons.add, size: 28),
            )
          : null,
    );
  }

  Map<String, List<Transaction>> _groupByDate(List<Transaction> transactions) {
    final map = <String, List<Transaction>>{};
    for (final tx in transactions) {
      final key = DateFormat('yyyy-MM-dd').format(tx.date);
      map.putIfAbsent(key, () => []).add(tx);
    }
    return map;
  }

  String _formatDateHeader(String dateKey, AppLocalizations l10n) {
    final date = DateTime.parse(dateKey);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final txDate = DateTime(date.year, date.month, date.day);

    if (txDate == today) {
      return '${l10n.today.toUpperCase()}, ${DateFormat('MMM d').format(date).toUpperCase()}';
    } else if (txDate == yesterday) {
      return '${l10n.yesterday.toUpperCase()}, ${DateFormat('MMM d').format(date).toUpperCase()}';
    }
    return DateFormat('MMM d').format(date).toUpperCase();
  }
}
