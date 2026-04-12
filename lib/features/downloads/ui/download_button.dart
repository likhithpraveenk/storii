import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/download_item.dart';
import 'package:storii/features/downloads/logic/download_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class DownloadButton extends ConsumerWidget {
  const DownloadButton({super.key, required this.libraryItemId});

  final String libraryItemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloads = ref.watch(downloadsProvider);
    final item = downloads[libraryItemId];
    final notifier = ref.read(downloadsProvider.notifier);
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;

    if (item == null) {
      return IconButton(
        tooltip: l.download,
        icon: const Icon(Icons.download_outlined),
        onPressed: () => notifier.download(libraryItemId),
      );
    }

    return switch (item.status) {
      .queued || .downloading => _ProgressButton(
        progress: item.progress,
        onCancel: () => notifier.cancel(libraryItemId),
      ),
      .complete => Container(
        decoration: BoxDecoration(
          color: scheme.secondaryFixedDim,
          borderRadius: .circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const .all(4),
        child: InkWell(
          borderRadius: .circular(6),
          child: Icon(Icons.download_done, color: scheme.onSecondaryFixed),
          onTap: () => _confirmDelete(context, ref, item),
        ),
      ),
      .failed => IconButton(
        tooltip: l.downloadFailed,
        icon: Icon(Icons.error_outline, color: scheme.error),
        onPressed: () => notifier.download(libraryItemId),
      ),
      .paused => IconButton(
        tooltip: l.resumeDownload,
        icon: Icon(Icons.download_for_offline_outlined, color: scheme.primary),
        onPressed: () => notifier.resume(libraryItemId),
      ),
    };
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, DownloadItem item) {
    final l = AppLocalizations.of(context)!;
    showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.removeDownloadQ),
        content: Text(
          '${item.title}\n${l.willBeFreed(formatBytes(item.totalBytes))}',
        ),
        actionsAlignment: .spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l.cancel),
          ),
          AppFilledButton(
            isDestructive: true,
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(downloadsProvider.notifier).delete(item.libraryItemId);
            },
            text: AppLocalizations.of(context)!.remove,
          ),
        ],
      ),
    );
  }
}

class _ProgressButton extends StatelessWidget {
  const _ProgressButton({required this.progress, required this.onCancel});

  final double progress;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return IconButton(
      tooltip: '${(progress * 100).toStringAsFixed(0)}%',
      onPressed: onCancel,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator(
              value: progress > 0 ? progress : null,
              strokeWidth: 2.5,
              color: scheme.primary,
            ),
          ),
          Icon(Icons.close, size: 12, color: scheme.onSurface),
        ],
      ),
    );
  }
}
