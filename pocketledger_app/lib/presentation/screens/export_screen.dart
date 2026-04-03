import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/services/export_service.dart';
import '../providers/budget_provider.dart';

class ExportScreen extends StatelessWidget {
  final ExportService exportService;

  const ExportScreen({super.key, required this.exportService});

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
          l10n.dataManagement.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _ActionCard(
              icon: Icons.save_alt,
              title: l10n.exportJson,
              onTap: () => _exportJson(context),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.table_chart,
              title: l10n.exportCsv,
              onTap: () => _exportCsv(context),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.upload_file,
              title: l10n.importData,
              onTap: () => _importData(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportJson(BuildContext context) async {
    if (!_requirePremium(context)) return;
    final l10n = AppLocalizations.of(context);
    try {
      final path = await exportService.exportJson();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.exportSuccess)),
        );
        await Share.shareXFiles([XFile(path)]);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error}: $e')),
        );
      }
    }
  }

  Future<void> _exportCsv(BuildContext context) async {
    if (!_requirePremium(context)) return;
    final l10n = AppLocalizations.of(context);
    try {
      final path = await exportService.exportCsv();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.exportSuccess)),
        );
        await Share.shareXFiles([XFile(path)]);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error}: $e')),
        );
      }
    }
  }

  Future<void> _importData(BuildContext context) async {
    if (!_requirePremium(context)) return;
    final l10n = AppLocalizations.of(context);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );
      if (result == null || result.files.single.path == null) return;

      await exportService.importJson(result.files.single.path!);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.importSuccess)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error}: $e')),
        );
      }
    }
  }

  /// Returns true if user is premium, otherwise shows upgrade dialog.
  bool _requirePremium(BuildContext context) {
    final provider = context.read<BudgetProvider>();
    if (provider.canExportImport) return true;

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
              provider.iapService.purchasePremium();
            },
            child: Text(
              l10n.upgradeNow,
              style: const TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
    return false;
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
