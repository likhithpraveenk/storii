import 'package:flutter/material.dart';

const appPrimaryColor = Color(0xFFAAAAFF);
const appSlateColor = Color(0xFF111122);
const appWhiteColor = Color(0xFFF4F4FF);
const appRedColor = Color(0xFFF80F30);
const appGreenColor = Color(0xFF0FF830);
const appYellowColor = Color(0xFFFFD60A);

final lightScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  dynamicSchemeVariant: .fidelity,
  seedColor: appPrimaryColor,
  onSurface: appSlateColor,
);

final darkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  dynamicSchemeVariant: .fidelity,
  seedColor: appPrimaryColor,
  surface: appSlateColor,
);

final highContrastTheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: appPrimaryColor,
  surface: Colors.black,
  onSurface: Colors.white,
  primary: Colors.white,
  onPrimary: Colors.black,
  secondary: Colors.yellowAccent,
  onSecondary: Colors.black,
  surfaceContainer: Colors.black,
  contrastLevel: 1,
);
