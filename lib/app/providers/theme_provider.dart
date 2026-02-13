import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/app_styles.dart';
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
      dynamicScheme ?? (brightness == .dark ? darkScheme : lightScheme);

  if (brightness == .dark && isPureBlack) {
    colorScheme = amoledScheme;
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
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: kBorderRadius),
      enabledBorder: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
    ),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
    ),
  );
}

@riverpod
TextScaler textScaler(Ref ref) {
  final fontScale = ref.watch(fontScaleProvider);
  return TextScaler.linear(fontScale);
}
