import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/app_settings.dart';
import 'package:storii/app/models/user_settings.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'settings_store.g.dart';

const _appSettingsKey = 'app_settings_key';

@Riverpod(keepAlive: true)
class SettingsStore extends _$SettingsStore {
  Box<String> get _userBox => Hive.box<String>(userSettingsBox);
  Box<String> get _appBox => Hive.box<String>(appSettingsBox);

  @override
  void build() {}

  Future<void> updateAppSettings(AppSettings settings) async {
    await _appBox.put(_appSettingsKey, jsonEncode(settings));
  }

  Future<void> updateUserSettings(String userId, UserSettings settings) async {
    await _userBox.put(userId, jsonEncode(settings));
  }

  AppSettings? getAppSettings() {
    final json = _appBox.get(_appSettingsKey);
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
    final json = _userBox.get(userId);
    if (json != null) {
      try {
        return UserSettings.fromJson(jsonDecode(json));
      } catch (e, st) {
        log('$e', stackTrace: st, level: 1000, name: 'UserSettings');
      }
    }
    return null;
  }

  Future<void> deleteAppSettings() => _appBox.delete(_appSettingsKey);

  Future<void> deleteUserSettings(String userId) => _userBox.delete(userId);

  Future<void> deleteUsers(List<String> userIds) => _userBox.deleteAll(userIds);
}
