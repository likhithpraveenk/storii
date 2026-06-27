import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';

part 'dynamic_colors.g.dart';

@riverpod
Future<List<Color>> dynamicColors(Ref ref) async {
  final colors = <Color>[];

  try {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    if (corePalette != null) {
      for (final palette in [
        corePalette.primary,
        corePalette.secondary,
        corePalette.tertiary,
      ]) {
        colors.add(Color(palette.get(40)));
      }
    }
  } catch (e) {
    LogService.log(
      'getting OS colors failed: $e',
      source: 'deviceColors',
      level: .error,
    );
  }
  if (colors.isEmpty) {
    try {
      final accent = await DynamicColorPlugin.getAccentColor();
      if (accent != null) {
        colors.add(accent);
      }
    } catch (e) {
      LogService.log(
        'getting OS accent color failed: $e',
        source: 'deviceColors',
        level: .error,
      );
    }
  }
  return colors;
}
