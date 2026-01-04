// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RssFeed {

 String get id; String get entityId; String get entityType; Uri get feedUrl; String? get slug; String? get userId; String? get coverPath; Uri? get serverAddress; RssFeedMetadata? get meta; List<RssFeedEpisode>? get episodes; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of RssFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RssFeedCopyWith<RssFeed> get copyWith => _$RssFeedCopyWithImpl<RssFeed>(this as RssFeed, _$identity);

  /// Serializes this RssFeed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RssFeed&&(identical(other.id, id) || other.id == id)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.serverAddress, serverAddress) || other.serverAddress == serverAddress)&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.episodes, episodes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,entityId,entityType,feedUrl,slug,userId,coverPath,serverAddress,meta,const DeepCollectionEquality().hash(episodes),createdAt,updatedAt);

@override
String toString() {
  return 'RssFeed(id: $id, entityId: $entityId, entityType: $entityType, feedUrl: $feedUrl, slug: $slug, userId: $userId, coverPath: $coverPath, serverAddress: $serverAddress, meta: $meta, episodes: $episodes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RssFeedCopyWith<$Res>  {
  factory $RssFeedCopyWith(RssFeed value, $Res Function(RssFeed) _then) = _$RssFeedCopyWithImpl;
@useResult
$Res call({
 String id, String entityId, String entityType, Uri feedUrl, String? slug, String? userId, String? coverPath, Uri? serverAddress, RssFeedMetadata? meta, List<RssFeedEpisode>? episodes, DateTime? createdAt, DateTime? updatedAt
});


$RssFeedMetadataCopyWith<$Res>? get meta;

}
/// @nodoc
class _$RssFeedCopyWithImpl<$Res>
    implements $RssFeedCopyWith<$Res> {
  _$RssFeedCopyWithImpl(this._self, this._then);

  final RssFeed _self;
  final $Res Function(RssFeed) _then;

/// Create a copy of RssFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? entityId = null,Object? entityType = null,Object? feedUrl = null,Object? slug = freezed,Object? userId = freezed,Object? coverPath = freezed,Object? serverAddress = freezed,Object? meta = freezed,Object? episodes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,feedUrl: null == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,serverAddress: freezed == serverAddress ? _self.serverAddress : serverAddress // ignore: cast_nullable_to_non_nullable
as Uri?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as RssFeedMetadata?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<RssFeedEpisode>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of RssFeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RssFeedMetadataCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $RssFeedMetadataCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [RssFeed].
extension RssFeedPatterns on RssFeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RssFeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RssFeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RssFeed value)  $default,){
final _that = this;
switch (_that) {
case _RssFeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RssFeed value)?  $default,){
final _that = this;
switch (_that) {
case _RssFeed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String entityId,  String entityType,  Uri feedUrl,  String? slug,  String? userId,  String? coverPath,  Uri? serverAddress,  RssFeedMetadata? meta,  List<RssFeedEpisode>? episodes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RssFeed() when $default != null:
return $default(_that.id,_that.entityId,_that.entityType,_that.feedUrl,_that.slug,_that.userId,_that.coverPath,_that.serverAddress,_that.meta,_that.episodes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String entityId,  String entityType,  Uri feedUrl,  String? slug,  String? userId,  String? coverPath,  Uri? serverAddress,  RssFeedMetadata? meta,  List<RssFeedEpisode>? episodes,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RssFeed():
return $default(_that.id,_that.entityId,_that.entityType,_that.feedUrl,_that.slug,_that.userId,_that.coverPath,_that.serverAddress,_that.meta,_that.episodes,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String entityId,  String entityType,  Uri feedUrl,  String? slug,  String? userId,  String? coverPath,  Uri? serverAddress,  RssFeedMetadata? meta,  List<RssFeedEpisode>? episodes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RssFeed() when $default != null:
return $default(_that.id,_that.entityId,_that.entityType,_that.feedUrl,_that.slug,_that.userId,_that.coverPath,_that.serverAddress,_that.meta,_that.episodes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _RssFeed implements RssFeed {
  const _RssFeed({required this.id, required this.entityId, required this.entityType, required this.feedUrl, this.slug, this.userId, this.coverPath, this.serverAddress, this.meta, final  List<RssFeedEpisode>? episodes, this.createdAt, this.updatedAt}): _episodes = episodes;
  factory _RssFeed.fromJson(Map<String, dynamic> json) => _$RssFeedFromJson(json);

@override final  String id;
@override final  String entityId;
@override final  String entityType;
@override final  Uri feedUrl;
@override final  String? slug;
@override final  String? userId;
@override final  String? coverPath;
@override final  Uri? serverAddress;
@override final  RssFeedMetadata? meta;
 final  List<RssFeedEpisode>? _episodes;
@override List<RssFeedEpisode>? get episodes {
  final value = _episodes;
  if (value == null) return null;
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of RssFeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RssFeedCopyWith<_RssFeed> get copyWith => __$RssFeedCopyWithImpl<_RssFeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RssFeedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RssFeed&&(identical(other.id, id) || other.id == id)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.serverAddress, serverAddress) || other.serverAddress == serverAddress)&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,entityId,entityType,feedUrl,slug,userId,coverPath,serverAddress,meta,const DeepCollectionEquality().hash(_episodes),createdAt,updatedAt);

@override
String toString() {
  return 'RssFeed(id: $id, entityId: $entityId, entityType: $entityType, feedUrl: $feedUrl, slug: $slug, userId: $userId, coverPath: $coverPath, serverAddress: $serverAddress, meta: $meta, episodes: $episodes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RssFeedCopyWith<$Res> implements $RssFeedCopyWith<$Res> {
  factory _$RssFeedCopyWith(_RssFeed value, $Res Function(_RssFeed) _then) = __$RssFeedCopyWithImpl;
@override @useResult
$Res call({
 String id, String entityId, String entityType, Uri feedUrl, String? slug, String? userId, String? coverPath, Uri? serverAddress, RssFeedMetadata? meta, List<RssFeedEpisode>? episodes, DateTime? createdAt, DateTime? updatedAt
});


@override $RssFeedMetadataCopyWith<$Res>? get meta;

}
/// @nodoc
class __$RssFeedCopyWithImpl<$Res>
    implements _$RssFeedCopyWith<$Res> {
  __$RssFeedCopyWithImpl(this._self, this._then);

  final _RssFeed _self;
  final $Res Function(_RssFeed) _then;

/// Create a copy of RssFeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? entityId = null,Object? entityType = null,Object? feedUrl = null,Object? slug = freezed,Object? userId = freezed,Object? coverPath = freezed,Object? serverAddress = freezed,Object? meta = freezed,Object? episodes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RssFeed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,feedUrl: null == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,serverAddress: freezed == serverAddress ? _self.serverAddress : serverAddress // ignore: cast_nullable_to_non_nullable
as Uri?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as RssFeedMetadata?,episodes: freezed == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<RssFeedEpisode>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of RssFeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RssFeedMetadataCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $RssFeedMetadataCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
