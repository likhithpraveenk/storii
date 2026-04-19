// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriesRequestParams {

 int get limit; int get page; String? get sort;@BoolBinaryConverter() bool? get desc;@FilterConverter() Filter? get filter;
/// Create a copy of SeriesRequestParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesRequestParamsCopyWith<SeriesRequestParams> get copyWith => _$SeriesRequestParamsCopyWithImpl<SeriesRequestParams>(this as SeriesRequestParams, _$identity);

  /// Serializes this SeriesRequestParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesRequestParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,desc,filter);

@override
String toString() {
  return 'SeriesRequestParams(limit: $limit, page: $page, sort: $sort, desc: $desc, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $SeriesRequestParamsCopyWith<$Res>  {
  factory $SeriesRequestParamsCopyWith(SeriesRequestParams value, $Res Function(SeriesRequestParams) _then) = _$SeriesRequestParamsCopyWithImpl;
@useResult
$Res call({
 int limit, int page, String? sort,@BoolBinaryConverter() bool? desc,@FilterConverter() Filter? filter
});




}
/// @nodoc
class _$SeriesRequestParamsCopyWithImpl<$Res>
    implements $SeriesRequestParamsCopyWith<$Res> {
  _$SeriesRequestParamsCopyWithImpl(this._self, this._then);

  final SeriesRequestParams _self;
  final $Res Function(SeriesRequestParams) _then;

/// Create a copy of SeriesRequestParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,Object? sort = freezed,Object? desc = freezed,Object? filter = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as bool?,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesRequestParams].
extension SeriesRequestParamsPatterns on SeriesRequestParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesRequestParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesRequestParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesRequestParams value)  $default,){
final _that = this;
switch (_that) {
case _SeriesRequestParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesRequestParams value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesRequestParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page,  String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesRequestParams() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.desc,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page,  String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter)  $default,) {final _that = this;
switch (_that) {
case _SeriesRequestParams():
return $default(_that.limit,_that.page,_that.sort,_that.desc,_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page,  String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter)?  $default,) {final _that = this;
switch (_that) {
case _SeriesRequestParams() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.desc,_that.filter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesRequestParams extends SeriesRequestParams {
  const _SeriesRequestParams({this.limit = 0, this.page = 0, this.sort, @BoolBinaryConverter() this.desc, @FilterConverter() this.filter}): super._();
  factory _SeriesRequestParams.fromJson(Map<String, dynamic> json) => _$SeriesRequestParamsFromJson(json);

@override@JsonKey() final  int limit;
@override@JsonKey() final  int page;
@override final  String? sort;
@override@BoolBinaryConverter() final  bool? desc;
@override@FilterConverter() final  Filter? filter;

/// Create a copy of SeriesRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesRequestParamsCopyWith<_SeriesRequestParams> get copyWith => __$SeriesRequestParamsCopyWithImpl<_SeriesRequestParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesRequestParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesRequestParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,desc,filter);

@override
String toString() {
  return 'SeriesRequestParams(limit: $limit, page: $page, sort: $sort, desc: $desc, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$SeriesRequestParamsCopyWith<$Res> implements $SeriesRequestParamsCopyWith<$Res> {
  factory _$SeriesRequestParamsCopyWith(_SeriesRequestParams value, $Res Function(_SeriesRequestParams) _then) = __$SeriesRequestParamsCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, String? sort,@BoolBinaryConverter() bool? desc,@FilterConverter() Filter? filter
});




}
/// @nodoc
class __$SeriesRequestParamsCopyWithImpl<$Res>
    implements _$SeriesRequestParamsCopyWith<$Res> {
  __$SeriesRequestParamsCopyWithImpl(this._self, this._then);

  final _SeriesRequestParams _self;
  final $Res Function(_SeriesRequestParams) _then;

/// Create a copy of SeriesRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? sort = freezed,Object? desc = freezed,Object? filter = freezed,}) {
  return _then(_SeriesRequestParams(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as bool?,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter?,
  ));
}


}

// dart format on
