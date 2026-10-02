import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/theme_provider.dart';

part 'grid_height_provider.g.dart';

@riverpod
double gridHeight(Ref ref) {
  final mode = ref.watch(libraryDisplayModeProvider);
  final cardWidth = ref.watch(imageMaxSizeProvider);

  return switch (mode) {
    .comfortable => () {
      final scaler = ref.watch(textScalerProvider);
      final titleSlot = scaler.scale(32);
      final authorSlot = scaler.scale(20);
      const padding = 16.0;
      final metadataHeight = titleSlot + padding + authorSlot;

      return cardWidth + metadataHeight;
    }(),

    .compact || .coverOnly => cardWidth,

    .listView => throw StateError('Do not use grid for list view'),
  };
}

@riverpod
double authorsGridHeight(Ref ref) {
  final scaler = ref.watch(textScalerProvider);
  final scaledTitleHeight = scaler.scale(32);
  const padding = 16.0;
  final cardWidth = ref.watch(imageMaxSizeProvider);

  return cardWidth + scaledTitleHeight + padding;
}

@riverpod
double seriesGridHeight(Ref ref) {
  final scaler = ref.watch(textScalerProvider);
  final cardWidth = ref.watch(stackedImagesCardMaxWidthProvider);

  final titleSlot = scaler.scale(32);
  final authorSlot = scaler.scale(20);
  final metadataHeight = titleSlot + authorSlot;

  return (cardWidth * 0.48) + metadataHeight;
}

@riverpod
double collectionsGridHeight(Ref ref) {
  final scaler = ref.watch(textScalerProvider);
  final cardWidth = ref.watch(stackedImagesCardMaxWidthProvider);
  final titleSlot = scaler.scale(32);

  return (cardWidth * 0.48) + titleSlot;
}
