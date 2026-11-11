import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/playback_history.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/history_event_tile.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class HistoryButton extends StatelessWidget {
  const new({
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
    Future<void> openSheet(BuildContext ctx) => showModalBottomSheet(
      context: ctx,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(kRadiusXl)),
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
        title: Text(l10n.playbackHistory),
        leading: const Icon(Icons.history),
        onTap: () {
          final navigator = Navigator.of(context)..pop();
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => openSheet(navigator.context),
          );
        },
      );
    }

    return IconButton(
      tooltip: l10n.playbackHistory,
      icon: const Icon(Icons.history),
      onPressed: () => openSheet(context),
    );
  }
}

class HistorySheet extends ConsumerWidget {
  const new({
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
    final historyNotifier = ref.read(playbackHistoryProvider(key).notifier);
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
                child: Text(
                  l10n.playbackHistory,
                  style: bottomSheetTitleTextStyle(context),
                ),
              ),
              if (history.isNotEmpty)
                Align(
                  alignment: .centerRight,
                  child: IconButton(
                    visualDensity: .compact,
                    padding: .zero,
                    onPressed: () async {
                      final confirmed = await AppDialog.show<bool>(
                        context,
                        title: l10n.clearHistoryQ,
                        actionLabel: l10n.confirm,
                        isDestructive: true,
                        onTap: () async {},
                      );
                      if (confirmed != true) return;
                      await historyNotifier.clearHistory();
                    },
                    icon: Icon(Icons.delete, color: theme.colorScheme.error),
                  ),
                ),
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
        if (history.isEmpty)
          const Expanded(child: EmptyState())
        else
          Expanded(
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
                  episodeId: episodeId,
                  event: event,
                  onTap: () {
                    if (isCurrentItem) {
                      unawaited(
                        audioHandler.seekFromGlobalPosition(event.position),
                      );
                    } else {
                      unawaited(
                        ref
                            .read(queueProvider.notifier)
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
  const new(this.label);
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
