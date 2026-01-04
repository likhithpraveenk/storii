// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookChapter {

 int get id; Duration get start; Duration get end; String get title;
/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookChapterCopyWith<BookChapter> get copyWith => _$BookChapterCopyWithImpl<BookChapter>(this as BookChapter, _$identity);

  /// Serializes this BookChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,title);

@override
String toString() {
  return 'BookChapter(id: $id, start: $start, end: $end, title: $title)';
}


}

/// @nodoc
abstract mixin class $BookChapterCopyWith<$Res>  {
  factory $BookChapterCopyWith(BookChapter value, $Res Function(BookChapter) _then) = _$BookChapterCopyWithImpl;
@useResult
$Res call({
 int id, Duration start, Duration end, String title
});




}
/// @nodoc
class _$BookChapterCopyWithImpl<$Res>
    implements $BookChapterCopyWith<$Res> {
  _$BookChapterCopyWithImpl(this._self, this._then);

  final BookChapter _self;
  final $Res Function(BookChapter) _then;

/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? start = null,Object? end = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookChapter].
extension BookChapterPatterns on BookChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookChapter value)  $default,){
final _that = this;
switch (_that) {
case _BookChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookChapter value)?  $default,){
final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Duration start,  Duration end,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Duration start,  Duration end,  String title)  $default,) {final _that = this;
switch (_that) {
case _BookChapter():
return $default(_that.id,_that.start,_that.end,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Duration start,  Duration end,  String title)?  $default,) {final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DurationPreciseSecondsConverter()
class _BookChapter implements BookChapter {
  const _BookChapter({required this.id, required this.start, required this.end, required this.title});
  factory _BookChapter.fromJson(Map<String, dynamic> json) => _$BookChapterFromJson(json);

@override final  int id;
@override final  Duration start;
@override final  Duration end;
@override final  String title;

/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookChapterCopyWith<_BookChapter> get copyWith => __$BookChapterCopyWithImpl<_BookChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,title);

@override
String toString() {
  return 'BookChapter(id: $id, start: $start, end: $end, title: $title)';
}


}

/// @nodoc
abstract mixin class _$BookChapterCopyWith<$Res> implements $BookChapterCopyWith<$Res> {
  factory _$BookChapterCopyWith(_BookChapter value, $Res Function(_BookChapter) _then) = __$BookChapterCopyWithImpl;
@override @useResult
$Res call({
 int id, Duration start, Duration end, String title
});




}
/// @nodoc
class __$BookChapterCopyWithImpl<$Res>
    implements _$BookChapterCopyWith<$Res> {
  __$BookChapterCopyWithImpl(this._self, this._then);

  final _BookChapter _self;
  final $Res Function(_BookChapter) _then;

/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? title = null,}) {
  return _then(_BookChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
