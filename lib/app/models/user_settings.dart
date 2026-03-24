import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/builder/annotations.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

class DefaultUserSettings {
  static const Library? currentLibrary = null;
  static const navTargets = defaultNavTargets;
  static const DisplayMode libraryDisplayMode = .comfortable;
  static const DisplayMode seriesDisplayMode = .comfortable;
  static const DisplayMode authorDisplayMode = .comfortable;
  static const startupNav = NavTarget.home;
  static const NavigationDestinationLabelBehavior navLabelBehavior =
      .alwaysShow;
  static const dateTimeFormat = 'dd MMM y';
  static const String? fontFamily = null;
  static const fontScale = 1.0;
  static const skipForward = Duration(seconds: 30);
  static const skipBackward = Duration(seconds: 10);
  static const speed = 1.0;
}

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @noCodeGen required String userId,

    Library? currentLibrary,

    @Default(defaultNavTargets) List<NavTarget> navTargets,

    @Default(DisplayMode.comfortable) DisplayMode libraryDisplayMode,

    @Default(DisplayMode.comfortable) DisplayMode seriesDisplayMode,

    @Default(DisplayMode.comfortable) DisplayMode authorDisplayMode,

    @Default(NavTarget.home) NavTarget startupNav,

    @Default(NavigationDestinationLabelBehavior.alwaysShow)
    NavigationDestinationLabelBehavior navLabelBehavior,

    @Default('dd MMM y') String dateTimeFormat,

    @Default('AtkinsonHyperlegibleNext') String? fontFamily,

    @Default(1) double fontScale,

    @Default(Duration(seconds: 30)) Duration skipForward,

    @Default(Duration(seconds: 10)) Duration skipBackward,

    @Default(1.0) double speed,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
