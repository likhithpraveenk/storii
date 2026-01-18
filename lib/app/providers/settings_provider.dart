import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/fonts.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/navigation/nav_bar/nav_targets.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/builder/annotations.dart';
import 'package:storii/storage/drift/database.dart';

part 'settings_provider.g.dart';
part 'settings_provider.freezed.dart';

const appSettingsKey = 'app_settings_key';

@freezed
sealed class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppTheme.system) AppTheme theme,

    @Default('en') String localeCode,

    UserDomain? currentUser,

    @Default(Duration(days: 2)) Duration logRetention,

    @Default('dd MMM y') String dateTimeFormat,

    @Default(defaultNavTargets) List<NavTarget> navTargets,

    @Default(AppFonts.defaultFont) String? fontFamily,

    @Default(1) double fontScale,

    @Default(50) int defaultItemsLimit,

    @Default(20) int defaultSeriesLimit,

    @Default(true) bool showTitleForItem,

    @Default(false) bool stackTitleOnImage,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @noCodeGen required String userId,

    String? currentLibraryId,

    String? currentItemId,

    @Default(false) bool isFullySynced,

    @Default(true) bool isItemsGridView,

    @Default(true) bool isSeriesGridView,

    @Default(true) bool isAuthorsGridView,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

@Riverpod(keepAlive: true)
class AppSettingsNotifier extends _$AppSettingsNotifier {
  AppDatabase get _db => ref.read(databaseProvider);
  final AppSettings? _initial;
  AppSettingsNotifier([this._initial]);

  @override
  AppSettings build() {
    return _initial ?? const AppSettings();
  }

  Future<void> _save(AppSettings s) async {
    if (s == state) return;
    state = s;
    await _db.managers.settings.create(
      (companion) => companion(key: appSettingsKey, value: jsonEncode(s)),
      mode: .insertOrReplace,
    );
  }

  Future<void> deleteUsers() async {
    await _db.managers.settings
        .filter((f) => f.key.not.equals(appSettingsKey))
        .delete();
  }

  Future<void> reset() => _save(AppSettings(currentUser: state.currentUser));
}

@Riverpod(keepAlive: true)
class UserSettingsNotifier extends _$UserSettingsNotifier {
  AppDatabase get _db => ref.read(databaseProvider);
  final UserSettings? _initial;
  UserSettingsNotifier([this._initial]);

  @override
  UserSettings build(String userId) {
    return _initial ?? UserSettings(userId: userId);
  }

  Future<void> _save(UserSettings s) async {
    if (s == state) return;
    state = s;
    await _db.managers.settings.create(
      (companion) => companion(key: userId, value: jsonEncode(s)),
      mode: .insertOrReplace,
    );
  }

  Future<void> delete() async {
    await _db.managers.settings.filter((f) => f.key.equals(userId)).delete();
    state = UserSettings(userId: userId);
  }

  Future<void> reset() => _save(
    UserSettings(
      userId: state.userId,
      currentLibraryId: state.currentLibraryId,
      isFullySynced: state.isFullySynced,
    ),
  );
}
