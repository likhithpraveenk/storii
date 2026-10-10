// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WidgetConfig {

 int get widgetId; String get itemId; String? get episodeId; DateTime get updatedAt; String? get coverPath; double? get progress;
/// Create a copy of WidgetConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetConfigCopyWith<WidgetConfig> get copyWith => _$WidgetConfigCopyWithImpl<WidgetConfig>(this as WidgetConfig, _$identity);

  /// Serializes this WidgetConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WidgetConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetConfig&&(identical(other.widgetId, _this.widgetId) || other.widgetId == _this.widgetId)&&(identical(other.itemId, _this.itemId) || other.itemId == _this.itemId)&&(identical(other.episodeId, _this.episodeId) || other.episodeId == _this.episodeId)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.coverPath, _this.coverPath) || other.coverPath == _this.coverPath)&&(identical(other.progress, _this.progress) || other.progress == _this.progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WidgetConfig;
  return Object.hash(runtimeType,_this.widgetId,_this.itemId,_this.episodeId,_this.updatedAt,_this.coverPath,_this.progress);
}

@override
String toString() {
  final _this = this as WidgetConfig;
  return 'WidgetConfig(widgetId: ${_this.widgetId}, itemId: ${_this.itemId}, episodeId: ${_this.episodeId}, updatedAt: ${_this.updatedAt}, coverPath: ${_this.coverPath}, progress: ${_this.progress})';
}


}

/// @nodoc
abstract mixin class $WidgetConfigCopyWith<$Res>  {
  factory $WidgetConfigCopyWith(WidgetConfig value, $Res Function(WidgetConfig) _then) = _$WidgetConfigCopyWithImpl;
@useResult
$Res call({
 int widgetId, String itemId, String? episodeId, DateTime updatedAt, String? coverPath, double? progress
});




}
/// @nodoc
class _$WidgetConfigCopyWithImpl<$Res>
    implements $WidgetConfigCopyWith<$Res> {
  _$WidgetConfigCopyWithImpl(this._self, this._then);

  final WidgetConfig _self;
  final $Res Function(WidgetConfig) _then;

/// Create a copy of WidgetConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? widgetId = null,Object? itemId = null,Object? episodeId = freezed,Object? updatedAt = null,Object? coverPath = freezed,Object? progress = freezed,}) {
  return _then(WidgetConfig(
widgetId: null == widgetId ? _self.widgetId : widgetId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [WidgetConfig].
extension WidgetConfigPatterns on WidgetConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetConfig value)  $default,){
final _that = this;
switch (_that) {
case _WidgetConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetConfig value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int widgetId,  String itemId,  String? episodeId,  DateTime updatedAt,  String? coverPath,  double? progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetConfig() when $default != null:
return $default(_that.widgetId,_that.itemId,_that.episodeId,_that.updatedAt,_that.coverPath,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int widgetId,  String itemId,  String? episodeId,  DateTime updatedAt,  String? coverPath,  double? progress)  $default,) {final _that = this;
switch (_that) {
case _WidgetConfig():
return $default(_that.widgetId,_that.itemId,_that.episodeId,_that.updatedAt,_that.coverPath,_that.progress);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int widgetId,  String itemId,  String? episodeId,  DateTime updatedAt,  String? coverPath,  double? progress)?  $default,) {final _that = this;
switch (_that) {
case _WidgetConfig() when $default != null:
return $default(_that.widgetId,_that.itemId,_that.episodeId,_that.updatedAt,_that.coverPath,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WidgetConfig implements WidgetConfig {
  const _WidgetConfig({required this.widgetId, required this.itemId, this.episodeId, required this.updatedAt, this.coverPath, this.progress});
  factory _WidgetConfig.fromJson(Map<String, dynamic> json) => _$WidgetConfigFromJson(json);

@override final  int widgetId;
@override final  String itemId;
@override final  String? episodeId;
@override final  DateTime updatedAt;
@override final  String? coverPath;
@override final  double? progress;

/// Create a copy of WidgetConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetConfigCopyWith<_WidgetConfig> get copyWith => __$WidgetConfigCopyWithImpl<_WidgetConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WidgetConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WidgetConfig&&(identical(other.widgetId, widgetId) || other.widgetId == widgetId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,widgetId,itemId,episodeId,updatedAt,coverPath,progress);
}

@override
String toString() {
    return 'WidgetConfig(widgetId: $widgetId, itemId: $itemId, episodeId: $episodeId, updatedAt: $updatedAt, coverPath: $coverPath, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$WidgetConfigCopyWith<$Res> implements $WidgetConfigCopyWith<$Res> {
  factory _$WidgetConfigCopyWith(_WidgetConfig value, $Res Function(_WidgetConfig) _then) = __$WidgetConfigCopyWithImpl;
@override @useResult
$Res call({
 int widgetId, String itemId, String? episodeId, DateTime updatedAt, String? coverPath, double? progress
});




}
/// @nodoc
class __$WidgetConfigCopyWithImpl<$Res>
    implements _$WidgetConfigCopyWith<$Res> {
  __$WidgetConfigCopyWithImpl(this._self, this._then);

  final _WidgetConfig _self;
  final $Res Function(_WidgetConfig) _then;

/// Create a copy of WidgetConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? widgetId = null,Object? itemId = null,Object? episodeId = freezed,Object? updatedAt = null,Object? coverPath = freezed,Object? progress = freezed,}) {
  return _then(_WidgetConfig(
widgetId: null == widgetId ? _self.widgetId : widgetId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
