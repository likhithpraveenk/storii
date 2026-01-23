// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  theme:
      $enumDecodeNullable(_$AppThemeEnumMap, json['theme']) ?? AppTheme.system,
  localeCode: json['localeCode'] as String? ?? 'en',
  currentUser: json['currentUser'] == null
      ? null
      : UserDomain.fromJson(json['currentUser'] as Map<String, dynamic>),
  logRetention: json['logRetention'] == null
      ? const Duration(days: 2)
      : Duration(microseconds: (json['logRetention'] as num).toInt()),
  dateTimeFormat: json['dateTimeFormat'] as String? ?? 'dd MMM y',
  navTargets:
      (json['navTargets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NavTargetEnumMap, e))
          .toList() ??
      defaultNavTargets,
  fontFamily: json['fontFamily'] as String? ?? AppFonts.defaultFont,
  fontScale: (json['fontScale'] as num?)?.toDouble() ?? 1,
  defaultItemsLimit: (json['defaultItemsLimit'] as num?)?.toInt() ?? 50,
  defaultSeriesLimit: (json['defaultSeriesLimit'] as num?)?.toInt() ?? 20,
  showTitleForItem: json['showTitleForItem'] as bool? ?? true,
  stackTitleOnImage: json['stackTitleOnImage'] as bool? ?? false,
);

Map<String, dynamic> _$AppSettingsToJson(
  _AppSettings instance,
) => <String, dynamic>{
  'theme': _$AppThemeEnumMap[instance.theme]!,
  'localeCode': instance.localeCode,
  'currentUser': ?instance.currentUser?.toJson(),
  'logRetention': instance.logRetention.inMicroseconds,
  'dateTimeFormat': instance.dateTimeFormat,
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'fontFamily': ?instance.fontFamily,
  'fontScale': instance.fontScale,
  'defaultItemsLimit': instance.defaultItemsLimit,
  'defaultSeriesLimit': instance.defaultSeriesLimit,
  'showTitleForItem': instance.showTitleForItem,
  'stackTitleOnImage': instance.stackTitleOnImage,
};

const _$AppThemeEnumMap = {
  AppTheme.system: 'system',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
  AppTheme.amoled: 'amoled',
};

const _$NavTargetEnumMap = {
  NavTarget.home: 'home',
  NavTarget.library: 'library',
  NavTarget.series: 'series',
  NavTarget.downloads: 'downloads',
  NavTarget.collections: 'collections',
  NavTarget.authors: 'authors',
  NavTarget.more: 'more',
};

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      userId: json['userId'] as String,
      currentLibraryId: json['currentLibraryId'] as String?,
      currentItemId: json['currentItemId'] as String?,
      isFullySynced: json['isFullySynced'] as bool? ?? false,
      isItemsGridView: json['isItemsGridView'] as bool? ?? true,
      isSeriesGridView: json['isSeriesGridView'] as bool? ?? true,
      isAuthorsGridView: json['isAuthorsGridView'] as bool? ?? true,
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentLibraryId': ?instance.currentLibraryId,
      'currentItemId': ?instance.currentItemId,
      'isFullySynced': instance.isFullySynced,
      'isItemsGridView': instance.isItemsGridView,
      'isSeriesGridView': instance.isSeriesGridView,
      'isAuthorsGridView': instance.isAuthorsGridView,
    };

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
    r'27f8caf56b887214974a16bbc5b15c57b6e960f1';

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
    r'd1ac78cb2ddb8524559c0d55dab0e0f07e1c5a57';

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
  Future<void> setTheme(AppTheme value) => _save(state.copyWith(theme: value));

  Future<void> setLocaleCode(String value) =>
      _save(state.copyWith(localeCode: value));

  Future<void> setCurrentUser(UserDomain? value) =>
      _save(state.copyWith(currentUser: value));

  Future<void> setLogRetention(Duration value) =>
      _save(state.copyWith(logRetention: value));

  Future<void> setDateTimeFormat(String value) =>
      _save(state.copyWith(dateTimeFormat: value));

  Future<void> setNavTargets(List<NavTarget> value) =>
      _save(state.copyWith(navTargets: value));

  Future<void> setFontFamily(String? value) =>
      _save(state.copyWith(fontFamily: value));

  Future<void> setFontScale(double value) =>
      _save(state.copyWith(fontScale: value));

  Future<void> setDefaultItemsLimit(int value) =>
      _save(state.copyWith(defaultItemsLimit: value));

  Future<void> setDefaultSeriesLimit(int value) =>
      _save(state.copyWith(defaultSeriesLimit: value));

  Future<void> setShowTitleForItem(bool value) =>
      _save(state.copyWith(showTitleForItem: value));

  Future<void> setStackTitleOnImage(bool value) =>
      _save(state.copyWith(stackTitleOnImage: value));
}

final themeProvider = Provider<AppTheme>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.theme)),
);

final localeCodeProvider = Provider<String>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.localeCode)),
);

final currentUserProvider = Provider<UserDomain?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.currentUser)),
);

final logRetentionProvider = Provider<Duration>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.logRetention)),
);

final dateTimeFormatProvider = Provider<String>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.dateTimeFormat)),
);

final navTargetsProvider = Provider<List<NavTarget>>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.navTargets)),
);

final fontFamilyProvider = Provider<String?>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.fontFamily)),
);

final fontScaleProvider = Provider<double>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.fontScale)),
);

final defaultItemsLimitProvider = Provider<int>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.defaultItemsLimit)),
);

final defaultSeriesLimitProvider = Provider<int>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.defaultSeriesLimit)),
);

final showTitleForItemProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.showTitleForItem)),
);

final stackTitleOnImageProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.stackTitleOnImage)),
);

// **************************************************************************
// _UserSettingsGenerator
// **************************************************************************

extension UserSettingsSetters on UserSettingsNotifier {
  Future<void> setCurrentLibraryId(String? value) =>
      _save(state.copyWith(currentLibraryId: value));

  Future<void> setCurrentItemId(String? value) =>
      _save(state.copyWith(currentItemId: value));

  Future<void> setIsFullySynced(bool value) =>
      _save(state.copyWith(isFullySynced: value));

  Future<void> setIsItemsGridView(bool value) =>
      _save(state.copyWith(isItemsGridView: value));

  Future<void> setIsSeriesGridView(bool value) =>
      _save(state.copyWith(isSeriesGridView: value));

  Future<void> setIsAuthorsGridView(bool value) =>
      _save(state.copyWith(isAuthorsGridView: value));
}

final currentLibraryIdProvider = Provider<String?>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.currentLibraryId)),
);

final currentItemIdProvider = Provider<String?>(
  (ref) => ref.watch(userSettingsProvider.select((s) => s.currentItemId)),
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
