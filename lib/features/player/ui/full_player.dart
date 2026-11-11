import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/player_cover_geometry.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/button_layout_big.dart';
import 'package:storii/features/player/ui/button_layout_compact.dart';
import 'package:storii/features/player/ui/button_layout_default.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/features/player/ui/progress_label.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class FullPlayer extends ConsumerWidget {
  const new({super.key, required this.expandFactor});

  final double expandFactor;

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

    final totalDuration = session.duration;
    final remaining = scale(totalDuration - globalPosition);

    final title = currentChapter?.title ?? session.displayTitle ?? l10n.noTitle;
    final subtitle = currentChapter != null
        ? session.displayTitle ?? l10n.noTitle
        : session.displayAuthor ?? l10n.noAuthor;

    final layout = ref.watch(playbackControlsLayoutProvider);

    final screen = MediaQuery.sizeOf(context);
    final isLandscape = screen.width > screen.height;
    final topInset = isLandscape
        ? statusBarHeight(context)
        : fullPlayerTopInset(context);
    final (:left, :size, :top) = playerCoverGeometry(
      screenWidth: screen.width,
      screenHeight: screen.height,
      expandFactor: expandFactor,
      topInset: topInset,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        Widget scroll(double minHeight) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: math.max(0, minHeight)),
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
                const SizedBox(height: 8),
                if (showChapterProgressSlider)
                  ProgressLabel(
                    currentPosition: globalPosition,
                    totalDuration: totalDuration,
                    remaining: remaining,
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
                const SizedBox(height: 8),
                if (layout != .big) ...[
                  FullPlayerActionsWidget(session),
                  const SizedBox(height: 8),
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

        if (isLandscape) {
          final statusBar = statusBarHeight(context);
          return Row(
            children: [
              const _PlayerHeader(isVertical: true),
              Expanded(
                child: Padding(
                  padding: .only(left: size, top: statusBar),
                  child: scroll(
                    constraints.maxHeight - statusBar - fullPlayerBottomPadding,
                  ),
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            const _PlayerHeader(),
            SizedBox(height: size + playerCoverContentGap),
            Expanded(
              child: scroll(
                constraints.maxHeight -
                    topInset -
                    size -
                    playerCoverContentGap -
                    fullPlayerBottomPadding,
              ),
            ),
          ],
        );
      },
    );
  }
}

double fullPlayerTopInset(BuildContext context) =>
    fullPlayerHeaderHeight + statusBarHeight(context);

double statusBarHeight(BuildContext context) =>
    MediaQueryData.fromView(View.of(context)).padding.top;

class _PlayerHeader extends ConsumerWidget {
  const new({this.isVertical = false});

  final bool isVertical;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collapseButton = IconButton(
      tooltip: l10n.collapse,
      onPressed: () => ref.read(playerModeProvider.notifier).toMini(),
      icon: const Icon(Icons.keyboard_arrow_down),
    );

    return SizedBox(
      width: isVertical ? fullPlayerHeaderHeight : null,
      height: isVertical ? null : fullPlayerTopInset(context),
      child: Padding(
        padding: .only(top: statusBarHeight(context)),
        child: isVertical
            ? Column(children: [collapseButton])
            : Row(
                children: [
                  collapseButton,
                  const Expanded(child: SizedBox.shrink()),
                ],
              ),
      ),
    );
  }
}
