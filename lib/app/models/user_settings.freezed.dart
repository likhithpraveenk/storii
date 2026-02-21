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

@noCodeGen String get userId; String? get currentLibraryId; bool get isFullySynced; bool get isItemsGridView; bool get isSeriesGridView; bool get isAuthorsGridView;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibraryId, currentLibraryId) || other.currentLibraryId == currentLibraryId)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.isItemsGridView, isItemsGridView) || other.isItemsGridView == isItemsGridView)&&(identical(other.isSeriesGridView, isSeriesGridView) || other.isSeriesGridView == isSeriesGridView)&&(identical(other.isAuthorsGridView, isAuthorsGridView) || other.isAuthorsGridView == isAuthorsGridView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibraryId,isFullySynced,isItemsGridView,isSeriesGridView,isAuthorsGridView);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibraryId: $currentLibraryId, isFullySynced: $isFullySynced, isItemsGridView: $isItemsGridView, isSeriesGridView: $isSeriesGridView, isAuthorsGridView: $isAuthorsGridView)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
@noCodeGen String userId, String? currentLibraryId, bool isFullySynced, bool isItemsGridView, bool isSeriesGridView, bool isAuthorsGridView
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
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? currentLibraryId = freezed,Object? isFullySynced = null,Object? isItemsGridView = null,Object? isSeriesGridView = null,Object? isAuthorsGridView = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibraryId: freezed == currentLibraryId ? _self.currentLibraryId : currentLibraryId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  String? currentLibraryId,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibraryId,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@noCodeGen  String userId,  String? currentLibraryId,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.userId,_that.currentLibraryId,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@noCodeGen  String userId,  String? currentLibraryId,  bool isFullySynced,  bool isItemsGridView,  bool isSeriesGridView,  bool isAuthorsGridView)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.currentLibraryId,_that.isFullySynced,_that.isItemsGridView,_that.isSeriesGridView,_that.isAuthorsGridView);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({@noCodeGen required this.userId, this.currentLibraryId, this.isFullySynced = false, this.isItemsGridView = true, this.isSeriesGridView = true, this.isAuthorsGridView = true});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@noCodeGen final  String userId;
@override final  String? currentLibraryId;
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentLibraryId, currentLibraryId) || other.currentLibraryId == currentLibraryId)&&(identical(other.isFullySynced, isFullySynced) || other.isFullySynced == isFullySynced)&&(identical(other.isItemsGridView, isItemsGridView) || other.isItemsGridView == isItemsGridView)&&(identical(other.isSeriesGridView, isSeriesGridView) || other.isSeriesGridView == isSeriesGridView)&&(identical(other.isAuthorsGridView, isAuthorsGridView) || other.isAuthorsGridView == isAuthorsGridView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentLibraryId,isFullySynced,isItemsGridView,isSeriesGridView,isAuthorsGridView);

@override
String toString() {
  return 'UserSettings(userId: $userId, currentLibraryId: $currentLibraryId, isFullySynced: $isFullySynced, isItemsGridView: $isItemsGridView, isSeriesGridView: $isSeriesGridView, isAuthorsGridView: $isAuthorsGridView)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
@noCodeGen String userId, String? currentLibraryId, bool isFullySynced, bool isItemsGridView, bool isSeriesGridView, bool isAuthorsGridView
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
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? currentLibraryId = freezed,Object? isFullySynced = null,Object? isItemsGridView = null,Object? isSeriesGridView = null,Object? isAuthorsGridView = null,}) {
  return _then(_UserSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentLibraryId: freezed == currentLibraryId ? _self.currentLibraryId : currentLibraryId // ignore: cast_nullable_to_non_nullable
as String?,isFullySynced: null == isFullySynced ? _self.isFullySynced : isFullySynced // ignore: cast_nullable_to_non_nullable
as bool,isItemsGridView: null == isItemsGridView ? _self.isItemsGridView : isItemsGridView // ignore: cast_nullable_to_non_nullable
as bool,isSeriesGridView: null == isSeriesGridView ? _self.isSeriesGridView : isSeriesGridView // ignore: cast_nullable_to_non_nullable
as bool,isAuthorsGridView: null == isAuthorsGridView ? _self.isAuthorsGridView : isAuthorsGridView // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
