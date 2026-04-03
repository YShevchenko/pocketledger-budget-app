import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/models/envelope.dart';
import '../providers/budget_provider.dart';
import '../../services/iap_service.dart';

class RecurringBillsScreen extends StatelessWidget {
  const RecurringBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();
    final bills = provider.recurringBills;
    final envelopeMap = {for (final e in provider.envelopes) e.id: e};
    final currencyFormat = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: '\$',
      decimalDigits: 2,
    );

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(178),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.recurringBills.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
        ),
      ),
      body: bills.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.repeat,
                    size: 48,
                    color: AppColors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.recurringBills,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.addFirst,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: bills.length,
              separatorBuilder: (_, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final bill = bills[index];
                final envelope = envelopeMap[bill.envelopeId];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.repeat,
                          color: AppColors.tertiary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bill.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                if (envelope != null) ...[
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: envelope.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    envelope.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(fontSize: 10),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                Text(
                                  'Day ${bill.dayOfMonth}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            currencyFormat.format(bill.amount),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () =>
                                provider.toggleRecurringBill(bill),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: bill.isActive
                                    ? AppColors.primary.withAlpha(25)
                                    : AppColors.surfaceContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                bill.isActive
                                    ? l10n.active.toUpperCase()
                                    : 'OFF',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.0,
                                  color: bill.isActive
                                      ? AppColors.primary
                                      : AppColors.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final provider = context.read<BudgetProvider>();
          if (!provider.canUseRecurringBills) {
            _showPremiumDialog(context, provider.iapService);
            return;
          }
          _showAddBillSheet(context);
        },
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  void _showPremiumDialog(BuildContext context, IapService iapService) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.freeLimitReached),
        content: Text(l10n.premiumDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              iapService.purchasePremium();
            },
            child: Text(
              l10n.upgradeNow,
              style: const TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddBillSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.read<BudgetProvider>();
    final envelopes = provider.envelopes;
    if (envelopes.isEmpty) return;

    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final dayController = TextEditingController(text: '1');
    Envelope selectedEnvelope = envelopes.first;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.addBill.toUpperCase(),
                style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: l10n.billName),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: l10n.amount,
                  prefixText: '\$ ',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: dayController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: l10n.dayOfMonth),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.outlineVariant.withAlpha(38),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Envelope>(
                    value: selectedEnvelope,
                    isExpanded: true,
                    dropdownColor: AppColors.surfaceContainerHigh,
                    items: envelopes.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    }).toList(),
                    onChanged: (e) {
                      if (e != null) {
                        setSheetState(() => selectedEnvelope = e);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final amount =
                        double.tryParse(amountController.text.trim()) ?? 0;
                    final day =
                        int.tryParse(dayController.text.trim()) ?? 1;
                    if (name.isEmpty || amount <= 0) return;

                    await provider.addRecurringBill(
                      envelopeId: selectedEnvelope.id,
                      name: name,
                      amount: amount,
                      dayOfMonth: day.clamp(1, 31),
                    );
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                  child: Text(l10n.save.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
