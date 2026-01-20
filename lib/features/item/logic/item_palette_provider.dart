import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';

part 'item_palette_provider.g.dart';

@riverpod
Future<PaletteGeneratorMaster> itemPalette(Ref ref, String id) async {
  final url = ref.watch(coverUrlProvider(id, type: .item));
  if (url == null) throw Exception('Could not resolve cover URL');

  final imageProvider = NetworkImage(url);

  final palette = await PaletteGeneratorMaster.fromImageProvider(
    imageProvider,
    colorSpace: ColorSpace.lab,
    filters: [
      (HSLColor color) => color.lightness > 0.15 && color.lightness < 0.95,
    ],
  );
  return palette;
}

Color getBackgroundColor(PaletteGeneratorMaster? palette, Color fallback) {
  return palette?.dominantColor?.color ?? fallback;
}

Color getForegroundColor(PaletteGeneratorMaster? palette, ColorScheme scheme) {
  final background = getBackgroundColor(palette, scheme.onSurface);
  return background.computeLuminance() < 0.45
      ? scheme.onSurface
      : scheme.onInverseSurface;
}
