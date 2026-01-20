import 'package:flutter/material.dart';

abstract class AppStyles {
  static final circularRadius = BorderRadius.circular(12);

  static final inputBorder = OutlineInputBorder(borderRadius: circularRadius);

  static final roundedRect = RoundedRectangleBorder(
    borderRadius: circularRadius,
  );

  static const maxCardWidthInGrid = 180.0;
  static const maxSeriesCardWidthInGrid = 360.0;

  static const imgSizeInMiniPlayer = 54.0;
  static const imgLeftPaddingInMiniPlayer = 8.0;
  static const maxImgSizeInFullPlayer = 360.0;
}
