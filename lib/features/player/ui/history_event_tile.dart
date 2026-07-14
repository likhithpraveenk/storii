import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

class HistoryEventTile extends ConsumerWidget {
  const HistoryEventTile({
    required this.itemId,
    required this.event,
    required this.onTap,
    super.key,
  });

  final PlaybackEvent event;
  final VoidCallback onTap;
  final String itemId;

  IconData get _icon => switch (event.kind) {
    .play => Icons.play_circle_outline,
    .pause => Icons.pause_circle_outline,
    .seek => Icons.commit,
    .sync => Icons.cloud_download_outlined,
    .stop => Icons.stop_circle_outlined,
    .complete => Icons.check_circle_outline,
  };

  Color _color(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (event.kind) {
      .play => scheme.primary,
      .pause => scheme.onSurfaceVariant,
      .seek => scheme.onSurfaceVariant,
      .sync => scheme.tertiary,
      .stop => scheme.error,
      .complete => scheme.primary,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final timeStr = event.timestamp.fString(format: 'HH:mm');
    final item = ref.watch(itemDetailProvider(itemId)).value;

    final showChapter = item?.isPodcast == true
        ? false
        : ref.watch(showChapterPositionInHistoryProvider);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const .symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              child: Text(
                timeStr,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(_icon, size: 16, color: _color(context)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(event.kind.label, style: theme.textTheme.bodyMedium),
            ),
            if (event.playbackError) ...[
              Text(
                l10n.playbackError,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontStyle: .italic,
                  overflow: .ellipsis,
                ),
              ),
              const SizedBox(width: 6),
            ],
            if (event.syncAttempt) ...[
              Icon(
                event.syncSuccess
                    ? Icons.cloud_done_outlined
                    : Icons.error_outline,
                size: 14,
                color: event.syncSuccess
                    ? theme.colorScheme.primary
                    : theme.colorScheme.error,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              showChapter
                  ? '${item?.historyPosition(event.position)}'
                  : event.position.toTime(padHours: true),
              style: theme.textTheme.bodySmall?.copyWith(
                fontFeatures: [const .tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
