import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator_master/palette_generator_master.dart';

final itemPaletteProvider =
    FutureProvider.family<PaletteGeneratorMaster, String?>((
      ref,
      imageUrl,
    ) async {
      if (imageUrl == null) return Future.error('imageUrl is null');
      final imageProvider = NetworkImage(imageUrl);
      return await PaletteGeneratorMaster.fromImageProvider(
        imageProvider,
        maximumColorCount: 10,
        size: const Size(100, 100),
      );
    });

Color getTextColor(Color background) {
  return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
