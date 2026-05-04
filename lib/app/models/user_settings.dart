import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/builder/annotations.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

class DefaultUserSettings {
  static const Library? currentLibrary = null;
  static const navTargets = defaultNavTargets;
  static const DisplayMode libraryDisplayMode = .comfortable;
  static const collapseSeries = false;
  static const DisplayMode seriesDisplayMode = .comfortable;
  static const DisplayMode authorDisplayMode = .comfortable;
  static const startupNav = NavTarget.home;
  static const NavigationDestinationLabelBehavior navLabelBehavior =
      .alwaysShow;
  static const dateTimeFormat = 'dd MMM y';
  static const String fontFamily = 'AtkinsonHyperlegibleNext';
  static const fontScale = 1.0;
  static const skipForward = Duration(seconds: 30);
  static const skipBackward = Duration(seconds: 10);
  static const speed = 1.0;
  static const historyLimit = 200;
  static const maxConcurrentDownloads = 2; // TODO: parallel downloads
  static const maxTracksPerItem = 4; // TODO: parallel downloads
  static const downloadOnWifiOnly =
      false; // TODO: setting to download on wifi only
}

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @noCodeGen required String userId,

    @Default(DefaultUserSettings.currentLibrary) Library? currentLibrary,

    @Default(DefaultUserSettings.navTargets) List<NavTarget> navTargets,

    @Default(DefaultUserSettings.libraryDisplayMode)
    DisplayMode libraryDisplayMode,

    @Default(DefaultUserSettings.collapseSeries) bool collapseSeries,

    @Default(DefaultUserSettings.seriesDisplayMode)
    DisplayMode seriesDisplayMode,

    @Default(DefaultUserSettings.authorDisplayMode)
    DisplayMode authorDisplayMode,

    @Default(DefaultUserSettings.startupNav) NavTarget startupNav,

    @Default(DefaultUserSettings.navLabelBehavior)
    NavigationDestinationLabelBehavior navLabelBehavior,

    @Default(DefaultUserSettings.dateTimeFormat) String dateTimeFormat,

    @Default(DefaultUserSettings.fontFamily) String? fontFamily,

    @Default(DefaultUserSettings.fontScale) double fontScale,

    @Default(DefaultUserSettings.skipForward) Duration skipForward,

    @Default(DefaultUserSettings.skipBackward) Duration skipBackward,

    @Default(DefaultUserSettings.speed) double speed,

    @Default(DefaultUserSettings.historyLimit) int historyLimit,

    @Default(DefaultUserSettings.maxConcurrentDownloads)
    int maxConcurrentDownloads,

    @Default(DefaultUserSettings.maxTracksPerItem) int maxTracksPerItem,

    @Default(DefaultUserSettings.downloadOnWifiOnly) bool downloadOnWifiOnly,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
