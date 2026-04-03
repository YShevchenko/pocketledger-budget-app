import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';

class MonthSelector extends StatelessWidget {
  final DateTime selectedMonth;
  final ValueChanged<DateTime> onMonthChanged;

  const MonthSelector({
    super.key,
    required this.selectedMonth,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMMM yyyy');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, color: AppColors.onSurfaceVariant),
          onPressed: () {
            final prev = DateTime(selectedMonth.year, selectedMonth.month - 1);
            onMonthChanged(prev);
          },
        ),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedMonth,
              firstDate: DateTime(2020),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              initialDatePickerMode: DatePickerMode.year,
            );
            if (picked != null) {
              onMonthChanged(DateTime(picked.year, picked.month));
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              format.format(selectedMonth),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.onSurface,
                    letterSpacing: 1.0,
                  ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant),
          onPressed: () {
            final next = DateTime(selectedMonth.year, selectedMonth.month + 1);
            if (next.isBefore(DateTime.now().add(const Duration(days: 31)))) {
              onMonthChanged(next);
            }
          },
        ),
      ],
    );
  }
}
