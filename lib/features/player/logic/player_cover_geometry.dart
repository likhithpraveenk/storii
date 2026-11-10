import 'dart:math' as math;

import 'package:storii/app/config/constants.dart';

const fullPlayerHeaderHeight = 56.0;
const fullPlayerBottomPadding = 32.0;
const playerCoverContentGap = 16.0;

typedef PlayerCoverGeometry = ({double size, double left, double top});

PlayerCoverGeometry playerCoverGeometry({
  required double screenWidth,
  required double screenHeight,
  required double expandFactor,
  required double topInset,
}) {
  final isLandscape = screenWidth > screenHeight;
  final fullSize = isLandscape
      ? (screenHeight - topInset - imgSizeInMiniPlayer).clamp(
          0.0,
          maxImgSizeInFullPlayer,
        )
      : (screenWidth - 32).clamp(
          0.0,
          math.min(maxImgSizeInFullPlayer, screenHeight * 0.4),
        );
  final fullLeft = isLandscape
      ? fullPlayerHeaderHeight
      : (screenWidth - fullSize) / 2;
  final fullTop = isLandscape ? (screenHeight - fullSize) / 2 : topInset;

  double lerp(double full) =>
      imgLeftPaddingInMiniPlayer +
      (full - imgLeftPaddingInMiniPlayer) * expandFactor;

  return (
    size: imgSizeInMiniPlayer + (fullSize - imgSizeInMiniPlayer) * expandFactor,
    left: lerp(fullLeft),
    top: lerp(fullTop),
  );
}
