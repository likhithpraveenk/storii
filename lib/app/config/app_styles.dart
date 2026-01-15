import 'package:flutter/material.dart';

abstract class AppStyles {
  static final circularRadius = BorderRadius.circular(12);

  static final inputBorder = OutlineInputBorder(borderRadius: circularRadius);

  static final roundedRect = RoundedRectangleBorder(
    borderRadius: circularRadius,
  );
}
