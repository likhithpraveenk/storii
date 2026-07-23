import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/features/player/ui/play_button.dart';
import 'package:storii/features/player/ui/seek_button.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

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

    final title = session.isPodcastEpisode
        ? session.displayTitle ?? l10n.noTitle
        : currentChapter?.title ?? session.displayTitle ?? l10n.noTitle;
    final subtitle = session.isPodcastEpisode
        ? session.mediaMetadata.title ?? session.displayAuthor ?? l10n.noTitle
        : currentChapter != null
        ? session.displayTitle ?? l10n.noTitle
        : session.displayAuthor ?? l10n.noAuthor;

    // TODO: multiple layouts support
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const .symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 32),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                MarqueeText(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
                ),
                Text(
                  subtitle,
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
                Row(
                  mainAxisAlignment: .spaceBetween,
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
                FullPlayerActionsWidget(session),
                Text(
                  session.playMethod.label,
                  textAlign: .center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outlineVariant,
                    fontStyle: .italic,
                  ),
                ),
                SizedBox(height: MediaQuery.paddingOf(context).bottom),
              ],
            ),
          ),
        );
      },
    );
  }
}
