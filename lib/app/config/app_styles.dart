import 'package:flutter/material.dart';

abstract class AppStyles {
  static final circularRadius = BorderRadius.circular(12);

  static final inputBorder = OutlineInputBorder(borderRadius: circularRadius);

  static final roundedRect = RoundedRectangleBorder(
    borderRadius: circularRadius,
  );
}

extension AppStylesX on ThemeData {
  TextTheme customTextTheme(String? fontFamily, double scale) {
    /// Main Navigation Title (e.g., "Library", "Currently Reading")
    const titleLarge = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.2,
    );

    /// Book Card Title / Section Header
    const titleMedium = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );

    /// List Item Title / Metadata Header (e.g., "Author", "Series")
    const titleSmall = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );

    /// Primary Content (Description)
    const bodyLarge = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );

    /// Secondary Content (Release Date, Narrator)
    const bodyMedium = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
    );

    /// Technical Metadata (e.g., "128kbps", "64.2 MB", "01:42:10")
    const labelSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: 0.5,
    );

    /// Controls (Buttons, Chips, Tabs)
    const action = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    );

    TextStyle s(TextStyle base) => base.copyWith(
      fontFamily: fontFamily,
      fontSize: base.fontSize ?? 14 * scale,
    );

    return textTheme.copyWith(
      titleLarge: s(titleLarge),
      titleMedium: s(titleMedium),
      titleSmall: s(titleSmall),
      bodyLarge: s(bodyLarge),
      bodyMedium: s(bodyMedium),
      labelLarge: s(action),
      labelSmall: s(labelSmall),
    );
  }
}
