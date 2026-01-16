// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeriesListState {

 List<SeriesDomain> get series; bool get isLoadingMore; bool get hasMore; Object? get error;
/// Create a copy of SeriesListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesListStateCopyWith<SeriesListState> get copyWith => _$SeriesListStateCopyWithImpl<SeriesListState>(this as SeriesListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesListState&&const DeepCollectionEquality().equals(other.series, series)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(series),isLoadingMore,hasMore,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SeriesListState(series: $series, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error)';
}


}

/// @nodoc
abstract mixin class $SeriesListStateCopyWith<$Res>  {
  factory $SeriesListStateCopyWith(SeriesListState value, $Res Function(SeriesListState) _then) = _$SeriesListStateCopyWithImpl;
@useResult
$Res call({
 List<SeriesDomain> series, bool isLoadingMore, bool hasMore, Object? error
});




}
/// @nodoc
class _$SeriesListStateCopyWithImpl<$Res>
    implements $SeriesListStateCopyWith<$Res> {
  _$SeriesListStateCopyWithImpl(this._self, this._then);

  final SeriesListState _self;
  final $Res Function(SeriesListState) _then;

/// Create a copy of SeriesListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? series = null,Object? isLoadingMore = null,Object? hasMore = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<SeriesDomain>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesListState].
extension SeriesListStatePatterns on SeriesListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesListState value)  $default,){
final _that = this;
switch (_that) {
case _SeriesListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesListState value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SeriesDomain> series,  bool isLoadingMore,  bool hasMore,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesListState() when $default != null:
return $default(_that.series,_that.isLoadingMore,_that.hasMore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SeriesDomain> series,  bool isLoadingMore,  bool hasMore,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _SeriesListState():
return $default(_that.series,_that.isLoadingMore,_that.hasMore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SeriesDomain> series,  bool isLoadingMore,  bool hasMore,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _SeriesListState() when $default != null:
return $default(_that.series,_that.isLoadingMore,_that.hasMore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SeriesListState implements SeriesListState {
  const _SeriesListState({final  List<SeriesDomain> series = const [], this.isLoadingMore = false, this.hasMore = true, this.error}): _series = series;
  

 final  List<SeriesDomain> _series;
@override@JsonKey() List<SeriesDomain> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}

@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;
@override final  Object? error;

/// Create a copy of SeriesListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesListStateCopyWith<_SeriesListState> get copyWith => __$SeriesListStateCopyWithImpl<_SeriesListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesListState&&const DeepCollectionEquality().equals(other._series, _series)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_series),isLoadingMore,hasMore,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SeriesListState(series: $series, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SeriesListStateCopyWith<$Res> implements $SeriesListStateCopyWith<$Res> {
  factory _$SeriesListStateCopyWith(_SeriesListState value, $Res Function(_SeriesListState) _then) = __$SeriesListStateCopyWithImpl;
@override @useResult
$Res call({
 List<SeriesDomain> series, bool isLoadingMore, bool hasMore, Object? error
});




}
/// @nodoc
class __$SeriesListStateCopyWithImpl<$Res>
    implements _$SeriesListStateCopyWith<$Res> {
  __$SeriesListStateCopyWithImpl(this._self, this._then);

  final _SeriesListState _self;
  final $Res Function(_SeriesListState) _then;

/// Create a copy of SeriesListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? series = null,Object? isLoadingMore = null,Object? hasMore = null,Object? error = freezed,}) {
  return _then(_SeriesListState(
series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<SeriesDomain>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
