import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class BalanceBar extends StatelessWidget {
  final double spent;
  final double budget;
  final Color? color;
  final double height;

  const BalanceBar({
    super.key,
    required this.spent,
    required this.budget,
    this.color,
    this.height = 6,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = budget > 0 ? (spent / budget).clamp(0.0, 1.0) : 0.0;
    final isOverspent = spent > budget;
    final barColor = color ?? (isOverspent ? AppColors.secondary : AppColors.primary);

    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: percentage,
          backgroundColor: AppColors.surfaceContainerLow,
          valueColor: AlwaysStoppedAnimation(barColor),
        ),
      ),
    );
  }
}
