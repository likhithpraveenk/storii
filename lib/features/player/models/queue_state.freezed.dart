// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueueItem {

 String get itemId; String? get episodeId;
/// Create a copy of QueueItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueItemCopyWith<QueueItem> get copyWith => _$QueueItemCopyWithImpl<QueueItem>(this as QueueItem, _$identity);

  /// Serializes this QueueItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,episodeId);

@override
String toString() {
  return 'QueueItem(itemId: $itemId, episodeId: $episodeId)';
}


}

/// @nodoc
abstract mixin class $QueueItemCopyWith<$Res>  {
  factory $QueueItemCopyWith(QueueItem value, $Res Function(QueueItem) _then) = _$QueueItemCopyWithImpl;
@useResult
$Res call({
 String itemId, String? episodeId
});




}
/// @nodoc
class _$QueueItemCopyWithImpl<$Res>
    implements $QueueItemCopyWith<$Res> {
  _$QueueItemCopyWithImpl(this._self, this._then);

  final QueueItem _self;
  final $Res Function(QueueItem) _then;

/// Create a copy of QueueItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? episodeId = freezed,}) {
  return _then(QueueItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueItem].
extension QueueItemPatterns on QueueItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueItem value)  $default,){
final _that = this;
switch (_that) {
case _QueueItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueItem value)?  $default,){
final _that = this;
switch (_that) {
case _QueueItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String? episodeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueItem() when $default != null:
return $default(_that.itemId,_that.episodeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String? episodeId)  $default,) {final _that = this;
switch (_that) {
case _QueueItem():
return $default(_that.itemId,_that.episodeId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String? episodeId)?  $default,) {final _that = this;
switch (_that) {
case _QueueItem() when $default != null:
return $default(_that.itemId,_that.episodeId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueItem implements QueueItem {
  const _QueueItem({required this.itemId, this.episodeId});
  factory _QueueItem.fromJson(Map<String, dynamic> json) => _$QueueItemFromJson(json);

@override final  String itemId;
@override final  String? episodeId;

/// Create a copy of QueueItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueItemCopyWith<_QueueItem> get copyWith => __$QueueItemCopyWithImpl<_QueueItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,episodeId);

@override
String toString() {
  return 'QueueItem(itemId: $itemId, episodeId: $episodeId)';
}


}

/// @nodoc
abstract mixin class _$QueueItemCopyWith<$Res> implements $QueueItemCopyWith<$Res> {
  factory _$QueueItemCopyWith(_QueueItem value, $Res Function(_QueueItem) _then) = __$QueueItemCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String? episodeId
});




}
/// @nodoc
class __$QueueItemCopyWithImpl<$Res>
    implements _$QueueItemCopyWith<$Res> {
  __$QueueItemCopyWithImpl(this._self, this._then);

  final _QueueItem _self;
  final $Res Function(_QueueItem) _then;

/// Create a copy of QueueItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? episodeId = freezed,}) {
  return _then(_QueueItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$QueueState {

 List<QueueItem> get items; int? get currentIndex;
/// Create a copy of QueueState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueStateCopyWith<QueueState> get copyWith => _$QueueStateCopyWithImpl<QueueState>(this as QueueState, _$identity);

  /// Serializes this QueueState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),currentIndex);

@override
String toString() {
  return 'QueueState(items: $items, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class $QueueStateCopyWith<$Res>  {
  factory $QueueStateCopyWith(QueueState value, $Res Function(QueueState) _then) = _$QueueStateCopyWithImpl;
@useResult
$Res call({
 List<QueueItem> items, int? currentIndex
});




}
/// @nodoc
class _$QueueStateCopyWithImpl<$Res>
    implements $QueueStateCopyWith<$Res> {
  _$QueueStateCopyWithImpl(this._self, this._then);

  final QueueState _self;
  final $Res Function(QueueState) _then;

/// Create a copy of QueueState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? currentIndex = freezed,}) {
  return _then(QueueState(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QueueItem>,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueState].
extension QueueStatePatterns on QueueState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueState value)  $default,){
final _that = this;
switch (_that) {
case _QueueState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueState value)?  $default,){
final _that = this;
switch (_that) {
case _QueueState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QueueItem> items,  int? currentIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueState() when $default != null:
return $default(_that.items,_that.currentIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QueueItem> items,  int? currentIndex)  $default,) {final _that = this;
switch (_that) {
case _QueueState():
return $default(_that.items,_that.currentIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QueueItem> items,  int? currentIndex)?  $default,) {final _that = this;
switch (_that) {
case _QueueState() when $default != null:
return $default(_that.items,_that.currentIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueState implements QueueState {
  const _QueueState({ List<QueueItem> items = const [], this.currentIndex}): _items = items;
  factory _QueueState.fromJson(Map<String, dynamic> json) => _$QueueStateFromJson(json);

 final  List<QueueItem> _items;
@override@JsonKey() List<QueueItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int? currentIndex;

/// Create a copy of QueueState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueStateCopyWith<_QueueState> get copyWith => __$QueueStateCopyWithImpl<_QueueState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),currentIndex);

@override
String toString() {
  return 'QueueState(items: $items, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$QueueStateCopyWith<$Res> implements $QueueStateCopyWith<$Res> {
  factory _$QueueStateCopyWith(_QueueState value, $Res Function(_QueueState) _then) = __$QueueStateCopyWithImpl;
@override @useResult
$Res call({
 List<QueueItem> items, int? currentIndex
});




}
/// @nodoc
class __$QueueStateCopyWithImpl<$Res>
    implements _$QueueStateCopyWith<$Res> {
  __$QueueStateCopyWithImpl(this._self, this._then);

  final _QueueState _self;
  final $Res Function(_QueueState) _then;

/// Create a copy of QueueState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? currentIndex = freezed,}) {
  return _then(_QueueState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QueueItem>,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
