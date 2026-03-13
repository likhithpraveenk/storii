import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/user.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
sealed class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ThemeMode.system) ThemeMode themeMode,

    @Default(false) bool useDynamicColor,

    @Default(false) bool usePureBlack,

    UserDomain? currentUser,

    @Default('dd MMM y') String dateTimeFormat,

    @Default(100) int maxLogs,

    @Default('AtkinsonHyperlegibleNext') String? fontFamily,

    @Default(1) double fontScale,

    @Default(false) bool enableHttpLogs,

    @Default(Duration(seconds: 30)) Duration skipForward,

    @Default(Duration(seconds: 10)) Duration skipBackward,

    @Default(1.0) double speed,

    @Default(Duration(seconds: 20)) Duration syncInterval,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
