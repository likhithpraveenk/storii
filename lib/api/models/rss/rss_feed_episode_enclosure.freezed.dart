// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_episode_enclosure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RssFeedEpisodeEnclosure {

 Uri get url; String get type; int get size;
/// Create a copy of RssFeedEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RssFeedEpisodeEnclosureCopyWith<RssFeedEpisodeEnclosure> get copyWith => _$RssFeedEpisodeEnclosureCopyWithImpl<RssFeedEpisodeEnclosure>(this as RssFeedEpisodeEnclosure, _$identity);

  /// Serializes this RssFeedEpisodeEnclosure to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RssFeedEpisodeEnclosure&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,type,size);

@override
String toString() {
  return 'RssFeedEpisodeEnclosure(url: $url, type: $type, size: $size)';
}


}

/// @nodoc
abstract mixin class $RssFeedEpisodeEnclosureCopyWith<$Res>  {
  factory $RssFeedEpisodeEnclosureCopyWith(RssFeedEpisodeEnclosure value, $Res Function(RssFeedEpisodeEnclosure) _then) = _$RssFeedEpisodeEnclosureCopyWithImpl;
@useResult
$Res call({
 Uri url, String type, int size
});




}
/// @nodoc
class _$RssFeedEpisodeEnclosureCopyWithImpl<$Res>
    implements $RssFeedEpisodeEnclosureCopyWith<$Res> {
  _$RssFeedEpisodeEnclosureCopyWithImpl(this._self, this._then);

  final RssFeedEpisodeEnclosure _self;
  final $Res Function(RssFeedEpisodeEnclosure) _then;

/// Create a copy of RssFeedEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? type = null,Object? size = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RssFeedEpisodeEnclosure].
extension RssFeedEpisodeEnclosurePatterns on RssFeedEpisodeEnclosure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RssFeedEpisodeEnclosure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RssFeedEpisodeEnclosure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RssFeedEpisodeEnclosure value)  $default,){
final _that = this;
switch (_that) {
case _RssFeedEpisodeEnclosure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RssFeedEpisodeEnclosure value)?  $default,){
final _that = this;
switch (_that) {
case _RssFeedEpisodeEnclosure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri url,  String type,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RssFeedEpisodeEnclosure() when $default != null:
return $default(_that.url,_that.type,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri url,  String type,  int size)  $default,) {final _that = this;
switch (_that) {
case _RssFeedEpisodeEnclosure():
return $default(_that.url,_that.type,_that.size);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri url,  String type,  int size)?  $default,) {final _that = this;
switch (_that) {
case _RssFeedEpisodeEnclosure() when $default != null:
return $default(_that.url,_that.type,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RssFeedEpisodeEnclosure implements RssFeedEpisodeEnclosure {
  const _RssFeedEpisodeEnclosure({required this.url, required this.type, required this.size});
  factory _RssFeedEpisodeEnclosure.fromJson(Map<String, dynamic> json) => _$RssFeedEpisodeEnclosureFromJson(json);

@override final  Uri url;
@override final  String type;
@override final  int size;

/// Create a copy of RssFeedEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RssFeedEpisodeEnclosureCopyWith<_RssFeedEpisodeEnclosure> get copyWith => __$RssFeedEpisodeEnclosureCopyWithImpl<_RssFeedEpisodeEnclosure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RssFeedEpisodeEnclosureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RssFeedEpisodeEnclosure&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,type,size);

@override
String toString() {
  return 'RssFeedEpisodeEnclosure(url: $url, type: $type, size: $size)';
}


}

/// @nodoc
abstract mixin class _$RssFeedEpisodeEnclosureCopyWith<$Res> implements $RssFeedEpisodeEnclosureCopyWith<$Res> {
  factory _$RssFeedEpisodeEnclosureCopyWith(_RssFeedEpisodeEnclosure value, $Res Function(_RssFeedEpisodeEnclosure) _then) = __$RssFeedEpisodeEnclosureCopyWithImpl;
@override @useResult
$Res call({
 Uri url, String type, int size
});




}
/// @nodoc
class __$RssFeedEpisodeEnclosureCopyWithImpl<$Res>
    implements _$RssFeedEpisodeEnclosureCopyWith<$Res> {
  __$RssFeedEpisodeEnclosureCopyWithImpl(this._self, this._then);

  final _RssFeedEpisodeEnclosure _self;
  final $Res Function(_RssFeedEpisodeEnclosure) _then;

/// Create a copy of RssFeedEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? type = null,Object? size = null,}) {
  return _then(_RssFeedEpisodeEnclosure(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
