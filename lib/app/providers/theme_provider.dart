import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/dynamic_colors.dart';

part 'theme_provider.g.dart';

@riverpod
ThemeData themeData(Ref ref, Brightness brightness) {
  final fontFamily = ref.watch(fontFamilyProvider);
  final isPureBlack = ref.watch(usePureBlackProvider);
  final useDynamic = ref.watch(useDynamicColorProvider);

  final dynamicScheme = useDynamic
      ? ref.watch(dynamicColorsProvider(brightness)).value
      : null;

  ColorScheme colorScheme =
      dynamicScheme ??
      (brightness == .dark ? CustomSchemes.dark : CustomSchemes.light);

  if (brightness == .dark && isPureBlack) {
    colorScheme = colorScheme.copyWith(surface: Colors.black);
  }

  LogService.log(
    'getting theme data with\n'
    'fontFamily: $fontFamily\n'
    'brightnesss: $brightness\n'
    'usePureBlack: $isPureBlack\n'
    'useSystemColors: $useDynamic\n'
    'hasDynamicScheme: ${dynamicScheme != null}',
    source: 'themeDataProvider',
    level: .debug,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    fontFamily: fontFamily,
  );
}

@riverpod
TextScaler textScaler(Ref ref) {
  final fontScale = ref.watch(fontScaleProvider);
  return TextScaler.linear(fontScale);
}
