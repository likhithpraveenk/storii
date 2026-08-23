import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/storage/local/backup_service.dart';

class BackupSettingsTile extends StatelessWidget {
  const BackupSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.backup_outlined),
      title: Text(l10n.backup),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.backup,
          subtitle: l10n.backupDescription,
          body: const _BackupSettingsSheet(),
        );
      },
    );
  }
}

class RestoreButton extends StatelessWidget {
  const RestoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: l10n.backup,
      onPressed: () {
        AppBottomSheet.show(
          context,
          title: l10n.backup,
          subtitle: l10n.backupDescription,
          body: const _BackupSettingsSheet(onlyRestore: true),
        );
      },
      icon: const Icon(Icons.cloud_download_outlined),
    );
  }
}

class _BackupSettingsSheet extends ConsumerStatefulWidget {
  const _BackupSettingsSheet({this.onlyRestore = false});

  final bool onlyRestore;

  @override
  ConsumerState<_BackupSettingsSheet> createState() =>
      _BackupSettingsSheetState();
}

class _BackupSettingsSheetState extends ConsumerState<_BackupSettingsSheet> {
  bool _exporting = false;
  bool _restoring = false;

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _createBackup(BuildContext context) async {
    setState(() => _exporting = true);
    try {
      final path = await BackupService.createBackup();
      if (!context.mounted) return;
      if (path != null) {
        _snack(context, l10n.backupCreated);
        Navigator.of(context).pop();
      }
    } catch (e) {
      log('backup error: $e');
      if (context.mounted) _snack(context, l10n.backupFailed);
    } finally {
      if (context.mounted) setState(() => _exporting = false);
    }
  }

  Future<void> _restoreBackup(BuildContext context) async {
    final file = await FilePicker.pickFile(
      type: .custom,
      allowedExtensions: ['json'],
    );
    if (file == null) return;

    setState(() => _restoring = true);
    try {
      final bytes = await BackupService.readBackupFile(file);
      await BackupService.restoreBackup(bytes);
      if (!context.mounted) return;
      _snack(context, l10n.restoreRestart);
      Navigator.of(context).pop();
    } catch (e) {
      log('restore error: $e');
      if (context.mounted) _snack(context, l10n.restoreFailed);
    } finally {
      if (context.mounted) setState(() => _restoring = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AppOutlinedButton(
              text: l10n.restoreBackup,
              onPressed: _restoring ? null : () => _restoreBackup(context),
              icon: const Icon(Icons.restore_outlined),
              loading: _restoring,
            ),
          ),
          if (!widget.onlyRestore) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                text: l10n.createBackup,
                onPressed: _exporting ? null : () => _createBackup(context),
                icon: const Icon(Icons.save_outlined),
                loading: _exporting,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
