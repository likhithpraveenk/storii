import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef TextThemeBuilder = TextTheme Function(TextTheme);

abstract class AppFonts {
  static const defaultFont = 'Atkinson Hyperlegible Next';

  static final available = <String, TextThemeBuilder>{
    'Atkinson Hyperlegible Next': GoogleFonts.atkinsonHyperlegibleNextTextTheme,
    'Lora': GoogleFonts.loraTextTheme,
    'Special Elite': GoogleFonts.specialEliteTextTheme,
    'Quantico': GoogleFonts.quanticoTextTheme,
    'Poppins': GoogleFonts.poppinsTextTheme,
    'Noto Sans': GoogleFonts.notoSansTextTheme,
    'Fira Sans Condensed': GoogleFonts.firaSansCondensedTextTheme,
  };

  static TextThemeBuilder get defaultBuilder => available[defaultFont]!;
}
