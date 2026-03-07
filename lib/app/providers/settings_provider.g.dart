// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppSettingsNotifier)
final appSettingsProvider = AppSettingsNotifierProvider._();

final class AppSettingsNotifierProvider
    extends $NotifierProvider<AppSettingsNotifier, AppSettings> {
  AppSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsNotifierHash();

  @$internal
  @override
  AppSettingsNotifier create() => AppSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSettings>(value),
    );
  }
}

String _$appSettingsNotifierHash() =>
    r'c0b4dbb282f484feef51fa112bd6e328ac75b074';

abstract class _$AppSettingsNotifier extends $Notifier<AppSettings> {
  AppSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppSettings, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppSettings, AppSettings>,
              AppSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UserSettingsNotifier)
final userSettingsProvider = UserSettingsNotifierProvider._();

final class UserSettingsNotifierProvider
    extends $NotifierProvider<UserSettingsNotifier, UserSettings> {
  UserSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSettingsNotifierHash();

  @$internal
  @override
  UserSettingsNotifier create() => UserSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSettings>(value),
    );
  }
}

String _$userSettingsNotifierHash() =>
    r'a7f2a3ae93e2dad4b31278fb2b798475693c0408';

abstract class _$UserSettingsNotifier extends $Notifier<UserSettings> {
  UserSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserSettings, UserSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSettings, UserSettings>,
              UserSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// **************************************************************************
// _AppSettingsGenerator
// **************************************************************************

extension AppSettingsSetters on AppSettingsNotifier {
  Future<void> setThemeMode(ThemeMode value) =>
      _save(state.copyWith(themeMode: value));

  Future<void> setUseDynamicColor(bool value) =>
      _save(state.copyWith(useDynamicColor: value));

  Future<void> setUsePureBlack(bool value) =>
      _save(state.copyWith(usePureBlack: value));

  Future<void> setLocaleCode(String value) =>
      _save(state.copyWith(localeCode: value));

  Future<void> setCurrentUser(UserDomain? value) =>
      _save(state.copyWith(currentUser: value));

  Future<void> setDateTimeFormat(String value) =>
      _save(state.copyWith(dateTimeFormat: value));

  Future<void> setMaxLogs(int value) => _save(state.copyWith(maxLogs: value));

  Future<void> setFontFamily(String? value) =>
      _save(state.copyWith(fontFamily: value));

  Future<void> setFontScale(double value) =>
      _save(state.copyWith(fontScale: value));

  Future<void> setEnableHttpLogs(bool value) =>
      _save(state.copyWith(enableHttpLogs: value));

  Future<void> setFastForward(Duration value) =>
      _save(state.copyWith(fastForward: value));

  Future<void> setRewind(Duration value) =>
      _save(state.copyWith(rewind: value));

  Future<void> setSpeed(double value) => _save(state.copyWith(speed: value));
}

final themeModeProvider = Provider<ThemeMode>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.themeMode)),
);

final useDynamicColorProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.useDynamicColor)),
);

final usePureBlackProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.usePureBlack)),
);

final localeCodeProvider = Provider<String>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.localeCode)),
);

final currentUserProvider = Provider<UserDomain?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.currentUser)),
);

final dateTimeFormatProvider = Provider<String>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.dateTimeFormat)),
);

final maxLogsProvider = Provider<int>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.maxLogs)),
);

final fontFamilyProvider = Provider<String?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.fontFamily)),
);

final fontScaleProvider = Provider<double>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.fontScale)),
);

final enableHttpLogsProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.enableHttpLogs)),
);

final fastForwardProvider = Provider<Duration>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.fastForward)),
);

final rewindProvider = Provider<Duration>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.rewind)),
);

final speedProvider = Provider<double>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.speed)),
);

// **************************************************************************
// _UserSettingsGenerator
// **************************************************************************

extension UserSettingsSetters on UserSettingsNotifier {
  Future<void> setCurrentLibrary(Library? value) =>
      _save(state.copyWith(currentLibrary: value));

  Future<void> setNavTargets(List<NavTarget> value) =>
      _save(state.copyWith(navTargets: value));

  Future<void> setIsFullySynced(bool value) =>
      _save(state.copyWith(isFullySynced: value));

  Future<void> setIsItemsGridView(bool value) =>
      _save(state.copyWith(isItemsGridView: value));

  Future<void> setIsSeriesGridView(bool value) =>
      _save(state.copyWith(isSeriesGridView: value));

  Future<void> setIsAuthorsGridView(bool value) =>
      _save(state.copyWith(isAuthorsGridView: value));

  Future<void> setShowTitleForItem(bool value) =>
      _save(state.copyWith(showTitleForItem: value));

  Future<void> setStackTitleOnImage(bool value) =>
      _save(state.copyWith(stackTitleOnImage: value));

  Future<void> setSyncInterval(Duration value) =>
      _save(state.copyWith(syncInterval: value));
}

final currentLibraryProvider = Provider<Library?>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.currentLibrary)),
);

final navTargetsProvider = Provider<List<NavTarget>>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.navTargets)),
);

final isFullySyncedProvider = Provider<bool>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.isFullySynced)),
);

final isItemsGridViewProvider = Provider<bool>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.isItemsGridView)),
);

final isSeriesGridViewProvider = Provider<bool>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.isSeriesGridView)),
);

final isAuthorsGridViewProvider = Provider<bool>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.isAuthorsGridView)),
);

final showTitleForItemProvider = Provider<bool>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.showTitleForItem)),
);

final stackTitleOnImageProvider = Provider<bool>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.stackTitleOnImage)),
);

final syncIntervalProvider = Provider<Duration>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.syncInterval)),
);
