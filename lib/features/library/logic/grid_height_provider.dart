import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/models/utils/enums.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/theme_provider.dart';

part 'grid_height_provider.g.dart';

enum DisplayMode {
  listView,
  compact,
  comfortable,
  coverOnly;

  static DisplayMode fromSettings({
    required bool showTitle,
    required bool stackTitle,
  }) {
    if (!showTitle) return .coverOnly;
    if (stackTitle) return .compact;
    return .comfortable;
  }
}

const _titleFactor = 1.4;
const _smallFactor = 1.3;

@riverpod
double gridHeight(Ref ref) {
  final mode = DisplayMode.fromSettings(
    showTitle: ref.watch(showTitleForItemProvider),
    stackTitle: ref.watch(stackTitleOnImageProvider),
  );
  final brightness = PlatformDispatcher.instance.platformBrightness;

  return switch (mode) {
    .comfortable => () {
      final theme = ref.watch(themeDataProvider(brightness));
      final scaler = ref.watch(textScalerProvider);

      final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
      final authorFontSize = theme.textTheme.bodySmall?.fontSize ?? 12.0;

      final scaledTitleHeight = scaler.scale(titleFontSize) * 2 * _titleFactor;
      final scaledAuthorHeight = scaler.scale(authorFontSize) * _smallFactor;

      final metadataHeight = scaledTitleHeight + 12 + scaledAuthorHeight;

      return maxCardWidthInGrid + metadataHeight;
    }(),

    .compact || .coverOnly => maxCardWidthInGrid,

    .listView => throw StateError('Do not use grid for listview'),
  };
}

@riverpod
double authorsGridHeight(Ref ref) {
  final brightness = PlatformDispatcher.instance.platformBrightness;
  final theme = ref.watch(themeDataProvider(brightness));
  final scaler = ref.watch(textScalerProvider);

  final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
  final scaledTitleHeight = scaler.scale(titleFontSize) * 2 * _titleFactor;

  return maxCardWidthInGrid + scaledTitleHeight + 12;
}

@riverpod
double seriesGridHeight(Ref ref) {
  final brightness = PlatformDispatcher.instance.platformBrightness;
  final theme = ref.watch(themeDataProvider(brightness));
  final scaler = ref.watch(textScalerProvider);

  final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
  final authorFontSize = theme.textTheme.bodySmall?.fontSize ?? 12.0;

  final scaledTitleHeight = scaler.scale(titleFontSize) * _titleFactor;
  final scaledAuthorHeight = scaler.scale(authorFontSize) * _smallFactor;

  final metadataHeight = scaledTitleHeight + scaledAuthorHeight;

  return (maxSeriesCardWidthInGrid * 0.5) + metadataHeight;
}

@riverpod
double shelfHeight(Ref ref, ShelfType type) {
  final mode = DisplayMode.fromSettings(
    showTitle: ref.watch(showTitleForItemProvider),
    stackTitle: ref.watch(stackTitleOnImageProvider),
  );

  final cardWidth = switch (type) {
    .series => maxSeriesCardWidthInGrid,
    _ => maxCardWidthInGrid,
  };

  final imageBaseHeight = switch (type) {
    .series => cardWidth * 0.5,
    _ => cardWidth,
  };

  final isBook = type == .book || type == .podcast;
  if (isBook && (mode == .compact || mode == .coverOnly)) {
    return imageBaseHeight;
  }
  final brightness = PlatformDispatcher.instance.platformBrightness;
  final theme = ref.watch(themeDataProvider(brightness));
  final scaler = ref.watch(textScalerProvider);

  final titleH =
      scaler.scale(theme.textTheme.titleSmall?.fontSize ?? 14.0) *
      2 *
      _titleFactor;
  final showSub = type != .authors && type != .series;
  final subH = showSub
      ? (scaler.scale(theme.textTheme.bodySmall?.fontSize ?? 12.0) *
            _smallFactor)
      : 0.0;

  return imageBaseHeight + titleH + subH + (isBook ? 8 : 0);
}
