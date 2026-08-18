// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_cover_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCoverResponse {

 bool get success; String get cover;
/// Create a copy of UpdateCoverResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCoverResponseCopyWith<UpdateCoverResponse> get copyWith => _$UpdateCoverResponseCopyWithImpl<UpdateCoverResponse>(this as UpdateCoverResponse, _$identity);

  /// Serializes this UpdateCoverResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCoverResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.cover, cover) || other.cover == cover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,cover);

@override
String toString() {
  return 'UpdateCoverResponse(success: $success, cover: $cover)';
}


}

/// @nodoc
abstract mixin class $UpdateCoverResponseCopyWith<$Res>  {
  factory $UpdateCoverResponseCopyWith(UpdateCoverResponse value, $Res Function(UpdateCoverResponse) _then) = _$UpdateCoverResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String cover
});




}
/// @nodoc
class _$UpdateCoverResponseCopyWithImpl<$Res>
    implements $UpdateCoverResponseCopyWith<$Res> {
  _$UpdateCoverResponseCopyWithImpl(this._self, this._then);

  final UpdateCoverResponse _self;
  final $Res Function(UpdateCoverResponse) _then;

/// Create a copy of UpdateCoverResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? cover = null,}) {
  return _then(UpdateCoverResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCoverResponse].
extension UpdateCoverResponsePatterns on UpdateCoverResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCoverResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCoverResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCoverResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCoverResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCoverResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCoverResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String cover)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCoverResponse() when $default != null:
return $default(_that.success,_that.cover);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String cover)  $default,) {final _that = this;
switch (_that) {
case _UpdateCoverResponse():
return $default(_that.success,_that.cover);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String cover)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCoverResponse() when $default != null:
return $default(_that.success,_that.cover);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCoverResponse implements UpdateCoverResponse {
  const _UpdateCoverResponse({required this.success, required this.cover});
  factory _UpdateCoverResponse.fromJson(Map<String, dynamic> json) => _$UpdateCoverResponseFromJson(json);

@override final  bool success;
@override final  String cover;

/// Create a copy of UpdateCoverResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCoverResponseCopyWith<_UpdateCoverResponse> get copyWith => __$UpdateCoverResponseCopyWithImpl<_UpdateCoverResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCoverResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCoverResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.cover, cover) || other.cover == cover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,cover);

@override
String toString() {
  return 'UpdateCoverResponse(success: $success, cover: $cover)';
}


}

/// @nodoc
abstract mixin class _$UpdateCoverResponseCopyWith<$Res> implements $UpdateCoverResponseCopyWith<$Res> {
  factory _$UpdateCoverResponseCopyWith(_UpdateCoverResponse value, $Res Function(_UpdateCoverResponse) _then) = __$UpdateCoverResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String cover
});




}
/// @nodoc
class __$UpdateCoverResponseCopyWithImpl<$Res>
    implements _$UpdateCoverResponseCopyWith<$Res> {
  __$UpdateCoverResponseCopyWithImpl(this._self, this._then);

  final _UpdateCoverResponse _self;
  final $Res Function(_UpdateCoverResponse) _then;

/// Create a copy of UpdateCoverResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? cover = null,}) {
  return _then(_UpdateCoverResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
