import 'package:flutter/material.dart';

const appPrimaryColor = Color(0xFFAAAAFF);
const appSlateColor = Color(0xFF111122);
const appWhiteColor = Color(0xFFF4F4FF);
const appRedColor = Color(0xFFF80F30);
const appGreenColor = Color(0xFF0FF830);
const appYellowColor = Color(0xFFFFD60A);

Color? getSurfaceColor(Color appColor, Brightness brightness) =>
    brightness == .dark && appColor == appPrimaryColor ? appSlateColor : null;
