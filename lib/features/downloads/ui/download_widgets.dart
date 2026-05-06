import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class DownloadTrackProgress extends StatelessWidget {
  const DownloadTrackProgress({super.key, required this.item});
  final DownloadItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final activeTracks = item.tracks
        .where((track) => track.status != .completed)
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          for (final (i, track) in activeTracks.indexed) ...[
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  track.audioTrack.metadata?.filename ??
                      track.audioTrack.index.toString(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                  overflow: .ellipsis,
                ),
                const SizedBox(width: 8),
                Text(
                  _trackLabel(track),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            LinearProgressIndicator(
              value: _trackProgress(track),
              borderRadius: .circular(2),
              minHeight: 3,
              color: _trackColor(track, scheme),
              backgroundColor: scheme.surfaceContainerHighest,
            ),
            if (i < item.tracks.length - 1) const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }

  double? _trackProgress(DownloadTrack t) {
    if (t.bytesTotal == 0) return null;
    return (t.bytesReceived / t.bytesTotal).clamp(0.0, 1.0);
  }

  String _trackLabel(DownloadTrack t) {
    return '${formatBytes(t.bytesReceived)} / ${formatBytes(t.bytesTotal)}';
  }

  Color _trackColor(DownloadTrack t, ColorScheme scheme) => switch (t.status) {
    .downloading => scheme.secondary,
    .failed => scheme.error,
    _ => scheme.outline,
  };
}

class DownloadStatusRow extends StatelessWidget {
  const DownloadStatusRow({super.key, required this.item});

  final DownloadItem item;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return switch (item.status) {
      .queued => Row(
        children: [
          Icon(Icons.schedule, color: scheme.outline, size: 12),
          const SizedBox(width: 6),
          Text(l10n.queued, style: textTheme.labelSmall),
        ],
      ),
      .downloading => Row(
        children: [
          Text(
            '${(item.progress * 100).toStringAsFixed(0)}%',
            style: textTheme.labelSmall,
          ),
          if (item.totalBytes > 0) ...[
            Text(' · ', style: textTheme.labelSmall),
            Text(formatBytes(item.totalBytes), style: textTheme.labelSmall),
          ],
        ],
      ),
      .completed => Text(
        formatBytes(item.totalBytes),
        style: textTheme.labelSmall?.copyWith(color: scheme.primary),
      ),
      .failed => Text(
        l10n.failed,
        style: textTheme.labelSmall?.copyWith(color: scheme.error),
      ),
      .paused => Text(
        '${l10n.paused}'
        ' · '
        '${formatBytes(item.receivedBytes)} / ${formatBytes(item.totalBytes)}',
        style: textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
      ),
    };
  }
}

class DownloadTileTrailingActions extends ConsumerWidget {
  const DownloadTileTrailingActions({super.key, required this.item});

  final DownloadItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queue = ref.read(downloadQueueProvider.notifier);

    return switch (item.status) {
      .downloading || .queued => IconButton(
        icon: const Icon(Icons.pause_circle_outline),
        tooltip: l10n.pause,
        onPressed: () => queue.pause(item.libraryItemId),
      ),
      .paused || .failed => IconButton(
        icon: const Icon(Icons.play_circle_outline),
        tooltip: l10n.resume,
        onPressed: () => queue.enqueue(item.libraryItemId),
      ),
      .completed => IconButton(
        icon: Icon(
          Icons.delete_outline,
          color: Theme.of(context).colorScheme.error,
        ),
        tooltip: l10n.delete,
        onPressed: () =>
            showDownloadsDeleteDialog(context, item: item, ref: ref),
      ),
    };
  }
}

void showDownloadsDeleteDialog(
  BuildContext context, {
  required WidgetRef ref,
  required DownloadItem item,
}) {
  AppDialog.show(
    context,
    title: l10n.removeDownloadQ,
    body: Column(
      children: [
        Text(item.title),
        Text(l10n.willBeFreed(formatBytes(item.receivedBytes))),
      ],
    ),
    actionLabel: l10n.remove,
    isDestructive: true,
    onTap: () async {
      await ref
          .read(downloadQueueProvider.notifier)
          .delete(item.libraryItem.id);
    },
  );
}
