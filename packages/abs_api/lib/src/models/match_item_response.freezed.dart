// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchItemResponse {

 bool get updated; LibraryItem get libraryItem;
/// Create a copy of MatchItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchItemResponseCopyWith<MatchItemResponse> get copyWith => _$MatchItemResponseCopyWithImpl<MatchItemResponse>(this as MatchItemResponse, _$identity);

  /// Serializes this MatchItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchItemResponse&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.libraryItem, libraryItem) || other.libraryItem == libraryItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,libraryItem);

@override
String toString() {
  return 'MatchItemResponse(updated: $updated, libraryItem: $libraryItem)';
}


}

/// @nodoc
abstract mixin class $MatchItemResponseCopyWith<$Res>  {
  factory $MatchItemResponseCopyWith(MatchItemResponse value, $Res Function(MatchItemResponse) _then) = _$MatchItemResponseCopyWithImpl;
@useResult
$Res call({
 bool updated, LibraryItem libraryItem
});


$LibraryItemCopyWith<$Res> get libraryItem;

}
/// @nodoc
class _$MatchItemResponseCopyWithImpl<$Res>
    implements $MatchItemResponseCopyWith<$Res> {
  _$MatchItemResponseCopyWithImpl(this._self, this._then);

  final MatchItemResponse _self;
  final $Res Function(MatchItemResponse) _then;

/// Create a copy of MatchItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updated = null,Object? libraryItem = null,}) {
  return _then(_self.copyWith(
updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as bool,libraryItem: null == libraryItem ? _self.libraryItem : libraryItem // ignore: cast_nullable_to_non_nullable
as LibraryItem,
  ));
}
/// Create a copy of MatchItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<$Res> get libraryItem {
  
  return $LibraryItemCopyWith<$Res>(_self.libraryItem, (value) {
    return _then(_self.copyWith(libraryItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchItemResponse].
extension MatchItemResponsePatterns on MatchItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _MatchItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MatchItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool updated,  LibraryItem libraryItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchItemResponse() when $default != null:
return $default(_that.updated,_that.libraryItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool updated,  LibraryItem libraryItem)  $default,) {final _that = this;
switch (_that) {
case _MatchItemResponse():
return $default(_that.updated,_that.libraryItem);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool updated,  LibraryItem libraryItem)?  $default,) {final _that = this;
switch (_that) {
case _MatchItemResponse() when $default != null:
return $default(_that.updated,_that.libraryItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchItemResponse implements MatchItemResponse {
  const _MatchItemResponse({required this.updated, required this.libraryItem});
  factory _MatchItemResponse.fromJson(Map<String, dynamic> json) => _$MatchItemResponseFromJson(json);

@override final  bool updated;
@override final  LibraryItem libraryItem;

/// Create a copy of MatchItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchItemResponseCopyWith<_MatchItemResponse> get copyWith => __$MatchItemResponseCopyWithImpl<_MatchItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchItemResponse&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.libraryItem, libraryItem) || other.libraryItem == libraryItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,libraryItem);

@override
String toString() {
  return 'MatchItemResponse(updated: $updated, libraryItem: $libraryItem)';
}


}

/// @nodoc
abstract mixin class _$MatchItemResponseCopyWith<$Res> implements $MatchItemResponseCopyWith<$Res> {
  factory _$MatchItemResponseCopyWith(_MatchItemResponse value, $Res Function(_MatchItemResponse) _then) = __$MatchItemResponseCopyWithImpl;
@override @useResult
$Res call({
 bool updated, LibraryItem libraryItem
});


@override $LibraryItemCopyWith<$Res> get libraryItem;

}
/// @nodoc
class __$MatchItemResponseCopyWithImpl<$Res>
    implements _$MatchItemResponseCopyWith<$Res> {
  __$MatchItemResponseCopyWithImpl(this._self, this._then);

  final _MatchItemResponse _self;
  final $Res Function(_MatchItemResponse) _then;

/// Create a copy of MatchItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updated = null,Object? libraryItem = null,}) {
  return _then(_MatchItemResponse(
updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as bool,libraryItem: null == libraryItem ? _self.libraryItem : libraryItem // ignore: cast_nullable_to_non_nullable
as LibraryItem,
  ));
}

/// Create a copy of MatchItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<$Res> get libraryItem {
  
  return $LibraryItemCopyWith<$Res>(_self.libraryItem, (value) {
    return _then(_self.copyWith(libraryItem: value));
  });
}
}

// dart format on
