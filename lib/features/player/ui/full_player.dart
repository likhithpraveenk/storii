import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';
import 'package:storii/shared/helpers/extensions.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);

    if (session == null) {
      return const SizedBox.shrink();
    }

    final currentChapter = ref.watch(currentChapterProvider).value;
    final globalPosition =
        ref.watch(globalPositionProvider).value ?? Duration.zero;

    return Padding(
      padding: const .all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Text(
              currentChapter?.title ?? session.displayTitle,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: .center,
            ),
            const SizedBox(height: 8),
            Text(
              currentChapter != null
                  ? session.displayTitle
                  : session.displayAuthor,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: .center,
            ),
            // TODO: move to top of hero cover in player screen
            Text(
              globalPosition.toTimestamp(),
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: .center,
            ),
            const BookSlider(),
            const Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                // IconButton(
                //   icon: const Icon(Icons.skip_previous, size: 36),
                //   onPressed: audioHandler.skipToPrevious,
                // ),
                AppSeekButton(isForward: false),
                PlayButton(),
                AppSeekButton(isForward: true),
                // IconButton(
                //   icon: const Icon(Icons.skip_next, size: 36),
                //   onPressed: audioHandler.skipToNext,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
