// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_items_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedLibraryItems {

 List<LibraryItem> get items; bool get hasMore; bool get isLoadingMore;
/// Create a copy of PaginatedLibraryItems
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedLibraryItemsCopyWith<PaginatedLibraryItems> get copyWith => _$PaginatedLibraryItemsCopyWithImpl<PaginatedLibraryItems>(this as PaginatedLibraryItems, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaginatedLibraryItems;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedLibraryItems&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore));
}


@override
int get hashCode {
  final _this = this as PaginatedLibraryItems;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.hasMore,_this.isLoadingMore);
}

@override
String toString() {
  final _this = this as PaginatedLibraryItems;
  return 'PaginatedLibraryItems(items: ${_this.items}, hasMore: ${_this.hasMore}, isLoadingMore: ${_this.isLoadingMore})';
}


}

/// @nodoc
abstract mixin class $PaginatedLibraryItemsCopyWith<$Res>  {
  factory $PaginatedLibraryItemsCopyWith(PaginatedLibraryItems value, $Res Function(PaginatedLibraryItems) _then) = _$PaginatedLibraryItemsCopyWithImpl;
@useResult
$Res call({
 List<LibraryItem> items, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$PaginatedLibraryItemsCopyWithImpl<$Res>
    implements $PaginatedLibraryItemsCopyWith<$Res> {
  _$PaginatedLibraryItemsCopyWithImpl(this._self, this._then);

  final PaginatedLibraryItems _self;
  final $Res Function(PaginatedLibraryItems) _then;

/// Create a copy of PaginatedLibraryItems
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(PaginatedLibraryItems(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedLibraryItems].
extension PaginatedLibraryItemsPatterns on PaginatedLibraryItems {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedLibraryItems value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedLibraryItems() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedLibraryItems value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedLibraryItems():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedLibraryItems value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedLibraryItems() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LibraryItem> items,  bool hasMore,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedLibraryItems() when $default != null:
return $default(_that.items,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LibraryItem> items,  bool hasMore,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _PaginatedLibraryItems():
return $default(_that.items,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LibraryItem> items,  bool hasMore,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedLibraryItems() when $default != null:
return $default(_that.items,_that.hasMore,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedLibraryItems implements PaginatedLibraryItems {
  const _PaginatedLibraryItems({required  List<LibraryItem> items, required this.hasMore, this.isLoadingMore = false}): _items = items;
  

 final  List<LibraryItem> _items;
@override List<LibraryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of PaginatedLibraryItems
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedLibraryItemsCopyWith<_PaginatedLibraryItems> get copyWith => __$PaginatedLibraryItemsCopyWithImpl<_PaginatedLibraryItems>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedLibraryItems&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMore,isLoadingMore);
}

@override
String toString() {
    return 'PaginatedLibraryItems(items: $items, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$PaginatedLibraryItemsCopyWith<$Res> implements $PaginatedLibraryItemsCopyWith<$Res> {
  factory _$PaginatedLibraryItemsCopyWith(_PaginatedLibraryItems value, $Res Function(_PaginatedLibraryItems) _then) = __$PaginatedLibraryItemsCopyWithImpl;
@override @useResult
$Res call({
 List<LibraryItem> items, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class __$PaginatedLibraryItemsCopyWithImpl<$Res>
    implements _$PaginatedLibraryItemsCopyWith<$Res> {
  __$PaginatedLibraryItemsCopyWithImpl(this._self, this._then);

  final _PaginatedLibraryItems _self;
  final $Res Function(_PaginatedLibraryItems) _then;

/// Create a copy of PaginatedLibraryItems
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_PaginatedLibraryItems(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
