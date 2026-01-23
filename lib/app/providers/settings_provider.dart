import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
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
  final _box = Hive.box<String>('settings');

  @override
  AppSettings build() {
    final settingsJson = _box.get(appSettingsKey);
    if (settingsJson != null) {
      try {
        return AppSettings.fromJson(jsonDecode(settingsJson));
      } catch (e, st) {
        if (kDebugMode) {
          debugPrint('Error: decoding app settings $e\n$st');
        }
      }
    }
    return const AppSettings();
  }

  Future<void> _save(AppSettings s) async {
    if (s == state) return;
    state = s;
    await _box.put(appSettingsKey, jsonEncode(s));
  }

  Future<void> deleteSettings(Uri url) async {
    final associatedUsers = await _db.managers.users
        .filter((f) => f.serverUrl.url.equals(url))
        .get();
    final userIds = associatedUsers.map((u) => u.id).toList();

    if (userIds.isNotEmpty) {
      await _box.deleteAll(userIds);
    }

    await _box.delete(appSettingsKey);
  }

  Future<void> deleteUserSettings(String userId) async {
    await _box.delete(userId);
  }

  Future<void> reset() => _save(AppSettings(currentUser: state.currentUser));
}

@Riverpod(keepAlive: true)
class UserSettingsNotifier extends _$UserSettingsNotifier {
  final _box = Hive.box<String>('settings');

  @override
  UserSettings build() {
    final user = ref.watch(currentUserProvider);
    if (user == null) {
      throw StateError(
        'UserSettingsNotifier accessed while currentUser is null',
      );
    }
    final settingsJson = _box.get(user.id);

    if (settingsJson != null) {
      try {
        return UserSettings.fromJson(jsonDecode(settingsJson));
      } catch (e, st) {
        if (kDebugMode) {
          debugPrint('Error: decoding app settings $e\n$st');
        }
      }
    }

    return UserSettings(userId: user.id);
  }

  Future<void> _save(UserSettings s) async {
    if (s == state) return;
    state = s;
    await _box.put(s.userId, jsonEncode(s));
  }

  Future<void> reset() => _save(
    UserSettings(
      userId: state.userId,
      currentLibraryId: state.currentLibraryId,
      isFullySynced: state.isFullySynced,
    ),
  );
}
