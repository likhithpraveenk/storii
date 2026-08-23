import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/models/app_settings.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/models/user_settings.dart';
import 'package:storii/storage/local/settings_store.dart';

export 'package:storii/app/models/app_settings.dart';
export 'package:storii/app/models/user_settings.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
class AppSettingsNotifier extends _$AppSettingsNotifier {
  SettingsStore get _store => ref.read(settingsStoreProvider.notifier);

  @override
  AppSettings build() {
    final settings = _store.getAppSettings();
    return settings ?? const AppSettings();
  }

  Future<void> _save(AppSettings s) async {
    if (s == state) return;
    state = s;
    await _store.updateAppSettings(s);
  }

  Future<void> deleteSettings(List<String> users) async {
    await _store.deleteUsers(users);
    await _store.deleteAppSettings();
  }

  Future<void> deleteUserSettings(String userId) async {
    await _store.deleteUserSettings(userId);
  }

  Future<void> reset() => _save(AppSettings(currentUser: state.currentUser));
}

@riverpod
class UserSettingsNotifier extends _$UserSettingsNotifier {
  SettingsStore get _store => ref.read(settingsStoreProvider.notifier);

  @override
  UserSettings? build() {
    final user = ref.watch(currentUserProvider);
    if (user == null) return null;

    final settings = _store.getUserSettings(user.id);
    return settings ?? UserSettings(userId: user.id);
  }

  Future<void> _save(UserSettings? s) async {
    if (s == state) return;
    state = s;
    if (s != null) {
      await _store.updateUserSettings(s.userId, s);
    }
  }

  Future<void> reset() async {
    final settings = state;
    if (settings == null) return;
    return _save(
      UserSettings(
        userId: settings.userId,
        currentLibrary: settings.currentLibrary,
      ),
    );
  }
}
