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
    r'b56f0a2a1d7442eef60072ad845d54b94208091e';

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
    r'58ef75ad310c010c97650865890ad7a09b5eafd7';

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

  Future<void> setSyncIntervalMetered(Duration value) =>
      _save(state.copyWith(syncIntervalMetered: value));
}

final themeModeProvider = Provider<ThemeMode>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.themeMode)),
  name: 'themeModeProvider',
);

final useDynamicColorProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.useDynamicColor)),
  name: 'useDynamicColorProvider',
);

final usePureBlackProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.usePureBlack)),
  name: 'usePureBlackProvider',
);

final currentUserProvider = Provider<UserDomain?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.currentUser)),
  name: 'currentUserProvider',
);

final serverUrlProvider = Provider<Uri?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.serverUrl)),
  name: 'serverUrlProvider',
);

final maxLogsProvider = Provider<int>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.maxLogs)),
  name: 'maxLogsProvider',
);

final enableHttpLogsProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.enableHttpLogs)),
  name: 'enableHttpLogsProvider',
);

final syncIntervalProvider = Provider<Duration>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.syncInterval)),
  name: 'syncIntervalProvider',
);

final syncIntervalMeteredProvider = Provider<Duration>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.syncIntervalMetered)),
  name: 'syncIntervalMeteredProvider',
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

  Future<void> setShowChapterPositionInHistory(bool value) =>
      _save(state?.copyWith(showChapterPositionInHistory: value));

  Future<void> setUseBinaryBytes(bool value) =>
      _save(state?.copyWith(useBinaryBytes: value));

  Future<void> setMinBufferDuration(Duration value) =>
      _save(state?.copyWith(minBufferDuration: value));

  Future<void> setMarqueeSpeed(double value) =>
      _save(state?.copyWith(marqueeSpeed: value));

  Future<void> setRememberSort(bool value) =>
      _save(state?.copyWith(rememberSort: value));

  Future<void> setLibrarySortAscending(bool value) =>
      _save(state?.copyWith(librarySortAscending: value));

  Future<void> setAuthorSortAscending(bool value) =>
      _save(state?.copyWith(authorSortAscending: value));

  Future<void> setSeriesSortAscending(bool value) =>
      _save(state?.copyWith(seriesSortAscending: value));

  Future<void> setAudiobookSortValue(AudiobookSort value) =>
      _save(state?.copyWith(audiobookSortValue: value));

  Future<void> setPodcastSortValue(PodcastSort value) =>
      _save(state?.copyWith(podcastSortValue: value));

  Future<void> setAuthorSortValue(AuthorSort value) =>
      _save(state?.copyWith(authorSortValue: value));

  Future<void> setSeriesSortValue(SeriesSort value) =>
      _save(state?.copyWith(seriesSortValue: value));
}

final currentLibraryProvider = Provider<Library?>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.currentLibrary ?? DefaultUserSettings.currentLibrary,
    ),
  ),
  name: 'currentLibraryProvider',
);

final navTargetsProvider = Provider<List<NavTarget>>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.navTargets ?? DefaultUserSettings.navTargets,
    ),
  ),
  name: 'navTargetsProvider',
);

final libraryDisplayModeProvider = Provider<DisplayMode>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.libraryDisplayMode ?? DefaultUserSettings.libraryDisplayMode,
    ),
  ),
  name: 'libraryDisplayModeProvider',
);

final collapseSeriesProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.collapseSeries ?? DefaultUserSettings.collapseSeries,
    ),
  ),
  name: 'collapseSeriesProvider',
);

final seriesDisplayModeProvider = Provider<DisplayMode>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.seriesDisplayMode ?? DefaultUserSettings.seriesDisplayMode,
    ),
  ),
  name: 'seriesDisplayModeProvider',
);

final authorDisplayModeProvider = Provider<DisplayMode>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.authorDisplayMode ?? DefaultUserSettings.authorDisplayMode,
    ),
  ),
  name: 'authorDisplayModeProvider',
);

final startupNavProvider = Provider<NavTarget>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.startupNav ?? DefaultUserSettings.startupNav,
    ),
  ),
  name: 'startupNavProvider',
);

final navLabelBehaviorProvider = Provider<NavigationDestinationLabelBehavior>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.navLabelBehavior ?? DefaultUserSettings.navLabelBehavior,
    ),
  ),
  name: 'navLabelBehaviorProvider',
);

final dateTimeFormatProvider = Provider<String>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.dateTimeFormat ?? DefaultUserSettings.dateTimeFormat,
    ),
  ),
  name: 'dateTimeFormatProvider',
);

final fontFamilyProvider = Provider<String?>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.fontFamily ?? DefaultUserSettings.fontFamily,
    ),
  ),
  name: 'fontFamilyProvider',
);

final fontScaleProvider = Provider<double>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.fontScale ?? DefaultUserSettings.fontScale,
    ),
  ),
  name: 'fontScaleProvider',
);

final skipForwardProvider = Provider<Duration>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.skipForward ?? DefaultUserSettings.skipForward,
    ),
  ),
  name: 'skipForwardProvider',
);

final skipBackwardProvider = Provider<Duration>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.skipBackward ?? DefaultUserSettings.skipBackward,
    ),
  ),
  name: 'skipBackwardProvider',
);

final speedProvider = Provider<double>(
  (ref) => ref.watch(
    userSettingsProvider.select((s) => s?.speed ?? DefaultUserSettings.speed),
  ),
  name: 'speedProvider',
);

final historyLimitProvider = Provider<int>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.historyLimit ?? DefaultUserSettings.historyLimit,
    ),
  ),
  name: 'historyLimitProvider',
);

final downloadOnUnmeteredOnlyProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) =>
          s?.downloadOnUnmeteredOnly ??
          DefaultUserSettings.downloadOnUnmeteredOnly,
    ),
  ),
  name: 'downloadOnUnmeteredOnlyProvider',
);

final showChapterPositionInHistoryProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) =>
          s?.showChapterPositionInHistory ??
          DefaultUserSettings.showChapterPositionInHistory,
    ),
  ),
  name: 'showChapterPositionInHistoryProvider',
);

final useBinaryBytesProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.useBinaryBytes ?? DefaultUserSettings.useBinaryBytes,
    ),
  ),
  name: 'useBinaryBytesProvider',
);

final minBufferDurationProvider = Provider<Duration>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.minBufferDuration ?? DefaultUserSettings.minBufferDuration,
    ),
  ),
  name: 'minBufferDurationProvider',
);

final marqueeSpeedProvider = Provider<double>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.marqueeSpeed ?? DefaultUserSettings.marqueeSpeed,
    ),
  ),
  name: 'marqueeSpeedProvider',
);

final rememberSortProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.rememberSort ?? DefaultUserSettings.rememberSort,
    ),
  ),
  name: 'rememberSortProvider',
);

final librarySortAscendingProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) =>
          s?.librarySortAscending ?? DefaultUserSettings.librarySortAscending,
    ),
  ),
  name: 'librarySortAscendingProvider',
);

final authorSortAscendingProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.authorSortAscending ?? DefaultUserSettings.authorSortAscending,
    ),
  ),
  name: 'authorSortAscendingProvider',
);

final seriesSortAscendingProvider = Provider<bool>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.seriesSortAscending ?? DefaultUserSettings.seriesSortAscending,
    ),
  ),
  name: 'seriesSortAscendingProvider',
);

final audiobookSortValueProvider = Provider<AudiobookSort>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.audiobookSortValue ?? DefaultUserSettings.audiobookSortValue,
    ),
  ),
  name: 'audiobookSortValueProvider',
);

final podcastSortValueProvider = Provider<PodcastSort>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.podcastSortValue ?? DefaultUserSettings.podcastSortValue,
    ),
  ),
  name: 'podcastSortValueProvider',
);

final authorSortValueProvider = Provider<AuthorSort>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.authorSortValue ?? DefaultUserSettings.authorSortValue,
    ),
  ),
  name: 'authorSortValueProvider',
);

final seriesSortValueProvider = Provider<SeriesSort>(
  (ref) => ref.watch(
    userSettingsProvider.select(
      (s) => s?.seriesSortValue ?? DefaultUserSettings.seriesSortValue,
    ),
  ),
  name: 'seriesSortValueProvider',
);
