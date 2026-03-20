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

@noCodeGen String get userId; Library? get currentLibrary; List<NavTarget> get navTargets; bool get isFullySynced; bool get isItemsGridView; bool get isSeriesGridView; bool get isAuthorsGridView; bool get showTitleForItem; bool get stackTitleOnImage; NavTarget get startupNav; NavigationDestinationLabelBehavior get navLabelBehavior;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibrary, currentLibrary) || other.currentLibrary == currentLibrary)&&const DeepCollectionEquality().equals(other.navTargets, navTargets)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.isItemsGridView, isItemsGridView) || other.isItemsGridView == isItemsGridView)&&(identical(other.isSeriesGridView, isSeriesGridView) || other.isSeriesGridView == isSeriesGridView)&&(identical(other.isAuthorsGridView, isAuthorsGridView) || other.isAuthorsGridView == isAuthorsGridView)&&(identical(other.showTitleForItem, showTitleForItem) || other.showTitleForItem == showTitleForItem)&&(identical(other.stackTitleOnImage, stackTitleOnImage) || other.stackTitleOnImage == stackTitleOnImage)&&(identical(other.startupNav, startupNav) || other.startupNav == startupNav)&&(identical(other.navLabelBehavior, navLabelBehavior) || other.navLabelBehavior == navLabelBehavior));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibrary,const DeepCollectionEquality().hash(navTargets),isFullySynced,isItemsGridView,isSeriesGridView,isAuthorsGridView,showTitleForItem,stackTitleOnImage,startupNav,navLabelBehavior);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibrary: $currentLibrary, navTargets: $navTargets, isFullySynced: $isFullySynced, isItemsGridView: $isItemsGridView, isSeriesGridView: $isSeriesGridView, isAuthorsGridView: $isAuthorsGridView, showTitleForItem: $showTitleForItem, stackTitleOnImage: $stackTitleOnImage, startupNav: $startupNav, navLabelBehavior: $navLabelBehavior)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
@noCodeGen String userId, Library? currentLibrary, List<NavTarget> navTargets, bool isFullySynced, bool isItemsGridView, bool isSeriesGridView, bool isAuthorsGridView, bool showTitleForItem, bool stackTitleOnImage, NavTarget startupNav, NavigationDestinationLabelBehavior navLabelBehavior
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
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? currentLibrary = freezed,Object? navTargets = null,Object? isFullySynced = null,Object? isItemsGridView = null,Object? isSeriesGridView = null,Object? isAuthorsGridView = null,Object? showTitleForItem = null,Object? stackTitleOnImage = null,Object? startupNav = null,Object? navLabelBehavior = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibrary: freezed == currentLibrary ? _self.currentLibrary : currentLibrary // ignore: cast_nullable_to_non_nullable
as Library?,navTargets: null == navTargets ? _self.navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,isItemsGridView: null == isItemsGridView ? _self.isItemsGridView : isItemsGridView // ignore: cast_nullable_to_non_nullable
as bool,isSeriesGridView: null == isSeriesGridView ? _self.isSeriesGridView : isSeriesGridView // ignore: cast_nullable_to_non_nullable
as bool,isAuthorsGridView: null == isAuthorsGridView ? _self.isAuthorsGridView : isAuthorsGridView // ignore: cast_nullable_to_non_nullable
as bool,showTitleForItem: null == showTitleForItem ? _self.showTitleForItem : showTitleForItem // ignore: cast_nullable_to_non_nullable
as bool,stackTitleOnImage: null == stackTitleOnImage ? _self.stackTitleOnImage : stackTitleOnImage // ignore: cast_nullable_to_non_nullable
as bool,startupNav: null == startupNav ? _self.startupNav : startupNav // ignore: cast_nullable_to_non_nullable
as NavTarget,navLabelBehavior: null == navLabelBehavior ? _self.navLabelBehavior : navLabelBehavior // ignore: cast_nullable_to_non_nullable
as NavigationDestinationLabelBehavior,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  Library? currentLibrary,  List<NavTarget> navTargets,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView,  bool showTitleForItem,  bool stackTitleOnImage,  NavTarget startupNav,  NavigationDestinationLabelBehavior navLabelBehavior)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibrary,_that.navTargets,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView,_that.showTitleForItem,_that.stackTitleOnImage,_that.startupNav,_that.navLabelBehavior);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  Library? currentLibrary,  List<NavTarget> navTargets,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView,  bool showTitleForItem,  bool stackTitleOnImage,  NavTarget startupNav,  NavigationDestinationLabelBehavior navLabelBehavior)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.userId,_that.currentLibrary,_that.navTargets,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView,_that.showTitleForItem,_that.stackTitleOnImage,_that.startupNav,_that.navLabelBehavior);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@noCodeGen  String userId,  Library? currentLibrary,  List<NavTarget> navTargets,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView,  bool showTitleForItem,  bool stackTitleOnImage,  NavTarget startupNav,  NavigationDestinationLabelBehavior navLabelBehavior)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibrary,_that.navTargets,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView,_that.showTitleForItem,_that.stackTitleOnImage,_that.startupNav,_that.navLabelBehavior);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({@noCodeGen required this.userId, this.currentLibrary, final  List<NavTarget> navTargets = defaultNavTargets, this.isFullySynced = false, this.isItemsGridView = true, this.isSeriesGridView = true, this.isAuthorsGridView = true, this.showTitleForItem = true, this.stackTitleOnImage = false, this.startupNav = NavTarget.home, this.navLabelBehavior = NavigationDestinationLabelBehavior.alwaysShow}): _navTargets = navTargets;
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@noCodeGen final  String userId;
@override final  Library? currentLibrary;
 final  List<NavTarget> _navTargets;
@override@JsonKey() List<NavTarget> get navTargets {
  if (_navTargets is EqualUnmodifiableListView) return _navTargets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_navTargets);
}

@override@JsonKey() final  bool isFullySynced;
@override@JsonKey() final  bool isItemsGridView;
@override@JsonKey() final  bool isSeriesGridView;
@override@JsonKey() final  bool isAuthorsGridView;
@override@JsonKey() final  bool showTitleForItem;
@override@JsonKey() final  bool stackTitleOnImage;
@override@JsonKey() final  NavTarget startupNav;
@override@JsonKey() final  NavigationDestinationLabelBehavior navLabelBehavior;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibrary, currentLibrary) || other.currentLibrary == currentLibrary)&&const DeepCollectionEquality().equals(other._navTargets, _navTargets)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.isItemsGridView, isItemsGridView) || other.isItemsGridView == isItemsGridView)&&(identical(other.isSeriesGridView, isSeriesGridView) || other.isSeriesGridView == isSeriesGridView)&&(identical(other.isAuthorsGridView, isAuthorsGridView) || other.isAuthorsGridView == isAuthorsGridView)&&(identical(other.showTitleForItem, showTitleForItem) || other.showTitleForItem == showTitleForItem)&&(identical(other.stackTitleOnImage, stackTitleOnImage) || other.stackTitleOnImage == stackTitleOnImage)&&(identical(other.startupNav, startupNav) || other.startupNav == startupNav)&&(identical(other.navLabelBehavior, navLabelBehavior) || other.navLabelBehavior == navLabelBehavior));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibrary,const DeepCollectionEquality().hash(_navTargets),isFullySynced,isItemsGridView,isSeriesGridView,isAuthorsGridView,showTitleForItem,stackTitleOnImage,startupNav,navLabelBehavior);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibrary: $currentLibrary, navTargets: $navTargets, isFullySynced: $isFullySynced, isItemsGridView: $isItemsGridView, isSeriesGridView: $isSeriesGridView, isAuthorsGridView: $isAuthorsGridView, showTitleForItem: $showTitleForItem, stackTitleOnImage: $stackTitleOnImage, startupNav: $startupNav, navLabelBehavior: $navLabelBehavior)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
@noCodeGen String userId, Library? currentLibrary, List<NavTarget> navTargets, bool isFullySynced, bool isItemsGridView, bool isSeriesGridView, bool isAuthorsGridView, bool showTitleForItem, bool stackTitleOnImage, NavTarget startupNav, NavigationDestinationLabelBehavior navLabelBehavior
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
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? currentLibrary = freezed,Object? navTargets = null,Object? isFullySynced = null,Object? isItemsGridView = null,Object? isSeriesGridView = null,Object? isAuthorsGridView = null,Object? showTitleForItem = null,Object? stackTitleOnImage = null,Object? startupNav = null,Object? navLabelBehavior = null,}) {
  return _then(_UserSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibrary: freezed == currentLibrary ? _self.currentLibrary : currentLibrary // ignore: cast_nullable_to_non_nullable
as Library?,navTargets: null == navTargets ? _self._navTargets : navTargets // ignore: cast_nullable_to_non_nullable
as List<NavTarget>,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,isItemsGridView: null == isItemsGridView ? _self.isItemsGridView : isItemsGridView // ignore: cast_nullable_to_non_nullable
as bool,isSeriesGridView: null == isSeriesGridView ? _self.isSeriesGridView : isSeriesGridView // ignore: cast_nullable_to_non_nullable
as bool,isAuthorsGridView: null == isAuthorsGridView ? _self.isAuthorsGridView : isAuthorsGridView // ignore: cast_nullable_to_non_nullable
as bool,showTitleForItem: null == showTitleForItem ? _self.showTitleForItem : showTitleForItem // ignore: cast_nullable_to_non_nullable
as bool,stackTitleOnImage: null == stackTitleOnImage ? _self.stackTitleOnImage : stackTitleOnImage // ignore: cast_nullable_to_non_nullable
as bool,startupNav: null == startupNav ? _self.startupNav : startupNav // ignore: cast_nullable_to_non_nullable
as NavTarget,navLabelBehavior: null == navLabelBehavior ? _self.navLabelBehavior : navLabelBehavior // ignore: cast_nullable_to_non_nullable
as NavigationDestinationLabelBehavior,
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
