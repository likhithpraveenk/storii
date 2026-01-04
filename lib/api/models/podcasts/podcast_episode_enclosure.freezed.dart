// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_episode_enclosure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastEpisodeEnclosure {

 Uri get url; String get type; String get length;
/// Create a copy of PodcastEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastEpisodeEnclosureCopyWith<PodcastEpisodeEnclosure> get copyWith => _$PodcastEpisodeEnclosureCopyWithImpl<PodcastEpisodeEnclosure>(this as PodcastEpisodeEnclosure, _$identity);

  /// Serializes this PodcastEpisodeEnclosure to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastEpisodeEnclosure&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,type,length);

@override
String toString() {
  return 'PodcastEpisodeEnclosure(url: $url, type: $type, length: $length)';
}


}

/// @nodoc
abstract mixin class $PodcastEpisodeEnclosureCopyWith<$Res>  {
  factory $PodcastEpisodeEnclosureCopyWith(PodcastEpisodeEnclosure value, $Res Function(PodcastEpisodeEnclosure) _then) = _$PodcastEpisodeEnclosureCopyWithImpl;
@useResult
$Res call({
 Uri url, String type, String length
});




}
/// @nodoc
class _$PodcastEpisodeEnclosureCopyWithImpl<$Res>
    implements $PodcastEpisodeEnclosureCopyWith<$Res> {
  _$PodcastEpisodeEnclosureCopyWithImpl(this._self, this._then);

  final PodcastEpisodeEnclosure _self;
  final $Res Function(PodcastEpisodeEnclosure) _then;

/// Create a copy of PodcastEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? type = null,Object? length = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PodcastEpisodeEnclosure].
extension PodcastEpisodeEnclosurePatterns on PodcastEpisodeEnclosure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PodcastEpisodeEnclosure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PodcastEpisodeEnclosure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PodcastEpisodeEnclosure value)  $default,){
final _that = this;
switch (_that) {
case _PodcastEpisodeEnclosure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PodcastEpisodeEnclosure value)?  $default,){
final _that = this;
switch (_that) {
case _PodcastEpisodeEnclosure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri url,  String type,  String length)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PodcastEpisodeEnclosure() when $default != null:
return $default(_that.url,_that.type,_that.length);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri url,  String type,  String length)  $default,) {final _that = this;
switch (_that) {
case _PodcastEpisodeEnclosure():
return $default(_that.url,_that.type,_that.length);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri url,  String type,  String length)?  $default,) {final _that = this;
switch (_that) {
case _PodcastEpisodeEnclosure() when $default != null:
return $default(_that.url,_that.type,_that.length);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PodcastEpisodeEnclosure implements PodcastEpisodeEnclosure {
  const _PodcastEpisodeEnclosure({required this.url, required this.type, required this.length});
  factory _PodcastEpisodeEnclosure.fromJson(Map<String, dynamic> json) => _$PodcastEpisodeEnclosureFromJson(json);

@override final  Uri url;
@override final  String type;
@override final  String length;

/// Create a copy of PodcastEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastEpisodeEnclosureCopyWith<_PodcastEpisodeEnclosure> get copyWith => __$PodcastEpisodeEnclosureCopyWithImpl<_PodcastEpisodeEnclosure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastEpisodeEnclosureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastEpisodeEnclosure&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,type,length);

@override
String toString() {
  return 'PodcastEpisodeEnclosure(url: $url, type: $type, length: $length)';
}


}

/// @nodoc
abstract mixin class _$PodcastEpisodeEnclosureCopyWith<$Res> implements $PodcastEpisodeEnclosureCopyWith<$Res> {
  factory _$PodcastEpisodeEnclosureCopyWith(_PodcastEpisodeEnclosure value, $Res Function(_PodcastEpisodeEnclosure) _then) = __$PodcastEpisodeEnclosureCopyWithImpl;
@override @useResult
$Res call({
 Uri url, String type, String length
});




}
/// @nodoc
class __$PodcastEpisodeEnclosureCopyWithImpl<$Res>
    implements _$PodcastEpisodeEnclosureCopyWith<$Res> {
  __$PodcastEpisodeEnclosureCopyWithImpl(this._self, this._then);

  final _PodcastEpisodeEnclosure _self;
  final $Res Function(_PodcastEpisodeEnclosure) _then;

/// Create a copy of PodcastEpisodeEnclosure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? type = null,Object? length = null,}) {
  return _then(_PodcastEpisodeEnclosure(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
