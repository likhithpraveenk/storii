import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/ui/chapter_list.dart';
import 'package:storii/features/player/ui/history_button.dart';
import 'package:storii/features/player/ui/more_actions_sheet.dart';
import 'package:storii/features/player/ui/sleep_button.dart';
import 'package:storii/features/player/ui/speed_button.dart';
import 'package:storii/features/player/ui/volume_button.dart';

extension WidgetX on FullPlayerActions {
  Widget? widget(
    BuildContext context,
    PlaybackSession session, {
    bool inOverflow = false,
  }) => switch (this) {
    .history => HistoryButton(
      itemId: session.libraryItemId,
      episodeId: session.episodeId,
      inOverflow: inOverflow,
    ),
    .chapters => ChaptersActionButton(session: session, inOverflow: inOverflow),
    .sleep => SleepButton(inOverflow: inOverflow),
    .speed => SpeedButton(inOverflow: inOverflow),
    .volume => VolumeButton(inOverflow: inOverflow),
  };
}

class FullPlayerActionsWidget extends ConsumerWidget {
  const FullPlayerActionsWidget(this.session, {super.key});

  final PlaybackSession session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinned = ref.watch(pinnedPlayerActionsProvider);
    final pinnedSet = pinned.toSet();
    final remaining = FullPlayerActions.values
        .where((action) => !pinnedSet.contains(action))
        .toList();

    return Row(
      mainAxisAlignment: .spaceAround,
      children: [
        ...pinned.map((a) => a.widget(context, session)).whereType<Widget>(),
        IconButton(
          tooltip: l10n.more,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: .vertical(top: .circular(24)),
              ),
              isScrollControlled: true,
              builder: (context) => SafeArea(
                child: MoreActionsSheet(remaining: remaining, session: session),
              ),
            );
          },
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
