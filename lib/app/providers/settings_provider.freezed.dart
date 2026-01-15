// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 AppTheme get theme; String get localeCode; User? get currentUser; Duration get logRetention; String get dateTimeFormat; List<NavTarget> get navTargets; String? get fontFamily; double get fontScale;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.localeCode, localeCode) || other.localeCode == localeCode)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.logRetention, logRetention) || other.logRetention == logRetention)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&const DeepCollectionEquality().equals(other.navTargets, navTargets)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theme,localeCode,currentUser,logRetention,dateTimeFormat,const DeepCollectionEquality().hash(navTargets),fontFamily,fontScale);

@override
String toString() {
  return 'AppSettings(theme: $theme, localeCode: $localeCode, currentUser: $currentUser, logRetention: $logRetention, dateTimeFormat: $dateTimeFormat, navTargets: $navTargets, fontFamily: $fontFamily, fontScale: $fontScale)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 AppTheme theme, String localeCode, User? currentUser, Duration logRetention, String dateTimeFormat, List<NavTarget> navTargets, String? fontFamily, double fontScale
});


$UserCopyWith<$Res>? get currentUser;

}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? localeCode = null,Object? currentUser = freezed,Object? logRetention = null,Object? dateTimeFormat = null,Object? navTargets = null,Object? fontFamily = freezed,Object? fontScale = null,}) {
  return _then(_self.copyWith(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme,localeCode: null == localeCode ? _self.localeCode : localeCode // ignore: cast_nullable_to_non_nullable
as String,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as User?,logRetention: null == logRetention ? _self.logRetention : logRetention // ignore: cast_nullable_to_non_nullable
as Duration,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,navTargets: null == navTargets ? _self.navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.currentUser!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppTheme theme,  String localeCode,  User? currentUser,  Duration logRetention,  String dateTimeFormat,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.theme,_that.localeCode,_that.currentUser,_that.logRetention,_that.dateTimeFormat,_that.navTargets,_that.fontFamily,_that.fontScale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppTheme theme,  String localeCode,  User? currentUser,  Duration logRetention,  String dateTimeFormat,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.theme,_that.localeCode,_that.currentUser,_that.logRetention,_that.dateTimeFormat,_that.navTargets,_that.fontFamily,_that.fontScale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppTheme theme,  String localeCode,  User? currentUser,  Duration logRetention,  String dateTimeFormat,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.theme,_that.localeCode,_that.currentUser,_that.logRetention,_that.dateTimeFormat,_that.navTargets,_that.fontFamily,_that.fontScale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.theme = AppTheme.system, this.localeCode = 'en', this.currentUser, this.logRetention = const Duration(days: 2), this.dateTimeFormat = 'dd MMM y', final  List<NavTarget> navTargets = defaultNavTargets, this.fontFamily = AppFonts.defaultFont, this.fontScale = 1}): _navTargets = navTargets;
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  AppTheme theme;
@override@JsonKey() final  String localeCode;
@override final  User? currentUser;
@override@JsonKey() final  Duration logRetention;
@override@JsonKey() final  String dateTimeFormat;
 final  List<NavTarget> _navTargets;
@override@JsonKey() List<NavTarget> get navTargets {
  if (_navTargets is EqualUnmodifiableListView) return _navTargets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_navTargets);
}

@override@JsonKey() final  String? fontFamily;
@override@JsonKey() final  double fontScale;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.localeCode, localeCode) || other.localeCode == localeCode)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.logRetention, logRetention) || other.logRetention == logRetention)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&const DeepCollectionEquality().equals(other._navTargets, _navTargets)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theme,localeCode,currentUser,logRetention,dateTimeFormat,const DeepCollectionEquality().hash(_navTargets),fontFamily,fontScale);

@override
String toString() {
  return 'AppSettings(theme: $theme, localeCode: $localeCode, currentUser: $currentUser, logRetention: $logRetention, dateTimeFormat: $dateTimeFormat, navTargets: $navTargets, fontFamily: $fontFamily, fontScale: $fontScale)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 AppTheme theme, String localeCode, User? currentUser, Duration logRetention, String dateTimeFormat, List<NavTarget> navTargets, String? fontFamily, double fontScale
});


@override $UserCopyWith<$Res>? get currentUser;

}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = null,Object? localeCode = null,Object? currentUser = freezed,Object? logRetention = null,Object? dateTimeFormat = null,Object? navTargets = null,Object? fontFamily = freezed,Object? fontScale = null,}) {
  return _then(_AppSettings(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme,localeCode: null == localeCode ? _self.localeCode : localeCode // ignore: cast_nullable_to_non_nullable
as String,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as User?,logRetention: null == logRetention ? _self.logRetention : logRetention // ignore: cast_nullable_to_non_nullable
as Duration,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,navTargets: null == navTargets ? _self._navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}


/// @nodoc
mixin _$UserSettings {

@noCodeGen String get userId; String? get currentLibraryId; String? get currentItemId; bool get isFullySynced; int get allGridCount; int get seriesGridCount; int get authorsGridCount;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibraryId, currentLibraryId) || other.currentLibraryId == currentLibraryId)&&(identical(other.currentItemId, currentItemId) || other.currentItemId == currentItemId)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.allGridCount, allGridCount) || other.allGridCount == allGridCount)&&(identical(other.seriesGridCount, seriesGridCount) || other.seriesGridCount == seriesGridCount)&&(identical(other.authorsGridCount, authorsGridCount) || other.authorsGridCount == authorsGridCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibraryId,currentItemId,isFullySynced,allGridCount,seriesGridCount,authorsGridCount);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibraryId: $currentLibraryId, currentItemId: $currentItemId, isFullySynced: $isFullySynced, allGridCount: $allGridCount, seriesGridCount: $seriesGridCount, authorsGridCount: $authorsGridCount)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
@noCodeGen String userId, String? currentLibraryId, String? currentItemId, bool isFullySynced, int allGridCount, int seriesGridCount, int authorsGridCount
});




}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? currentLibraryId = freezed,Object? currentItemId = freezed,Object? isFullySynced = null,Object? allGridCount = null,Object? seriesGridCount = null,Object? authorsGridCount = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibraryId: freezed == currentLibraryId ? _self.currentLibraryId : currentLibraryId // ignore: cast_nullable_to_non_nullable
as String?,currentItemId: freezed == currentItemId ? _self.currentItemId : currentItemId // ignore: cast_nullable_to_non_nullable
as String?,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,allGridCount: null == allGridCount ? _self.allGridCount : allGridCount // ignore: cast_nullable_to_non_nullable
as int,seriesGridCount: null == seriesGridCount ? _self.seriesGridCount : seriesGridCount // ignore: cast_nullable_to_non_nullable
as int,authorsGridCount: null == authorsGridCount ? _self.authorsGridCount : authorsGridCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  String? currentLibraryId,  String? currentItemId,  bool isFullySynced,  int allGridCount,  int seriesGridCount,  int authorsGridCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibraryId,_that.currentItemId,_that.isFullySynced,_that.allGridCount,_that.seriesGridCount,_that.authorsGridCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  String? currentLibraryId,  String? currentItemId,  bool isFullySynced,  int allGridCount,  int seriesGridCount,  int authorsGridCount)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.userId,_that.currentLibraryId,_that.currentItemId,_that.isFullySynced,_that.allGridCount,_that.seriesGridCount,_that.authorsGridCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@noCodeGen  String userId,  String? currentLibraryId,  String? currentItemId,  bool isFullySynced,  int allGridCount,  int seriesGridCount,  int authorsGridCount)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibraryId,_that.currentItemId,_that.isFullySynced,_that.allGridCount,_that.seriesGridCount,_that.authorsGridCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({@noCodeGen required this.userId, this.currentLibraryId, this.currentItemId, this.isFullySynced = false, this.allGridCount = 2, this.seriesGridCount = 1, this.authorsGridCount = 2});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@noCodeGen final  String userId;
@override final  String? currentLibraryId;
@override final  String? currentItemId;
@override@JsonKey() final  bool isFullySynced;
@override@JsonKey() final  int allGridCount;
@override@JsonKey() final  int seriesGridCount;
@override@JsonKey() final  int authorsGridCount;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibraryId, currentLibraryId) || other.currentLibraryId == currentLibraryId)&&(identical(other.currentItemId, currentItemId) || other.currentItemId == currentItemId)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.allGridCount, allGridCount) || other.allGridCount == allGridCount)&&(identical(other.seriesGridCount, seriesGridCount) || other.seriesGridCount == seriesGridCount)&&(identical(other.authorsGridCount, authorsGridCount) || other.authorsGridCount == authorsGridCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibraryId,currentItemId,isFullySynced,allGridCount,seriesGridCount,authorsGridCount);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibraryId: $currentLibraryId, currentItemId: $currentItemId, isFullySynced: $isFullySynced, allGridCount: $allGridCount, seriesGridCount: $seriesGridCount, authorsGridCount: $authorsGridCount)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
@noCodeGen String userId, String? currentLibraryId, String? currentItemId, bool isFullySynced, int allGridCount, int seriesGridCount, int authorsGridCount
});




}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? currentLibraryId = freezed,Object? currentItemId = freezed,Object? isFullySynced = null,Object? allGridCount = null,Object? seriesGridCount = null,Object? authorsGridCount = null,}) {
  return _then(_UserSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibraryId: freezed == currentLibraryId ? _self.currentLibraryId : currentLibraryId // ignore: cast_nullable_to_non_nullable
as String?,currentItemId: freezed == currentItemId ? _self.currentItemId : currentItemId // ignore: cast_nullable_to_non_nullable
as String?,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,allGridCount: null == allGridCount ? _self.allGridCount : allGridCount // ignore: cast_nullable_to_non_nullable
as int,seriesGridCount: null == seriesGridCount ? _self.seriesGridCount : seriesGridCount // ignore: cast_nullable_to_non_nullable
as int,authorsGridCount: null == authorsGridCount ? _self.authorsGridCount : authorsGridCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
