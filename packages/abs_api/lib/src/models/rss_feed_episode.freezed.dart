// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RssFeedEpisode {

 String get id; String get title; String get description; RssFeedEpisodeEnclosure get enclosure; String get pubDate; Uri get link; String get author; bool get explicit; Duration get duration; String get libraryItemId; String? get episodeId; int get trackIndex; String get fullPath;
/// Create a copy of RssFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RssFeedEpisodeCopyWith<RssFeedEpisode> get copyWith => _$RssFeedEpisodeCopyWithImpl<RssFeedEpisode>(this as RssFeedEpisode, _$identity);

  /// Serializes this RssFeedEpisode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RssFeedEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enclosure, enclosure) || other.enclosure == enclosure)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.link, link) || other.link == link)&&(identical(other.author, author) || other.author == author)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.trackIndex, trackIndex) || other.trackIndex == trackIndex)&&(identical(other.fullPath, fullPath) || other.fullPath == fullPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,enclosure,pubDate,link,author,explicit,duration,libraryItemId,episodeId,trackIndex,fullPath);

@override
String toString() {
  return 'RssFeedEpisode(id: $id, title: $title, description: $description, enclosure: $enclosure, pubDate: $pubDate, link: $link, author: $author, explicit: $explicit, duration: $duration, libraryItemId: $libraryItemId, episodeId: $episodeId, trackIndex: $trackIndex, fullPath: $fullPath)';
}


}

/// @nodoc
abstract mixin class $RssFeedEpisodeCopyWith<$Res>  {
  factory $RssFeedEpisodeCopyWith(RssFeedEpisode value, $Res Function(RssFeedEpisode) _then) = _$RssFeedEpisodeCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, RssFeedEpisodeEnclosure enclosure, String pubDate, Uri link, String author, bool explicit, Duration duration, String libraryItemId, String? episodeId, int trackIndex, String fullPath
});


$RssFeedEpisodeEnclosureCopyWith<$Res> get enclosure;

}
/// @nodoc
class _$RssFeedEpisodeCopyWithImpl<$Res>
    implements $RssFeedEpisodeCopyWith<$Res> {
  _$RssFeedEpisodeCopyWithImpl(this._self, this._then);

  final RssFeedEpisode _self;
  final $Res Function(RssFeedEpisode) _then;

/// Create a copy of RssFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? enclosure = null,Object? pubDate = null,Object? link = null,Object? author = null,Object? explicit = null,Object? duration = null,Object? libraryItemId = null,Object? episodeId = freezed,Object? trackIndex = null,Object? fullPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enclosure: null == enclosure ? _self.enclosure : enclosure // ignore: cast_nullable_to_non_nullable
as RssFeedEpisodeEnclosure,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,trackIndex: null == trackIndex ? _self.trackIndex : trackIndex // ignore: cast_nullable_to_non_nullable
as int,fullPath: null == fullPath ? _self.fullPath : fullPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RssFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RssFeedEpisodeEnclosureCopyWith<$Res> get enclosure {
  
  return $RssFeedEpisodeEnclosureCopyWith<$Res>(_self.enclosure, (value) {
    return _then(_self.copyWith(enclosure: value));
  });
}
}


/// Adds pattern-matching-related methods to [RssFeedEpisode].
extension RssFeedEpisodePatterns on RssFeedEpisode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RssFeedEpisode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RssFeedEpisode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RssFeedEpisode value)  $default,){
final _that = this;
switch (_that) {
case _RssFeedEpisode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RssFeedEpisode value)?  $default,){
final _that = this;
switch (_that) {
case _RssFeedEpisode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  RssFeedEpisodeEnclosure enclosure,  String pubDate,  Uri link,  String author,  bool explicit,  Duration duration,  String libraryItemId,  String? episodeId,  int trackIndex,  String fullPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RssFeedEpisode() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.enclosure,_that.pubDate,_that.link,_that.author,_that.explicit,_that.duration,_that.libraryItemId,_that.episodeId,_that.trackIndex,_that.fullPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  RssFeedEpisodeEnclosure enclosure,  String pubDate,  Uri link,  String author,  bool explicit,  Duration duration,  String libraryItemId,  String? episodeId,  int trackIndex,  String fullPath)  $default,) {final _that = this;
switch (_that) {
case _RssFeedEpisode():
return $default(_that.id,_that.title,_that.description,_that.enclosure,_that.pubDate,_that.link,_that.author,_that.explicit,_that.duration,_that.libraryItemId,_that.episodeId,_that.trackIndex,_that.fullPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  RssFeedEpisodeEnclosure enclosure,  String pubDate,  Uri link,  String author,  bool explicit,  Duration duration,  String libraryItemId,  String? episodeId,  int trackIndex,  String fullPath)?  $default,) {final _that = this;
switch (_that) {
case _RssFeedEpisode() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.enclosure,_that.pubDate,_that.link,_that.author,_that.explicit,_that.duration,_that.libraryItemId,_that.episodeId,_that.trackIndex,_that.fullPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DurationPreciseSecondsConverter()
class _RssFeedEpisode implements RssFeedEpisode {
  const _RssFeedEpisode({required this.id, required this.title, required this.description, required this.enclosure, required this.pubDate, required this.link, required this.author, required this.explicit, required this.duration, required this.libraryItemId, this.episodeId, required this.trackIndex, required this.fullPath});
  factory _RssFeedEpisode.fromJson(Map<String, dynamic> json) => _$RssFeedEpisodeFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  RssFeedEpisodeEnclosure enclosure;
@override final  String pubDate;
@override final  Uri link;
@override final  String author;
@override final  bool explicit;
@override final  Duration duration;
@override final  String libraryItemId;
@override final  String? episodeId;
@override final  int trackIndex;
@override final  String fullPath;

/// Create a copy of RssFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RssFeedEpisodeCopyWith<_RssFeedEpisode> get copyWith => __$RssFeedEpisodeCopyWithImpl<_RssFeedEpisode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RssFeedEpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RssFeedEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enclosure, enclosure) || other.enclosure == enclosure)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.link, link) || other.link == link)&&(identical(other.author, author) || other.author == author)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.trackIndex, trackIndex) || other.trackIndex == trackIndex)&&(identical(other.fullPath, fullPath) || other.fullPath == fullPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,enclosure,pubDate,link,author,explicit,duration,libraryItemId,episodeId,trackIndex,fullPath);

@override
String toString() {
  return 'RssFeedEpisode(id: $id, title: $title, description: $description, enclosure: $enclosure, pubDate: $pubDate, link: $link, author: $author, explicit: $explicit, duration: $duration, libraryItemId: $libraryItemId, episodeId: $episodeId, trackIndex: $trackIndex, fullPath: $fullPath)';
}


}

/// @nodoc
abstract mixin class _$RssFeedEpisodeCopyWith<$Res> implements $RssFeedEpisodeCopyWith<$Res> {
  factory _$RssFeedEpisodeCopyWith(_RssFeedEpisode value, $Res Function(_RssFeedEpisode) _then) = __$RssFeedEpisodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, RssFeedEpisodeEnclosure enclosure, String pubDate, Uri link, String author, bool explicit, Duration duration, String libraryItemId, String? episodeId, int trackIndex, String fullPath
});


@override $RssFeedEpisodeEnclosureCopyWith<$Res> get enclosure;

}
/// @nodoc
class __$RssFeedEpisodeCopyWithImpl<$Res>
    implements _$RssFeedEpisodeCopyWith<$Res> {
  __$RssFeedEpisodeCopyWithImpl(this._self, this._then);

  final _RssFeedEpisode _self;
  final $Res Function(_RssFeedEpisode) _then;

/// Create a copy of RssFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? enclosure = null,Object? pubDate = null,Object? link = null,Object? author = null,Object? explicit = null,Object? duration = null,Object? libraryItemId = null,Object? episodeId = freezed,Object? trackIndex = null,Object? fullPath = null,}) {
  return _then(_RssFeedEpisode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enclosure: null == enclosure ? _self.enclosure : enclosure // ignore: cast_nullable_to_non_nullable
as RssFeedEpisodeEnclosure,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,trackIndex: null == trackIndex ? _self.trackIndex : trackIndex // ignore: cast_nullable_to_non_nullable
as int,fullPath: null == fullPath ? _self.fullPath : fullPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RssFeedEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RssFeedEpisodeEnclosureCopyWith<$Res> get enclosure {
  
  return $RssFeedEpisodeEnclosureCopyWith<$Res>(_self.enclosure, (value) {
    return _then(_self.copyWith(enclosure: value));
  });
}
}

// dart format on
