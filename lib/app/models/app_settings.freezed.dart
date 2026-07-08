// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 ThemeMode get themeMode; bool get useDynamicColor;@ColorConverter() Color get appColor; DynamicSchemeVariant get schemeVariant; bool get usePureBlack; UserDomain? get currentUser; Uri? get serverUrl; int get maxLogs; bool get enableHttpLogs; Duration get syncInterval; Duration get syncIntervalMetered; bool get downloadPathsV2Migrated; bool get trustAllCertificates;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.useDynamicColor, useDynamicColor) || other.useDynamicColor == useDynamicColor)&&(identical(other.appColor, appColor) || other.appColor == appColor)&&(identical(other.schemeVariant, schemeVariant) || other.schemeVariant == schemeVariant)&&(identical(other.usePureBlack, usePureBlack) || other.usePureBlack == usePureBlack)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.maxLogs, maxLogs) || other.maxLogs == maxLogs)&&(identical(other.enableHttpLogs, enableHttpLogs) || other.enableHttpLogs == enableHttpLogs)&&(identical(other.syncInterval, syncInterval) || other.syncInterval == syncInterval)&&(identical(other.syncIntervalMetered, syncIntervalMetered) || other.syncIntervalMetered == syncIntervalMetered)&&(identical(other.downloadPathsV2Migrated, downloadPathsV2Migrated) || other.downloadPathsV2Migrated == downloadPathsV2Migrated)&&(identical(other.trustAllCertificates, trustAllCertificates) || other.trustAllCertificates == trustAllCertificates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,useDynamicColor,appColor,schemeVariant,usePureBlack,currentUser,serverUrl,maxLogs,enableHttpLogs,syncInterval,syncIntervalMetered,downloadPathsV2Migrated,trustAllCertificates);

@override
String toString() {
  return 'AppSettings(themeMode: $themeMode, useDynamicColor: $useDynamicColor, appColor: $appColor, schemeVariant: $schemeVariant, usePureBlack: $usePureBlack, currentUser: $currentUser, serverUrl: $serverUrl, maxLogs: $maxLogs, enableHttpLogs: $enableHttpLogs, syncInterval: $syncInterval, syncIntervalMetered: $syncIntervalMetered, downloadPathsV2Migrated: $downloadPathsV2Migrated, trustAllCertificates: $trustAllCertificates)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, bool useDynamicColor,@ColorConverter() Color appColor, DynamicSchemeVariant schemeVariant, bool usePureBlack, UserDomain? currentUser, Uri? serverUrl, int maxLogs, bool enableHttpLogs, Duration syncInterval, Duration syncIntervalMetered, bool downloadPathsV2Migrated, bool trustAllCertificates
});


$UserDomainCopyWith<$Res>? get currentUser;

}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? useDynamicColor = null,Object? appColor = null,Object? schemeVariant = null,Object? usePureBlack = null,Object? currentUser = freezed,Object? serverUrl = freezed,Object? maxLogs = null,Object? enableHttpLogs = null,Object? syncInterval = null,Object? syncIntervalMetered = null,Object? downloadPathsV2Migrated = null,Object? trustAllCertificates = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,useDynamicColor: null == useDynamicColor ? _self.useDynamicColor : useDynamicColor // ignore: cast_nullable_to_non_nullable
as bool,appColor: null == appColor ? _self.appColor : appColor // ignore: cast_nullable_to_non_nullable
as Color,schemeVariant: null == schemeVariant ? _self.schemeVariant : schemeVariant // ignore: cast_nullable_to_non_nullable
as DynamicSchemeVariant,usePureBlack: null == usePureBlack ? _self.usePureBlack : usePureBlack // ignore: cast_nullable_to_non_nullable
as bool,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserDomain?,serverUrl: freezed == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as Uri?,maxLogs: null == maxLogs ? _self.maxLogs : maxLogs // ignore: cast_nullable_to_non_nullable
as int,enableHttpLogs: null == enableHttpLogs ? _self.enableHttpLogs : enableHttpLogs // ignore: cast_nullable_to_non_nullable
as bool,syncInterval: null == syncInterval ? _self.syncInterval : syncInterval // ignore: cast_nullable_to_non_nullable
as Duration,syncIntervalMetered: null == syncIntervalMetered ? _self.syncIntervalMetered : syncIntervalMetered // ignore: cast_nullable_to_non_nullable
as Duration,downloadPathsV2Migrated: null == downloadPathsV2Migrated ? _self.downloadPathsV2Migrated : downloadPathsV2Migrated // ignore: cast_nullable_to_non_nullable
as bool,trustAllCertificates: null == trustAllCertificates ? _self.trustAllCertificates : trustAllCertificates // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDomainCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserDomainCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool useDynamicColor, @ColorConverter()  Color appColor,  DynamicSchemeVariant schemeVariant,  bool usePureBlack,  UserDomain? currentUser,  Uri? serverUrl,  int maxLogs,  bool enableHttpLogs,  Duration syncInterval,  Duration syncIntervalMetered,  bool downloadPathsV2Migrated,  bool trustAllCertificates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.useDynamicColor,_that.appColor,_that.schemeVariant,_that.usePureBlack,_that.currentUser,_that.serverUrl,_that.maxLogs,_that.enableHttpLogs,_that.syncInterval,_that.syncIntervalMetered,_that.downloadPathsV2Migrated,_that.trustAllCertificates);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool useDynamicColor, @ColorConverter()  Color appColor,  DynamicSchemeVariant schemeVariant,  bool usePureBlack,  UserDomain? currentUser,  Uri? serverUrl,  int maxLogs,  bool enableHttpLogs,  Duration syncInterval,  Duration syncIntervalMetered,  bool downloadPathsV2Migrated,  bool trustAllCertificates)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.themeMode,_that.useDynamicColor,_that.appColor,_that.schemeVariant,_that.usePureBlack,_that.currentUser,_that.serverUrl,_that.maxLogs,_that.enableHttpLogs,_that.syncInterval,_that.syncIntervalMetered,_that.downloadPathsV2Migrated,_that.trustAllCertificates);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  bool useDynamicColor, @ColorConverter()  Color appColor,  DynamicSchemeVariant schemeVariant,  bool usePureBlack,  UserDomain? currentUser,  Uri? serverUrl,  int maxLogs,  bool enableHttpLogs,  Duration syncInterval,  Duration syncIntervalMetered,  bool downloadPathsV2Migrated,  bool trustAllCertificates)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.useDynamicColor,_that.appColor,_that.schemeVariant,_that.usePureBlack,_that.currentUser,_that.serverUrl,_that.maxLogs,_that.enableHttpLogs,_that.syncInterval,_that.syncIntervalMetered,_that.downloadPathsV2Migrated,_that.trustAllCertificates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.themeMode = ThemeMode.system, this.useDynamicColor = false, @ColorConverter() this.appColor = appPrimaryColor, this.schemeVariant = DynamicSchemeVariant.fidelity, this.usePureBlack = false, this.currentUser, this.serverUrl, this.maxLogs = 100, this.enableHttpLogs = false, this.syncInterval = const Duration(seconds: 20), this.syncIntervalMetered = const Duration(minutes: 1), this.downloadPathsV2Migrated = false, this.trustAllCertificates = false});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool useDynamicColor;
@override@JsonKey()@ColorConverter() final  Color appColor;
@override@JsonKey() final  DynamicSchemeVariant schemeVariant;
@override@JsonKey() final  bool usePureBlack;
@override final  UserDomain? currentUser;
@override final  Uri? serverUrl;
@override@JsonKey() final  int maxLogs;
@override@JsonKey() final  bool enableHttpLogs;
@override@JsonKey() final  Duration syncInterval;
@override@JsonKey() final  Duration syncIntervalMetered;
@override@JsonKey() final  bool downloadPathsV2Migrated;
@override@JsonKey() final  bool trustAllCertificates;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.useDynamicColor, useDynamicColor) || other.useDynamicColor == useDynamicColor)&&(identical(other.appColor, appColor) || other.appColor == appColor)&&(identical(other.schemeVariant, schemeVariant) || other.schemeVariant == schemeVariant)&&(identical(other.usePureBlack, usePureBlack) || other.usePureBlack == usePureBlack)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.maxLogs, maxLogs) || other.maxLogs == maxLogs)&&(identical(other.enableHttpLogs, enableHttpLogs) || other.enableHttpLogs == enableHttpLogs)&&(identical(other.syncInterval, syncInterval) || other.syncInterval == syncInterval)&&(identical(other.syncIntervalMetered, syncIntervalMetered) || other.syncIntervalMetered == syncIntervalMetered)&&(identical(other.downloadPathsV2Migrated, downloadPathsV2Migrated) || other.downloadPathsV2Migrated == downloadPathsV2Migrated)&&(identical(other.trustAllCertificates, trustAllCertificates) || other.trustAllCertificates == trustAllCertificates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,useDynamicColor,appColor,schemeVariant,usePureBlack,currentUser,serverUrl,maxLogs,enableHttpLogs,syncInterval,syncIntervalMetered,downloadPathsV2Migrated,trustAllCertificates);

@override
String toString() {
  return 'AppSettings(themeMode: $themeMode, useDynamicColor: $useDynamicColor, appColor: $appColor, schemeVariant: $schemeVariant, usePureBlack: $usePureBlack, currentUser: $currentUser, serverUrl: $serverUrl, maxLogs: $maxLogs, enableHttpLogs: $enableHttpLogs, syncInterval: $syncInterval, syncIntervalMetered: $syncIntervalMetered, downloadPathsV2Migrated: $downloadPathsV2Migrated, trustAllCertificates: $trustAllCertificates)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, bool useDynamicColor,@ColorConverter() Color appColor, DynamicSchemeVariant schemeVariant, bool usePureBlack, UserDomain? currentUser, Uri? serverUrl, int maxLogs, bool enableHttpLogs, Duration syncInterval, Duration syncIntervalMetered, bool downloadPathsV2Migrated, bool trustAllCertificates
});


@override $UserDomainCopyWith<$Res>? get currentUser;

}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? useDynamicColor = null,Object? appColor = null,Object? schemeVariant = null,Object? usePureBlack = null,Object? currentUser = freezed,Object? serverUrl = freezed,Object? maxLogs = null,Object? enableHttpLogs = null,Object? syncInterval = null,Object? syncIntervalMetered = null,Object? downloadPathsV2Migrated = null,Object? trustAllCertificates = null,}) {
  return _then(_AppSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,useDynamicColor: null == useDynamicColor ? _self.useDynamicColor : useDynamicColor // ignore: cast_nullable_to_non_nullable
as bool,appColor: null == appColor ? _self.appColor : appColor // ignore: cast_nullable_to_non_nullable
as Color,schemeVariant: null == schemeVariant ? _self.schemeVariant : schemeVariant // ignore: cast_nullable_to_non_nullable
as DynamicSchemeVariant,usePureBlack: null == usePureBlack ? _self.usePureBlack : usePureBlack // ignore: cast_nullable_to_non_nullable
as bool,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserDomain?,serverUrl: freezed == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as Uri?,maxLogs: null == maxLogs ? _self.maxLogs : maxLogs // ignore: cast_nullable_to_non_nullable
as int,enableHttpLogs: null == enableHttpLogs ? _self.enableHttpLogs : enableHttpLogs // ignore: cast_nullable_to_non_nullable
as bool,syncInterval: null == syncInterval ? _self.syncInterval : syncInterval // ignore: cast_nullable_to_non_nullable
as Duration,syncIntervalMetered: null == syncIntervalMetered ? _self.syncIntervalMetered : syncIntervalMetered // ignore: cast_nullable_to_non_nullable
as Duration,downloadPathsV2Migrated: null == downloadPathsV2Migrated ? _self.downloadPathsV2Migrated : downloadPathsV2Migrated // ignore: cast_nullable_to_non_nullable
as bool,trustAllCertificates: null == trustAllCertificates ? _self.trustAllCertificates : trustAllCertificates // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDomainCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserDomainCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}

// dart format on
