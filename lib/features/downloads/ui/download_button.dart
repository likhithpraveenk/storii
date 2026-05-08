import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/ui/download_widgets.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';

class ActiveDownloadsButton extends ConsumerWidget {
  const ActiveDownloadsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeDownloads = ref.watch(activeDownloadsProvider).value ?? [];
    final activeCount = activeDownloads.length;
    if (activeDownloads.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Stack(
      children: [
        IconButton(
          tooltip: l10n.downloads,
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
    final item = ref.watch(downloadItemProvider(libraryItemId));
    final queue = ref.read(downloadQueueProvider.notifier);
    final scheme = Theme.of(context).colorScheme;

    return switch (item?.status) {
      null => IconButton(
        tooltip: l10n.download,
        icon: const Icon(Icons.download_outlined),
        onPressed: () => queue.enqueue(libraryItemId),
      ),
      .queued => IconButton(
        tooltip: l10n.queued,
        icon: Icon(Icons.schedule, color: scheme.outline),
        onPressed: () => queue.delete(libraryItemId),
      ),
      .downloading => _ProgressButton(
        progress: item!.progress,
        onCancel: () => queue.delete(libraryItemId),
      ),
      .completed => IconButton(
        tooltip: l10n.downloaded,
        icon: const Icon(
          Icons.download_for_offline_outlined,
          color: appGreenColor,
        ),
        onPressed: () =>
            showDownloadsDeleteDialog(context, item: item!, ref: ref),
      ),
      .failed => IconButton(
        tooltip: l10n.downloadFailed,
        icon: Icon(Icons.refresh, color: scheme.error),
        onPressed: () => queue.enqueue(libraryItemId),
      ),
      .paused => IconButton(
        tooltip: l10n.resumeDownload,
        icon: Icon(Icons.play_circle_outline, color: scheme.tertiary),
        onPressed: () => queue.enqueue(libraryItemId),
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
