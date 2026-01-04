// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriesProgress {

 List<String> get libraryItemIds; List<String> get libraryItemIdsFinished; bool get isFinished;
/// Create a copy of SeriesProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesProgressCopyWith<SeriesProgress> get copyWith => _$SeriesProgressCopyWithImpl<SeriesProgress>(this as SeriesProgress, _$identity);

  /// Serializes this SeriesProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesProgress&&const DeepCollectionEquality().equals(other.libraryItemIds, libraryItemIds)&&const DeepCollectionEquality().equals(other.libraryItemIdsFinished, libraryItemIdsFinished)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(libraryItemIds),const DeepCollectionEquality().hash(libraryItemIdsFinished),isFinished);

@override
String toString() {
  return 'SeriesProgress(libraryItemIds: $libraryItemIds, libraryItemIdsFinished: $libraryItemIdsFinished, isFinished: $isFinished)';
}


}

/// @nodoc
abstract mixin class $SeriesProgressCopyWith<$Res>  {
  factory $SeriesProgressCopyWith(SeriesProgress value, $Res Function(SeriesProgress) _then) = _$SeriesProgressCopyWithImpl;
@useResult
$Res call({
 List<String> libraryItemIds, List<String> libraryItemIdsFinished, bool isFinished
});




}
/// @nodoc
class _$SeriesProgressCopyWithImpl<$Res>
    implements $SeriesProgressCopyWith<$Res> {
  _$SeriesProgressCopyWithImpl(this._self, this._then);

  final SeriesProgress _self;
  final $Res Function(SeriesProgress) _then;

/// Create a copy of SeriesProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryItemIds = null,Object? libraryItemIdsFinished = null,Object? isFinished = null,}) {
  return _then(_self.copyWith(
libraryItemIds: null == libraryItemIds ? _self.libraryItemIds : libraryItemIds // ignore: cast_nullable_to_non_nullable
as List<String>,libraryItemIdsFinished: null == libraryItemIdsFinished ? _self.libraryItemIdsFinished : libraryItemIdsFinished // ignore: cast_nullable_to_non_nullable
as List<String>,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesProgress].
extension SeriesProgressPatterns on SeriesProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesProgress value)  $default,){
final _that = this;
switch (_that) {
case _SeriesProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesProgress value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> libraryItemIds,  List<String> libraryItemIdsFinished,  bool isFinished)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesProgress() when $default != null:
return $default(_that.libraryItemIds,_that.libraryItemIdsFinished,_that.isFinished);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> libraryItemIds,  List<String> libraryItemIdsFinished,  bool isFinished)  $default,) {final _that = this;
switch (_that) {
case _SeriesProgress():
return $default(_that.libraryItemIds,_that.libraryItemIdsFinished,_that.isFinished);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> libraryItemIds,  List<String> libraryItemIdsFinished,  bool isFinished)?  $default,) {final _that = this;
switch (_that) {
case _SeriesProgress() when $default != null:
return $default(_that.libraryItemIds,_that.libraryItemIdsFinished,_that.isFinished);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesProgress implements SeriesProgress {
  const _SeriesProgress({required final  List<String> libraryItemIds, required final  List<String> libraryItemIdsFinished, required this.isFinished}): _libraryItemIds = libraryItemIds,_libraryItemIdsFinished = libraryItemIdsFinished;
  factory _SeriesProgress.fromJson(Map<String, dynamic> json) => _$SeriesProgressFromJson(json);

 final  List<String> _libraryItemIds;
@override List<String> get libraryItemIds {
  if (_libraryItemIds is EqualUnmodifiableListView) return _libraryItemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_libraryItemIds);
}

 final  List<String> _libraryItemIdsFinished;
@override List<String> get libraryItemIdsFinished {
  if (_libraryItemIdsFinished is EqualUnmodifiableListView) return _libraryItemIdsFinished;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_libraryItemIdsFinished);
}

@override final  bool isFinished;

/// Create a copy of SeriesProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesProgressCopyWith<_SeriesProgress> get copyWith => __$SeriesProgressCopyWithImpl<_SeriesProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesProgress&&const DeepCollectionEquality().equals(other._libraryItemIds, _libraryItemIds)&&const DeepCollectionEquality().equals(other._libraryItemIdsFinished, _libraryItemIdsFinished)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_libraryItemIds),const DeepCollectionEquality().hash(_libraryItemIdsFinished),isFinished);

@override
String toString() {
  return 'SeriesProgress(libraryItemIds: $libraryItemIds, libraryItemIdsFinished: $libraryItemIdsFinished, isFinished: $isFinished)';
}


}

/// @nodoc
abstract mixin class _$SeriesProgressCopyWith<$Res> implements $SeriesProgressCopyWith<$Res> {
  factory _$SeriesProgressCopyWith(_SeriesProgress value, $Res Function(_SeriesProgress) _then) = __$SeriesProgressCopyWithImpl;
@override @useResult
$Res call({
 List<String> libraryItemIds, List<String> libraryItemIdsFinished, bool isFinished
});




}
/// @nodoc
class __$SeriesProgressCopyWithImpl<$Res>
    implements _$SeriesProgressCopyWith<$Res> {
  __$SeriesProgressCopyWithImpl(this._self, this._then);

  final _SeriesProgress _self;
  final $Res Function(_SeriesProgress) _then;

/// Create a copy of SeriesProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryItemIds = null,Object? libraryItemIdsFinished = null,Object? isFinished = null,}) {
  return _then(_SeriesProgress(
libraryItemIds: null == libraryItemIds ? _self._libraryItemIds : libraryItemIds // ignore: cast_nullable_to_non_nullable
as List<String>,libraryItemIdsFinished: null == libraryItemIdsFinished ? _self._libraryItemIdsFinished : libraryItemIdsFinished // ignore: cast_nullable_to_non_nullable
as List<String>,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
