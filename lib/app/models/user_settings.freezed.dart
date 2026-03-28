// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSettings {

@noCodeGen String get userId; Library? get currentLibrary; List<NavTarget> get navTargets; DisplayMode get libraryDisplayMode; bool get collapseSeries; DisplayMode get seriesDisplayMode; DisplayMode get authorDisplayMode; NavTarget get startupNav; NavigationDestinationLabelBehavior get navLabelBehavior; String get dateTimeFormat; String? get fontFamily; double get fontScale; Duration get skipForward; Duration get skipBackward; double get speed; int get historyLimit;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibrary, currentLibrary) || other.currentLibrary == currentLibrary)&&const DeepCollectionEquality().equals(other.navTargets, navTargets)&&(identical(other.libraryDisplayMode, libraryDisplayMode) || other.libraryDisplayMode == libraryDisplayMode)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries)&&(identical(other.seriesDisplayMode, seriesDisplayMode) || other.seriesDisplayMode == seriesDisplayMode)&&(identical(other.authorDisplayMode, authorDisplayMode) || other.authorDisplayMode == authorDisplayMode)&&(identical(other.startupNav, startupNav) || other.startupNav == startupNav)&&(identical(other.navLabelBehavior, navLabelBehavior) || other.navLabelBehavior == navLabelBehavior)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale)&&(identical(other.skipForward, skipForward) || other.skipForward == skipForward)&&(identical(other.skipBackward, skipBackward) || other.skipBackward == skipBackward)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.historyLimit, historyLimit) || other.historyLimit == historyLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibrary,const DeepCollectionEquality().hash(navTargets),libraryDisplayMode,collapseSeries,seriesDisplayMode,authorDisplayMode,startupNav,navLabelBehavior,dateTimeFormat,fontFamily,fontScale,skipForward,skipBackward,speed,historyLimit);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibrary: $currentLibrary, navTargets: $navTargets, libraryDisplayMode: $libraryDisplayMode, collapseSeries: $collapseSeries, seriesDisplayMode: $seriesDisplayMode, authorDisplayMode: $authorDisplayMode, startupNav: $startupNav, navLabelBehavior: $navLabelBehavior, dateTimeFormat: $dateTimeFormat, fontFamily: $fontFamily, fontScale: $fontScale, skipForward: $skipForward, skipBackward: $skipBackward, speed: $speed, historyLimit: $historyLimit)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
@noCodeGen String userId, Library? currentLibrary, List<NavTarget> navTargets, DisplayMode libraryDisplayMode, bool collapseSeries, DisplayMode seriesDisplayMode, DisplayMode authorDisplayMode, NavTarget startupNav, NavigationDestinationLabelBehavior navLabelBehavior, String dateTimeFormat, String? fontFamily, double fontScale, Duration skipForward, Duration skipBackward, double speed, int historyLimit
});


$LibraryCopyWith<$Res>? get currentLibrary;

}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? currentLibrary = freezed,Object? navTargets = null,Object? libraryDisplayMode = null,Object? collapseSeries = null,Object? seriesDisplayMode = null,Object? authorDisplayMode = null,Object? startupNav = null,Object? navLabelBehavior = null,Object? dateTimeFormat = null,Object? fontFamily = freezed,Object? fontScale = null,Object? skipForward = null,Object? skipBackward = null,Object? speed = null,Object? historyLimit = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibrary: freezed == currentLibrary ? _self.currentLibrary : currentLibrary // ignore: cast_nullable_to_non_nullable
as Library?,navTargets: null == navTargets ? _self.navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,libraryDisplayMode: null == libraryDisplayMode ? _self.libraryDisplayMode : libraryDisplayMode // ignore: cast_nullable_to_non_nullable
as DisplayMode,collapseSeries: null == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesDisplayMode: null == seriesDisplayMode ? _self.seriesDisplayMode : seriesDisplayMode // ignore: cast_nullable_to_non_nullable
as DisplayMode,authorDisplayMode: null == authorDisplayMode ? _self.authorDisplayMode : authorDisplayMode // ignore: cast_nullable_to_non_nullable
as DisplayMode,startupNav: null == startupNav ? _self.startupNav : startupNav // ignore: cast_nullable_to_non_nullable
as NavTarget,navLabelBehavior: null == navLabelBehavior ? _self.navLabelBehavior : navLabelBehavior // ignore: cast_nullable_to_non_nullable
as NavigationDestinationLabelBehavior,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,skipForward: null == skipForward ? _self.skipForward : skipForward // ignore: cast_nullable_to_non_nullable
as Duration,skipBackward: null == skipBackward ? _self.skipBackward : skipBackward // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,historyLimit: null == historyLimit ? _self.historyLimit : historyLimit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryCopyWith<$Res>? get currentLibrary {
    if (_self.currentLibrary == null) {
    return null;
  }

  return $LibraryCopyWith<$Res>(_self.currentLibrary!, (value) {
    return _then(_self.copyWith(currentLibrary: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  Library? currentLibrary,  List<NavTarget> navTargets,  DisplayMode libraryDisplayMode,  bool collapseSeries,  DisplayMode seriesDisplayMode,  DisplayMode authorDisplayMode,  NavTarget startupNav,  NavigationDestinationLabelBehavior navLabelBehavior,  String dateTimeFormat,  String? fontFamily,  double fontScale,  Duration skipForward,  Duration skipBackward,  double speed,  int historyLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibrary,_that.navTargets,_that.libraryDisplayMode,_that.collapseSeries,_that.seriesDisplayMode,_that.authorDisplayMode,_that.startupNav,_that.navLabelBehavior,_that.dateTimeFormat,_that.fontFamily,_that.fontScale,_that.skipForward,_that.skipBackward,_that.speed,_that.historyLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  Library? currentLibrary,  List<NavTarget> navTargets,  DisplayMode libraryDisplayMode,  bool collapseSeries,  DisplayMode seriesDisplayMode,  DisplayMode authorDisplayMode,  NavTarget startupNav,  NavigationDestinationLabelBehavior navLabelBehavior,  String dateTimeFormat,  String? fontFamily,  double fontScale,  Duration skipForward,  Duration skipBackward,  double speed,  int historyLimit)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.userId,_that.currentLibrary,_that.navTargets,_that.libraryDisplayMode,_that.collapseSeries,_that.seriesDisplayMode,_that.authorDisplayMode,_that.startupNav,_that.navLabelBehavior,_that.dateTimeFormat,_that.fontFamily,_that.fontScale,_that.skipForward,_that.skipBackward,_that.speed,_that.historyLimit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@noCodeGen  String userId,  Library? currentLibrary,  List<NavTarget> navTargets,  DisplayMode libraryDisplayMode,  bool collapseSeries,  DisplayMode seriesDisplayMode,  DisplayMode authorDisplayMode,  NavTarget startupNav,  NavigationDestinationLabelBehavior navLabelBehavior,  String dateTimeFormat,  String? fontFamily,  double fontScale,  Duration skipForward,  Duration skipBackward,  double speed,  int historyLimit)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibrary,_that.navTargets,_that.libraryDisplayMode,_that.collapseSeries,_that.seriesDisplayMode,_that.authorDisplayMode,_that.startupNav,_that.navLabelBehavior,_that.dateTimeFormat,_that.fontFamily,_that.fontScale,_that.skipForward,_that.skipBackward,_that.speed,_that.historyLimit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({@noCodeGen required this.userId, this.currentLibrary, final  List<NavTarget> navTargets = defaultNavTargets, this.libraryDisplayMode = DisplayMode.comfortable, this.collapseSeries = false, this.seriesDisplayMode = DisplayMode.comfortable, this.authorDisplayMode = DisplayMode.comfortable, this.startupNav = NavTarget.home, this.navLabelBehavior = NavigationDestinationLabelBehavior.alwaysShow, this.dateTimeFormat = 'dd MMM y', this.fontFamily = 'AtkinsonHyperlegibleNext', this.fontScale = 1, this.skipForward = const Duration(seconds: 30), this.skipBackward = const Duration(seconds: 10), this.speed = 1.0, this.historyLimit = 200}): _navTargets = navTargets;
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@noCodeGen final  String userId;
@override final  Library? currentLibrary;
 final  List<NavTarget> _navTargets;
@override@JsonKey() List<NavTarget> get navTargets {
  if (_navTargets is EqualUnmodifiableListView) return _navTargets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_navTargets);
}

@override@JsonKey() final  DisplayMode libraryDisplayMode;
@override@JsonKey() final  bool collapseSeries;
@override@JsonKey() final  DisplayMode seriesDisplayMode;
@override@JsonKey() final  DisplayMode authorDisplayMode;
@override@JsonKey() final  NavTarget startupNav;
@override@JsonKey() final  NavigationDestinationLabelBehavior navLabelBehavior;
@override@JsonKey() final  String dateTimeFormat;
@override@JsonKey() final  String? fontFamily;
@override@JsonKey() final  double fontScale;
@override@JsonKey() final  Duration skipForward;
@override@JsonKey() final  Duration skipBackward;
@override@JsonKey() final  double speed;
@override@JsonKey() final  int historyLimit;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibrary, currentLibrary) || other.currentLibrary == currentLibrary)&&const DeepCollectionEquality().equals(other._navTargets, _navTargets)&&(identical(other.libraryDisplayMode, libraryDisplayMode) || other.libraryDisplayMode == libraryDisplayMode)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries)&&(identical(other.seriesDisplayMode, seriesDisplayMode) || other.seriesDisplayMode == seriesDisplayMode)&&(identical(other.authorDisplayMode, authorDisplayMode) || other.authorDisplayMode == authorDisplayMode)&&(identical(other.startupNav, startupNav) || other.startupNav == startupNav)&&(identical(other.navLabelBehavior, navLabelBehavior) || other.navLabelBehavior == navLabelBehavior)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale)&&(identical(other.skipForward, skipForward) || other.skipForward == skipForward)&&(identical(other.skipBackward, skipBackward) || other.skipBackward == skipBackward)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.historyLimit, historyLimit) || other.historyLimit == historyLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibrary,const DeepCollectionEquality().hash(_navTargets),libraryDisplayMode,collapseSeries,seriesDisplayMode,authorDisplayMode,startupNav,navLabelBehavior,dateTimeFormat,fontFamily,fontScale,skipForward,skipBackward,speed,historyLimit);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibrary: $currentLibrary, navTargets: $navTargets, libraryDisplayMode: $libraryDisplayMode, collapseSeries: $collapseSeries, seriesDisplayMode: $seriesDisplayMode, authorDisplayMode: $authorDisplayMode, startupNav: $startupNav, navLabelBehavior: $navLabelBehavior, dateTimeFormat: $dateTimeFormat, fontFamily: $fontFamily, fontScale: $fontScale, skipForward: $skipForward, skipBackward: $skipBackward, speed: $speed, historyLimit: $historyLimit)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
@noCodeGen String userId, Library? currentLibrary, List<NavTarget> navTargets, DisplayMode libraryDisplayMode, bool collapseSeries, DisplayMode seriesDisplayMode, DisplayMode authorDisplayMode, NavTarget startupNav, NavigationDestinationLabelBehavior navLabelBehavior, String dateTimeFormat, String? fontFamily, double fontScale, Duration skipForward, Duration skipBackward, double speed, int historyLimit
});


@override $LibraryCopyWith<$Res>? get currentLibrary;

}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? currentLibrary = freezed,Object? navTargets = null,Object? libraryDisplayMode = null,Object? collapseSeries = null,Object? seriesDisplayMode = null,Object? authorDisplayMode = null,Object? startupNav = null,Object? navLabelBehavior = null,Object? dateTimeFormat = null,Object? fontFamily = freezed,Object? fontScale = null,Object? skipForward = null,Object? skipBackward = null,Object? speed = null,Object? historyLimit = null,}) {
  return _then(_UserSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibrary: freezed == currentLibrary ? _self.currentLibrary : currentLibrary // ignore: cast_nullable_to_non_nullable
as Library?,navTargets: null == navTargets ? _self._navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,libraryDisplayMode: null == libraryDisplayMode ? _self.libraryDisplayMode : libraryDisplayMode // ignore: cast_nullable_to_non_nullable
as DisplayMode,collapseSeries: null == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesDisplayMode: null == seriesDisplayMode ? _self.seriesDisplayMode : seriesDisplayMode // ignore: cast_nullable_to_non_nullable
as DisplayMode,authorDisplayMode: null == authorDisplayMode ? _self.authorDisplayMode : authorDisplayMode // ignore: cast_nullable_to_non_nullable
as DisplayMode,startupNav: null == startupNav ? _self.startupNav : startupNav // ignore: cast_nullable_to_non_nullable
as NavTarget,navLabelBehavior: null == navLabelBehavior ? _self.navLabelBehavior : navLabelBehavior // ignore: cast_nullable_to_non_nullable
as NavigationDestinationLabelBehavior,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,skipForward: null == skipForward ? _self.skipForward : skipForward // ignore: cast_nullable_to_non_nullable
as Duration,skipBackward: null == skipBackward ? _self.skipBackward : skipBackward // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,historyLimit: null == historyLimit ? _self.historyLimit : historyLimit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryCopyWith<$Res>? get currentLibrary {
    if (_self.currentLibrary == null) {
    return null;
  }

  return $LibraryCopyWith<$Res>(_self.currentLibrary!, (value) {
    return _then(_self.copyWith(currentLibrary: value));
  });
}
}

// dart format on
