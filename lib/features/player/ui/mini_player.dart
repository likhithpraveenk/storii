import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    if (session == null) {
      return const SizedBox.shrink();
    }

    final isPlaying = ref.watch(isPlayingProvider);
    final processingState = ref.watch(processingStateProvider);
    final isLoading =
        processingState == .loading || processingState == .buffering;

    return Container(
      padding: const .all(8),
      decoration: BoxDecoration(
        borderRadius: const .only(
          topLeft: .circular(4),
          topRight: .circular(4),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          const SizedBox(width: imgSizeInMiniPlayer),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                MarqueeText(
                  session.displayTitle,
                  style: const TextStyle(fontWeight: .bold),
                ),
                MarqueeText(
                  session.displayAuthor,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.replay, size: 24),
            onPressed: audioHandler.rewind,
          ),
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 24),
            onPressed: isLoading ? null : audioHandler.togglePlay,
          ),
          IconButton(
            onPressed: audioHandler.fastForward,
            icon: Transform.flip(
              flipX: true,
              child: const Icon(Icons.replay, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
