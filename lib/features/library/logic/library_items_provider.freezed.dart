// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_items_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryItemsState {

 List<ItemDomain> get items; bool get isLoadingMore; bool get hasMore; Object? get error;
/// Create a copy of LibraryItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemsStateCopyWith<LibraryItemsState> get copyWith => _$LibraryItemsStateCopyWithImpl<LibraryItemsState>(this as LibraryItemsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemsState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),isLoadingMore,hasMore,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'LibraryItemsState(items: $items, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error)';
}


}

/// @nodoc
abstract mixin class $LibraryItemsStateCopyWith<$Res>  {
  factory $LibraryItemsStateCopyWith(LibraryItemsState value, $Res Function(LibraryItemsState) _then) = _$LibraryItemsStateCopyWithImpl;
@useResult
$Res call({
 List<ItemDomain> items, bool isLoadingMore, bool hasMore, Object? error
});




}
/// @nodoc
class _$LibraryItemsStateCopyWithImpl<$Res>
    implements $LibraryItemsStateCopyWith<$Res> {
  _$LibraryItemsStateCopyWithImpl(this._self, this._then);

  final LibraryItemsState _self;
  final $Res Function(LibraryItemsState) _then;

/// Create a copy of LibraryItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? isLoadingMore = null,Object? hasMore = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ItemDomain>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryItemsState].
extension LibraryItemsStatePatterns on LibraryItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItemsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItemsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItemsState value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItemsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItemsState value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItemsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ItemDomain> items,  bool isLoadingMore,  bool hasMore,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItemsState() when $default != null:
return $default(_that.items,_that.isLoadingMore,_that.hasMore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ItemDomain> items,  bool isLoadingMore,  bool hasMore,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _LibraryItemsState():
return $default(_that.items,_that.isLoadingMore,_that.hasMore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ItemDomain> items,  bool isLoadingMore,  bool hasMore,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItemsState() when $default != null:
return $default(_that.items,_that.isLoadingMore,_that.hasMore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _LibraryItemsState implements LibraryItemsState {
  const _LibraryItemsState({final  List<ItemDomain> items = const [], this.isLoadingMore = false, this.hasMore = true, this.error}): _items = items;
  

 final  List<ItemDomain> _items;
@override@JsonKey() List<ItemDomain> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;
@override final  Object? error;

/// Create a copy of LibraryItemsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemsStateCopyWith<_LibraryItemsState> get copyWith => __$LibraryItemsStateCopyWithImpl<_LibraryItemsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItemsState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),isLoadingMore,hasMore,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'LibraryItemsState(items: $items, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemsStateCopyWith<$Res> implements $LibraryItemsStateCopyWith<$Res> {
  factory _$LibraryItemsStateCopyWith(_LibraryItemsState value, $Res Function(_LibraryItemsState) _then) = __$LibraryItemsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ItemDomain> items, bool isLoadingMore, bool hasMore, Object? error
});




}
/// @nodoc
class __$LibraryItemsStateCopyWithImpl<$Res>
    implements _$LibraryItemsStateCopyWith<$Res> {
  __$LibraryItemsStateCopyWithImpl(this._self, this._then);

  final _LibraryItemsState _self;
  final $Res Function(_LibraryItemsState) _then;

/// Create a copy of LibraryItemsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? isLoadingMore = null,Object? hasMore = null,Object? error = freezed,}) {
  return _then(_LibraryItemsState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ItemDomain>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
