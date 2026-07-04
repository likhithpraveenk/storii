import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/shared/helpers/converters.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
sealed class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ThemeMode.system) ThemeMode themeMode,

    @Default(false) bool useDynamicColor,

    @ColorConverter() @Default(appPrimaryColor) Color appColor,

    @Default(DynamicSchemeVariant.fidelity) DynamicSchemeVariant schemeVariant,

    @Default(false) bool usePureBlack,

    UserDomain? currentUser,

    Uri? serverUrl,

    @Default(100) int maxLogs,

    @Default(false) bool enableHttpLogs,

    @Default(Duration(seconds: 20)) Duration syncInterval,

    @Default(Duration(minutes: 1)) Duration syncIntervalMetered,

    @Default(false) bool downloadPathsV2Migrated,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
