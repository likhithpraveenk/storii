import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/theme.dart';
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

  var colorScheme =
      dynamicScheme ?? (brightness == .dark ? darkScheme : lightScheme);

  if (brightness == .dark && isPureBlack) {
    colorScheme = colorScheme.copyWith(
      surface: Colors.black,
      surfaceContainer: Colors.black,
      surfaceContainerLow: Colors.black,
      surfaceContainerLowest: Colors.black,
    );
  }

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    fontFamily: fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: .circular(kRadius)),
      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(kRadius),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(kRadius),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
    ),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: .floating,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: .circular(kRadius)),
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStateProperty.all(12),
      thumbColor: WidgetStateProperty.all(colorScheme.primaryContainer),
      radius: const .circular(16),
      interactive: true,
      mainAxisMargin: 4.0,
      crossAxisMargin: 2.0,
      thumbVisibility: WidgetStateProperty.all(true),
    ),
  );
}

@riverpod
TextScaler textScaler(Ref ref) {
  final fontScale = ref.watch(fontScaleProvider);
  return TextScaler.linear(fontScale);
}
