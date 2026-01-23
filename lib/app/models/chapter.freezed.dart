// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterDomain {

 int get id; Duration get start; Duration get end; String get title;
/// Create a copy of ChapterDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterDomainCopyWith<ChapterDomain> get copyWith => _$ChapterDomainCopyWithImpl<ChapterDomain>(this as ChapterDomain, _$identity);

  /// Serializes this ChapterDomain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,title);

@override
String toString() {
  return 'ChapterDomain(id: $id, start: $start, end: $end, title: $title)';
}


}

/// @nodoc
abstract mixin class $ChapterDomainCopyWith<$Res>  {
  factory $ChapterDomainCopyWith(ChapterDomain value, $Res Function(ChapterDomain) _then) = _$ChapterDomainCopyWithImpl;
@useResult
$Res call({
 int id, Duration start, Duration end, String title
});




}
/// @nodoc
class _$ChapterDomainCopyWithImpl<$Res>
    implements $ChapterDomainCopyWith<$Res> {
  _$ChapterDomainCopyWithImpl(this._self, this._then);

  final ChapterDomain _self;
  final $Res Function(ChapterDomain) _then;

/// Create a copy of ChapterDomain
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


/// Adds pattern-matching-related methods to [ChapterDomain].
extension ChapterDomainPatterns on ChapterDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterDomain value)  $default,){
final _that = this;
switch (_that) {
case _ChapterDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterDomain value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterDomain() when $default != null:
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
case _ChapterDomain() when $default != null:
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
case _ChapterDomain():
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
case _ChapterDomain() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterDomain implements ChapterDomain {
  const _ChapterDomain({required this.id, required this.start, required this.end, required this.title});
  factory _ChapterDomain.fromJson(Map<String, dynamic> json) => _$ChapterDomainFromJson(json);

@override final  int id;
@override final  Duration start;
@override final  Duration end;
@override final  String title;

/// Create a copy of ChapterDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterDomainCopyWith<_ChapterDomain> get copyWith => __$ChapterDomainCopyWithImpl<_ChapterDomain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterDomainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,title);

@override
String toString() {
  return 'ChapterDomain(id: $id, start: $start, end: $end, title: $title)';
}


}

/// @nodoc
abstract mixin class _$ChapterDomainCopyWith<$Res> implements $ChapterDomainCopyWith<$Res> {
  factory _$ChapterDomainCopyWith(_ChapterDomain value, $Res Function(_ChapterDomain) _then) = __$ChapterDomainCopyWithImpl;
@override @useResult
$Res call({
 int id, Duration start, Duration end, String title
});




}
/// @nodoc
class __$ChapterDomainCopyWithImpl<$Res>
    implements _$ChapterDomainCopyWith<$Res> {
  __$ChapterDomainCopyWithImpl(this._self, this._then);

  final _ChapterDomain _self;
  final $Res Function(_ChapterDomain) _then;

/// Create a copy of ChapterDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? title = null,}) {
  return _then(_ChapterDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
