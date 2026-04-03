import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/models/envelope.dart';
import '../providers/budget_provider.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  Envelope? _fromEnvelope;
  Envelope? _toEnvelope;
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();
    final envelopes = provider.envelopes;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(178),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.moveMoney.toUpperCase(),
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
            // From envelope
            Text(
              l10n.from.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 8),
            _EnvelopeDropdown(
              value: _fromEnvelope,
              envelopes: envelopes,
              onChanged: (e) => setState(() => _fromEnvelope = e),
              hint: l10n.selectEnvelope,
            ),
            const SizedBox(height: 24),

            // Swap button
            Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    final temp = _fromEnvelope;
                    _fromEnvelope = _toEnvelope;
                    _toEnvelope = temp;
                  });
                },
                icon: const Icon(
                  Icons.swap_vert,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // To envelope
            Text(
              l10n.to.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 8),
            _EnvelopeDropdown(
              value: _toEnvelope,
              envelopes: envelopes,
              onChanged: (e) => setState(() => _toEnvelope = e),
              hint: l10n.selectEnvelope,
            ),
            const SizedBox(height: 28),

            // Amount
            Text(
              l10n.amount.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
              decoration: InputDecoration(
                hintText: '0.00',
                prefixText: '\$ ',
                prefixStyle:
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
              ),
            ),
            const SizedBox(height: 24),

            // Note
            Text(
              l10n.note.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 3.0,
                    fontSize: 10,
                  ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: l10n.note,
              ),
            ),
            const SizedBox(height: 40),

            // Confirm
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
                    onTap: _submit,
                    child: Center(
                      child: Text(
                        l10n.confirm.toUpperCase(),
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

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;

    if (_fromEnvelope == null ||
        _toEnvelope == null ||
        _fromEnvelope!.id == _toEnvelope!.id ||
        amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.error)),
      );
      return;
    }

    await context.read<BudgetProvider>().addTransfer(
          fromEnvelopeId: _fromEnvelope!.id,
          toEnvelopeId: _toEnvelope!.id,
          amount: amount,
          note: _noteController.text.trim().isNotEmpty
              ? _noteController.text.trim()
              : null,
        );

    if (mounted) Navigator.of(context).pop();
  }
}

class _EnvelopeDropdown extends StatelessWidget {
  final Envelope? value;
  final List<Envelope> envelopes;
  final ValueChanged<Envelope?> onChanged;
  final String hint;

  const _EnvelopeDropdown({
    required this.value,
    required this.envelopes,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          value: value,
          hint: Text(
            hint,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant.withAlpha(102),
                ),
          ),
          isExpanded: true,
          dropdownColor: AppColors.surfaceContainerHigh,
          style: Theme.of(context).textTheme.bodyMedium,
          items: envelopes.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: e.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(e.name),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
