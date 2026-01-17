import 'package:flutter/material.dart';

int calculateGridCount(
  BuildContext context, {
  double targetWidth = 180,
  int minCount = 2,
}) {
  final double screenWidth = MediaQuery.sizeOf(context).width;
  final double availableWidth = screenWidth - 32;

  final int count = (availableWidth / targetWidth).floor();

  return count < minCount ? minCount : count;
}

double calculateGridRatio(
  BuildContext context, {
  bool showTitle = true,
  bool showAuthor = true,
  bool stackTitle = false,
  double targetWidth = 180,
  int minCount = 2,
}) {
  if (stackTitle) return 1.0;

  final width = MediaQuery.sizeOf(context).width;
  final cardWidth =
      width /
      calculateGridCount(context, targetWidth: targetWidth, minCount: minCount);

  final metadataHeight = calculateMetadataHeight(
    context,
    showTitle: showTitle,
    showAuthor: showAuthor,
    stackTitle: stackTitle,
  );

  return cardWidth / (cardWidth + metadataHeight);
}

double calculateMetadataHeight(
  BuildContext context, {
  bool stackTitle = false,
  bool showTitle = true,
  bool showAuthor = true,
}) {
  if (stackTitle) return 0;
  final theme = Theme.of(context);
  final textScaler = MediaQuery.textScalerOf(context);

  final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
  final authorFontSize = theme.textTheme.bodySmall?.fontSize ?? 12.0;

  final scaledTitleSize = textScaler.scale(titleFontSize);
  final scaledAuthorSize = textScaler.scale(authorFontSize);

  final titleHeight = scaledTitleSize * 2 * 1.3;
  final authorHeight = scaledAuthorSize * 1.3;

  double metadataHeight = 0;
  if (showTitle) {
    metadataHeight = 24 + titleHeight;
    if (showAuthor) {
      metadataHeight += 2 + authorHeight;
    }
  }
  return metadataHeight;
}

double calculateCarouselCardWidth(
  BuildContext context, {
  double cardsVisible = 2.1,
  double horizontalPadding = 32.0,
  double spacing = 16.0,
}) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  final availableWidth = screenWidth - horizontalPadding;
  final totalSpacingVisible = (cardsVisible.floor()) * spacing;
  final cardWidth = (availableWidth - totalSpacingVisible) / cardsVisible;

  return cardWidth;
}
