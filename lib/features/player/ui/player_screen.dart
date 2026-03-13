import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/ui/book_slider.dart';
import 'package:storii/features/player/ui/full_player.dart';
import 'package:storii/features/player/ui/hero_cover.dart';
import 'package:storii/features/player/ui/mini_player.dart';
import 'package:storii/features/player/ui/player_builder.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(playbackStateProvider, (previous, next) {
      final event = next.value;
      if (event?.processingState == .error) {
        final message = event?.errorMessage ?? 'Playback Error';
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    });

    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;
    final screenHeight = size.height;
    final isLandscape = screenWidth > screenHeight;

    final maxImgSize = isLandscape
        ? (screenHeight - 64).clamp(0.0, maxImgSizeInFullPlayer)
        : (screenWidth - 32).clamp(0.0, maxImgSizeInFullPlayer);
    final targetImgLeft = isLandscape
        ? (screenWidth * 0.25) - (maxImgSize / 2)
        : (screenWidth - maxImgSize) / 2;
    final targetImgTop = isLandscape
        ? (screenHeight - maxImgSize) / 2
        : screenHeight * 0.08;

    final imgSizeDelta = maxImgSize - imgSizeInMiniPlayer;

    const miniInterval = Interval(0.0, 0.3);
    const fullInterval = Interval(0.6, 1.0);

    return PlayerBuilder(
      maxHeight: screenHeight,
      onDismiss: () async {
        // log('miniplayer dismissed');
        return await audioHandler.stop();
      },
      builder: (context, f) {
        final miniOpacity = 1 - miniInterval.transform(f);
        final fullOpacity = fullInterval.transform(f);

        final imgSize = imgSizeInMiniPlayer + (imgSizeDelta * f);
        final imgLeft = targetImgLeft * f;
        final imgTop = targetImgTop * f;

        return Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(color: Theme.of(context).colorScheme.surface),
            ),
            if (f > 0.5)
              Positioned(
                top: isLandscape ? 16 : targetImgTop + maxImgSize + 16,
                left: isLandscape ? screenWidth * 0.5 : 0,
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: fullOpacity,
                  child: IgnorePointer(
                    ignoring: f < 0.9,
                    child: const FullPlayer(),
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
              top: imgTop,
              left: imgLeft,
              width: imgSize,
              height: imgSize,
              child: HeroCover(expandFactor: f),
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
        );
      },
    );
  }
}
