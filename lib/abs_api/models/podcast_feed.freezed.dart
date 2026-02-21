// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastFeed {

 PodcastFeedMetadata get metadata; List<PodcastFeedEpisode>? get episodes;
/// Create a copy of PodcastFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastFeedCopyWith<PodcastFeed> get copyWith => _$PodcastFeedCopyWithImpl<PodcastFeed>(this as PodcastFeed, _$identity);

  /// Serializes this PodcastFeed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastFeed&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,const DeepCollectionEquality().hash(episodes));

@override
String toString() {
  return 'PodcastFeed(metadata: $metadata, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $PodcastFeedCopyWith<$Res>  {
  factory $PodcastFeedCopyWith(PodcastFeed value, $Res Function(PodcastFeed) _then) = _$PodcastFeedCopyWithImpl;
@useResult
$Res call({
 PodcastFeedMetadata metadata, List<PodcastFeedEpisode>? episodes
});


$PodcastFeedMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$PodcastFeedCopyWithImpl<$Res>
    implements $PodcastFeedCopyWith<$Res> {
  _$PodcastFeedCopyWithImpl(this._self, this._then);

  final PodcastFeed _self;
  final $Res Function(PodcastFeed) _then;

/// Create a copy of PodcastFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = null,Object? episodes = freezed,}) {
  return _then(_self.copyWith(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as PodcastFeedMetadata,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<PodcastFeedEpisode>?,
  ));
}
/// Create a copy of PodcastFeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PodcastFeedMetadataCopyWith<$Res> get metadata {
  
  return $PodcastFeedMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [PodcastFeed].
extension PodcastFeedPatterns on PodcastFeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PodcastFeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PodcastFeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PodcastFeed value)  $default,){
final _that = this;
switch (_that) {
case _PodcastFeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PodcastFeed value)?  $default,){
final _that = this;
switch (_that) {
case _PodcastFeed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PodcastFeedMetadata metadata,  List<PodcastFeedEpisode>? episodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PodcastFeed() when $default != null:
return $default(_that.metadata,_that.episodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PodcastFeedMetadata metadata,  List<PodcastFeedEpisode>? episodes)  $default,) {final _that = this;
switch (_that) {
case _PodcastFeed():
return $default(_that.metadata,_that.episodes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PodcastFeedMetadata metadata,  List<PodcastFeedEpisode>? episodes)?  $default,) {final _that = this;
switch (_that) {
case _PodcastFeed() when $default != null:
return $default(_that.metadata,_that.episodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PodcastFeed implements PodcastFeed {
  const _PodcastFeed({required this.metadata, final  List<PodcastFeedEpisode>? episodes}): _episodes = episodes;
  factory _PodcastFeed.fromJson(Map<String, dynamic> json) => _$PodcastFeedFromJson(json);

@override final  PodcastFeedMetadata metadata;
 final  List<PodcastFeedEpisode>? _episodes;
@override List<PodcastFeedEpisode>? get episodes {
  final value = _episodes;
  if (value == null) return null;
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PodcastFeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastFeedCopyWith<_PodcastFeed> get copyWith => __$PodcastFeedCopyWithImpl<_PodcastFeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastFeedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastFeed&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,const DeepCollectionEquality().hash(_episodes));

@override
String toString() {
  return 'PodcastFeed(metadata: $metadata, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$PodcastFeedCopyWith<$Res> implements $PodcastFeedCopyWith<$Res> {
  factory _$PodcastFeedCopyWith(_PodcastFeed value, $Res Function(_PodcastFeed) _then) = __$PodcastFeedCopyWithImpl;
@override @useResult
$Res call({
 PodcastFeedMetadata metadata, List<PodcastFeedEpisode>? episodes
});


@override $PodcastFeedMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$PodcastFeedCopyWithImpl<$Res>
    implements _$PodcastFeedCopyWith<$Res> {
  __$PodcastFeedCopyWithImpl(this._self, this._then);

  final _PodcastFeed _self;
  final $Res Function(_PodcastFeed) _then;

/// Create a copy of PodcastFeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadata = null,Object? episodes = freezed,}) {
  return _then(_PodcastFeed(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as PodcastFeedMetadata,episodes: freezed == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<PodcastFeedEpisode>?,
  ));
}

/// Create a copy of PodcastFeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PodcastFeedMetadataCopyWith<$Res> get metadata {
  
  return $PodcastFeedMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
