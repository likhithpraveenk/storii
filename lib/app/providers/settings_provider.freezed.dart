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
mixin _$AppSettings implements DiagnosticableTreeMixin {

 ThemeMode get themeMode; bool get useDynamicColor; bool get usePureBlack; String get localeCode; UserDomain? get currentUser; Duration get logRetention; String get dateTimeFormat; List<NavTarget> get navTargets; String? get fontFamily; double get fontScale; int get defaultItemsLimit; int get defaultSeriesLimit; bool get showTitleForItem; bool get stackTitleOnImage; bool get enableHttpLogs;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppSettings'))
    ..add(DiagnosticsProperty('themeMode', themeMode))..add(DiagnosticsProperty('useDynamicColor', useDynamicColor))..add(DiagnosticsProperty('usePureBlack', usePureBlack))..add(DiagnosticsProperty('localeCode', localeCode))..add(DiagnosticsProperty('currentUser', currentUser))..add(DiagnosticsProperty('logRetention', logRetention))..add(DiagnosticsProperty('dateTimeFormat', dateTimeFormat))..add(DiagnosticsProperty('navTargets', navTargets))..add(DiagnosticsProperty('fontFamily', fontFamily))..add(DiagnosticsProperty('fontScale', fontScale))..add(DiagnosticsProperty('defaultItemsLimit', defaultItemsLimit))..add(DiagnosticsProperty('defaultSeriesLimit', defaultSeriesLimit))..add(DiagnosticsProperty('showTitleForItem', showTitleForItem))..add(DiagnosticsProperty('stackTitleOnImage', stackTitleOnImage))..add(DiagnosticsProperty('enableHttpLogs', enableHttpLogs));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.useDynamicColor, useDynamicColor) || other.useDynamicColor == useDynamicColor)&&(identical(other.usePureBlack, usePureBlack) || other.usePureBlack == usePureBlack)&&(identical(other.localeCode, localeCode) || other.localeCode == localeCode)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.logRetention, logRetention) || other.logRetention == logRetention)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&const DeepCollectionEquality().equals(other.navTargets, navTargets)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale)&&(identical(other.defaultItemsLimit, defaultItemsLimit) || other.defaultItemsLimit == defaultItemsLimit)&&(identical(other.defaultSeriesLimit, defaultSeriesLimit) || other.defaultSeriesLimit == defaultSeriesLimit)&&(identical(other.showTitleForItem, showTitleForItem) || other.showTitleForItem == showTitleForItem)&&(identical(other.stackTitleOnImage, stackTitleOnImage) || other.stackTitleOnImage == stackTitleOnImage)&&(identical(other.enableHttpLogs, enableHttpLogs) || other.enableHttpLogs == enableHttpLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,useDynamicColor,usePureBlack,localeCode,currentUser,logRetention,dateTimeFormat,const DeepCollectionEquality().hash(navTargets),fontFamily,fontScale,defaultItemsLimit,defaultSeriesLimit,showTitleForItem,stackTitleOnImage,enableHttpLogs);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppSettings(themeMode: $themeMode, useDynamicColor: $useDynamicColor, usePureBlack: $usePureBlack, localeCode: $localeCode, currentUser: $currentUser, logRetention: $logRetention, dateTimeFormat: $dateTimeFormat, navTargets: $navTargets, fontFamily: $fontFamily, fontScale: $fontScale, defaultItemsLimit: $defaultItemsLimit, defaultSeriesLimit: $defaultSeriesLimit, showTitleForItem: $showTitleForItem, stackTitleOnImage: $stackTitleOnImage, enableHttpLogs: $enableHttpLogs)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, bool useDynamicColor, bool usePureBlack, String localeCode, UserDomain? currentUser, Duration logRetention, String dateTimeFormat, List<NavTarget> navTargets, String? fontFamily, double fontScale, int defaultItemsLimit, int defaultSeriesLimit, bool showTitleForItem, bool stackTitleOnImage, bool enableHttpLogs
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
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? useDynamicColor = null,Object? usePureBlack = null,Object? localeCode = null,Object? currentUser = freezed,Object? logRetention = null,Object? dateTimeFormat = null,Object? navTargets = null,Object? fontFamily = freezed,Object? fontScale = null,Object? defaultItemsLimit = null,Object? defaultSeriesLimit = null,Object? showTitleForItem = null,Object? stackTitleOnImage = null,Object? enableHttpLogs = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,useDynamicColor: null == useDynamicColor ? _self.useDynamicColor : useDynamicColor // ignore: cast_nullable_to_non_nullable
as bool,usePureBlack: null == usePureBlack ? _self.usePureBlack : usePureBlack // ignore: cast_nullable_to_non_nullable
as bool,localeCode: null == localeCode ? _self.localeCode : localeCode // ignore: cast_nullable_to_non_nullable
as String,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserDomain?,logRetention: null == logRetention ? _self.logRetention : logRetention // ignore: cast_nullable_to_non_nullable
as Duration,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,navTargets: null == navTargets ? _self.navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,defaultItemsLimit: null == defaultItemsLimit ? _self.defaultItemsLimit : defaultItemsLimit // ignore: cast_nullable_to_non_nullable
as int,defaultSeriesLimit: null == defaultSeriesLimit ? _self.defaultSeriesLimit : defaultSeriesLimit // ignore: cast_nullable_to_non_nullable
as int,showTitleForItem: null == showTitleForItem ? _self.showTitleForItem : showTitleForItem // ignore: cast_nullable_to_non_nullable
as bool,stackTitleOnImage: null == stackTitleOnImage ? _self.stackTitleOnImage : stackTitleOnImage // ignore: cast_nullable_to_non_nullable
as bool,enableHttpLogs: null == enableHttpLogs ? _self.enableHttpLogs : enableHttpLogs // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool useDynamicColor,  bool usePureBlack,  String localeCode,  UserDomain? currentUser,  Duration logRetention,  String dateTimeFormat,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale,  int defaultItemsLimit,  int defaultSeriesLimit,  bool showTitleForItem,  bool stackTitleOnImage,  bool enableHttpLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.useDynamicColor,_that.usePureBlack,_that.localeCode,_that.currentUser,_that.logRetention,_that.dateTimeFormat,_that.navTargets,_that.fontFamily,_that.fontScale,_that.defaultItemsLimit,_that.defaultSeriesLimit,_that.showTitleForItem,_that.stackTitleOnImage,_that.enableHttpLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool useDynamicColor,  bool usePureBlack,  String localeCode,  UserDomain? currentUser,  Duration logRetention,  String dateTimeFormat,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale,  int defaultItemsLimit,  int defaultSeriesLimit,  bool showTitleForItem,  bool stackTitleOnImage,  bool enableHttpLogs)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.themeMode,_that.useDynamicColor,_that.usePureBlack,_that.localeCode,_that.currentUser,_that.logRetention,_that.dateTimeFormat,_that.navTargets,_that.fontFamily,_that.fontScale,_that.defaultItemsLimit,_that.defaultSeriesLimit,_that.showTitleForItem,_that.stackTitleOnImage,_that.enableHttpLogs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  bool useDynamicColor,  bool usePureBlack,  String localeCode,  UserDomain? currentUser,  Duration logRetention,  String dateTimeFormat,  List<NavTarget> navTargets,  String? fontFamily,  double fontScale,  int defaultItemsLimit,  int defaultSeriesLimit,  bool showTitleForItem,  bool stackTitleOnImage,  bool enableHttpLogs)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.useDynamicColor,_that.usePureBlack,_that.localeCode,_that.currentUser,_that.logRetention,_that.dateTimeFormat,_that.navTargets,_that.fontFamily,_that.fontScale,_that.defaultItemsLimit,_that.defaultSeriesLimit,_that.showTitleForItem,_that.stackTitleOnImage,_that.enableHttpLogs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings with DiagnosticableTreeMixin implements AppSettings {
  const _AppSettings({this.themeMode = ThemeMode.dark, this.useDynamicColor = false, this.usePureBlack = false, this.localeCode = 'en', this.currentUser, this.logRetention = const Duration(days: 2), this.dateTimeFormat = 'dd MMM y', final  List<NavTarget> navTargets = defaultNavTargets, this.fontFamily = AppFonts.defaultFont, this.fontScale = 1, this.defaultItemsLimit = 50, this.defaultSeriesLimit = 20, this.showTitleForItem = true, this.stackTitleOnImage = false, this.enableHttpLogs = false}): _navTargets = navTargets;
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool useDynamicColor;
@override@JsonKey() final  bool usePureBlack;
@override@JsonKey() final  String localeCode;
@override final  UserDomain? currentUser;
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
@override@JsonKey() final  int defaultItemsLimit;
@override@JsonKey() final  int defaultSeriesLimit;
@override@JsonKey() final  bool showTitleForItem;
@override@JsonKey() final  bool stackTitleOnImage;
@override@JsonKey() final  bool enableHttpLogs;

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
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppSettings'))
    ..add(DiagnosticsProperty('themeMode', themeMode))..add(DiagnosticsProperty('useDynamicColor', useDynamicColor))..add(DiagnosticsProperty('usePureBlack', usePureBlack))..add(DiagnosticsProperty('localeCode', localeCode))..add(DiagnosticsProperty('currentUser', currentUser))..add(DiagnosticsProperty('logRetention', logRetention))..add(DiagnosticsProperty('dateTimeFormat', dateTimeFormat))..add(DiagnosticsProperty('navTargets', navTargets))..add(DiagnosticsProperty('fontFamily', fontFamily))..add(DiagnosticsProperty('fontScale', fontScale))..add(DiagnosticsProperty('defaultItemsLimit', defaultItemsLimit))..add(DiagnosticsProperty('defaultSeriesLimit', defaultSeriesLimit))..add(DiagnosticsProperty('showTitleForItem', showTitleForItem))..add(DiagnosticsProperty('stackTitleOnImage', stackTitleOnImage))..add(DiagnosticsProperty('enableHttpLogs', enableHttpLogs));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.useDynamicColor, useDynamicColor) || other.useDynamicColor == useDynamicColor)&&(identical(other.usePureBlack, usePureBlack) || other.usePureBlack == usePureBlack)&&(identical(other.localeCode, localeCode) || other.localeCode == localeCode)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.logRetention, logRetention) || other.logRetention == logRetention)&&(identical(other.dateTimeFormat, dateTimeFormat) || other.dateTimeFormat == dateTimeFormat)&&const DeepCollectionEquality().equals(other._navTargets, _navTargets)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontScale, fontScale) || other.fontScale == fontScale)&&(identical(other.defaultItemsLimit, defaultItemsLimit) || other.defaultItemsLimit == defaultItemsLimit)&&(identical(other.defaultSeriesLimit, defaultSeriesLimit) || other.defaultSeriesLimit == defaultSeriesLimit)&&(identical(other.showTitleForItem, showTitleForItem) || other.showTitleForItem == showTitleForItem)&&(identical(other.stackTitleOnImage, stackTitleOnImage) || other.stackTitleOnImage == stackTitleOnImage)&&(identical(other.enableHttpLogs, enableHttpLogs) || other.enableHttpLogs == enableHttpLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,useDynamicColor,usePureBlack,localeCode,currentUser,logRetention,dateTimeFormat,const DeepCollectionEquality().hash(_navTargets),fontFamily,fontScale,defaultItemsLimit,defaultSeriesLimit,showTitleForItem,stackTitleOnImage,enableHttpLogs);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppSettings(themeMode: $themeMode, useDynamicColor: $useDynamicColor, usePureBlack: $usePureBlack, localeCode: $localeCode, currentUser: $currentUser, logRetention: $logRetention, dateTimeFormat: $dateTimeFormat, navTargets: $navTargets, fontFamily: $fontFamily, fontScale: $fontScale, defaultItemsLimit: $defaultItemsLimit, defaultSeriesLimit: $defaultSeriesLimit, showTitleForItem: $showTitleForItem, stackTitleOnImage: $stackTitleOnImage, enableHttpLogs: $enableHttpLogs)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, bool useDynamicColor, bool usePureBlack, String localeCode, UserDomain? currentUser, Duration logRetention, String dateTimeFormat, List<NavTarget> navTargets, String? fontFamily, double fontScale, int defaultItemsLimit, int defaultSeriesLimit, bool showTitleForItem, bool stackTitleOnImage, bool enableHttpLogs
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
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? useDynamicColor = null,Object? usePureBlack = null,Object? localeCode = null,Object? currentUser = freezed,Object? logRetention = null,Object? dateTimeFormat = null,Object? navTargets = null,Object? fontFamily = freezed,Object? fontScale = null,Object? defaultItemsLimit = null,Object? defaultSeriesLimit = null,Object? showTitleForItem = null,Object? stackTitleOnImage = null,Object? enableHttpLogs = null,}) {
  return _then(_AppSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,useDynamicColor: null == useDynamicColor ? _self.useDynamicColor : useDynamicColor // ignore: cast_nullable_to_non_nullable
as bool,usePureBlack: null == usePureBlack ? _self.usePureBlack : usePureBlack // ignore: cast_nullable_to_non_nullable
as bool,localeCode: null == localeCode ? _self.localeCode : localeCode // ignore: cast_nullable_to_non_nullable
as String,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserDomain?,logRetention: null == logRetention ? _self.logRetention : logRetention // ignore: cast_nullable_to_non_nullable
as Duration,dateTimeFormat: null == dateTimeFormat ? _self.dateTimeFormat : dateTimeFormat // ignore: cast_nullable_to_non_nullable
as String,navTargets: null == navTargets ? _self._navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontScale: null == fontScale ? _self.fontScale : fontScale // ignore: cast_nullable_to_non_nullable
as double,defaultItemsLimit: null == defaultItemsLimit ? _self.defaultItemsLimit : defaultItemsLimit // ignore: cast_nullable_to_non_nullable
as int,defaultSeriesLimit: null == defaultSeriesLimit ? _self.defaultSeriesLimit : defaultSeriesLimit // ignore: cast_nullable_to_non_nullable
as int,showTitleForItem: null == showTitleForItem ? _self.showTitleForItem : showTitleForItem // ignore: cast_nullable_to_non_nullable
as bool,stackTitleOnImage: null == stackTitleOnImage ? _self.stackTitleOnImage : stackTitleOnImage // ignore: cast_nullable_to_non_nullable
as bool,enableHttpLogs: null == enableHttpLogs ? _self.enableHttpLogs : enableHttpLogs // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$UserSettings implements DiagnosticableTreeMixin {

@noCodeGen String get userId; String? get currentLibraryId; String? get currentItemId; bool get isFullySynced; bool get isItemsGridView; bool get isSeriesGridView; bool get isAuthorsGridView;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSettings'))
    ..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('currentLibraryId', currentLibraryId))..add(DiagnosticsProperty('currentItemId', currentItemId))..add(DiagnosticsProperty('isFullySynced', isFullySynced))..add(DiagnosticsProperty('isItemsGridView', isItemsGridView))..add(DiagnosticsProperty('isSeriesGridView', isSeriesGridView))..add(DiagnosticsProperty('isAuthorsGridView', isAuthorsGridView));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibraryId, currentLibraryId) || other.currentLibraryId == currentLibraryId)&&(identical(other.currentItemId, currentItemId) || other.currentItemId == currentItemId)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.isItemsGridView, isItemsGridView) || other.isItemsGridView == isItemsGridView)&&(identical(other.isSeriesGridView, isSeriesGridView) || other.isSeriesGridView == isSeriesGridView)&&(identical(other.isAuthorsGridView, isAuthorsGridView) || other.isAuthorsGridView == isAuthorsGridView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibraryId,currentItemId,isFullySynced,isItemsGridView,isSeriesGridView,isAuthorsGridView);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSettings(userId: $userId, currentLibraryId: $currentLibraryId, currentItemId: $currentItemId, isFullySynced: $isFullySynced, isItemsGridView: $isItemsGridView, isSeriesGridView: $isSeriesGridView, isAuthorsGridView: $isAuthorsGridView)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
@noCodeGen String userId, String? currentLibraryId, String? currentItemId, bool isFullySynced, bool isItemsGridView, bool isSeriesGridView, bool isAuthorsGridView
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
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? currentLibraryId = freezed,Object? currentItemId = freezed,Object? isFullySynced = null,Object? isItemsGridView = null,Object? isSeriesGridView = null,Object? isAuthorsGridView = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibraryId: freezed == currentLibraryId ? _self.currentLibraryId : currentLibraryId // ignore: cast_nullable_to_non_nullable
as String?,currentItemId: freezed == currentItemId ? _self.currentItemId : currentItemId // ignore: cast_nullable_to_non_nullable
as String?,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,isItemsGridView: null == isItemsGridView ? _self.isItemsGridView : isItemsGridView // ignore: cast_nullable_to_non_nullable
as bool,isSeriesGridView: null == isSeriesGridView ? _self.isSeriesGridView : isSeriesGridView // ignore: cast_nullable_to_non_nullable
as bool,isAuthorsGridView: null == isAuthorsGridView ? _self.isAuthorsGridView : isAuthorsGridView // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  String? currentLibraryId,  String? currentItemId,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibraryId,_that.currentItemId,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  String? currentLibraryId,  String? currentItemId,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.userId,_that.currentLibraryId,_that.currentItemId,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@noCodeGen  String userId,  String? currentLibraryId,  String? currentItemId,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibraryId,_that.currentItemId,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings with DiagnosticableTreeMixin implements UserSettings {
  const _UserSettings({@noCodeGen required this.userId, this.currentLibraryId, this.currentItemId, this.isFullySynced = false, this.isItemsGridView = true, this.isSeriesGridView = true, this.isAuthorsGridView = true});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@noCodeGen final  String userId;
@override final  String? currentLibraryId;
@override final  String? currentItemId;
@override@JsonKey() final  bool isFullySynced;
@override@JsonKey() final  bool isItemsGridView;
@override@JsonKey() final  bool isSeriesGridView;
@override@JsonKey() final  bool isAuthorsGridView;

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
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSettings'))
    ..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('currentLibraryId', currentLibraryId))..add(DiagnosticsProperty('currentItemId', currentItemId))..add(DiagnosticsProperty('isFullySynced', isFullySynced))..add(DiagnosticsProperty('isItemsGridView', isItemsGridView))..add(DiagnosticsProperty('isSeriesGridView', isSeriesGridView))..add(DiagnosticsProperty('isAuthorsGridView', isAuthorsGridView));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibraryId, currentLibraryId) || other.currentLibraryId == currentLibraryId)&&(identical(other.currentItemId, currentItemId) || other.currentItemId == currentItemId)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.isItemsGridView, isItemsGridView) || other.isItemsGridView == isItemsGridView)&&(identical(other.isSeriesGridView, isSeriesGridView) || other.isSeriesGridView == isSeriesGridView)&&(identical(other.isAuthorsGridView, isAuthorsGridView) || other.isAuthorsGridView == isAuthorsGridView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibraryId,currentItemId,isFullySynced,isItemsGridView,isSeriesGridView,isAuthorsGridView);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSettings(userId: $userId, currentLibraryId: $currentLibraryId, currentItemId: $currentItemId, isFullySynced: $isFullySynced, isItemsGridView: $isItemsGridView, isSeriesGridView: $isSeriesGridView, isAuthorsGridView: $isAuthorsGridView)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
@noCodeGen String userId, String? currentLibraryId, String? currentItemId, bool isFullySynced, bool isItemsGridView, bool isSeriesGridView, bool isAuthorsGridView
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
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? currentLibraryId = freezed,Object? currentItemId = freezed,Object? isFullySynced = null,Object? isItemsGridView = null,Object? isSeriesGridView = null,Object? isAuthorsGridView = null,}) {
  return _then(_UserSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibraryId: freezed == currentLibraryId ? _self.currentLibraryId : currentLibraryId // ignore: cast_nullable_to_non_nullable
as String?,currentItemId: freezed == currentItemId ? _self.currentItemId : currentItemId // ignore: cast_nullable_to_non_nullable
as String?,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,isItemsGridView: null == isItemsGridView ? _self.isItemsGridView : isItemsGridView // ignore: cast_nullable_to_non_nullable
as bool,isSeriesGridView: null == isSeriesGridView ? _self.isSeriesGridView : isSeriesGridView // ignore: cast_nullable_to_non_nullable
as bool,isAuthorsGridView: null == isAuthorsGridView ? _self.isAuthorsGridView : isAuthorsGridView // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
