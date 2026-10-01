import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/models/app_settings.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/models/storage_location.dart';
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

  Future<void> resetAppearance() => _save(
    state.copyWith(
      themeMode: .system,
      useDynamicColor: false,
      appColor: appPrimaryColor,
      schemeVariant: .fidelity,
      usePureBlack: false,
    ),
  );

  Future<void> resetPlayer() => _save(
    state.copyWith(
      syncInterval: const Duration(seconds: 20),
      syncIntervalMetered: const Duration(minutes: 1),
    ),
  );

  Future<void> resetAdvanced() =>
      _save(state.copyWith(enableHttpLogs: false, trustAllCertificates: false));

  Future<void> resetDownloads() => _save(state.copyWith());
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

  Future<void> resetLibrary() async {
    final s = state;
    if (s == null) return;
    return _save(
      s.copyWith(
        homeShelves: DefaultUserSettings.homeShelves,
        rememberSort: DefaultUserSettings.rememberSort,
        stackedImagesVisible: DefaultUserSettings.stackedImagesVisible,
        libraryPageSize: DefaultUserSettings.libraryPageSize,
        seriesPageSize: DefaultUserSettings.seriesPageSize,
      ),
    );
  }

  Future<void> resetPlayer() async {
    final s = state;
    if (s == null) return;
    return _save(
      s.copyWith(
        skipForward: DefaultUserSettings.skipForward,
        skipBackward: DefaultUserSettings.skipBackward,
        speed: DefaultUserSettings.speed,
        minBufferDuration: DefaultUserSettings.minBufferDuration,
        playOnStartup: DefaultUserSettings.playOnStartup,
        showMiniPlayerSeekButtons:
            DefaultUserSettings.showMiniPlayerSeekButtons,
        miniplayerSubtitleMode: DefaultUserSettings.miniplayerSubtitleMode,
        playerBackgroundTheme: DefaultUserSettings.playerBackgroundTheme,
        playbackControlsLayout: DefaultUserSettings.playbackControlsLayout,
        shakeDuringSleepTimer: DefaultUserSettings.shakeDuringSleepTimer,
        shakeSleepTimerAddMinutes:
            DefaultUserSettings.shakeSleepTimerAddMinutes,
        shakeSensitivity: DefaultUserSettings.shakeSensitivity,
        fadeOnSleep: DefaultUserSettings.fadeOnSleep,
        fadeOnSleepDuration: DefaultUserSettings.fadeOnSleepDuration,
        fadeOnSleepMinVolume: DefaultUserSettings.fadeOnSleepMinVolume,
        isSleepWindowOn: DefaultUserSettings.isSleepWindowOn,
        sleepWindow: DefaultUserSettings.sleepWindow,
        sleepTimerWindowDuration: DefaultUserSettings.sleepTimerWindowDuration,
        osNotificationCanSeek: DefaultUserSettings.osNotificationCanSeek,
        osNotificationCanSkip: DefaultUserSettings.osNotificationCanSkip,
        osNotificationCanSkipChapter:
            DefaultUserSettings.osNotificationCanSkipChapter,
        osNotificationCanStop: DefaultUserSettings.osNotificationCanStop,
        osNotificationCanSpeed: DefaultUserSettings.osNotificationCanSpeed,
        hardwareClickToSkipChapters:
            DefaultUserSettings.hardwareClickToSkipChapters,
        interruptionSkipBackward: DefaultUserSettings.interruptionSkipBackward,
        interruptionLongSkipThreshold:
            DefaultUserSettings.interruptionLongSkipThreshold,
        interruptionLongSkipBackward:
            DefaultUserSettings.interruptionLongSkipBackward,
      ),
    );
  }

  Future<void> resetAppearance() async {
    final s = state;
    if (s == null) return;
    return _save(
      s.copyWith(
        useNowPlayingTheme: DefaultUserSettings.useNowPlayingTheme,
        fontFamily: DefaultUserSettings.fontFamily,
        fontScale: DefaultUserSettings.fontScale,
        dateTimeFormat: DefaultUserSettings.dateTimeFormat,
        marqueeSpeed: DefaultUserSettings.marqueeSpeed,
        useBinaryBytes: DefaultUserSettings.useBinaryBytes,
      ),
    );
  }

  Future<void> resetCustomization() async {
    final s = state;
    if (s == null) return;
    return _save(
      s.copyWith(
        startupNav: DefaultUserSettings.startupNav,
        navTargets: DefaultUserSettings.navTargets,
        navLabelBehavior: DefaultUserSettings.navLabelBehavior,
        scrollThumbVisibility: DefaultUserSettings.scrollThumbVisibility,
        scrollThumbDuration: DefaultUserSettings.scrollThumbDuration,
        scrollThumbHeight: DefaultUserSettings.scrollThumbHeight,
        scrollThumbWidth: DefaultUserSettings.scrollThumbWidth,
      ),
    );
  }
}
