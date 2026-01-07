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
      : User.fromJson(json['currentUser'] as Map<String, dynamic>),
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
  gridCount: (json['gridCount'] as num?)?.toInt() ?? 2,
);

Map<String, dynamic> _$AppSettingsToJson(
  _AppSettings instance,
) => <String, dynamic>{
  'theme': _$AppThemeEnumMap[instance.theme]!,
  'localeCode': instance.localeCode,
  'currentUser': instance.currentUser?.toJson(),
  'logRetention': instance.logRetention.inMicroseconds,
  'dateTimeFormat': instance.dateTimeFormat,
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'fontFamily': instance.fontFamily,
  'fontScale': instance.fontScale,
  'gridCount': instance.gridCount,
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
  NavTarget.search: 'search',
  NavTarget.downloads: 'downloads',
  NavTarget.collections: 'collections',
  NavTarget.settings: 'settings',
};

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      userId: json['userId'] as String,
      currentLibraryId: json['currentLibraryId'] as String?,
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentLibraryId': instance.currentLibraryId,
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
    r'5f1db45d322fe593119b28b472efc78efdc06165';

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
final userSettingsProvider = UserSettingsNotifierFamily._();

final class UserSettingsNotifierProvider
    extends $NotifierProvider<UserSettingsNotifier, UserSettings> {
  UserSettingsNotifierProvider._({
    required UserSettingsNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userSettingsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userSettingsNotifierHash();

  @override
  String toString() {
    return r'userSettingsProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is UserSettingsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userSettingsNotifierHash() =>
    r'180d519d41951d4b618bc39977313b19cb3f6e01';

final class UserSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserSettingsNotifier,
          UserSettings,
          UserSettings,
          UserSettings,
          String
        > {
  UserSettingsNotifierFamily._()
    : super(
        retry: null,
        name: r'userSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  UserSettingsNotifierProvider call(String userId) =>
      UserSettingsNotifierProvider._(argument: userId, from: this);

  @override
  String toString() => r'userSettingsProvider';
}

abstract class _$UserSettingsNotifier extends $Notifier<UserSettings> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  UserSettings build(String userId);
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
    element.handleCreate(ref, () => build(_$args));
  }
}

// **************************************************************************
// _AppSettingsGenerator
// **************************************************************************

extension AppSettingsSetters on AppSettingsNotifier {
  Future<void> setTheme(AppTheme value) => _save(state.copyWith(theme: value));

  Future<void> setLocaleCode(String value) =>
      _save(state.copyWith(localeCode: value));

  Future<void> setCurrentUser(User? value) =>
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

  Future<void> setGridCount(int value) =>
      _save(state.copyWith(gridCount: value));
}

final themeProvider = Provider<AppTheme>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.theme)),
);

final localeCodeProvider = Provider<String>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.localeCode)),
);

final currentUserProvider = Provider<User?>(
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

final gridCountProvider = Provider<int>(
  (ref) => ref.watch(appSettingsProvider.select((s) => s.gridCount)),
);

// **************************************************************************
// _UserSettingsGenerator
// **************************************************************************

extension UserSettingsSetters on UserSettingsNotifier {
  Future<void> setCurrentLibraryId(String? value) =>
      _save(state.copyWith(currentLibraryId: value));
}

final currentLibraryIdProvider = Provider.family<String?, String>(
  (ref, userId) =>
      ref.watch(userSettingsProvider(userId).select((s) => s.currentLibraryId)),
);
