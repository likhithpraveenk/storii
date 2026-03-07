import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/models/app_settings.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/models/user_settings.dart';
import 'package:storii/storage/hive/boxes.dart';

export 'package:storii/app/models/app_settings.dart';
export 'package:storii/app/models/user_settings.dart';

part 'settings_provider.g.dart';

const appSettingsKey = 'app_settings_key';

@Riverpod(keepAlive: true)
class AppSettingsNotifier extends _$AppSettingsNotifier {
  final _box = Hive.box<String>(appSettingsBox);

  @override
  AppSettings build() {
    final settingsJson = _box.get(appSettingsKey);
    if (settingsJson != null) {
      try {
        return AppSettings.fromJson(jsonDecode(settingsJson));
      } catch (e, st) {
        if (kDebugMode) {
          debugPrint('Error: decoding app settings $e Stacktrace: $st');
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

  Future<void> deleteSettings(List<String> users) async {
    if (users.isNotEmpty) {
      await _box.deleteAll(users);
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
  final _box = Hive.box<String>(userSettingsBox);

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
          debugPrint('Error: decoding user settings $e Stacktrace: $st');
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
      currentLibrary: state.currentLibrary,
      isFullySynced: state.isFullySynced,
    ),
  );
}
