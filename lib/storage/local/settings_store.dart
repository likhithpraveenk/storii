import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/app_settings.dart';
import 'package:storii/app/models/user_settings.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'settings_store.g.dart';

const _appSettingsKey = 'app_settings_key';

@Riverpod(keepAlive: true)
class SettingsStore extends _$SettingsStore {
  @override
  void build() {}

  Future<void> updateAppSettings(AppSettings settings) async {
    await appSettingsBox.put(_appSettingsKey, jsonEncode(settings));
  }

  Future<void> updateUserSettings(String userId, UserSettings settings) async {
    await userSettingsBox.put(userId, jsonEncode(settings));
  }

  AppSettings? getAppSettings() {
    final json = appSettingsBox.get(_appSettingsKey);
    if (json != null) {
      try {
        return AppSettings.fromJson(jsonDecode(json));
      } catch (e, st) {
        log('$e', stackTrace: st, level: 1000, name: 'AppSettings');
      }
    }
    return null;
  }

  UserSettings? getUserSettings(String userId) {
    final json = userSettingsBox.get(userId);
    if (json != null) {
      try {
        return UserSettings.fromJson(jsonDecode(json));
      } catch (e, st) {
        log('$e', stackTrace: st, level: 1000, name: 'UserSettings');
      }
    }
    return null;
  }

  Future<void> deleteAppSettings() => appSettingsBox.delete(_appSettingsKey);

  Future<void> deleteUserSettings(String userId) =>
      userSettingsBox.delete(userId);

  Future<void> deleteUsers(List<String> userIds) =>
      userSettingsBox.deleteAll(userIds);
}
