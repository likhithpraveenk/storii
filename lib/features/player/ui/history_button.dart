import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/history_event_tile.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    super.key,
    required this.itemId,
    this.episodeId,
    this.inOverflow = false,
  });
  final String itemId;
  final String? episodeId;
  final bool inOverflow;

  @override
  Widget build(BuildContext context) {
    Future<void> openSheet() => showModalBottomSheet(
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
    );

    if (inOverflow) {
      return ListTile(
        title: Text(l10n.history),
        leading: const Icon(Icons.history),
        onTap: () {
          Navigator.of(context).pop();
          openSheet();
        },
      );
    }

    return IconButton(
      tooltip: l10n.history,
      icon: const Icon(Icons.history),
      onPressed: openSheet,
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
                  style: bottomSheetTitleTextStyle(context),
                ),
              ),
              // if (history.isNotEmpty)
              //   Align(
              //     alignment: .centerRight,
              //     child: IconButton(
              //       visualDensity: .compact,
              //       padding: .zero,
              //       onPressed: () async {
              //         await historyNotifier.clearHistory();
              //       },
              //       icon: Icon(Icons.delete, color: theme.colorScheme.error),
              //     ),
              //   ),
            ],
          ),
        ),
        if (episodeId == null)
          SwitchListTile(
            contentPadding: const .fromLTRB(24, 0, 16, 0),
            title: Text(l10n.showChapterPosition),
            value: ref.watch(showChapterPositionInHistoryProvider),
            onChanged: (value) {
              ref
                  .read(userSettingsProvider.notifier)
                  .setShowChapterPositionInHistory(value);
            },
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
                    return HistoryEventTile(
                      itemId: itemId,
                      event: event,
                      onTap: () {
                        if (isCurrentItem) {
                          unawaited(
                            audioHandler.seekFromGlobalPosition(event.position),
                          );
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
