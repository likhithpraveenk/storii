// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_items_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryItemsRequestParams {

 int get limit; int get page; String? get sort;@BoolBinaryConverter() bool? get desc;@FilterConverter() Filter? get filter;@JsonKey(name: 'collapseseries') bool? get collapseSeries;
/// Create a copy of LibraryItemsRequestParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemsRequestParamsCopyWith<LibraryItemsRequestParams> get copyWith => _$LibraryItemsRequestParamsCopyWithImpl<LibraryItemsRequestParams>(this as LibraryItemsRequestParams, _$identity);

  /// Serializes this LibraryItemsRequestParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemsRequestParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,desc,filter,collapseSeries);

@override
String toString() {
  return 'LibraryItemsRequestParams(limit: $limit, page: $page, sort: $sort, desc: $desc, filter: $filter, collapseSeries: $collapseSeries)';
}


}

/// @nodoc
abstract mixin class $LibraryItemsRequestParamsCopyWith<$Res>  {
  factory $LibraryItemsRequestParamsCopyWith(LibraryItemsRequestParams value, $Res Function(LibraryItemsRequestParams) _then) = _$LibraryItemsRequestParamsCopyWithImpl;
@useResult
$Res call({
 int limit, int page, String? sort,@BoolBinaryConverter() bool? desc,@FilterConverter() Filter? filter,@JsonKey(name: 'collapseseries') bool? collapseSeries
});




}
/// @nodoc
class _$LibraryItemsRequestParamsCopyWithImpl<$Res>
    implements $LibraryItemsRequestParamsCopyWith<$Res> {
  _$LibraryItemsRequestParamsCopyWithImpl(this._self, this._then);

  final LibraryItemsRequestParams _self;
  final $Res Function(LibraryItemsRequestParams) _then;

/// Create a copy of LibraryItemsRequestParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,Object? sort = freezed,Object? desc = freezed,Object? filter = freezed,Object? collapseSeries = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as bool?,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter?,collapseSeries: freezed == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryItemsRequestParams].
extension LibraryItemsRequestParamsPatterns on LibraryItemsRequestParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItemsRequestParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItemsRequestParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItemsRequestParams value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItemsRequestParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItemsRequestParams value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItemsRequestParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page,  String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter, @JsonKey(name: 'collapseseries')  bool? collapseSeries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItemsRequestParams() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.desc,_that.filter,_that.collapseSeries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page,  String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter, @JsonKey(name: 'collapseseries')  bool? collapseSeries)  $default,) {final _that = this;
switch (_that) {
case _LibraryItemsRequestParams():
return $default(_that.limit,_that.page,_that.sort,_that.desc,_that.filter,_that.collapseSeries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page,  String? sort, @BoolBinaryConverter()  bool? desc, @FilterConverter()  Filter? filter, @JsonKey(name: 'collapseseries')  bool? collapseSeries)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItemsRequestParams() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.desc,_that.filter,_that.collapseSeries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryItemsRequestParams extends LibraryItemsRequestParams {
  const _LibraryItemsRequestParams({this.limit = 0, this.page = 0, this.sort, @BoolBinaryConverter() this.desc, @FilterConverter() this.filter, @JsonKey(name: 'collapseseries') this.collapseSeries}): super._();
  factory _LibraryItemsRequestParams.fromJson(Map<String, dynamic> json) => _$LibraryItemsRequestParamsFromJson(json);

@override@JsonKey() final  int limit;
@override@JsonKey() final  int page;
@override final  String? sort;
@override@BoolBinaryConverter() final  bool? desc;
@override@FilterConverter() final  Filter? filter;
@override@JsonKey(name: 'collapseseries') final  bool? collapseSeries;

/// Create a copy of LibraryItemsRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemsRequestParamsCopyWith<_LibraryItemsRequestParams> get copyWith => __$LibraryItemsRequestParamsCopyWithImpl<_LibraryItemsRequestParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryItemsRequestParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItemsRequestParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,desc,filter,collapseSeries);

@override
String toString() {
  return 'LibraryItemsRequestParams(limit: $limit, page: $page, sort: $sort, desc: $desc, filter: $filter, collapseSeries: $collapseSeries)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemsRequestParamsCopyWith<$Res> implements $LibraryItemsRequestParamsCopyWith<$Res> {
  factory _$LibraryItemsRequestParamsCopyWith(_LibraryItemsRequestParams value, $Res Function(_LibraryItemsRequestParams) _then) = __$LibraryItemsRequestParamsCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, String? sort,@BoolBinaryConverter() bool? desc,@FilterConverter() Filter? filter,@JsonKey(name: 'collapseseries') bool? collapseSeries
});




}
/// @nodoc
class __$LibraryItemsRequestParamsCopyWithImpl<$Res>
    implements _$LibraryItemsRequestParamsCopyWith<$Res> {
  __$LibraryItemsRequestParamsCopyWithImpl(this._self, this._then);

  final _LibraryItemsRequestParams _self;
  final $Res Function(_LibraryItemsRequestParams) _then;

/// Create a copy of LibraryItemsRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? sort = freezed,Object? desc = freezed,Object? filter = freezed,Object? collapseSeries = freezed,}) {
  return _then(_LibraryItemsRequestParams(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as bool?,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter?,collapseSeries: freezed == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
