import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/models/transaction.dart';
import '../providers/budget_provider.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final String? envelopeName;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TransactionTile({
    super.key,
    required this.transaction,
    this.envelopeName,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: '\$',
      decimalDigits: 2,
    );
    final dateFormat = DateFormat('MMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');
    final isExpense = transaction.isExpense;
    final amountColor =
        isExpense ? AppColors.secondary : const Color(0xFF3FFF8B);
    final amountPrefix = isExpense ? '-' : '+';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      transaction.isRecurring
                          ? Icons.repeat
                          : (transaction.receiptPath != null
                              ? Icons.receipt_long
                              : (isExpense ? Icons.payments : Icons.savings)),
                      color: AppColors.onSurfaceVariant,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.description.isNotEmpty
                              ? transaction.description
                              : (envelopeName ?? 'Transaction'),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (envelopeName != null) ...[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  envelopeName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                            Text(
                              '${dateFormat.format(transaction.date)} ${timeFormat.format(transaction.date)}',
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
                  // Amount
                  Text(
                    '$amountPrefix${currencyFormat.format(transaction.amount.abs())}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: amountColor,
                        ),
                  ),
                  const SizedBox(width: 8),
                  // Cleared badge toggle
                  GestureDetector(
                    onTap: () {
                      context.read<BudgetProvider>().clearTransaction(
                            transaction.id,
                            !transaction.isCleared,
                          );
                    },
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: transaction.isCleared
                            ? const Color(0xFF3FFF8B)
                            : Colors.transparent,
                        border: transaction.isCleared
                            ? null
                            : Border.all(
                                color: AppColors.onSurfaceVariant.withAlpha(120),
                                width: 1.5,
                              ),
                      ),
                      child: transaction.isCleared
                          ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.black87,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              // Receipt thumbnail (shown below main row when present)
              if (transaction.receiptPath != null) ...[
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _viewFullReceipt(context, transaction.receiptPath!),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(transaction.receiptPath!),
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 64,
                        height: 64,
                        color: AppColors.surfaceContainer,
                        child: const Icon(
                          Icons.broken_image,
                          size: 28,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _viewFullReceipt(BuildContext context, String path) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _FullScreenReceiptView(path: path),
      ),
    );
  }
}

/// Full-screen receipt viewer with pinch-to-zoom
class _FullScreenReceiptView extends StatelessWidget {
  final String path;

  const _FullScreenReceiptView({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'RECEIPT',
          style: TextStyle(color: Colors.white, letterSpacing: 2.0),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 5.0,
          child: Image.file(
            File(path),
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.broken_image,
              color: Colors.white54,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }
}
