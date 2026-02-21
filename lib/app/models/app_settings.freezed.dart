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

 ThemeMode get themeMode; bool get useDynamicColor; bool get usePureBlack; String get localeCode; UserDomain? get currentUser; String get dateTimeFormat; int get maxLogs; List<NavTarget> get navTargets; String? get fontFamily; double get fontScale; bool get showTitleForItem; bool get stackTitleOnImage; bool get enableHttpLogs; Duration get fastForward; Duration get rewind; double get speed;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.useDynamicColor, useDynamicColor) || other.useDynamicColor == useDynamicColor)&&(identical(other.usePureBlack, usePureBlack) || other.usePureBlack == usePureBlack)&&(identical(other.localeCode, localeCode) || other.localeCode == localeCode)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&(identical(other.maxLogs, maxLogs) || other.maxLogs == maxLogs)&&const DeepCollectionEquality().equals(other.navTargets, navTargets)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale)&&(identical(other.showTitleForItem, showTitleForItem) || other.showTitleForItem == showTitleForItem)&&(identical(other.stackTitleOnImage, stackTitleOnImage) || other.stackTitleOnImage == stackTitleOnImage)&&(identical(other.enableHttpLogs, enableHttpLogs) || other.enableHttpLogs == enableHttpLogs)&&(identical(other.fastForward, fastForward) || other.fastForward == fastForward)&&(identical(other.rewind, rewind) || other.rewind == rewind)&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,useDynamicColor,usePureBlack,localeCode,currentUser,dateTimeFormat,maxLogs,const DeepCollectionEquality().hash(navTargets),fontFamily,fontScale,showTitleForItem,stackTitleOnImage,enableHttpLogs,fastForward,rewind,speed);

@override
String toString() {
  return 'AppSettings(themeMode: $themeMode, useDynamicColor: $useDynamicColor, usePureBlack: $usePureBlack, localeCode: $localeCode, currentUser: $currentUser, dateTimeFormat: $dateTimeFormat, maxLogs: $maxLogs, navTargets: $navTargets, fontFamily: $fontFamily, fontScale: $fontScale, showTitleForItem: $showTitleForItem, stackTitleOnImage: $stackTitleOnImage, enableHttpLogs: $enableHttpLogs, fastForward: $fastForward, rewind: $rewind, speed: $speed)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, bool useDynamicColor, bool usePureBlack, String localeCode, UserDomain? currentUser, String dateTimeFormat, int maxLogs, List<NavTarget> navTargets, String? fontFamily, double fontScale, bool showTitleForItem, bool stackTitleOnImage, bool enableHttpLogs, Duration fastForward, Duration rewind, double speed
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
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? useDynamicColor = null,Object? usePureBlack = null,Object? localeCode = null,Object? currentUser = freezed,Object? dateTimeFormat = null,Object? maxLogs = null,Object? navTargets = null,Object? fontFamily = freezed,Object? fontScale = null,Object? showTitleForItem = null,Object? stackTitleOnImage = null,Object? enableHttpLogs = null,Object? fastForward = null,Object? rewind = null,Object? speed = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,useDynamicColor: null == useDynamicColor ? _self.useDynamicColor : useDynamicColor // ignore: cast_nullable_to_non_nullable
as bool,usePureBlack: null == usePureBlack ? _self.usePureBlack : usePureBlack // ignore: cast_nullable_to_non_nullable
as bool,localeCode: null == localeCode ? _self.localeCode : localeCode // ignore: cast_nullable_to_non_nullable
as String,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserDomain?,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,maxLogs: null == maxLogs ? _self.maxLogs : maxLogs // ignore: cast_nullable_to_non_nullable
as int,navTargets: null == navTargets ? _self.navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,showTitleForItem: null == showTitleForItem ? _self.showTitleForItem : showTitleForItem // ignore: cast_nullable_to_non_nullable
as bool,stackTitleOnImage: null == stackTitleOnImage ? _self.stackTitleOnImage : stackTitleOnImage // ignore: cast_nullable_to_non_nullable
as bool,enableHttpLogs: null == enableHttpLogs ? _self.enableHttpLogs : enableHttpLogs // ignore: cast_nullable_to_non_nullable
as bool,fastForward: null == fastForward ? _self.fastForward : fastForward // ignore: cast_nullable_to_non_nullable
as Duration,rewind: null == rewind ? _self.rewind : rewind // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool useDynamicColor,  bool usePureBlack,  String localeCode,  UserDomain? currentUser,  String dateTimeFormat,  int maxLogs,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale,  bool showTitleForItem,  bool stackTitleOnImage,  bool enableHttpLogs,  Duration fastForward,  Duration rewind,  double speed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.useDynamicColor,_that.usePureBlack,_that.localeCode,_that.currentUser,_that.dateTimeFormat,_that.maxLogs,_that.navTargets,_that.fontFamily,_that.fontScale,_that.showTitleForItem,_that.stackTitleOnImage,_that.enableHttpLogs,_that.fastForward,_that.rewind,_that.speed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool useDynamicColor,  bool usePureBlack,  String localeCode,  UserDomain? currentUser,  String dateTimeFormat,  int maxLogs,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale,  bool showTitleForItem,  bool stackTitleOnImage,  bool enableHttpLogs,  Duration fastForward,  Duration rewind,  double speed)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.themeMode,_that.useDynamicColor,_that.usePureBlack,_that.localeCode,_that.currentUser,_that.dateTimeFormat,_that.maxLogs,_that.navTargets,_that.fontFamily,_that.fontScale,_that.showTitleForItem,_that.stackTitleOnImage,_that.enableHttpLogs,_that.fastForward,_that.rewind,_that.speed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  bool useDynamicColor,  bool usePureBlack,  String localeCode,  UserDomain? currentUser,  String dateTimeFormat,  int maxLogs,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale,  bool showTitleForItem,  bool stackTitleOnImage,  bool enableHttpLogs,  Duration fastForward,  Duration rewind,  double speed)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.useDynamicColor,_that.usePureBlack,_that.localeCode,_that.currentUser,_that.dateTimeFormat,_that.maxLogs,_that.navTargets,_that.fontFamily,_that.fontScale,_that.showTitleForItem,_that.stackTitleOnImage,_that.enableHttpLogs,_that.fastForward,_that.rewind,_that.speed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.themeMode = ThemeMode.system, this.useDynamicColor = false, this.usePureBlack = false, this.localeCode = 'en', this.currentUser, this.dateTimeFormat = 'dd MMM y', this.maxLogs = 100, final  List<NavTarget> navTargets = defaultNavTargets, this.fontFamily = 'AtkinsonHyperlegibleNext', this.fontScale = 1, this.showTitleForItem = true, this.stackTitleOnImage = false, this.enableHttpLogs = false, this.fastForward = const Duration(seconds: 10), this.rewind = const Duration(seconds: 10), this.speed = 1.0}): _navTargets = navTargets;
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool useDynamicColor;
@override@JsonKey() final  bool usePureBlack;
@override@JsonKey() final  String localeCode;
@override final  UserDomain? currentUser;
@override@JsonKey() final  String dateTimeFormat;
@override@JsonKey() final  int maxLogs;
 final  List<NavTarget> _navTargets;
@override@JsonKey() List<NavTarget> get navTargets {
  if (_navTargets is EqualUnmodifiableListView) return _navTargets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_navTargets);
}

@override@JsonKey() final  String? fontFamily;
@override@JsonKey() final  double fontScale;
@override@JsonKey() final  bool showTitleForItem;
@override@JsonKey() final  bool stackTitleOnImage;
@override@JsonKey() final  bool enableHttpLogs;
@override@JsonKey() final  Duration fastForward;
@override@JsonKey() final  Duration rewind;
@override@JsonKey() final  double speed;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.useDynamicColor, useDynamicColor) || other.useDynamicColor == useDynamicColor)&&(identical(other.usePureBlack, usePureBlack) || other.usePureBlack == usePureBlack)&&(identical(other.localeCode, localeCode) || other.localeCode == localeCode)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&(identical(other.maxLogs, maxLogs) || other.maxLogs == maxLogs)&&const DeepCollectionEquality().equals(other._navTargets, _navTargets)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale)&&(identical(other.showTitleForItem, showTitleForItem) || other.showTitleForItem == showTitleForItem)&&(identical(other.stackTitleOnImage, stackTitleOnImage) || other.stackTitleOnImage == stackTitleOnImage)&&(identical(other.enableHttpLogs, enableHttpLogs) || other.enableHttpLogs == enableHttpLogs)&&(identical(other.fastForward, fastForward) || other.fastForward == fastForward)&&(identical(other.rewind, rewind) || other.rewind == rewind)&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,useDynamicColor,usePureBlack,localeCode,currentUser,dateTimeFormat,maxLogs,const DeepCollectionEquality().hash(_navTargets),fontFamily,fontScale,showTitleForItem,stackTitleOnImage,enableHttpLogs,fastForward,rewind,speed);

@override
String toString() {
  return 'AppSettings(themeMode: $themeMode, useDynamicColor: $useDynamicColor, usePureBlack: $usePureBlack, localeCode: $localeCode, currentUser: $currentUser, dateTimeFormat: $dateTimeFormat, maxLogs: $maxLogs, navTargets: $navTargets, fontFamily: $fontFamily, fontScale: $fontScale, showTitleForItem: $showTitleForItem, stackTitleOnImage: $stackTitleOnImage, enableHttpLogs: $enableHttpLogs, fastForward: $fastForward, rewind: $rewind, speed: $speed)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, bool useDynamicColor, bool usePureBlack, String localeCode, UserDomain? currentUser, String dateTimeFormat, int maxLogs, List<NavTarget> navTargets, String? fontFamily, double fontScale, bool showTitleForItem, bool stackTitleOnImage, bool enableHttpLogs, Duration fastForward, Duration rewind, double speed
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
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? useDynamicColor = null,Object? usePureBlack = null,Object? localeCode = null,Object? currentUser = freezed,Object? dateTimeFormat = null,Object? maxLogs = null,Object? navTargets = null,Object? fontFamily = freezed,Object? fontScale = null,Object? showTitleForItem = null,Object? stackTitleOnImage = null,Object? enableHttpLogs = null,Object? fastForward = null,Object? rewind = null,Object? speed = null,}) {
  return _then(_AppSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,useDynamicColor: null == useDynamicColor ? _self.useDynamicColor : useDynamicColor // ignore: cast_nullable_to_non_nullable
as bool,usePureBlack: null == usePureBlack ? _self.usePureBlack : usePureBlack // ignore: cast_nullable_to_non_nullable
as bool,localeCode: null == localeCode ? _self.localeCode : localeCode // ignore: cast_nullable_to_non_nullable
as String,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserDomain?,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,maxLogs: null == maxLogs ? _self.maxLogs : maxLogs // ignore: cast_nullable_to_non_nullable
as int,navTargets: null == navTargets ? _self._navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,showTitleForItem: null == showTitleForItem ? _self.showTitleForItem : showTitleForItem // ignore: cast_nullable_to_non_nullable
as bool,stackTitleOnImage: null == stackTitleOnImage ? _self.stackTitleOnImage : stackTitleOnImage // ignore: cast_nullable_to_non_nullable
as bool,enableHttpLogs: null == enableHttpLogs ? _self.enableHttpLogs : enableHttpLogs // ignore: cast_nullable_to_non_nullable
as bool,fastForward: null == fastForward ? _self.fastForward : fastForward // ignore: cast_nullable_to_non_nullable
as Duration,rewind: null == rewind ? _self.rewind : rewind // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
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
