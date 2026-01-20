import 'package:flutter/material.dart';
import 'package:storii/app/config/fonts.dart';

enum AppTheme {
  system('System'),
  light('Light'),
  dark('Dark'),
  amoled('AMOLED');

  const AppTheme(this.displayName);
  final String displayName;
}

abstract class AppColors {
  static const primary = Color(0xFFAAAAFF);
  static const black = Color(0xFF111122);
  static const white = Color(0xFFF4F4FF);
  static const red = Color(0xFFF80F30);
  static const green = Color(0xFF0FF830);
}

class CustomThemes {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primary,
      onSurface: AppColors.black,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
      surface: AppColors.black,
    ),
  );

  // it might be better to manually make this
  static final amoledTheme = ThemeData(
    visualDensity: .adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
      surface: Colors.black,
      onPrimary: Colors.black,
      onSurface: Colors.white,
      surfaceContainer: Colors.black,
      contrastLevel: 1,
    ),
  );
}

extension AppThemeExtension on AppTheme {
  ThemeData get lightTheme => CustomThemes.lightTheme;

  ThemeData get darkTheme {
    switch (this) {
      case .amoled:
        return CustomThemes.amoledTheme;
      default:
        return CustomThemes.darkTheme;
    }
  }

  ThemeMode get themeMode {
    switch (this) {
      case .light:
        return .light;
      case .dark:
      case .amoled:
        return .dark;
      case .system:
        return .system;
    }
  }
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
