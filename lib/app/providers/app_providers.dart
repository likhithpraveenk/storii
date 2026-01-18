import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'app_providers.g.dart';

@riverpod
ThemeData themeData(Ref ref) {
  final appTheme = ref.watch(themeProvider);
  final fontFamily = ref.watch(fontFamilyProvider);

  final brightness = PlatformDispatcher.instance.platformBrightness;

  final isDarkMode =
      appTheme.themeMode == .dark ||
      (appTheme.themeMode == .system && brightness == .dark);

  return isDarkMode
      ? appTheme.darkTheme.build(fontFamily)
      : appTheme.lightTheme.build(fontFamily);
}

@riverpod
TextScaler textScaler(Ref ref) {
  final fontScale = ref.watch(fontScaleProvider);
  return TextScaler.linear(fontScale);
}
