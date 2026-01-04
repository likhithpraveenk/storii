import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storii/app/config/app_styles.dart';

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
}

class AppThemes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primary,
      onSurface: AppColors.black,
    ),
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
      surface: AppColors.black,
    ),
  );

  // it might be better to manually make this
  static final amoled = ThemeData(
    visualDensity: .adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
      surface: Colors.black,
      onSurface: Colors.white,
      surfaceContainer: Colors.black,
      contrastLevel: 1,
    ),
  );
}

extension AppThemeExtension on AppTheme {
  ThemeData get lightTheme => AppThemes.light;

  ThemeData get darkTheme {
    switch (this) {
      case AppTheme.amoled:
        return AppThemes.amoled;
      default:
        return AppThemes.dark;
    }
  }

  ThemeMode get themeMode {
    switch (this) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
      case AppTheme.amoled:
        return ThemeMode.dark;
      case AppTheme.system:
        return ThemeMode.system;
    }
  }

  ThemeData build({
    required Brightness brightness,
    String? fontFamily,
    required double fontScale,
  }) {
    final base = brightness == .light ? lightTheme : darkTheme;
    final textTheme = base.customTextTheme(fontFamily, fontScale);

    return base.copyWith(
      textTheme: fontFamily != null
          ? GoogleFonts.getTextTheme(fontFamily, textTheme)
          : textTheme,
      primaryTextTheme: fontFamily != null
          ? GoogleFonts.getTextTheme(fontFamily, textTheme)
          : textTheme,
    );
  }

  String get displayName => name[0].toUpperCase() + name.substring(1);
}
