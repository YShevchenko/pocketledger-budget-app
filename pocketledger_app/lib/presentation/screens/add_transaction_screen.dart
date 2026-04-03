import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/models/envelope.dart';
import '../providers/budget_provider.dart';
import '../widgets/giant_numpad.dart';

class AddTransactionScreen extends StatefulWidget {
  final Envelope? preselectedEnvelope;

  const AddTransactionScreen({
    super.key,
    this.preselectedEnvelope,
  });

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String _amountStr = '0';
  Envelope? _selectedEnvelope;
  final _descController = TextEditingController();
  bool _showDescription = false;
  bool _isExpense = true;
  bool _isCleared = false;
  String? _receiptPath;
  bool _pickingImage = false;

  static const _uuid = Uuid();

  @override
  void initState() {
    super.initState();
    _selectedEnvelope = widget.preselectedEnvelope;
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  double get _amount => double.tryParse(_amountStr) ?? 0.0;
  bool get _canConfirm => _amount > 0 && _selectedEnvelope != null;

  void _onDigit(String digit) {
    setState(() {
      if (_amountStr == '0' && digit != '0') {
        _amountStr = digit;
      } else if (_amountStr == '0' && digit == '0') {
        // Don't add leading zeros
      } else {
        // Limit decimal places to 2
        if (_amountStr.contains('.')) {
          final parts = _amountStr.split('.');
          if (parts[1].length >= 2) return;
        }
        // Limit total length
        if (_amountStr.replaceAll('.', '').length >= 10) return;
        _amountStr += digit;
      }
    });
  }

  void _onDecimal() {
    setState(() {
      if (!_amountStr.contains('.')) {
        _amountStr += '.';
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_amountStr.length <= 1) {
        _amountStr = '0';
      } else {
        _amountStr = _amountStr.substring(0, _amountStr.length - 1);
      }
    });
  }

  Future<void> _showReceiptBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: AppColors.primary),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(ctx);
                _pickReceipt(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppColors.primary),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(ctx);
                _pickReceipt(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickReceipt(ImageSource source) async {
    if (_pickingImage) return;
    setState(() => _pickingImage = true);
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: source);
      if (picked == null) return;

      // Read raw bytes
      final rawBytes = await picked.readAsBytes();

      // Decode and resize (max 1200px on longest side, quality 85)
      final decoded = img.decodeImage(rawBytes);
      if (decoded == null) return;

      img.Image resized;
      if (decoded.width > 1200 || decoded.height > 1200) {
        resized = img.copyResize(
          decoded,
          width: decoded.width >= decoded.height ? 1200 : -1,
          height: decoded.height > decoded.width ? 1200 : -1,
        );
      } else {
        resized = decoded;
      }

      final compressed = Uint8List.fromList(img.encodeJpg(resized, quality: 85));

      // Save to <documents>/receipts/<uuid>.jpg
      final docDir = await getApplicationDocumentsDirectory();
      final receiptsDir = Directory('${docDir.path}/receipts');
      if (!await receiptsDir.exists()) await receiptsDir.create(recursive: true);

      final fileName = '${_uuid.v4()}.jpg';
      final file = File('${receiptsDir.path}/$fileName');
      await file.writeAsBytes(compressed);

      setState(() => _receiptPath = file.path);
    } catch (_) {
      // Permission denied or error — silently ignore
    } finally {
      setState(() => _pickingImage = false);
    }
  }

  void _viewFullReceipt() {
    if (_receiptPath == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _FullScreenReceiptView(path: _receiptPath!),
      ),
    );
  }

  Future<void> _onConfirm() async {
    if (!_canConfirm) return;

    final provider = context.read<BudgetProvider>();
    await provider.addTransaction(
      envelopeId: _selectedEnvelope!.id,
      amount: _amount,
      description: _descController.text.trim(),
      receiptPath: _receiptPath,
      isExpense: _isExpense,
      isCleared: _isCleared,
    );

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final provider = context.watch<BudgetProvider>();
    final envelopes = provider.envelopes;
    final isPremium = provider.isPremium;

    // Auto-select first envelope if none selected
    if (_selectedEnvelope == null && envelopes.isNotEmpty) {
      _selectedEnvelope = envelopes.first;
    }

    final amountColor = _amount > 0
        ? (_isExpense ? AppColors.secondary : const Color(0xFF3FFF8B))
        : AppColors.onSurface.withAlpha(102);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(178),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.newEntry.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _showDescription ? Icons.notes : Icons.note_add_outlined,
              color: AppColors.onSurfaceVariant,
            ),
            onPressed: () => setState(() => _showDescription = !_showDescription),
          ),
        ],
      ),
      body: Column(
        children: [
          // Expense / Income toggle
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isExpense = true),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: _isExpense
                            ? AppColors.secondary.withAlpha(200)
                            : AppColors.surfaceContainer,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'EXPENSE',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                          color: _isExpense
                              ? Colors.white
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isExpense = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: !_isExpense
                            ? const Color(0xFF3FFF8B).withAlpha(200)
                            : AppColors.surfaceContainer,
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(20),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'INCOME',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                          color: !_isExpense
                              ? Colors.black87
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Envelope selector chips
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: envelopes.length,
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final envelope = envelopes[index];
                  final isSelected = _selectedEnvelope?.id == envelope.id;
                  return GestureDetector(
                    onTap: () =>
                        setState(() => _selectedEnvelope = envelope),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        envelope.name.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                          color: isSelected
                              ? AppColors.onPrimaryContainer
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Amount display
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.currentLedgerEntry.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          letterSpacing: 3.0,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _amountStr == '0' ? '0.00' : _amountStr,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 72,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -2.0,
                        color: amountColor,
                      ),
                    ),
                  ),
                  if (_showDescription) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: _descController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: l10n.description,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    // Receipt photo row (Premium only)
                    if (isPremium) ...[
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _pickingImage ? null : _showReceiptBottomSheet,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (_pickingImage)
                                    const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primary,
                                      ),
                                    )
                                  else
                                    Icon(
                                      _receiptPath != null
                                          ? Icons.check_circle_outline
                                          : Icons.camera_alt_outlined,
                                      size: 18,
                                      color: _receiptPath != null
                                          ? const Color(0xFF3FFF8B)
                                          : AppColors.onSurfaceVariant,
                                    ),
                                  const SizedBox(width: 6),
                                  Text(
                                    _receiptPath != null
                                        ? 'RECEIPT ATTACHED'
                                        : 'ADD RECEIPT',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.5,
                                      color: _receiptPath != null
                                          ? const Color(0xFF3FFF8B)
                                          : AppColors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_receiptPath != null) ...[
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: _viewFullReceipt,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(_receiptPath!),
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () => setState(() => _receiptPath = null),
                              child: const Icon(
                                Icons.close,
                                size: 18,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                    // Mark as Cleared toggle
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline,
                          size: 18,
                          color: AppColors.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'MARK AS CLEARED',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          value: _isCleared,
                          onChanged: (v) => setState(() => _isCleared = v),
                          activeColor: const Color(0xFF3FFF8B),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Giant numpad
          GiantNumpad(
            currentAmount: _amountStr,
            onDigitPressed: _onDigit,
            onBackspace: _onBackspace,
            onDecimalPressed: _onDecimal,
            onDoubleZeroPressed: () {
              _onDigit('0');
              _onDigit('0');
            },
            onConfirm: _onConfirm,
            confirmLabel: l10n.logTransaction.toUpperCase(),
            confirmEnabled: _canConfirm,
          ),
        ],
      ),
    );
  }
}

/// Full-screen receipt viewer with pinch-to-zoom feel (InteractiveViewer)
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
