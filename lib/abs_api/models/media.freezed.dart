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

 String get id; MediaMetadata get metadata; String? get libraryItemId; List<String> get tags; String? get coverPath; int? get size;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.id, id) || other.id == id)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,metadata,libraryItemId,const DeepCollectionEquality().hash(tags),coverPath,size);

@override
String toString() {
  return 'Media(id: $id, metadata: $metadata, libraryItemId: $libraryItemId, tags: $tags, coverPath: $coverPath, size: $size)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 String id, MediaMetadata metadata, String? libraryItemId, List<String> tags, String? coverPath, int? size
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? metadata = null,Object? libraryItemId = freezed,Object? tags = null,Object? coverPath = freezed,Object? size = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  MediaMetadata metadata,  String? libraryItemId,  List<String> tags,  Duration? duration,  String? coverPath,  List<AudioFile>? audioFiles,  int? numAudioFiles,  List<AudioTrack>? tracks,  int? numTracks,  List<BookChapter>? chapters,  int? numChapters,  int? size)?  book,TResult Function( String id,  MediaMetadata metadata,  String? libraryItemId,  List<String> tags,  bool autoDownloadEpisodes,  List<PodcastEpisode> episodes,  String? coverPath,  DateTime? lastEpisodeCheck,  int? size,  int? numEpisodes)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookMedia() when book != null:
return book(_that.id,_that.metadata,_that.libraryItemId,_that.tags,_that.duration,_that.coverPath,_that.audioFiles,_that.numAudioFiles,_that.tracks,_that.numTracks,_that.chapters,_that.numChapters,_that.size);case PodcastMedia() when podcast != null:
return podcast(_that.id,_that.metadata,_that.libraryItemId,_that.tags,_that.autoDownloadEpisodes,_that.episodes,_that.coverPath,_that.lastEpisodeCheck,_that.size,_that.numEpisodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  MediaMetadata metadata,  String? libraryItemId,  List<String> tags,  Duration? duration,  String? coverPath,  List<AudioFile>? audioFiles,  int? numAudioFiles,  List<AudioTrack>? tracks,  int? numTracks,  List<BookChapter>? chapters,  int? numChapters,  int? size)  book,required TResult Function( String id,  MediaMetadata metadata,  String? libraryItemId,  List<String> tags,  bool autoDownloadEpisodes,  List<PodcastEpisode> episodes,  String? coverPath,  DateTime? lastEpisodeCheck,  int? size,  int? numEpisodes)  podcast,}) {final _that = this;
switch (_that) {
case BookMedia():
return book(_that.id,_that.metadata,_that.libraryItemId,_that.tags,_that.duration,_that.coverPath,_that.audioFiles,_that.numAudioFiles,_that.tracks,_that.numTracks,_that.chapters,_that.numChapters,_that.size);case PodcastMedia():
return podcast(_that.id,_that.metadata,_that.libraryItemId,_that.tags,_that.autoDownloadEpisodes,_that.episodes,_that.coverPath,_that.lastEpisodeCheck,_that.size,_that.numEpisodes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  MediaMetadata metadata,  String? libraryItemId,  List<String> tags,  Duration? duration,  String? coverPath,  List<AudioFile>? audioFiles,  int? numAudioFiles,  List<AudioTrack>? tracks,  int? numTracks,  List<BookChapter>? chapters,  int? numChapters,  int? size)?  book,TResult? Function( String id,  MediaMetadata metadata,  String? libraryItemId,  List<String> tags,  bool autoDownloadEpisodes,  List<PodcastEpisode> episodes,  String? coverPath,  DateTime? lastEpisodeCheck,  int? size,  int? numEpisodes)?  podcast,}) {final _that = this;
switch (_that) {
case BookMedia() when book != null:
return book(_that.id,_that.metadata,_that.libraryItemId,_that.tags,_that.duration,_that.coverPath,_that.audioFiles,_that.numAudioFiles,_that.tracks,_that.numTracks,_that.chapters,_that.numChapters,_that.size);case PodcastMedia() when podcast != null:
return podcast(_that.id,_that.metadata,_that.libraryItemId,_that.tags,_that.autoDownloadEpisodes,_that.episodes,_that.coverPath,_that.lastEpisodeCheck,_that.size,_that.numEpisodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DurationPreciseSecondsConverter()
class BookMedia implements Media {
  const BookMedia({required this.id, required this.metadata, this.libraryItemId, final  List<String> tags = const [], this.duration, this.coverPath, final  List<AudioFile>? audioFiles, this.numAudioFiles, final  List<AudioTrack>? tracks, this.numTracks, final  List<BookChapter>? chapters, this.numChapters, this.size, final  String? $type}): _tags = tags,_audioFiles = audioFiles,_tracks = tracks,_chapters = chapters,$type = $type ?? 'book';
  factory BookMedia.fromJson(Map<String, dynamic> json) => _$BookMediaFromJson(json);

@override final  String id;
@override final  MediaMetadata metadata;
@override final  String? libraryItemId;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  Duration? duration;
@override final  String? coverPath;
 final  List<AudioFile>? _audioFiles;
 List<AudioFile>? get audioFiles {
  final value = _audioFiles;
  if (value == null) return null;
  if (_audioFiles is EqualUnmodifiableListView) return _audioFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? numAudioFiles;
 final  List<AudioTrack>? _tracks;
 List<AudioTrack>? get tracks {
  final value = _tracks;
  if (value == null) return null;
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? numTracks;
 final  List<BookChapter>? _chapters;
 List<BookChapter>? get chapters {
  final value = _chapters;
  if (value == null) return null;
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? numChapters;
@override final  int? size;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other._audioFiles, _audioFiles)&&(identical(other.numAudioFiles, numAudioFiles) || other.numAudioFiles == numAudioFiles)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&(identical(other.numTracks, numTracks) || other.numTracks == numTracks)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,metadata,libraryItemId,const DeepCollectionEquality().hash(_tags),duration,coverPath,const DeepCollectionEquality().hash(_audioFiles),numAudioFiles,const DeepCollectionEquality().hash(_tracks),numTracks,const DeepCollectionEquality().hash(_chapters),numChapters,size);

@override
String toString() {
  return 'Media.book(id: $id, metadata: $metadata, libraryItemId: $libraryItemId, tags: $tags, duration: $duration, coverPath: $coverPath, audioFiles: $audioFiles, numAudioFiles: $numAudioFiles, tracks: $tracks, numTracks: $numTracks, chapters: $chapters, numChapters: $numChapters, size: $size)';
}


}

/// @nodoc
abstract mixin class $BookMediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory $BookMediaCopyWith(BookMedia value, $Res Function(BookMedia) _then) = _$BookMediaCopyWithImpl;
@override @useResult
$Res call({
 String id, MediaMetadata metadata, String? libraryItemId, List<String> tags, Duration? duration, String? coverPath, List<AudioFile>? audioFiles, int? numAudioFiles, List<AudioTrack>? tracks, int? numTracks, List<BookChapter>? chapters, int? numChapters, int? size
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? metadata = null,Object? libraryItemId = freezed,Object? tags = null,Object? duration = freezed,Object? coverPath = freezed,Object? audioFiles = freezed,Object? numAudioFiles = freezed,Object? tracks = freezed,Object? numTracks = freezed,Object? chapters = freezed,Object? numChapters = freezed,Object? size = freezed,}) {
  return _then(BookMedia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,audioFiles: freezed == audioFiles ? _self._audioFiles : audioFiles // ignore: cast_nullable_to_non_nullable
as List<AudioFile>?,numAudioFiles: freezed == numAudioFiles ? _self.numAudioFiles : numAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>?,numTracks: freezed == numTracks ? _self.numTracks : numTracks // ignore: cast_nullable_to_non_nullable
as int?,chapters: freezed == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
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

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class PodcastMedia implements Media {
  const PodcastMedia({required this.id, required this.metadata, this.libraryItemId, final  List<String> tags = const [], this.autoDownloadEpisodes = false, final  List<PodcastEpisode> episodes = const [], this.coverPath, this.lastEpisodeCheck, this.size, this.numEpisodes, final  String? $type}): _tags = tags,_episodes = episodes,$type = $type ?? 'podcast';
  factory PodcastMedia.fromJson(Map<String, dynamic> json) => _$PodcastMediaFromJson(json);

@override final  String id;
@override final  MediaMetadata metadata;
@override final  String? libraryItemId;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@JsonKey() final  bool autoDownloadEpisodes;
 final  List<PodcastEpisode> _episodes;
@JsonKey() List<PodcastEpisode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}

@override final  String? coverPath;
 final  DateTime? lastEpisodeCheck;
@override final  int? size;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.autoDownloadEpisodes, autoDownloadEpisodes) || other.autoDownloadEpisodes == autoDownloadEpisodes)&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.lastEpisodeCheck, lastEpisodeCheck) || other.lastEpisodeCheck == lastEpisodeCheck)&&(identical(other.size, size) || other.size == size)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,metadata,libraryItemId,const DeepCollectionEquality().hash(_tags),autoDownloadEpisodes,const DeepCollectionEquality().hash(_episodes),coverPath,lastEpisodeCheck,size,numEpisodes);

@override
String toString() {
  return 'Media.podcast(id: $id, metadata: $metadata, libraryItemId: $libraryItemId, tags: $tags, autoDownloadEpisodes: $autoDownloadEpisodes, episodes: $episodes, coverPath: $coverPath, lastEpisodeCheck: $lastEpisodeCheck, size: $size, numEpisodes: $numEpisodes)';
}


}

/// @nodoc
abstract mixin class $PodcastMediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory $PodcastMediaCopyWith(PodcastMedia value, $Res Function(PodcastMedia) _then) = _$PodcastMediaCopyWithImpl;
@override @useResult
$Res call({
 String id, MediaMetadata metadata, String? libraryItemId, List<String> tags, bool autoDownloadEpisodes, List<PodcastEpisode> episodes, String? coverPath, DateTime? lastEpisodeCheck, int? size, int? numEpisodes
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? metadata = null,Object? libraryItemId = freezed,Object? tags = null,Object? autoDownloadEpisodes = null,Object? episodes = null,Object? coverPath = freezed,Object? lastEpisodeCheck = freezed,Object? size = freezed,Object? numEpisodes = freezed,}) {
  return _then(PodcastMedia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,autoDownloadEpisodes: null == autoDownloadEpisodes ? _self.autoDownloadEpisodes : autoDownloadEpisodes // ignore: cast_nullable_to_non_nullable
as bool,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<PodcastEpisode>,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
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
