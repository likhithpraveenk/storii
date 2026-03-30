import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/chapter_button.dart';
import 'package:storii/features/player/ui/history_button.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';
import 'package:storii/features/player/ui/sleep_button.dart';
import 'package:storii/features/player/ui/speed_button.dart';
import 'package:storii/shared/helpers/extensions.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final session = ref.watch(sessionProvider);

    if (session == null) {
      return const SizedBox.shrink();
    }

    final currentChapter = ref.watch(currentChapterProvider).value;
    final globalPosition =
        ref.watch(globalPositionProvider).value ?? Duration.zero;

    final currentPosition = globalPosition.toTime();
    final totalDuration = session.duration.toTime();

    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              currentChapter?.title ?? session.displayTitle,
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
              textAlign: .center,
              maxLines: 1,
              overflow: .ellipsis,
            ),
            Text(
              currentChapter != null
                  ? session.displayTitle
                  : session.displayAuthor,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: .center,
              maxLines: 1,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '$currentPosition / $totalDuration',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.7,
                ),
                fontWeight: .bold,
                letterSpacing: 0.8,
              ),
              textAlign: .center,
            ),
            const BookSlider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous, size: 36),
                  onPressed: currentChapter?.displayIndex == 1
                      ? null
                      : audioHandler.skipToPrevious,
                ),
                const AppSeekButton(isForward: false),
                const PlayButton(),
                const AppSeekButton(isForward: true),
                IconButton(
                  icon: const Icon(Icons.skip_next, size: 36),
                  onPressed:
                      currentChapter?.displayIndex == session.chapters.length
                      ? null
                      : audioHandler.skipToNext,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                HistoryButton(
                  itemId: session.libraryItemId,
                  episodeId: session.episodeId,
                ),
                const SizedBox(width: 16),
                ChapterButton(session.chapters),
                const SizedBox(width: 16),
                const SleepButton(),
                const SizedBox(width: 16),
                const SpeedButton(),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
