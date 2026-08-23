import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class PlayButton extends ConsumerWidget {
  const PlayButton(this.item, {super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      audioPlayerProvider.select((s) => s.loadingItemId == item.id),
    );

    final isCurrentItem = ref.watch(
      sessionProvider.select((s) => s?.libraryItemId == item.id),
    );
    final isPlaying = isCurrentItem && ref.watch(isPlayingProvider);

    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(item.id))
        .value;
    final progress = mediaProgress?.progress ?? 0.0;

    final isPodcast = item.isPodcast;

    String? remaining;
    String label;
    String? episodeId;

    if (isPodcast) {
      label = isPlaying ? l10n.pause : l10n.play;
      if (!isCurrentItem) {
        final unfinished = item.episodes.where(
          (e) =>
              ref
                  .watch(mediaProgressFromMapProvider(item.id, e.id))
                  .value
                  ?.isFinished !=
              true,
        );
        episodeId = unfinished.firstOrNull?.id;
      }
    } else {
      remaining =
          (item.duration - (mediaProgress?.currentTime ?? Duration.zero))
              .toReadableDuration(isLeft: true);
      label = isPlaying
          ? l10n.pause
          : progress == 1.0
          ? l10n.replay
          : progress > 0
          ? '${l10n.resume} • $remaining'
          : l10n.play;
    }

    return AppFilledButton(
      loading: isLoading,
      onPressed: () async {
        if (isCurrentItem) {
          await audioHandler.togglePlay();
        } else {
          await ref
              .read(audioPlayerProvider.notifier)
              .play(itemId: item.id, episodeId: episodeId);
        }
      },
      icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
      text: label,
    );
  }
}
