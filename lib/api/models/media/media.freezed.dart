// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Media _$MediaFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'book':
          return BookMedia.fromJson(
            json
          );
                case 'podcast':
          return PodcastMedia.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Media',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Media {

 MediaMetadata get metadata; List<String> get tags; int get size; String? get coverPath;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.size, size) || other.size == size)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,const DeepCollectionEquality().hash(tags),size,coverPath);

@override
String toString() {
  return 'Media(metadata: $metadata, tags: $tags, size: $size, coverPath: $coverPath)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 MediaMetadata metadata, List<String> tags, int size, String? coverPath
});


$MediaMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$MediaCopyWithImpl<$Res>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = null,Object? tags = null,Object? size = null,Object? coverPath = freezed,}) {
  return _then(_self.copyWith(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get metadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [Media].
extension MediaPatterns on Media {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookMedia value)?  book,TResult Function( PodcastMedia value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookMedia() when book != null:
return book(_that);case PodcastMedia() when podcast != null:
return podcast(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookMedia value)  book,required TResult Function( PodcastMedia value)  podcast,}){
final _that = this;
switch (_that) {
case BookMedia():
return book(_that);case PodcastMedia():
return podcast(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookMedia value)?  book,TResult? Function( PodcastMedia value)?  podcast,}){
final _that = this;
switch (_that) {
case BookMedia() when book != null:
return book(_that);case PodcastMedia() when podcast != null:
return podcast(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MediaMetadata metadata,  List<String> tags,  Duration duration,  int size,  String? coverPath,  List<AudioFile>? audioFiles,  List<AudioTrack>? tracks,  List<BookChapter>? chapters)?  book,TResult Function( MediaMetadata metadata,  List<String> tags,  int size,  bool autoDownloadEpisodes,  String? coverPath,  DateTime? lastEpisodeCheck,  List<PodcastEpisode>? episodes,  int? numEpisodes)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookMedia() when book != null:
return book(_that.metadata,_that.tags,_that.duration,_that.size,_that.coverPath,_that.audioFiles,_that.tracks,_that.chapters);case PodcastMedia() when podcast != null:
return podcast(_that.metadata,_that.tags,_that.size,_that.autoDownloadEpisodes,_that.coverPath,_that.lastEpisodeCheck,_that.episodes,_that.numEpisodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MediaMetadata metadata,  List<String> tags,  Duration duration,  int size,  String? coverPath,  List<AudioFile>? audioFiles,  List<AudioTrack>? tracks,  List<BookChapter>? chapters)  book,required TResult Function( MediaMetadata metadata,  List<String> tags,  int size,  bool autoDownloadEpisodes,  String? coverPath,  DateTime? lastEpisodeCheck,  List<PodcastEpisode>? episodes,  int? numEpisodes)  podcast,}) {final _that = this;
switch (_that) {
case BookMedia():
return book(_that.metadata,_that.tags,_that.duration,_that.size,_that.coverPath,_that.audioFiles,_that.tracks,_that.chapters);case PodcastMedia():
return podcast(_that.metadata,_that.tags,_that.size,_that.autoDownloadEpisodes,_that.coverPath,_that.lastEpisodeCheck,_that.episodes,_that.numEpisodes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MediaMetadata metadata,  List<String> tags,  Duration duration,  int size,  String? coverPath,  List<AudioFile>? audioFiles,  List<AudioTrack>? tracks,  List<BookChapter>? chapters)?  book,TResult? Function( MediaMetadata metadata,  List<String> tags,  int size,  bool autoDownloadEpisodes,  String? coverPath,  DateTime? lastEpisodeCheck,  List<PodcastEpisode>? episodes,  int? numEpisodes)?  podcast,}) {final _that = this;
switch (_that) {
case BookMedia() when book != null:
return book(_that.metadata,_that.tags,_that.duration,_that.size,_that.coverPath,_that.audioFiles,_that.tracks,_that.chapters);case PodcastMedia() when podcast != null:
return podcast(_that.metadata,_that.tags,_that.size,_that.autoDownloadEpisodes,_that.coverPath,_that.lastEpisodeCheck,_that.episodes,_that.numEpisodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DurationPreciseSecondsConverter()
class BookMedia implements Media {
  const BookMedia({required this.metadata, required final  List<String> tags, required this.duration, required this.size, this.coverPath, final  List<AudioFile>? audioFiles, final  List<AudioTrack>? tracks, final  List<BookChapter>? chapters, final  String? $type}): _tags = tags,_audioFiles = audioFiles,_tracks = tracks,_chapters = chapters,$type = $type ?? 'book';
  factory BookMedia.fromJson(Map<String, dynamic> json) => _$BookMediaFromJson(json);

@override final  MediaMetadata metadata;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  Duration duration;
@override final  int size;
@override final  String? coverPath;
 final  List<AudioFile>? _audioFiles;
 List<AudioFile>? get audioFiles {
  final value = _audioFiles;
  if (value == null) return null;
  if (_audioFiles is EqualUnmodifiableListView) return _audioFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AudioTrack>? _tracks;
 List<AudioTrack>? get tracks {
  final value = _tracks;
  if (value == null) return null;
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<BookChapter>? _chapters;
 List<BookChapter>? get chapters {
  final value = _chapters;
  if (value == null) return null;
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookMediaCopyWith<BookMedia> get copyWith => _$BookMediaCopyWithImpl<BookMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookMedia&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other._audioFiles, _audioFiles)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._chapters, _chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,const DeepCollectionEquality().hash(_tags),duration,size,coverPath,const DeepCollectionEquality().hash(_audioFiles),const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_chapters));

@override
String toString() {
  return 'Media.book(metadata: $metadata, tags: $tags, duration: $duration, size: $size, coverPath: $coverPath, audioFiles: $audioFiles, tracks: $tracks, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $BookMediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory $BookMediaCopyWith(BookMedia value, $Res Function(BookMedia) _then) = _$BookMediaCopyWithImpl;
@override @useResult
$Res call({
 MediaMetadata metadata, List<String> tags, Duration duration, int size, String? coverPath, List<AudioFile>? audioFiles, List<AudioTrack>? tracks, List<BookChapter>? chapters
});


@override $MediaMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$BookMediaCopyWithImpl<$Res>
    implements $BookMediaCopyWith<$Res> {
  _$BookMediaCopyWithImpl(this._self, this._then);

  final BookMedia _self;
  final $Res Function(BookMedia) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadata = null,Object? tags = null,Object? duration = null,Object? size = null,Object? coverPath = freezed,Object? audioFiles = freezed,Object? tracks = freezed,Object? chapters = freezed,}) {
  return _then(BookMedia(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,audioFiles: freezed == audioFiles ? _self._audioFiles : audioFiles // ignore: cast_nullable_to_non_nullable
as List<AudioFile>?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>?,chapters: freezed == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,
  ));
}

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get metadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class PodcastMedia implements Media {
  const PodcastMedia({required this.metadata, required final  List<String> tags, required this.size, required this.autoDownloadEpisodes, this.coverPath, this.lastEpisodeCheck, final  List<PodcastEpisode>? episodes, this.numEpisodes, final  String? $type}): _tags = tags,_episodes = episodes,$type = $type ?? 'podcast';
  factory PodcastMedia.fromJson(Map<String, dynamic> json) => _$PodcastMediaFromJson(json);

@override final  MediaMetadata metadata;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int size;
 final  bool autoDownloadEpisodes;
@override final  String? coverPath;
 final  DateTime? lastEpisodeCheck;
 final  List<PodcastEpisode>? _episodes;
 List<PodcastEpisode>? get episodes {
  final value = _episodes;
  if (value == null) return null;
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? numEpisodes;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastMediaCopyWith<PodcastMedia> get copyWith => _$PodcastMediaCopyWithImpl<PodcastMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastMedia&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.size, size) || other.size == size)&&(identical(other.autoDownloadEpisodes, autoDownloadEpisodes) || other.autoDownloadEpisodes == autoDownloadEpisodes)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.lastEpisodeCheck, lastEpisodeCheck) || other.lastEpisodeCheck == lastEpisodeCheck)&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,const DeepCollectionEquality().hash(_tags),size,autoDownloadEpisodes,coverPath,lastEpisodeCheck,const DeepCollectionEquality().hash(_episodes),numEpisodes);

@override
String toString() {
  return 'Media.podcast(metadata: $metadata, tags: $tags, size: $size, autoDownloadEpisodes: $autoDownloadEpisodes, coverPath: $coverPath, lastEpisodeCheck: $lastEpisodeCheck, episodes: $episodes, numEpisodes: $numEpisodes)';
}


}

/// @nodoc
abstract mixin class $PodcastMediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory $PodcastMediaCopyWith(PodcastMedia value, $Res Function(PodcastMedia) _then) = _$PodcastMediaCopyWithImpl;
@override @useResult
$Res call({
 MediaMetadata metadata, List<String> tags, int size, bool autoDownloadEpisodes, String? coverPath, DateTime? lastEpisodeCheck, List<PodcastEpisode>? episodes, int? numEpisodes
});


@override $MediaMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$PodcastMediaCopyWithImpl<$Res>
    implements $PodcastMediaCopyWith<$Res> {
  _$PodcastMediaCopyWithImpl(this._self, this._then);

  final PodcastMedia _self;
  final $Res Function(PodcastMedia) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadata = null,Object? tags = null,Object? size = null,Object? autoDownloadEpisodes = null,Object? coverPath = freezed,Object? lastEpisodeCheck = freezed,Object? episodes = freezed,Object? numEpisodes = freezed,}) {
  return _then(PodcastMedia(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,autoDownloadEpisodes: null == autoDownloadEpisodes ? _self.autoDownloadEpisodes : autoDownloadEpisodes // ignore: cast_nullable_to_non_nullable
as bool,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,episodes: freezed == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<PodcastEpisode>?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get metadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
