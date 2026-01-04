// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_feed_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastFeedEpisode {

 String get title; String get subtitle; String get description; String get descriptionPlain; String get pubDate; String get episodeType; String get season; String get episode; String get author; String get duration; String get explicit; DateTime get publishedAt; PodcastEpisodeEnclosure get enclosure;
/// Create a copy of PodcastFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastFeedEpisodeCopyWith<PodcastFeedEpisode> get copyWith => _$PodcastFeedEpisodeCopyWithImpl<PodcastFeedEpisode>(this as PodcastFeedEpisode, _$identity);

  /// Serializes this PodcastFeedEpisode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastFeedEpisode&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionPlain, descriptionPlain) || other.descriptionPlain == descriptionPlain)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.season, season) || other.season == season)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.author, author) || other.author == author)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.enclosure, enclosure) || other.enclosure == enclosure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,description,descriptionPlain,pubDate,episodeType,season,episode,author,duration,explicit,publishedAt,enclosure);

@override
String toString() {
  return 'PodcastFeedEpisode(title: $title, subtitle: $subtitle, description: $description, descriptionPlain: $descriptionPlain, pubDate: $pubDate, episodeType: $episodeType, season: $season, episode: $episode, author: $author, duration: $duration, explicit: $explicit, publishedAt: $publishedAt, enclosure: $enclosure)';
}


}

/// @nodoc
abstract mixin class $PodcastFeedEpisodeCopyWith<$Res>  {
  factory $PodcastFeedEpisodeCopyWith(PodcastFeedEpisode value, $Res Function(PodcastFeedEpisode) _then) = _$PodcastFeedEpisodeCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, String description, String descriptionPlain, String pubDate, String episodeType, String season, String episode, String author, String duration, String explicit, DateTime publishedAt, PodcastEpisodeEnclosure enclosure
});


$PodcastEpisodeEnclosureCopyWith<$Res> get enclosure;

}
/// @nodoc
class _$PodcastFeedEpisodeCopyWithImpl<$Res>
    implements $PodcastFeedEpisodeCopyWith<$Res> {
  _$PodcastFeedEpisodeCopyWithImpl(this._self, this._then);

  final PodcastFeedEpisode _self;
  final $Res Function(PodcastFeedEpisode) _then;

/// Create a copy of PodcastFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? description = null,Object? descriptionPlain = null,Object? pubDate = null,Object? episodeType = null,Object? season = null,Object? episode = null,Object? author = null,Object? duration = null,Object? explicit = null,Object? publishedAt = null,Object? enclosure = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionPlain: null == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,enclosure: null == enclosure ? _self.enclosure : enclosure // ignore: cast_nullable_to_non_nullable
as PodcastEpisodeEnclosure,
  ));
}
/// Create a copy of PodcastFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PodcastEpisodeEnclosureCopyWith<$Res> get enclosure {
  
  return $PodcastEpisodeEnclosureCopyWith<$Res>(_self.enclosure, (value) {
    return _then(_self.copyWith(enclosure: value));
  });
}
}


/// Adds pattern-matching-related methods to [PodcastFeedEpisode].
extension PodcastFeedEpisodePatterns on PodcastFeedEpisode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PodcastFeedEpisode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PodcastFeedEpisode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PodcastFeedEpisode value)  $default,){
final _that = this;
switch (_that) {
case _PodcastFeedEpisode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PodcastFeedEpisode value)?  $default,){
final _that = this;
switch (_that) {
case _PodcastFeedEpisode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  String description,  String descriptionPlain,  String pubDate,  String episodeType,  String season,  String episode,  String author,  String duration,  String explicit,  DateTime publishedAt,  PodcastEpisodeEnclosure enclosure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PodcastFeedEpisode() when $default != null:
return $default(_that.title,_that.subtitle,_that.description,_that.descriptionPlain,_that.pubDate,_that.episodeType,_that.season,_that.episode,_that.author,_that.duration,_that.explicit,_that.publishedAt,_that.enclosure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  String description,  String descriptionPlain,  String pubDate,  String episodeType,  String season,  String episode,  String author,  String duration,  String explicit,  DateTime publishedAt,  PodcastEpisodeEnclosure enclosure)  $default,) {final _that = this;
switch (_that) {
case _PodcastFeedEpisode():
return $default(_that.title,_that.subtitle,_that.description,_that.descriptionPlain,_that.pubDate,_that.episodeType,_that.season,_that.episode,_that.author,_that.duration,_that.explicit,_that.publishedAt,_that.enclosure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  String description,  String descriptionPlain,  String pubDate,  String episodeType,  String season,  String episode,  String author,  String duration,  String explicit,  DateTime publishedAt,  PodcastEpisodeEnclosure enclosure)?  $default,) {final _that = this;
switch (_that) {
case _PodcastFeedEpisode() when $default != null:
return $default(_that.title,_that.subtitle,_that.description,_that.descriptionPlain,_that.pubDate,_that.episodeType,_that.season,_that.episode,_that.author,_that.duration,_that.explicit,_that.publishedAt,_that.enclosure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _PodcastFeedEpisode implements PodcastFeedEpisode {
  const _PodcastFeedEpisode({required this.title, required this.subtitle, required this.description, required this.descriptionPlain, required this.pubDate, required this.episodeType, required this.season, required this.episode, required this.author, required this.duration, required this.explicit, required this.publishedAt, required this.enclosure});
  factory _PodcastFeedEpisode.fromJson(Map<String, dynamic> json) => _$PodcastFeedEpisodeFromJson(json);

@override final  String title;
@override final  String subtitle;
@override final  String description;
@override final  String descriptionPlain;
@override final  String pubDate;
@override final  String episodeType;
@override final  String season;
@override final  String episode;
@override final  String author;
@override final  String duration;
@override final  String explicit;
@override final  DateTime publishedAt;
@override final  PodcastEpisodeEnclosure enclosure;

/// Create a copy of PodcastFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastFeedEpisodeCopyWith<_PodcastFeedEpisode> get copyWith => __$PodcastFeedEpisodeCopyWithImpl<_PodcastFeedEpisode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastFeedEpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastFeedEpisode&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionPlain, descriptionPlain) || other.descriptionPlain == descriptionPlain)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.season, season) || other.season == season)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.author, author) || other.author == author)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.enclosure, enclosure) || other.enclosure == enclosure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,description,descriptionPlain,pubDate,episodeType,season,episode,author,duration,explicit,publishedAt,enclosure);

@override
String toString() {
  return 'PodcastFeedEpisode(title: $title, subtitle: $subtitle, description: $description, descriptionPlain: $descriptionPlain, pubDate: $pubDate, episodeType: $episodeType, season: $season, episode: $episode, author: $author, duration: $duration, explicit: $explicit, publishedAt: $publishedAt, enclosure: $enclosure)';
}


}

/// @nodoc
abstract mixin class _$PodcastFeedEpisodeCopyWith<$Res> implements $PodcastFeedEpisodeCopyWith<$Res> {
  factory _$PodcastFeedEpisodeCopyWith(_PodcastFeedEpisode value, $Res Function(_PodcastFeedEpisode) _then) = __$PodcastFeedEpisodeCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, String description, String descriptionPlain, String pubDate, String episodeType, String season, String episode, String author, String duration, String explicit, DateTime publishedAt, PodcastEpisodeEnclosure enclosure
});


@override $PodcastEpisodeEnclosureCopyWith<$Res> get enclosure;

}
/// @nodoc
class __$PodcastFeedEpisodeCopyWithImpl<$Res>
    implements _$PodcastFeedEpisodeCopyWith<$Res> {
  __$PodcastFeedEpisodeCopyWithImpl(this._self, this._then);

  final _PodcastFeedEpisode _self;
  final $Res Function(_PodcastFeedEpisode) _then;

/// Create a copy of PodcastFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? description = null,Object? descriptionPlain = null,Object? pubDate = null,Object? episodeType = null,Object? season = null,Object? episode = null,Object? author = null,Object? duration = null,Object? explicit = null,Object? publishedAt = null,Object? enclosure = null,}) {
  return _then(_PodcastFeedEpisode(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionPlain: null == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,enclosure: null == enclosure ? _self.enclosure : enclosure // ignore: cast_nullable_to_non_nullable
as PodcastEpisodeEnclosure,
  ));
}

/// Create a copy of PodcastFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PodcastEpisodeEnclosureCopyWith<$Res> get enclosure {
  
  return $PodcastEpisodeEnclosureCopyWith<$Res>(_self.enclosure, (value) {
    return _then(_self.copyWith(enclosure: value));
  });
}
}

// dart format on
