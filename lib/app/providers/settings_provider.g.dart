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
    r'f4601d8c96e3fb626a68018d7b04201833af2fac';

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
    extends $NotifierProvider<UserSettingsNotifier, UserSettings?> {
  UserSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSettingsNotifierHash();

  @$internal
  @override
  UserSettingsNotifier create() => UserSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSettings? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSettings?>(value),
    );
  }
}

String _$userSettingsNotifierHash() =>
    r'8471fcbdc00a6db5391d0afa5307ef38451b61f6';

abstract class _$UserSettingsNotifier extends $Notifier<UserSettings?> {
  UserSettings? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserSettings?, UserSettings?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSettings?, UserSettings?>,
              UserSettings?,
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

  Future<void> setCurrentUser(UserDomain? value) =>
      _save(state.copyWith(currentUser: value));

  Future<void> setServerUrl(Uri? value) =>
      _save(state.copyWith(serverUrl: value));

  Future<void> setMaxLogs(int value) => _save(state.copyWith(maxLogs: value));

  Future<void> setEnableHttpLogs(bool value) =>
      _save(state.copyWith(enableHttpLogs: value));

  Future<void> setSyncInterval(Duration value) =>
      _save(state.copyWith(syncInterval: value));
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

final currentUserProvider = Provider<UserDomain?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.currentUser)),
);

final serverUrlProvider = Provider<Uri?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.serverUrl)),
);

final maxLogsProvider = Provider<int>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.maxLogs)),
);

final enableHttpLogsProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.enableHttpLogs)),
);

final syncIntervalProvider = Provider<Duration>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.syncInterval)),
);

// **************************************************************************
// _UserSettingsGenerator
// **************************************************************************

extension UserSettingsSetters on UserSettingsNotifier {
  Future<void> setCurrentLibrary(Library? value) =>
      _save(state?.copyWith(currentLibrary: value));

  Future<void> setNavTargets(List<NavTarget> value) =>
      _save(state?.copyWith(navTargets: value));

  Future<void> setLibraryDisplayMode(DisplayMode value) =>
      _save(state?.copyWith(libraryDisplayMode: value));

  Future<void> setCollapseSeries(bool value) =>
      _save(state?.copyWith(collapseSeries: value));

  Future<void> setSeriesDisplayMode(DisplayMode value) =>
      _save(state?.copyWith(seriesDisplayMode: value));

  Future<void> setAuthorDisplayMode(DisplayMode value) =>
      _save(state?.copyWith(authorDisplayMode: value));

  Future<void> setStartupNav(NavTarget value) =>
      _save(state?.copyWith(startupNav: value));

  Future<void> setNavLabelBehavior(NavigationDestinationLabelBehavior value) =>
      _save(state?.copyWith(navLabelBehavior: value));

  Future<void> setDateTimeFormat(String value) =>
      _save(state?.copyWith(dateTimeFormat: value));

  Future<void> setFontFamily(String? value) =>
      _save(state?.copyWith(fontFamily: value));

  Future<void> setFontScale(double value) =>
      _save(state?.copyWith(fontScale: value));

  Future<void> setSkipForward(Duration value) =>
      _save(state?.copyWith(skipForward: value));

  Future<void> setSkipBackward(Duration value) =>
      _save(state?.copyWith(skipBackward: value));

  Future<void> setSpeed(double value) => _save(state?.copyWith(speed: value));

  Future<void> setHistoryLimit(int value) =>
      _save(state?.copyWith(historyLimit: value));

  Future<void> setDownloadOnUnmeteredOnly(bool value) =>
      _save(state?.copyWith(downloadOnUnmeteredOnly: value));
}

final currentLibraryProvider = Provider<Library?>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.currentLibrary ?? DefaultUserSettings.currentLibrary,
    ),
  ),
);

final navTargetsProvider = Provider<List<NavTarget>>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.navTargets ?? DefaultUserSettings.navTargets,
    ),
  ),
);

final libraryDisplayModeProvider = Provider<DisplayMode>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.libraryDisplayMode ?? DefaultUserSettings.libraryDisplayMode,
    ),
  ),
);

final collapseSeriesProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.collapseSeries ?? DefaultUserSettings.collapseSeries,
    ),
  ),
);

final seriesDisplayModeProvider = Provider<DisplayMode>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.seriesDisplayMode ?? DefaultUserSettings.seriesDisplayMode,
    ),
  ),
);

final authorDisplayModeProvider = Provider<DisplayMode>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.authorDisplayMode ?? DefaultUserSettings.authorDisplayMode,
    ),
  ),
);

final startupNavProvider = Provider<NavTarget>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.startupNav ?? DefaultUserSettings.startupNav,
    ),
  ),
);

final navLabelBehaviorProvider = Provider<NavigationDestinationLabelBehavior>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.navLabelBehavior ?? DefaultUserSettings.navLabelBehavior,
    ),
  ),
);

final dateTimeFormatProvider = Provider<String>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.dateTimeFormat ?? DefaultUserSettings.dateTimeFormat,
    ),
  ),
);

final fontFamilyProvider = Provider<String?>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.fontFamily ?? DefaultUserSettings.fontFamily,
    ),
  ),
);

final fontScaleProvider = Provider<double>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.fontScale ?? DefaultUserSettings.fontScale,
    ),
  ),
);

final skipForwardProvider = Provider<Duration>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.skipForward ?? DefaultUserSettings.skipForward,
    ),
  ),
);

final skipBackwardProvider = Provider<Duration>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.skipBackward ?? DefaultUserSettings.skipBackward,
    ),
  ),
);

final speedProvider = Provider<double>(
  (ref) => ref.watch(
    userSettingsProvider.select((s) => s?.speed ?? DefaultUserSettings.speed),
  ),
);

final historyLimitProvider = Provider<int>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.historyLimit ?? DefaultUserSettings.historyLimit,
    ),
  ),
);

final downloadOnUnmeteredOnlyProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) =>
          s?.downloadOnUnmeteredOnly ??
          DefaultUserSettings.downloadOnUnmeteredOnly,
    ),
  ),
);
