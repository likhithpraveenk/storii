import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/button_layout_big.dart';
import 'package:storii/features/player/ui/button_layout_compact.dart';
import 'package:storii/features/player/ui/button_layout_default.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class FullPlayer extends ConsumerWidget {
  const new({super.key});

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

    final localSpeed = ref.watch(localSpeedProvider);
    final scaleTimeBySpeed = ref.watch(scaleTimeBySpeedProvider);
    final showChapterProgressSlider = ref.watch(
      showChapterProgressSliderProvider,
    );

    Duration scale(Duration d) => scaleTimeBySpeed
        ? Duration(microseconds: (d.inMicroseconds / localSpeed).round())
        : d;

    final currentPosition = scale(globalPosition).toTime();
    final totalDuration = scale(session.duration).toTime();

    final title = session.isPodcastEpisode
        ? session.displayTitle ?? l10n.noTitle
        : currentChapter?.title ?? session.displayTitle ?? l10n.noTitle;
    final subtitle = session.isPodcastEpisode
        ? session.mediaMetadata.title ?? session.displayAuthor ?? l10n.noTitle
        : currentChapter != null
        ? session.displayTitle ?? l10n.noTitle
        : session.displayAuthor ?? l10n.noAuthor;

    final layout = ref.watch(playbackControlsLayoutProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 32),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Padding(
                  padding: const .symmetric(horizontal: 24),
                  child: MarqueeText(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const .symmetric(horizontal: 24),
                  child: Text(
                    subtitle,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: .center,
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                if (showChapterProgressSlider)
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
                const Padding(
                  padding: .symmetric(horizontal: 24),
                  child: BookSlider(),
                ),
                switch (layout) {
                  .defaultLayout => const ButtonLayoutDefault(),
                  .compact => const ButtonLayoutCompact(),
                  .big => const ButtonLayoutBig(),
                },
                const SizedBox(height: 12),
                if (layout != .big) ...[
                  FullPlayerActionsWidget(session),
                  const SizedBox(height: 12),
                ],
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
