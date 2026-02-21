import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
sealed class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ThemeMode.system) ThemeMode themeMode,

    @Default(false) bool useDynamicColor,

    @Default(false) bool usePureBlack,

    @Default('en') String localeCode,

    UserDomain? currentUser,

    @Default('dd MMM y') String dateTimeFormat,

    @Default(100) int maxLogs,

    @Default(defaultNavTargets) List<NavTarget> navTargets,

    @Default('AtkinsonHyperlegibleNext') String? fontFamily,

    @Default(1) double fontScale,

    @Default(true) bool showTitleForItem,

    @Default(false) bool stackTitleOnImage,

    @Default(false) bool enableHttpLogs,

    @Default(Duration(seconds: 10)) Duration fastForward,

    @Default(Duration(seconds: 10)) Duration rewind,

    @Default(1.0) double speed,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
