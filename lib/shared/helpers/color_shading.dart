import 'package:flutter/material.dart';

Color darken(Color color, [double amount = 0.3]) {
  final hsl = HSLColor.fromColor(color);
  final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
  return hsl.withLightness(lightness).toColor();
}

Color shadeForBrightness(Color color, Brightness brightness) {
  final hsl = HSLColor.fromColor(color);
  final lightness = brightness == .dark
      ? hsl.lightness * 0.4
      : (hsl.lightness + (1 - hsl.lightness) * 0.6);
  return hsl.withLightness(lightness.clamp(0.0, 1.0)).toColor();
}
