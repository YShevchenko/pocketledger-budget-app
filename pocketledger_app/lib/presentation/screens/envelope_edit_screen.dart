import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/models/envelope.dart';
import '../providers/budget_provider.dart';

class EnvelopeEditScreen extends StatefulWidget {
  final Envelope? envelope;

  const EnvelopeEditScreen({super.key, this.envelope});

  @override
  State<EnvelopeEditScreen> createState() => _EnvelopeEditScreenState();
}

class _EnvelopeEditScreenState extends State<EnvelopeEditScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _budgetController;
  late int _selectedColorIndex;
  late Color _selectedColor;
  late String _selectedIcon;

  bool get _isEditing => widget.envelope != null;

  static const List<String> _iconOptions = [
    'account_balance_wallet',
    'shopping_cart',
    'restaurant',
    'directions_car',
    'fitness_center',
    'local_hospital',
    'movie',
    'school',
    'home',
    'flight',
    'pets',
    'child_care',
    'devices',
    'checkroom',
    'local_gas_station',
    'spa',
  ];

  static const Map<String, IconData> _iconMap = {
    'account_balance_wallet': Icons.account_balance_wallet,
    'shopping_cart': Icons.shopping_cart,
    'restaurant': Icons.restaurant,
    'directions_car': Icons.directions_car,
    'fitness_center': Icons.fitness_center,
    'local_hospital': Icons.local_hospital,
    'movie': Icons.movie,
    'school': Icons.school,
    'home': Icons.home,
    'flight': Icons.flight,
    'pets': Icons.pets,
    'child_care': Icons.child_care,
    'devices': Icons.devices,
    'checkroom': Icons.checkroom,
    'local_gas_station': Icons.local_gas_station,
    'spa': Icons.spa,
  };

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.envelope?.name ?? '');
    _budgetController = TextEditingController(
      text: widget.envelope?.budgetAmount.toStringAsFixed(2) ?? '',
    );
    if (widget.envelope != null) {
      final idx = AppColors.envelopeColors
          .indexWhere((c) => c.toARGB32() == widget.envelope!.colorValue);
      if (idx >= 0) {
        _selectedColorIndex = idx;
        _selectedColor = AppColors.envelopeColors[idx];
      } else {
        _selectedColorIndex = -1;
        _selectedColor = Color(widget.envelope!.colorValue);
      }
    } else {
      _selectedColorIndex = 0;
      _selectedColor = AppColors.envelopeColors[0];
    }
    _selectedIcon =
        widget.envelope?.icon ?? 'account_balance_wallet';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(178),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          (_isEditing ? l10n.editEnvelope : l10n.createEnvelope).toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name field
            Text(
              l10n.envelopeName.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              style: Theme.of(context).textTheme.titleMedium,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: l10n.envelopeName,
              ),
            ),
            const SizedBox(height: 28),

            // Budget amount
            Text(
              l10n.budgetAmount.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _budgetController,
              style: Theme.of(context).textTheme.titleMedium,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: '0.00',
                prefixText: '\$ ',
                prefixStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
            const SizedBox(height: 28),

            // Color picker
            Text(
              l10n.color.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ...List.generate(
                  AppColors.envelopeColors.length,
                  (index) {
                    final color = AppColors.envelopeColors[index];
                    final isSelected = index == _selectedColorIndex;
                    return GestureDetector(
                      onTap: () => setState(() {
                        _selectedColorIndex = index;
                        _selectedColor = color;
                      }),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: Colors.white, width: 3)
                              : null,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: color.withAlpha(102),
                                    blurRadius: 12,
                                  ),
                                ]
                              : null,
                        ),
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              )
                            : null,
                      ),
                    );
                  },
                ),
                // Custom color swatch — shows current custom color if selected,
                // or a "+" button to open the wheel
                GestureDetector(
                  onTap: () => _openColorWheelDialog(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _selectedColorIndex == -1
                          ? _selectedColor
                          : AppColors.surfaceContainerHigh,
                      shape: BoxShape.circle,
                      border: _selectedColorIndex == -1
                          ? Border.all(color: Colors.white, width: 3)
                          : Border.all(
                              color: AppColors.outlineVariant, width: 1),
                      boxShadow: _selectedColorIndex == -1
                          ? [
                              BoxShadow(
                                color: _selectedColor.withAlpha(102),
                                blurRadius: 12,
                              ),
                            ]
                          : null,
                    ),
                    child: _selectedColorIndex == -1
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : const Icon(Icons.colorize,
                            color: AppColors.onSurfaceVariant, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Icon picker
            Text(
              l10n.icon.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _iconOptions.map((iconName) {
                final isSelected = iconName == _selectedIcon;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedIcon = iconName),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withAlpha(25)
                          : AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(color: AppColors.primary)
                          : null,
                    ),
                    child: Icon(
                      _iconMap[iconName] ?? Icons.account_balance_wallet,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.onSurfaceVariant,
                      size: 22,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),

            // Save button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryContainer],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(51),
                      blurRadius: 24,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () => _save(context),
                    child: Center(
                      child: Text(
                        l10n.save.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          letterSpacing: 3.0,
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
      ),
    );
  }

  Future<void> _openColorWheelDialog(BuildContext context) async {
    Color pickerColor = _selectedColorIndex == -1
        ? _selectedColor
        : AppColors.envelopeColors[0];

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.surfaceContainer,
          title: Text(
            'Custom Color',
            style: Theme.of(ctx).textTheme.titleMedium,
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              color: pickerColor,
              onColorChanged: (c) => pickerColor = c,
              pickersEnabled: const {
                ColorPickerType.wheel: true,
                ColorPickerType.accent: false,
                ColorPickerType.primary: false,
                ColorPickerType.both: false,
                ColorPickerType.bw: false,
                ColorPickerType.custom: false,
                ColorPickerType.customSecondary: false,
              },
              wheelDiameter: 260,
              showColorCode: true,
              colorCodeHasColor: true,
              enableShadesSelection: false,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColors.onSurfaceVariant),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text(
                'Select',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      setState(() {
        _selectedColor = pickerColor;
        _selectedColorIndex = -1;
      });
    }
  }

  Future<void> _save(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final nav = Navigator.of(context);
    final name = _nameController.text.trim();
    final budget = double.tryParse(_budgetController.text.trim()) ?? 0;

    if (name.isEmpty || budget <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.error)),
      );
      return;
    }

    final provider = context.read<BudgetProvider>();

    if (!_isEditing && !provider.canCreateEnvelope) {
      _showPremiumDialog(context);
      return;
    }

    final colorValue = _selectedColor.toARGB32();

    if (_isEditing) {
      await provider.updateEnvelope(
        widget.envelope!.copyWith(
          name: name,
          budgetAmount: budget,
          colorValue: colorValue,
          icon: _selectedIcon,
        ),
      );
    } else {
      await provider.addEnvelope(
        name: name,
        budgetAmount: budget,
        colorValue: colorValue,
        icon: _selectedIcon,
      );
    }

    if (mounted) nav.pop();
  }

  void _showPremiumDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.freeLimitReached),
        content: Text(l10n.freeLimitMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<BudgetProvider>().iapService.purchasePremium();
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
}
