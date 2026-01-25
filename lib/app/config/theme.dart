import 'package:flutter/material.dart';
import 'package:storii/app/config/fonts.dart';

abstract class AppColors {
  static const primary = Color(0xFFAAAAFF);
  static const slate = Color(0xFF111122);
  static const white = Color(0xFFF4F4FF);
  static const red = Color(0xFFF80F30);
  static const green = Color(0xFF0FF830);
}

class CustomSchemes {
  static final light = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.primary,
    onSurface: AppColors.slate,
  );

  static final dark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.primary,
    surface: AppColors.slate,
  );

  // it might be better to manually make this
  static final amoled = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.primary,
    surface: Colors.black,
    onPrimary: Colors.black,
    onSurface: Colors.white,
    surfaceContainer: Colors.black,
    contrastLevel: 1,
  );
}

extension ThemeDataX on ThemeData {
  ThemeData build(String? fontFamily) {
    if (fontFamily == null) return this;

    final builder = AppFonts.available[fontFamily];
    return copyWith(
      textTheme: builder != null ? builder(textTheme) : textTheme,
    );
  }
}
