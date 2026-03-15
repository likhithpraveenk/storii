import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    if (session == null) {
      return const SizedBox.shrink();
    }

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isPlaying = ref.watch(isPlayingProvider);
    final processingState = ref.watch(processingStateProvider);
    final isLoading =
        processingState == .loading || processingState == .buffering;
    final currentChapter = ref.watch(currentChapterProvider).value;
    final chapterPosition =
        ref.watch(chapterPositionProvider).value ?? Duration.zero;
    final remaining =
        (currentChapter?.duration ?? Duration.zero) - chapterPosition;
    final remainingStr = remaining.toReadableDuration(context, isLeft: true);

    return Container(
      padding: const .all(8),
      decoration: BoxDecoration(
        borderRadius: const .only(
          topLeft: .circular(4),
          topRight: .circular(4),
        ),
        color: colorScheme.surface,
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
                if (currentChapter != null)
                  Text(
                    session.displayTitle,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.8,
                      ),
                      fontWeight: .w600,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                MarqueeText(
                  currentChapter?.title ?? session.displayTitle,
                  style: textTheme.labelLarge?.copyWith(fontWeight: .bold),
                ),
                if (currentChapter != null)
                  Text(
                    remainingStr,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: .bold,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.replay, size: 24),
            onPressed: audioHandler.rewind,
          ),
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 36),
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
