import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/ui/full_player.dart';
import 'package:storii/features/player/ui/hero_cover.dart';
import 'package:storii/features/player/ui/mini_player.dart';
import 'package:storii/features/player/ui/player_builder.dart';

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;
    final screenHeight = size.height;

    final maxImgSize = (screenWidth - 32).clamp(0.0, maxImgSizeInFullPlayer);
    final maxImgLeft = (screenWidth - maxImgSize) / 2;
    final maxImgTop = screenHeight * 0.1;

    final imgSizeDelta = maxImgSize - imgSizeInMiniPlayer;
    final imgLeftDelta = maxImgLeft - imgLeftPaddingInMiniPlayer;
    final imgTopDelta = maxImgTop - imgLeftPaddingInMiniPlayer;

    const miniInterval = Interval(0.0, 0.3);
    const fullInterval = Interval(0.6, 1.0);

    // TODO: audio
    // ref.listen(currentItemProvider, (prev, next) {
    //   next.whenData((item) {
    //     if (item != null) {
    //       LogService.log('listener: ${item.title}', source: 'PlayerScreen');
    //       ref.read(audioPlayerProvider.notifier).play(item);
    //     }
    //   });
    // });

    return PlayerBuilder(
      maxHeight: screenHeight,
      onDismiss: () {
        LogService.log(
          'miniPlayerDismissed',
          level: .debug,
          source: 'PlayerScreen',
        );
        ref.read(userSettingsProvider.notifier).setCurrentItemId(null);
      },
      builder: (context, f) {
        final miniOpacity = 1 - miniInterval.transform(f);
        final fullOpacity = fullInterval.transform(f);

        final imgSize = imgSizeInMiniPlayer + (imgSizeDelta * f);
        final imgLeft = imgLeftPaddingInMiniPlayer + (imgLeftDelta * f);
        final imgTop = imgLeftPaddingInMiniPlayer + (imgTopDelta * f);

        return Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(color: Theme.of(context).colorScheme.surface),
            ),
            if (f > 0.6)
              Positioned(
                top: imgTop + imgSize + 16,
                bottom: 0,
                left: 0,
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
          ],
        );
      },
    );
  }
}
