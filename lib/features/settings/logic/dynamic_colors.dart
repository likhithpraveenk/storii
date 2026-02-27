import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/logs/log_service.dart';

part 'dynamic_colors.g.dart';

@riverpod
Future<ColorScheme?> dynamicColors(Ref ref, Brightness brightness) async {
  ColorScheme? colorScheme;
  try {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    final primary = corePalette?.toColorScheme(brightness: brightness).primary;
    if (primary != null) {
      final harmonizedPrimary = primary.harmonizeWith(appPrimaryColor);
      colorScheme = ColorScheme.fromSeed(
        seedColor: harmonizedPrimary,
        brightness: brightness,
      );
    }
  } catch (e) {
    LogService.log(
      'getting OS colors failed: $e',
      source: 'dynamicColors',
      level: .error,
    );
  }
  if (colorScheme == null) {
    try {
      final primary = await DynamicColorPlugin.getAccentColor();
      if (primary != null) {
        final harmonizedPrimary = primary.harmonizeWith(appPrimaryColor);
        colorScheme = ColorScheme.fromSeed(
          seedColor: harmonizedPrimary,
          brightness: brightness,
        );
      }
    } catch (e) {
      LogService.log(
        'getting OS accent color failed: $e',
        source: 'dynamicColors',
        level: .error,
      );
    }
  }

  return colorScheme;
}
