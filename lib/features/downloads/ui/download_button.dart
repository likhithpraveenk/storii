import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/features/downloads/logic/download_notifier.dart';
import 'package:storii/features/downloads/ui/download_widgets.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/l10n/l10n.dart';

class ActiveDownloadsButton extends ConsumerWidget {
  const ActiveDownloadsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeDownloads = ref.read(activeDownloadsProvider);
    final activeCount = activeDownloads.length;
    if (activeDownloads.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Stack(
      children: [
        IconButton(
          tooltip: AppLocalizations.of(context)!.downloads,
          onPressed: () {
            context.push(
              AppRoute.downloads.path,
              extra: DownloadsScreenTab.active,
            );
          },
          icon: const Icon(Icons.download_outlined),
        ),
        if (activeCount > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: const .all(3),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: .circle,
              ),
              child: Text(
                '$activeCount',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 9,
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

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

    return switch (item?.status) {
      null || .cancelled => IconButton(
        tooltip: l.download,
        icon: const Icon(Icons.download_outlined),
        onPressed: () => notifier.download(libraryItemId),
      ),
      .queued => IconButton(
        tooltip: l.queued,
        icon: Icon(Icons.schedule, color: scheme.outline),
        onPressed: () => notifier.cancel(libraryItemId),
      ),
      .downloading => _ProgressButton(
        progress: item!.progress,
        onCancel: () => notifier.cancel(libraryItemId),
      ),
      .completed => IconButton(
        tooltip: l.downloaded,
        icon: const Icon(
          Icons.download_for_offline_outlined,
          color: appGreenColor,
        ),
        onPressed: () => showDownloadsDeleteDialog(context, item: item!),
      ),
      .failed => IconButton(
        tooltip: l.downloadFailed,
        icon: Icon(Icons.refresh, color: scheme.error),
        onPressed: () => notifier.download(libraryItemId),
      ),
      .paused => IconButton(
        tooltip: l.resumeDownload,
        icon: Icon(Icons.play_circle_outline, color: scheme.tertiary),
        onPressed: () => notifier.resume(libraryItemId),
      ),
    };
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
        alignment: .center,
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
