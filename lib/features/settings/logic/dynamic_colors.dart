import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'dynamic_colors.g.dart';

@riverpod
Future<ColorScheme?> dynamicColors(Ref ref, Brightness brightness) async {
  ColorScheme? colorScheme;
  try {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    final primary = corePalette?.toColorScheme(brightness: brightness).primary;
    if (primary != null) {
      final harmonizedPrimary = primary.harmonizeWith(AppColors.primary);
      LogService.log(
        'found color ${harmonizedPrimary.toHex()} for $brightness',
        source: 'dynamicColors',
        level: .debug,
      );
      colorScheme = ColorScheme.fromSeed(
        seedColor: harmonizedPrimary,
        brightness: brightness,
      );
    }
  } catch (_) {
    LogService.log(
      'getting OS\'s colors failed',
      source: 'dynamicColors',
      level: .error,
    );
  }
  if (colorScheme == null) {
    try {
      final primary = await DynamicColorPlugin.getAccentColor();
      if (primary != null) {
        final harmonizedPrimary = primary.harmonizeWith(AppColors.primary);
        LogService.log(
          'found color ${harmonizedPrimary.toHex()} for $brightness',
          source: 'dynamicColors',
          level: .debug,
        );
        colorScheme = ColorScheme.fromSeed(
          seedColor: harmonizedPrimary,
          brightness: brightness,
        );
      }
    } catch (_) {
      LogService.log(
        'getting OS\'s accent color failed',
        source: 'dynamicColors',
        level: .error,
      );
    }
  }

  return colorScheme;
}
