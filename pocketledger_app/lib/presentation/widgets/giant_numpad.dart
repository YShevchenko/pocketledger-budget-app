import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';

class GiantNumpad extends StatelessWidget {
  final String currentAmount;
  final ValueChanged<String> onDigitPressed;
  final VoidCallback onBackspace;
  final VoidCallback onDecimalPressed;
  final VoidCallback onDoubleZeroPressed;
  final VoidCallback onConfirm;
  final String confirmLabel;
  final bool confirmEnabled;

  const GiantNumpad({
    super.key,
    required this.currentAmount,
    required this.onDigitPressed,
    required this.onBackspace,
    required this.onDecimalPressed,
    required this.onDoubleZeroPressed,
    required this.onConfirm,
    this.confirmLabel = 'LOG TRANSACTION',
    this.confirmEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 40,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Numpad grid
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: 1.6,
              children: [
                _NumpadButton(label: '1', onTap: () => onDigitPressed('1')),
                _NumpadButton(label: '2', onTap: () => onDigitPressed('2')),
                _NumpadButton(label: '3', onTap: () => onDigitPressed('3')),
                _NumpadButton(label: '4', onTap: () => onDigitPressed('4')),
                _NumpadButton(label: '5', onTap: () => onDigitPressed('5')),
                _NumpadButton(label: '6', onTap: () => onDigitPressed('6')),
                _NumpadButton(label: '7', onTap: () => onDigitPressed('7')),
                _NumpadButton(label: '8', onTap: () => onDigitPressed('8')),
                _NumpadButton(label: '9', onTap: () => onDigitPressed('9')),
                _NumpadButton(label: '.', onTap: onDecimalPressed),
                _NumpadButton(label: '0', onTap: () => onDigitPressed('0')),
                _NumpadButton(
                  icon: Icons.backspace_outlined,
                  onTap: onBackspace,
                  onLongPress: () {
                    // Clear all on long press
                    HapticFeedback.heavyImpact();
                    // Multiple backspaces to clear
                    for (int i = 0; i < 20; i++) {
                      onBackspace();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Confirm button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: confirmEnabled
                      ? const LinearGradient(
                          colors: [AppColors.primary, AppColors.primaryContainer],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : null,
                  color: confirmEnabled ? null : AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: confirmEnabled
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withAlpha(51),
                            blurRadius: 24,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: confirmEnabled ? onConfirm : null,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            confirmLabel,
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: 2.0,
                              color: confirmEnabled
                                  ? AppColors.onPrimaryContainer
                                  : AppColors.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: confirmEnabled
                                ? AppColors.onPrimaryContainer
                                : AppColors.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NumpadButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const _NumpadButton({
    this.label,
    this.icon,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        onLongPress: onLongPress,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: icon != null
              ? Icon(
                  icon,
                  size: 28,
                  color: AppColors.onSurfaceVariant,
                )
              : Text(
                  label!,
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
        ),
      ),
    );
  }
}
