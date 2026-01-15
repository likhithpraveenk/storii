import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';

part 'item_palette_provider.g.dart';

@riverpod
class ItemPaletteNotifier extends _$ItemPaletteNotifier {
  @override
  Future<PaletteGeneratorMaster> build(String id) async {
    final url = ref.watch(coverUrlProvider(id, type: .item));
    if (url == null) throw Exception('Could not resolve cover URL');

    final imageProvider = NetworkImage(url);
    final palette = await PaletteGeneratorMaster.fromImageProvider(
      imageProvider,
      colorSpace: .lab,
      filters: [
        (HSLColor color) {
          return color.lightness > 0.15 && color.lightness < 0.95;
        },
      ],
    );
    return palette;
  }

  Color getBackgroundColor(Color fallback) {
    final palette = state.value;
    return palette?.dominantColor?.color ?? fallback;
  }

  Color getForegroundColor(ThemeData theme) {
    final background = getBackgroundColor(theme.colorScheme.onSurface);
    return background.computeLuminance() < 0.45
        ? theme.colorScheme.onSurface
        : theme.colorScheme.onInverseSurface;
  }
}
