import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/models/envelope.dart';
import '../../l10n/app_localizations.dart';

class EnvelopeCard extends StatelessWidget {
  final Envelope envelope;
  final VoidCallback? onTap;

  const EnvelopeCard({
    super.key,
    required this.envelope,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currencyFormat = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: '\$',
      decimalDigits: 2,
    );

    final isOverspent = envelope.isOverspent;
    final progressColor =
        isOverspent ? AppColors.secondary : envelope.color;
    final remainingColor =
        isOverspent ? AppColors.secondary : AppColors.primary;
    final statusText = isOverspent ? l10n.overspent : l10n.remaining;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16),
            border: isOverspent
                ? Border.all(
                    color: AppColors.secondary.withAlpha(51),
                  )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          envelope.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        currencyFormat.format(envelope.remainingAmount),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: remainingColor,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        statusText.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(
                              color: isOverspent
                                  ? AppColors.secondary.withAlpha(153)
                                  : AppColors.onSurfaceVariant,
                              letterSpacing: 1.0,
                              fontSize: 9,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: envelope.spentPercentage.clamp(0.0, 1.0),
                  minHeight: 6,
                  backgroundColor: AppColors.surfaceContainerLow,
                  valueColor: AlwaysStoppedAnimation(
                    isOverspent
                        ? progressColor
                        : progressColor.withAlpha(envelope.spentPercentage > 0.7
                            ? 255
                            : 102),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${l10n.spent.toUpperCase()}: ${currencyFormat.format(envelope.spentAmount)}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 9,
                          letterSpacing: 2.0,
                        ),
                  ),
                  Text(
                    '${l10n.limit.toUpperCase()}: ${currencyFormat.format(envelope.budgetAmount)}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 9,
                          letterSpacing: 2.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
