import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key, required this.itemId, this.episodeId});
  final String itemId;
  final String? episodeId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: l10n.history,
      icon: const Icon(Icons.history),
      onPressed: () => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: .vertical(top: .circular(24)),
        ),
        builder: (_) => DraggableScrollableSheet(
          maxChildSize: 0.95,
          minChildSize: 0.4,
          shouldCloseOnMinExtent: false,
          snap: true,
          expand: false,
          builder: (context, controller) => DecoratedBox(
            decoration: bottomSheetDecoration(context),
            child: HistorySheet(
              itemId: itemId,
              episodeId: episodeId,
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}

class HistorySheet extends ConsumerWidget {
  const HistorySheet({
    super.key,
    required this.itemId,
    this.episodeId,
    required this.controller,
  });
  final String itemId;
  final String? episodeId;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = mediaItemIdKey(itemId, episodeId);
    final history = ref.watch(playbackHistoryProvider(key));
    final historyNotifier = ref.watch(playbackHistoryProvider(key).notifier);
    final theme = Theme.of(context);
    final session = ref.watch(sessionProvider);
    final isCurrentItem =
        (session?.libraryItemId, session?.episodeId) == (itemId, episodeId);

    final items = _groupByDay(history, ref);

    return Column(
      children: [
        Padding(
          padding: const .fromLTRB(24, 24, 24, 0),
          child: Stack(
            alignment: .center,
            children: [
              Align(
                alignment: .center,
                child: Text(
                  l10n.history,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: .w600,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              if (history.isNotEmpty)
                Align(
                  alignment: .centerRight,
                  child: IconButton(
                    visualDensity: .compact,
                    padding: .zero,
                    onPressed: () async {
                      await historyNotifier.clearHistory();
                    },
                    icon: Icon(Icons.delete, color: theme.colorScheme.error),
                  ),
                ),
            ],
          ),
        ),
        history.isEmpty
            ? const Expanded(child: EmptyState())
            : Expanded(
                child: ListView.builder(
                  controller: controller,
                  padding: const .only(bottom: 48),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    if (item is String) return _DayHeader(item);
                    final event = item as PlaybackEvent;
                    return _HistoryEventTile(
                      event: event,
                      onTap: () {
                        if (isCurrentItem) {
                          unawaited(audioHandler.seek(event.position));
                        } else {
                          unawaited(
                            ref
                                .read(audioPlayerProvider.notifier)
                                .play(
                                  itemId: itemId,
                                  episodeId: episodeId,
                                  initialPosition: event.position,
                                ),
                          );
                        }
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
      ],
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const .fromLTRB(24, 16, 24, 4),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: .w600,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _HistoryEventTile extends StatelessWidget {
  const _HistoryEventTile({required this.event, required this.onTap});

  final PlaybackEvent event;
  final VoidCallback onTap;

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeStr = event.timestamp.fString(format: 'HH:mm');

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
              event.position.toTime(padHours: true),
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

String _dayLabel(DateTime day, WidgetRef ref) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(day.year, day.month, day.day);
  final diff = today.difference(target).inDays;
  if (diff == 0) return l10n.today;
  if (diff == 1) return l10n.yesterday;
  final fmt = ref.read(dateTimeFormatProvider);
  return target.fString(format: fmt);
}

List<Object> _groupByDay(List<PlaybackEvent> history, WidgetRef ref) {
  final items = <Object>[];
  String? currentLabel;

  for (final event in history.reversed) {
    final label = _dayLabel(event.timestamp, ref);
    if (label != currentLabel) {
      items.add(label);
      currentLabel = label;
    }
    items.add(event);
  }

  return items;
}
