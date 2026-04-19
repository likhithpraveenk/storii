// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastEpisode {

 String get libraryItemId; String get podcastId; String get id; int? get index; String? get season; String? get episode; String? get episodeType; String? get title; String? get subtitle; String? get description; PodcastEpisodeEnclosure? get enclosure; String? get pubDate; AudioFile get audioFile; DateTime get publishedAt; DateTime get addedAt; DateTime get updatedAt; AudioTrack get audioTrack; Duration get duration; int? get size;
/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastEpisodeCopyWith<PodcastEpisode> get copyWith => _$PodcastEpisodeCopyWithImpl<PodcastEpisode>(this as PodcastEpisode, _$identity);

  /// Serializes this PodcastEpisode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastEpisode&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.podcastId, podcastId) || other.podcastId == podcastId)&&(identical(other.id, id) || other.id == id)&&(identical(other.index, index) || other.index == index)&&(identical(other.season, season) || other.season == season)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.enclosure, enclosure) || other.enclosure == enclosure)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.audioFile, audioFile) || other.audioFile == audioFile)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.audioTrack, audioTrack) || other.audioTrack == audioTrack)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,libraryItemId,podcastId,id,index,season,episode,episodeType,title,subtitle,description,enclosure,pubDate,audioFile,publishedAt,addedAt,updatedAt,audioTrack,duration,size]);

@override
String toString() {
  return 'PodcastEpisode(libraryItemId: $libraryItemId, podcastId: $podcastId, id: $id, index: $index, season: $season, episode: $episode, episodeType: $episodeType, title: $title, subtitle: $subtitle, description: $description, enclosure: $enclosure, pubDate: $pubDate, audioFile: $audioFile, publishedAt: $publishedAt, addedAt: $addedAt, updatedAt: $updatedAt, audioTrack: $audioTrack, duration: $duration, size: $size)';
}


}

/// @nodoc
abstract mixin class $PodcastEpisodeCopyWith<$Res>  {
  factory $PodcastEpisodeCopyWith(PodcastEpisode value, $Res Function(PodcastEpisode) _then) = _$PodcastEpisodeCopyWithImpl;
@useResult
$Res call({
 String libraryItemId, String podcastId, String id, int? index, String? season, String? episode, String? episodeType, String? title, String? subtitle, String? description, PodcastEpisodeEnclosure? enclosure, String? pubDate, AudioFile audioFile, DateTime publishedAt, DateTime addedAt, DateTime updatedAt, AudioTrack audioTrack, Duration duration, int? size
});


$PodcastEpisodeEnclosureCopyWith<$Res>? get enclosure;$AudioFileCopyWith<$Res> get audioFile;$AudioTrackCopyWith<$Res> get audioTrack;

}
/// @nodoc
class _$PodcastEpisodeCopyWithImpl<$Res>
    implements $PodcastEpisodeCopyWith<$Res> {
  _$PodcastEpisodeCopyWithImpl(this._self, this._then);

  final PodcastEpisode _self;
  final $Res Function(PodcastEpisode) _then;

/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryItemId = null,Object? podcastId = null,Object? id = null,Object? index = freezed,Object? season = freezed,Object? episode = freezed,Object? episodeType = freezed,Object? title = freezed,Object? subtitle = freezed,Object? description = freezed,Object? enclosure = freezed,Object? pubDate = freezed,Object? audioFile = null,Object? publishedAt = null,Object? addedAt = null,Object? updatedAt = null,Object? audioTrack = null,Object? duration = null,Object? size = freezed,}) {
  return _then(_self.copyWith(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,podcastId: null == podcastId ? _self.podcastId : podcastId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as String?,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,enclosure: freezed == enclosure ? _self.enclosure : enclosure // ignore: cast_nullable_to_non_nullable
as PodcastEpisodeEnclosure?,pubDate: freezed == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String?,audioFile: null == audioFile ? _self.audioFile : audioFile // ignore: cast_nullable_to_non_nullable
as AudioFile,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,audioTrack: null == audioTrack ? _self.audioTrack : audioTrack // ignore: cast_nullable_to_non_nullable
as AudioTrack,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PodcastEpisodeEnclosureCopyWith<$Res>? get enclosure {
    if (_self.enclosure == null) {
    return null;
  }

  return $PodcastEpisodeEnclosureCopyWith<$Res>(_self.enclosure!, (value) {
    return _then(_self.copyWith(enclosure: value));
  });
}/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioFileCopyWith<$Res> get audioFile {
  
  return $AudioFileCopyWith<$Res>(_self.audioFile, (value) {
    return _then(_self.copyWith(audioFile: value));
  });
}/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioTrackCopyWith<$Res> get audioTrack {
  
  return $AudioTrackCopyWith<$Res>(_self.audioTrack, (value) {
    return _then(_self.copyWith(audioTrack: value));
  });
}
}


/// Adds pattern-matching-related methods to [PodcastEpisode].
extension PodcastEpisodePatterns on PodcastEpisode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PodcastEpisode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PodcastEpisode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PodcastEpisode value)  $default,){
final _that = this;
switch (_that) {
case _PodcastEpisode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PodcastEpisode value)?  $default,){
final _that = this;
switch (_that) {
case _PodcastEpisode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String libraryItemId,  String podcastId,  String id,  int? index,  String? season,  String? episode,  String? episodeType,  String? title,  String? subtitle,  String? description,  PodcastEpisodeEnclosure? enclosure,  String? pubDate,  AudioFile audioFile,  DateTime publishedAt,  DateTime addedAt,  DateTime updatedAt,  AudioTrack audioTrack,  Duration duration,  int? size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PodcastEpisode() when $default != null:
return $default(_that.libraryItemId,_that.podcastId,_that.id,_that.index,_that.season,_that.episode,_that.episodeType,_that.title,_that.subtitle,_that.description,_that.enclosure,_that.pubDate,_that.audioFile,_that.publishedAt,_that.addedAt,_that.updatedAt,_that.audioTrack,_that.duration,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String libraryItemId,  String podcastId,  String id,  int? index,  String? season,  String? episode,  String? episodeType,  String? title,  String? subtitle,  String? description,  PodcastEpisodeEnclosure? enclosure,  String? pubDate,  AudioFile audioFile,  DateTime publishedAt,  DateTime addedAt,  DateTime updatedAt,  AudioTrack audioTrack,  Duration duration,  int? size)  $default,) {final _that = this;
switch (_that) {
case _PodcastEpisode():
return $default(_that.libraryItemId,_that.podcastId,_that.id,_that.index,_that.season,_that.episode,_that.episodeType,_that.title,_that.subtitle,_that.description,_that.enclosure,_that.pubDate,_that.audioFile,_that.publishedAt,_that.addedAt,_that.updatedAt,_that.audioTrack,_that.duration,_that.size);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String libraryItemId,  String podcastId,  String id,  int? index,  String? season,  String? episode,  String? episodeType,  String? title,  String? subtitle,  String? description,  PodcastEpisodeEnclosure? enclosure,  String? pubDate,  AudioFile audioFile,  DateTime publishedAt,  DateTime addedAt,  DateTime updatedAt,  AudioTrack audioTrack,  Duration duration,  int? size)?  $default,) {final _that = this;
switch (_that) {
case _PodcastEpisode() when $default != null:
return $default(_that.libraryItemId,_that.podcastId,_that.id,_that.index,_that.season,_that.episode,_that.episodeType,_that.title,_that.subtitle,_that.description,_that.enclosure,_that.pubDate,_that.audioFile,_that.publishedAt,_that.addedAt,_that.updatedAt,_that.audioTrack,_that.duration,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _PodcastEpisode implements PodcastEpisode {
  const _PodcastEpisode({required this.libraryItemId, required this.podcastId, required this.id, this.index, this.season, this.episode, this.episodeType, this.title, this.subtitle, this.description, this.enclosure, this.pubDate, required this.audioFile, required this.publishedAt, required this.addedAt, required this.updatedAt, required this.audioTrack, required this.duration, this.size});
  factory _PodcastEpisode.fromJson(Map<String, dynamic> json) => _$PodcastEpisodeFromJson(json);

@override final  String libraryItemId;
@override final  String podcastId;
@override final  String id;
@override final  int? index;
@override final  String? season;
@override final  String? episode;
@override final  String? episodeType;
@override final  String? title;
@override final  String? subtitle;
@override final  String? description;
@override final  PodcastEpisodeEnclosure? enclosure;
@override final  String? pubDate;
@override final  AudioFile audioFile;
@override final  DateTime publishedAt;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;
@override final  AudioTrack audioTrack;
@override final  Duration duration;
@override final  int? size;

/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastEpisodeCopyWith<_PodcastEpisode> get copyWith => __$PodcastEpisodeCopyWithImpl<_PodcastEpisode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastEpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastEpisode&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.podcastId, podcastId) || other.podcastId == podcastId)&&(identical(other.id, id) || other.id == id)&&(identical(other.index, index) || other.index == index)&&(identical(other.season, season) || other.season == season)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.enclosure, enclosure) || other.enclosure == enclosure)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.audioFile, audioFile) || other.audioFile == audioFile)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.audioTrack, audioTrack) || other.audioTrack == audioTrack)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,libraryItemId,podcastId,id,index,season,episode,episodeType,title,subtitle,description,enclosure,pubDate,audioFile,publishedAt,addedAt,updatedAt,audioTrack,duration,size]);

@override
String toString() {
  return 'PodcastEpisode(libraryItemId: $libraryItemId, podcastId: $podcastId, id: $id, index: $index, season: $season, episode: $episode, episodeType: $episodeType, title: $title, subtitle: $subtitle, description: $description, enclosure: $enclosure, pubDate: $pubDate, audioFile: $audioFile, publishedAt: $publishedAt, addedAt: $addedAt, updatedAt: $updatedAt, audioTrack: $audioTrack, duration: $duration, size: $size)';
}


}

/// @nodoc
abstract mixin class _$PodcastEpisodeCopyWith<$Res> implements $PodcastEpisodeCopyWith<$Res> {
  factory _$PodcastEpisodeCopyWith(_PodcastEpisode value, $Res Function(_PodcastEpisode) _then) = __$PodcastEpisodeCopyWithImpl;
@override @useResult
$Res call({
 String libraryItemId, String podcastId, String id, int? index, String? season, String? episode, String? episodeType, String? title, String? subtitle, String? description, PodcastEpisodeEnclosure? enclosure, String? pubDate, AudioFile audioFile, DateTime publishedAt, DateTime addedAt, DateTime updatedAt, AudioTrack audioTrack, Duration duration, int? size
});


@override $PodcastEpisodeEnclosureCopyWith<$Res>? get enclosure;@override $AudioFileCopyWith<$Res> get audioFile;@override $AudioTrackCopyWith<$Res> get audioTrack;

}
/// @nodoc
class __$PodcastEpisodeCopyWithImpl<$Res>
    implements _$PodcastEpisodeCopyWith<$Res> {
  __$PodcastEpisodeCopyWithImpl(this._self, this._then);

  final _PodcastEpisode _self;
  final $Res Function(_PodcastEpisode) _then;

/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryItemId = null,Object? podcastId = null,Object? id = null,Object? index = freezed,Object? season = freezed,Object? episode = freezed,Object? episodeType = freezed,Object? title = freezed,Object? subtitle = freezed,Object? description = freezed,Object? enclosure = freezed,Object? pubDate = freezed,Object? audioFile = null,Object? publishedAt = null,Object? addedAt = null,Object? updatedAt = null,Object? audioTrack = null,Object? duration = null,Object? size = freezed,}) {
  return _then(_PodcastEpisode(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,podcastId: null == podcastId ? _self.podcastId : podcastId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as String?,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,enclosure: freezed == enclosure ? _self.enclosure : enclosure // ignore: cast_nullable_to_non_nullable
as PodcastEpisodeEnclosure?,pubDate: freezed == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String?,audioFile: null == audioFile ? _self.audioFile : audioFile // ignore: cast_nullable_to_non_nullable
as AudioFile,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,audioTrack: null == audioTrack ? _self.audioTrack : audioTrack // ignore: cast_nullable_to_non_nullable
as AudioTrack,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PodcastEpisodeEnclosureCopyWith<$Res>? get enclosure {
    if (_self.enclosure == null) {
    return null;
  }

  return $PodcastEpisodeEnclosureCopyWith<$Res>(_self.enclosure!, (value) {
    return _then(_self.copyWith(enclosure: value));
  });
}/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioFileCopyWith<$Res> get audioFile {
  
  return $AudioFileCopyWith<$Res>(_self.audioFile, (value) {
    return _then(_self.copyWith(audioFile: value));
  });
}/// Create a copy of PodcastEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioTrackCopyWith<$Res> get audioTrack {
  
  return $AudioTrackCopyWith<$Res>(_self.audioTrack, (value) {
    return _then(_self.copyWith(audioTrack: value));
  });
}
}

// dart format on
