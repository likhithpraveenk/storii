import 'package:flutter/material.dart';

const appPrimaryColor = Color(0xFFAAAAFF);
const appSlateColor = Color(0xFF111122);
const appWhiteColor = Color(0xFFF4F4FF);
const appRedColor = Color(0xFFF80F30);
const appGreenColor = Color(0xFF0FF830);

final lightScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: appPrimaryColor,
  onSurface: appSlateColor,
);

final darkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: appPrimaryColor,
  surface: appSlateColor,
);

// it might be better to manually make this
final amoledScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: appPrimaryColor,
  surface: Colors.black,
  onPrimary: Colors.black,
  onSurface: Colors.white,
  surfaceContainer: Colors.black,
  contrastLevel: 1,
);
