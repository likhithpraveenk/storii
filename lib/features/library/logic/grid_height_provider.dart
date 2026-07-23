import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/theme_provider.dart';

part 'grid_height_provider.g.dart';

@riverpod
double gridHeight(Ref ref) {
  final mode = ref.watch(libraryDisplayModeProvider);

  return switch (mode) {
    .comfortable => () {
      final scaler = ref.watch(textScalerProvider);
      final titleSlot = scaler.scale(32.0);
      final authorSlot = scaler.scale(16.0);
      const padding = 16.0;
      final metadataHeight = titleSlot + padding + authorSlot;

      return maxCardWidthInGrid + metadataHeight;
    }(),

    .compact || .coverOnly => maxCardWidthInGrid,

    .listView => throw StateError('Do not use grid for list view'),
  };
}

@riverpod
double authorsGridHeight(Ref ref) {
  final scaler = ref.watch(textScalerProvider);
  final scaledTitleHeight = scaler.scale(32.0);
  const padding = 16.0;

  return maxCardWidthInGrid + scaledTitleHeight + padding;
}

@riverpod
double seriesGridHeight(Ref ref) {
  final scaler = ref.watch(textScalerProvider);

  final titleSlot = scaler.scale(32.0);
  final authorSlot = scaler.scale(16.0);
  final metadataHeight = titleSlot + authorSlot;

  return (maxSeriesCardWidthInGrid * 0.46) + metadataHeight;
}
