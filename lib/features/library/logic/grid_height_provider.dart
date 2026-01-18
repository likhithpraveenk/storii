import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/models/utils/enums.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/app_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';

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

@riverpod
double gridHeight(Ref ref) {
  final mode = DisplayMode.fromSettings(
    showTitle: ref.watch(showTitleForItemProvider),
    stackTitle: ref.watch(stackTitleOnImageProvider),
  );

  return switch (mode) {
    .comfortable => () {
      final theme = ref.watch(themeDataProvider);
      final scaler = ref.watch(textScalerProvider);

      final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
      final authorFontSize = theme.textTheme.bodySmall?.fontSize ?? 12.0;

      final scaledTitleHeight = scaler.scale(titleFontSize) * 2 * 1.25;
      final scaledAuthorHeight = scaler.scale(authorFontSize) * 1.25;

      final metadataHeight = scaledTitleHeight + 8 + scaledAuthorHeight;

      return AppStyles.maxCardWidth + metadataHeight;
    }(),

    .compact || .coverOnly => AppStyles.maxCardWidth,

    .listView => throw StateError('Do not use grid for listview'),
  };
}

@riverpod
double authorsGridHeight(Ref ref) {
  final theme = ref.watch(themeDataProvider);
  final scaler = ref.watch(textScalerProvider);

  final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
  final scaledTitleHeight = scaler.scale(titleFontSize) * 2 * 1.2;

  return AppStyles.maxCardWidth + scaledTitleHeight;
}

@riverpod
double seriesGridHeight(Ref ref) {
  final theme = ref.watch(themeDataProvider);
  final scaler = ref.watch(textScalerProvider);

  final titleFontSize = theme.textTheme.titleSmall?.fontSize ?? 14.0;
  final authorFontSize = theme.textTheme.bodySmall?.fontSize ?? 12.0;

  final scaledTitleHeight = scaler.scale(titleFontSize) * 1.25;
  final scaledAuthorHeight = scaler.scale(authorFontSize) * 1.25;

  final metadataHeight = scaledTitleHeight + scaledAuthorHeight;

  return (AppStyles.maxSeriesCardWidth * 0.5) + metadataHeight;
}

@riverpod
double shelfHeight(Ref ref, ShelfType type) {
  final mode = DisplayMode.fromSettings(
    showTitle: ref.watch(showTitleForItemProvider),
    stackTitle: ref.watch(stackTitleOnImageProvider),
  );

  final cardWidth = switch (type) {
    .series => AppStyles.maxSeriesCardWidth,
    _ => AppStyles.maxCardWidth,
  };

  final imageBaseHeight = switch (type) {
    .series => cardWidth * 0.5,
    _ => cardWidth,
  };

  final isBook = type == .book || type == .podcast;
  if (isBook && (mode == .compact || mode == .coverOnly)) {
    return imageBaseHeight;
  }

  final theme = ref.watch(themeDataProvider);
  final scaler = ref.watch(textScalerProvider);
  const leading = 1.25;

  final titleH =
      scaler.scale(theme.textTheme.titleSmall?.fontSize ?? 14.0) * 2 * leading;
  final showSub = type != .authors && type != .series;
  final subH = showSub
      ? (scaler.scale(theme.textTheme.bodySmall?.fontSize ?? 12.0) * leading)
      : 0.0;

  return imageBaseHeight + titleH + subH + (isBook ? 4 : 0);
}
