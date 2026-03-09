import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';

class FullPlayer extends ConsumerWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final session = ref.watch(sessionProvider);

    if (session == null) {
      return const SizedBox.shrink();
    }

    final currentChapter = ref.watch(currentChapterProvider).value;
    final globalPosition =
        ref.watch(globalPositionProvider).value ?? Duration.zero;

    final totalDuration = session.duration;
    final (hr, min) = (totalDuration - globalPosition).toReadableDuration();
    final progressValue =
        (globalPosition.inMicroseconds / totalDuration.inMicroseconds).clamp(
          0.0,
          1.0,
        );
    final progress = '${(progressValue * 100).toStringAsFixed(1)}%';

    return Padding(
      padding: const .all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Text(
              currentChapter?.title ?? session.displayTitle,
              style: theme.textTheme.titleLarge,
              textAlign: .center,
              maxLines: 1,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              currentChapter != null
                  ? session.displayTitle
                  : session.displayAuthor,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: .center,
              maxLines: 1,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '$progress • ${l.durationRemaining(hr, min)}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: .w600,
                letterSpacing: 0.5,
              ),
              textAlign: .center,
            ),
            const BookSlider(),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous, size: 36),
                  onPressed: audioHandler.skipToPrevious,
                ),
                const AppSeekButton(isForward: false),
                const PlayButton(),
                const AppSeekButton(isForward: true),
                IconButton(
                  icon: const Icon(Icons.skip_next, size: 36),
                  onPressed: audioHandler.skipToNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
