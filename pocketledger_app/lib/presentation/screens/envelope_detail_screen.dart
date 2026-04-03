import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/models/envelope.dart';
import '../../domain/models/transaction.dart';
import '../providers/budget_provider.dart';
import '../widgets/transaction_tile.dart';
import 'add_transaction_screen.dart';
import 'envelope_edit_screen.dart';

class EnvelopeDetailScreen extends StatefulWidget {
  final Envelope envelope;

  const EnvelopeDetailScreen({super.key, required this.envelope});

  @override
  State<EnvelopeDetailScreen> createState() => _EnvelopeDetailScreenState();
}

class _EnvelopeDetailScreenState extends State<EnvelopeDetailScreen> {
  late Future<List<Transaction>> _transactionsFuture;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    _transactionsFuture = context
        .read<BudgetProvider>()
        .getTransactionsByEnvelope(widget.envelope.id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();
    // Get latest envelope data
    final envelope = provider.envelopes.firstWhere(
      (e) => e.id == widget.envelope.id,
      orElse: () => widget.envelope,
    );
    final currencyFormat = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: '\$',
      decimalDigits: 2,
    );

    final isOverspent = envelope.isOverspent;
    final remainingColor = isOverspent ? AppColors.secondary : AppColors.onSurface;
    final statusLabel = isOverspent ? l10n.overspent : l10n.remaining;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(178),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          envelope.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.onSurfaceVariant),
            onPressed: () => _showOptions(context, envelope),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await provider.loadAll();
          _loadTransactions();
          setState(() {});
        },
        color: AppColors.primary,
        child: CustomScrollView(
          slivers: [
            // Hero balance
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.availableBudget.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 3.0,
                            fontSize: 10,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currencyFormat.format(envelope.remainingAmount),
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 56,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -2.0,
                        color: remainingColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: (isOverspent
                                ? AppColors.secondary
                                : AppColors.primary)
                            .withAlpha(25),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        statusLabel.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                          color:
                              isOverspent ? AppColors.secondary : AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Stats bento
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.outlineVariant.withAlpha(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.monthlyGoal.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontSize: 9,
                                    letterSpacing: 2.0,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              currencyFormat.format(envelope.budgetAmount),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.outlineVariant.withAlpha(12),
                          ),
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
                            const SizedBox(height: 12),
                            Text(
                              currencyFormat.format(envelope.spentAmount),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
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
              ),
            ),
            // Activity header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.activity,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
            // Transaction list
            FutureBuilder<List<Transaction>>(
              future: _transactionsFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  );
                }

                final transactions = snapshot.data!;
                if (transactions.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.receipt_long,
                            size: 48,
                            color: AppColors.onSurfaceVariant,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.noTransactions,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.addFirst,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final tx = transactions[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: TransactionTile(
                            transaction: tx,
                            onLongPress: () => _confirmDelete(context, tx),
                          ),
                        );
                      },
                      childCount: transactions.length,
                    ),
                  ),
                );
              },
            ),
            // Bottom spacing
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddTransactionScreen(
                preselectedEnvelope: envelope,
              ),
            ),
          );
          _loadTransactions();
          setState(() {});
        },
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  void _showOptions(BuildContext context, Envelope envelope) {
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: AppColors.primary),
              title: Text(l10n.editEnvelope),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EnvelopeEditScreen(envelope: envelope),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: AppColors.secondary),
              title: Text(l10n.deleteEnvelope),
              onTap: () {
                Navigator.pop(ctx);
                _confirmDeleteEnvelope(context, envelope);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeleteEnvelope(BuildContext context, Envelope envelope) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteEnvelope),
        content: Text(l10n.deleteEnvelopeConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              final nav = Navigator.of(context);
              final prov = context.read<BudgetProvider>();
              Navigator.pop(ctx);
              await prov.deleteEnvelope(envelope.id);
              if (mounted) nav.pop();
            },
            child: Text(
              l10n.delete,
              style: const TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, Transaction tx) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.delete),
        content: Text(
          '${tx.description.isNotEmpty ? tx.description : "Transaction"} - \$${tx.amount.toStringAsFixed(2)}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await context
                  .read<BudgetProvider>()
                  .deleteTransaction(tx.id);
              _loadTransactions();
              setState(() {});
            },
            child: Text(
              l10n.delete,
              style: const TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
