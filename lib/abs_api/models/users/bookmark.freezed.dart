// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {

 String get libraryItemId; String get title;@DurationSecConverter() Duration get time;@DateTimeEpochConverter() DateTime get createdAt;
/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkCopyWith<Bookmark> get copyWith => _$BookmarkCopyWithImpl<Bookmark>(this as Bookmark, _$identity);

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bookmark&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.time, time) || other.time == time)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryItemId,title,time,createdAt);

@override
String toString() {
  return 'Bookmark(libraryItemId: $libraryItemId, title: $title, time: $time, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookmarkCopyWith<$Res>  {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) _then) = _$BookmarkCopyWithImpl;
@useResult
$Res call({
 String libraryItemId, String title,@DurationSecConverter() Duration time,@DateTimeEpochConverter() DateTime createdAt
});




}
/// @nodoc
class _$BookmarkCopyWithImpl<$Res>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._self, this._then);

  final Bookmark _self;
  final $Res Function(Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryItemId = null,Object? title = null,Object? time = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as Duration,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Bookmark].
extension BookmarkPatterns on Bookmark {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bookmark value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bookmark value)  $default,){
final _that = this;
switch (_that) {
case _Bookmark():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bookmark value)?  $default,){
final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String libraryItemId,  String title, @DurationSecConverter()  Duration time, @DateTimeEpochConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that.libraryItemId,_that.title,_that.time,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String libraryItemId,  String title, @DurationSecConverter()  Duration time, @DateTimeEpochConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Bookmark():
return $default(_that.libraryItemId,_that.title,_that.time,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String libraryItemId,  String title, @DurationSecConverter()  Duration time, @DateTimeEpochConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that.libraryItemId,_that.title,_that.time,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bookmark implements Bookmark {
  const _Bookmark({required this.libraryItemId, required this.title, @DurationSecConverter() required this.time, @DateTimeEpochConverter() required this.createdAt});
  factory _Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);

@override final  String libraryItemId;
@override final  String title;
@override@DurationSecConverter() final  Duration time;
@override@DateTimeEpochConverter() final  DateTime createdAt;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCopyWith<_Bookmark> get copyWith => __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmark&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.time, time) || other.time == time)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryItemId,title,time,createdAt);

@override
String toString() {
  return 'Bookmark(libraryItemId: $libraryItemId, title: $title, time: $time, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) = __$BookmarkCopyWithImpl;
@override @useResult
$Res call({
 String libraryItemId, String title,@DurationSecConverter() Duration time,@DateTimeEpochConverter() DateTime createdAt
});




}
/// @nodoc
class __$BookmarkCopyWithImpl<$Res>
    implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryItemId = null,Object? title = null,Object? time = null,Object? createdAt = null,}) {
  return _then(_Bookmark(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as Duration,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
