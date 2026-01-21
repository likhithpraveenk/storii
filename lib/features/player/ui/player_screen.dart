import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/ui/full_player.dart';
import 'package:storii/features/player/ui/hero_cover.dart';
import 'package:storii/features/player/ui/mini_player.dart';
import 'package:storii/features/player/ui/player_builder.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(playerEventProvider.notifier);

    ref.listen(currentItemProvider, ((_, next) {
      if (next.hasValue && next.value != null) {
        controller.toFull();
      }
    }));

    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;
    final screenHeight = size.height;

    final maxImgSize = (screenWidth - 32).clamp(
      0.0,
      AppStyles.maxImgSizeInFullPlayer,
    );
    final maxImgLeft = (screenWidth - maxImgSize) / 2;
    final maxImgTop = screenHeight * 0.1;

    final imgSizeDelta = maxImgSize - AppStyles.imgSizeInMiniPlayer;
    final imgLeftDelta = maxImgLeft - AppStyles.imgLeftPaddingInMiniPlayer;
    final imgTopDelta = maxImgTop - AppStyles.imgLeftPaddingInMiniPlayer;

    const miniInterval = Interval(0.0, 0.3);
    const fullInterval = Interval(0.6, 1.0);

    return PlayerBuilder(
      maxHeight: screenHeight,
      builder: (context, f) {
        final miniOpacity = 1 - miniInterval.transform(f);
        final fullOpacity = fullInterval.transform(f);

        final imgSize = AppStyles.imgSizeInMiniPlayer + (imgSizeDelta * f);
        final imgLeft =
            AppStyles.imgLeftPaddingInMiniPlayer + (imgLeftDelta * f);
        final imgTop = AppStyles.imgLeftPaddingInMiniPlayer + (imgTopDelta * f);

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
