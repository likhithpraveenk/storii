import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/player_cover_geometry.dart';
import 'package:storii/features/player/logic/player_theme.dart';
import 'package:storii/features/player/logic/sleep_shake_consumer.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/full_player.dart';
import 'package:storii/features/player/ui/mini_player.dart';
import 'package:storii/features/player/ui/player_builder.dart';
import 'package:storii/features/player/ui/player_cover.dart';
import 'package:storii/features/player/ui/themed_background.dart';

class PlayerScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sleepShakeConsumerProvider);

    final defaultTheme = Theme.of(context);
    final scheme = defaultTheme.colorScheme;
    final themeData =
        ref.watch(playerThemeProvider(defaultTheme.brightness)) ?? defaultTheme;
    ref.listen(playbackErrorsProvider, (_, next) {
      next.whenData((type) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                type.label,
                style: defaultTheme.textTheme.bodyMedium?.copyWith(
                  color: type == .network ? scheme.onTertiary : scheme.onError,
                ),
              ),
              backgroundColor: type == .network
                  ? scheme.tertiary
                  : scheme.error,
            ),
          );
      });
    });

    final screen = MediaQuery.sizeOf(context);
    final isLandscape = screen.width > screen.height;
    final topInset = isLandscape
        ? statusBarHeight(context)
        : fullPlayerTopInset(context);

    const miniInterval = Interval(0, 0.3);
    const fullInterval = Interval(0.6, 1);

    return PlayerBuilder(
      maxHeight: screen.height,
      onDismiss: () {
        log('player dismissed. audio handler stop');
        unawaited(audioHandler.stop());
      },
      builder: (context, f) {
        final miniOpacity = 1 - miniInterval.transform(f);
        final fullOpacity = fullInterval.transform(f);
        final (:size, :left, :top) = playerCoverGeometry(
          screenWidth: screen.width,
          screenHeight: screen.height,
          expandFactor: f,
          topInset: topInset,
        );

        return Theme(
          data: themeData,
          child: Stack(
            children: [
              const Positioned.fill(child: ThemedBackground()),
              if (f > 0.5)
                Positioned.fill(
                  child: Opacity(
                    opacity: fullOpacity,
                    child: IgnorePointer(
                      ignoring: f < 0.9,
                      child: FullPlayer(expandFactor: f),
                    ),
                  ),
                ),
              if (f < 0.3)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 80,
                  child: Opacity(
                    opacity: miniOpacity,
                    child: IgnorePointer(
                      ignoring: f > 0.05,
                      child: const MiniPlayer(),
                    ),
                  ),
                ),
              Positioned(
                top: top,
                left: left,
                width: size,
                height: size,
                child: PlayerCover(expandFactor: f),
              ),
              if (f < 0.2)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: miniOpacity,
                    child: const MiniProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
