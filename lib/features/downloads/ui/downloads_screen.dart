import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/downloads/logic/download_notifier.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/waveform.dart';

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloads = ref.watch(downloadsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.downloads,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: downloads.isEmpty
          ? const EmptyState()
          : ListView.builder(
              padding: const .only(bottom: 8),
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final item = downloads.values.elementAt(index);
                return _DownloadTile(item: item);
              },
            ),
    );
  }
}

class _DownloadTile extends ConsumerWidget {
  const _DownloadTile({required this.item});

  final DownloadItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(downloadsProvider.notifier);

    return Column(
      mainAxisSize: .min,
      children: [
        ListTile(
          contentPadding: const .fromLTRB(16, 8, 16, 4),
          onTap: item.isComplete
              ? () => context.push(
                  AppRoute.itemDetail.path,
                  extra: item.libraryItemId,
                )
              : null,
          leading: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: .circular(8),
              child: ImageWidget(id: item.libraryItemId, type: .item),
            ),
          ),
          title: Text(
            item.title,
            maxLines: 2,
            overflow: .ellipsis,
            style: theme.textTheme.titleSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: .start,
            children: [
              if (item.author.isNotEmpty)
                Text(
                  item.author,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 4),
              _StatusRow(item: item),
            ],
          ),
          trailing: _TrailingActions(item: item, notifier: notifier),
        ),
        if (item.status == .downloading || item.status == .paused)
          _TrackProgress(item: item),
      ],
    );
  }
}

class _TrackProgress extends StatelessWidget {
  const _TrackProgress({required this.item});
  final DownloadItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          for (final (i, track) in item.tracks.indexed) ...[
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  track.audioTrack.metadata.filename,
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
    if (t.status == .completed) return 1.0;
    if (t.bytesTotal == 0) return null;
    return (t.bytesReceived / t.bytesTotal).clamp(0.0, 1.0);
  }

  String _trackLabel(DownloadTrack t) {
    return switch (t.status) {
      .completed => formatBytes(t.bytesTotal),
      .downloading when t.bytesTotal > 0 =>
        '${formatBytes(t.bytesReceived)} / ${formatBytes(t.bytesTotal)}',
      .paused => 'paused',
      _ => '',
    };
  }

  Color _trackColor(DownloadTrack t, ColorScheme scheme) => switch (t.status) {
    .completed => scheme.primary,
    .downloading => scheme.secondary,
    .failed => scheme.error,
    _ => scheme.outline,
  };
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.item});

  final DownloadItem item;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;

    return switch (item.status) {
      .queued => Row(
        children: [
          const SizedBox.square(
            dimension: 16,
            child: RandomWaveform(barCount: 4, barMaxHeight: 12, barWidth: 2),
          ),
          const SizedBox(width: 6),
          Text(l.queued, style: textTheme.labelSmall),
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
      .failed || .cancelled => Text(
        l.failed,
        style: textTheme.labelSmall?.copyWith(color: scheme.error),
      ),
      .paused => Text(
        '${l.paused}'
        ' · '
        '${formatBytes(item.receivedBytes)} / ${formatBytes(item.totalBytes)}',
        style: textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
      ),
    };
  }
}

class _TrailingActions extends StatelessWidget {
  const _TrailingActions({required this.item, required this.notifier});

  final DownloadItem item;
  final DownloadsNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (item.status) {
      .downloading || .queued => IconButton(
        icon: const Icon(Icons.pause_circle_outline),
        tooltip: l.pause,
        onPressed: () => notifier.pause(item.libraryItemId),
      ),
      .paused || .failed || .cancelled => IconButton(
        icon: const Icon(Icons.play_circle_outline),
        tooltip: l.resume,
        onPressed: () => notifier.resume(item.libraryItemId),
      ),
      .completed => IconButton(
        icon: Icon(
          Icons.delete_outline,
          color: Theme.of(context).colorScheme.error,
        ),
        tooltip: l.delete,
        onPressed: () => confirmDelete(context),
      ),
    };
  }

  void confirmDelete(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.removeDownloadQ),
        content: Text(
          '${item.title}\n${l.willBeFreed(formatBytes(item.totalBytes))}',
        ),
        actionsAlignment: .spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l.cancel),
          ),
          AppFilledButton(
            isDestructive: true,
            onPressed: () {
              Navigator.pop(context);
              notifier.delete(item.libraryItem.id);
            },
            text: l.remove,
          ),
        ],
      ),
    );
  }
}
