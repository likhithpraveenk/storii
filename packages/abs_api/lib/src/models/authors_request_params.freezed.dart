// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authors_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthorsRequestParams {

 String? get sort;@BoolBinaryConverter() bool? get desc;@FilterConverter() Filter? get filter;
/// Create a copy of AuthorsRequestParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorsRequestParamsCopyWith<AuthorsRequestParams> get copyWith => _$AuthorsRequestParamsCopyWithImpl<AuthorsRequestParams>(this as AuthorsRequestParams, _$identity);

  /// Serializes this AuthorsRequestParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorsRequestParams&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sort,desc,filter);

@override
String toString() {
  return 'AuthorsRequestParams(sort: $sort, desc: $desc, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $AuthorsRequestParamsCopyWith<$Res>  {
  factory $AuthorsRequestParamsCopyWith(AuthorsRequestParams value, $Res Function(AuthorsRequestParams) _then) = _$AuthorsRequestParamsCopyWithImpl;
@useResult
$Res call({
 String? sort,@BoolBinaryConverter() bool? desc,@FilterConverter() Filter? filter
});




}
/// @nodoc
class _$AuthorsRequestParamsCopyWithImpl<$Res>
    implements $AuthorsRequestParamsCopyWith<$Res> {
  _$AuthorsRequestParamsCopyWithImpl(this._self, this._then);

  final AuthorsRequestParams _self;
  final $Res Function(AuthorsRequestParams) _then;

/// Create a copy of AuthorsRequestParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sort = freezed,Object? desc = freezed,Object? filter = freezed,}) {
  return _then(_self.copyWith(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as bool?,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorsRequestParams].
extension AuthorsRequestParamsPatterns on AuthorsRequestParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorsRequestParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorsRequestParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorsRequestParams value)  $default,){
final _that = this;
switch (_that) {
case _AuthorsRequestParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorsRequestParams value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorsRequestParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorsRequestParams() when $default != null:
return $default(_that.sort,_that.desc,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter)  $default,) {final _that = this;
switch (_that) {
case _AuthorsRequestParams():
return $default(_that.sort,_that.desc,_that.filter);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter)?  $default,) {final _that = this;
switch (_that) {
case _AuthorsRequestParams() when $default != null:
return $default(_that.sort,_that.desc,_that.filter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthorsRequestParams extends AuthorsRequestParams {
  const _AuthorsRequestParams({this.sort, @BoolBinaryConverter() this.desc, @FilterConverter() this.filter}): super._();
  factory _AuthorsRequestParams.fromJson(Map<String, dynamic> json) => _$AuthorsRequestParamsFromJson(json);

@override final  String? sort;
@override@BoolBinaryConverter() final  bool? desc;
@override@FilterConverter() final  Filter? filter;

/// Create a copy of AuthorsRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorsRequestParamsCopyWith<_AuthorsRequestParams> get copyWith => __$AuthorsRequestParamsCopyWithImpl<_AuthorsRequestParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorsRequestParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorsRequestParams&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sort,desc,filter);

@override
String toString() {
  return 'AuthorsRequestParams(sort: $sort, desc: $desc, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$AuthorsRequestParamsCopyWith<$Res> implements $AuthorsRequestParamsCopyWith<$Res> {
  factory _$AuthorsRequestParamsCopyWith(_AuthorsRequestParams value, $Res Function(_AuthorsRequestParams) _then) = __$AuthorsRequestParamsCopyWithImpl;
@override @useResult
$Res call({
 String? sort,@BoolBinaryConverter() bool? desc,@FilterConverter() Filter? filter
});




}
/// @nodoc
class __$AuthorsRequestParamsCopyWithImpl<$Res>
    implements _$AuthorsRequestParamsCopyWith<$Res> {
  __$AuthorsRequestParamsCopyWithImpl(this._self, this._then);

  final _AuthorsRequestParams _self;
  final $Res Function(_AuthorsRequestParams) _then;

/// Create a copy of AuthorsRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sort = freezed,Object? desc = freezed,Object? filter = freezed,}) {
  return _then(_AuthorsRequestParams(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as bool?,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter?,
  ));
}


}

// dart format on
