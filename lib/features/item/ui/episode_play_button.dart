import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

class EpisodePlayButton extends ConsumerWidget {
  const new({required this.episode, super.key});
  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = ref.watch(
      sessionProvider.select(
        (s) =>
            s?.libraryItemId == episode.libraryItemId &&
            s?.episodeId == episode.id,
      ),
    );
    final isPlaying = isActive && ref.watch(isPlayingProvider);

    return IconButton(
      onPressed: () {
        if (isActive) {
          audioHandler.togglePlay();
          return;
        }
        ref
            .read(queueProvider.notifier)
            .play(itemId: episode.libraryItemId, episodeId: episode.id);
      },
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Theme.of(context).colorScheme.primary,
      ),
      tooltip: isPlaying ? l10n.pause : l10n.play,
    );
  }
}
