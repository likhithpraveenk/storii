// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryItem {

 String get id; String get libraryId; DateTime get addedAt; DateTime get updatedAt; bool get isMissing; int get size; String? get title; String? get authorName; String? get description; String? get language; bool get explicit; List<String> get genres; List<String> get tags; double get progress; bool get isFinished; bool get hideFromContinueListening;
/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<LibraryItem> get copyWith => _$LibraryItemCopyWithImpl<LibraryItem>(this as LibraryItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.size, size) || other.size == size)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening));
}


@override
int get hashCode => Object.hash(runtimeType,id,libraryId,addedAt,updatedAt,isMissing,size,title,authorName,description,language,explicit,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(tags),progress,isFinished,hideFromContinueListening);

@override
String toString() {
  return 'LibraryItem(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, size: $size, title: $title, authorName: $authorName, description: $description, language: $language, explicit: $explicit, genres: $genres, tags: $tags, progress: $progress, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening)';
}


}

/// @nodoc
abstract mixin class $LibraryItemCopyWith<$Res>  {
  factory $LibraryItemCopyWith(LibraryItem value, $Res Function(LibraryItem) _then) = _$LibraryItemCopyWithImpl;
@useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, int size, String? title, String? authorName, String? description, String? language, bool explicit, List<String> genres, List<String> tags, double progress, bool isFinished, bool hideFromContinueListening
});




}
/// @nodoc
class _$LibraryItemCopyWithImpl<$Res>
    implements $LibraryItemCopyWith<$Res> {
  _$LibraryItemCopyWithImpl(this._self, this._then);

  final LibraryItem _self;
  final $Res Function(LibraryItem) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? libraryId = null,Object? addedAt = null,Object? updatedAt = null,Object? isMissing = null,Object? size = null,Object? title = freezed,Object? authorName = freezed,Object? description = freezed,Object? language = freezed,Object? explicit = null,Object? genres = null,Object? tags = null,Object? progress = null,Object? isFinished = null,Object? hideFromContinueListening = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryItem].
extension LibraryItemPatterns on LibraryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Audiobook value)?  audiobook,TResult Function( Podcast value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Audiobook() when audiobook != null:
return audiobook(_that);case Podcast() when podcast != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Audiobook value)  audiobook,required TResult Function( Podcast value)  podcast,}){
final _that = this;
switch (_that) {
case Audiobook():
return audiobook(_that);case Podcast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Audiobook value)?  audiobook,TResult? Function( Podcast value)?  podcast,}){
final _that = this;
switch (_that) {
case Audiobook() when audiobook != null:
return audiobook(_that);case Podcast() when podcast != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  Duration duration,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> narrators,  List<String> genres,  List<String> tags,  List<AudioFile> audioFiles,  List<AudioTrack> tracks,  List<BookChapter> chapters,  double progress,  bool isFinished,  bool hideFromContinueListening)?  audiobook,TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  String? episodeId,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> genres,  List<String> tags,  List<PodcastEpisode> episodes,  Uri? feedUrl,  DateTime? lastEpisodeCheck,  double progress,  bool isFinished,  bool hideFromContinueListening)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Audiobook() when audiobook != null:
return audiobook(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.duration,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.narrators,_that.genres,_that.tags,_that.audioFiles,_that.tracks,_that.chapters,_that.progress,_that.isFinished,_that.hideFromContinueListening);case Podcast() when podcast != null:
return podcast(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.episodeId,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.genres,_that.tags,_that.episodes,_that.feedUrl,_that.lastEpisodeCheck,_that.progress,_that.isFinished,_that.hideFromContinueListening);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  Duration duration,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> narrators,  List<String> genres,  List<String> tags,  List<AudioFile> audioFiles,  List<AudioTrack> tracks,  List<BookChapter> chapters,  double progress,  bool isFinished,  bool hideFromContinueListening)  audiobook,required TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  String? episodeId,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> genres,  List<String> tags,  List<PodcastEpisode> episodes,  Uri? feedUrl,  DateTime? lastEpisodeCheck,  double progress,  bool isFinished,  bool hideFromContinueListening)  podcast,}) {final _that = this;
switch (_that) {
case Audiobook():
return audiobook(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.duration,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.narrators,_that.genres,_that.tags,_that.audioFiles,_that.tracks,_that.chapters,_that.progress,_that.isFinished,_that.hideFromContinueListening);case Podcast():
return podcast(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.episodeId,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.genres,_that.tags,_that.episodes,_that.feedUrl,_that.lastEpisodeCheck,_that.progress,_that.isFinished,_that.hideFromContinueListening);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  Duration duration,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> narrators,  List<String> genres,  List<String> tags,  List<AudioFile> audioFiles,  List<AudioTrack> tracks,  List<BookChapter> chapters,  double progress,  bool isFinished,  bool hideFromContinueListening)?  audiobook,TResult? Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  String? episodeId,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> genres,  List<String> tags,  List<PodcastEpisode> episodes,  Uri? feedUrl,  DateTime? lastEpisodeCheck,  double progress,  bool isFinished,  bool hideFromContinueListening)?  podcast,}) {final _that = this;
switch (_that) {
case Audiobook() when audiobook != null:
return audiobook(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.duration,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.narrators,_that.genres,_that.tags,_that.audioFiles,_that.tracks,_that.chapters,_that.progress,_that.isFinished,_that.hideFromContinueListening);case Podcast() when podcast != null:
return podcast(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.episodeId,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.genres,_that.tags,_that.episodes,_that.feedUrl,_that.lastEpisodeCheck,_that.progress,_that.isFinished,_that.hideFromContinueListening);case _:
  return null;

}
}

}

/// @nodoc


class Audiobook extends LibraryItem {
  const Audiobook({required this.id, required this.libraryId, required this.addedAt, required this.updatedAt, required this.isMissing, required this.size, required this.duration, this.title, this.authorName, this.description, this.language, this.explicit = false, final  List<String> narrators = const [], final  List<String> genres = const [], final  List<String> tags = const [], final  List<AudioFile> audioFiles = const [], final  List<AudioTrack> tracks = const [], final  List<BookChapter> chapters = const [], this.progress = 0, this.isFinished = false, this.hideFromContinueListening = false}): _narrators = narrators,_genres = genres,_tags = tags,_audioFiles = audioFiles,_tracks = tracks,_chapters = chapters,super._();
  

@override final  String id;
@override final  String libraryId;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;
@override final  bool isMissing;
@override final  int size;
 final  Duration duration;
@override final  String? title;
@override final  String? authorName;
@override final  String? description;
@override final  String? language;
@override@JsonKey() final  bool explicit;
 final  List<String> _narrators;
@JsonKey() List<String> get narrators {
  if (_narrators is EqualUnmodifiableListView) return _narrators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_narrators);
}

 final  List<String> _genres;
@override@JsonKey() List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<AudioFile> _audioFiles;
@JsonKey() List<AudioFile> get audioFiles {
  if (_audioFiles is EqualUnmodifiableListView) return _audioFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_audioFiles);
}

 final  List<AudioTrack> _tracks;
@JsonKey() List<AudioTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}

 final  List<BookChapter> _chapters;
@JsonKey() List<BookChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override@JsonKey() final  double progress;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool hideFromContinueListening;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudiobookCopyWith<Audiobook> get copyWith => _$AudiobookCopyWithImpl<Audiobook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Audiobook&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.size, size) || other.size == size)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other._narrators, _narrators)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._audioFiles, _audioFiles)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,libraryId,addedAt,updatedAt,isMissing,size,duration,title,authorName,description,language,explicit,const DeepCollectionEquality().hash(_narrators),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_audioFiles),const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_chapters),progress,isFinished,hideFromContinueListening]);

@override
String toString() {
  return 'LibraryItem.audiobook(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, size: $size, duration: $duration, title: $title, authorName: $authorName, description: $description, language: $language, explicit: $explicit, narrators: $narrators, genres: $genres, tags: $tags, audioFiles: $audioFiles, tracks: $tracks, chapters: $chapters, progress: $progress, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening)';
}


}

/// @nodoc
abstract mixin class $AudiobookCopyWith<$Res> implements $LibraryItemCopyWith<$Res> {
  factory $AudiobookCopyWith(Audiobook value, $Res Function(Audiobook) _then) = _$AudiobookCopyWithImpl;
@override @useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, int size, Duration duration, String? title, String? authorName, String? description, String? language, bool explicit, List<String> narrators, List<String> genres, List<String> tags, List<AudioFile> audioFiles, List<AudioTrack> tracks, List<BookChapter> chapters, double progress, bool isFinished, bool hideFromContinueListening
});




}
/// @nodoc
class _$AudiobookCopyWithImpl<$Res>
    implements $AudiobookCopyWith<$Res> {
  _$AudiobookCopyWithImpl(this._self, this._then);

  final Audiobook _self;
  final $Res Function(Audiobook) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? libraryId = null,Object? addedAt = null,Object? updatedAt = null,Object? isMissing = null,Object? size = null,Object? duration = null,Object? title = freezed,Object? authorName = freezed,Object? description = freezed,Object? language = freezed,Object? explicit = null,Object? narrators = null,Object? genres = null,Object? tags = null,Object? audioFiles = null,Object? tracks = null,Object? chapters = null,Object? progress = null,Object? isFinished = null,Object? hideFromContinueListening = null,}) {
  return _then(Audiobook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,narrators: null == narrators ? _self._narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<String>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,audioFiles: null == audioFiles ? _self._audioFiles : audioFiles // ignore: cast_nullable_to_non_nullable
as List<AudioFile>,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Podcast extends LibraryItem {
  const Podcast({required this.id, required this.libraryId, required this.addedAt, required this.updatedAt, required this.isMissing, required this.size, this.episodeId, this.title, this.authorName, this.description, this.language, this.explicit = false, final  List<String> genres = const [], final  List<String> tags = const [], final  List<PodcastEpisode> episodes = const [], this.feedUrl, this.lastEpisodeCheck, this.progress = 0, this.isFinished = false, this.hideFromContinueListening = false}): _genres = genres,_tags = tags,_episodes = episodes,super._();
  

@override final  String id;
@override final  String libraryId;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;
@override final  bool isMissing;
@override final  int size;
 final  String? episodeId;
@override final  String? title;
@override final  String? authorName;
@override final  String? description;
@override final  String? language;
@override@JsonKey() final  bool explicit;
 final  List<String> _genres;
@override@JsonKey() List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<PodcastEpisode> _episodes;
@JsonKey() List<PodcastEpisode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}

 final  Uri? feedUrl;
 final  DateTime? lastEpisodeCheck;
@override@JsonKey() final  double progress;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool hideFromContinueListening;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastCopyWith<Podcast> get copyWith => _$PodcastCopyWithImpl<Podcast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Podcast&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.size, size) || other.size == size)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.lastEpisodeCheck, lastEpisodeCheck) || other.lastEpisodeCheck == lastEpisodeCheck)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,libraryId,addedAt,updatedAt,isMissing,size,episodeId,title,authorName,description,language,explicit,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_episodes),feedUrl,lastEpisodeCheck,progress,isFinished,hideFromContinueListening]);

@override
String toString() {
  return 'LibraryItem.podcast(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, size: $size, episodeId: $episodeId, title: $title, authorName: $authorName, description: $description, language: $language, explicit: $explicit, genres: $genres, tags: $tags, episodes: $episodes, feedUrl: $feedUrl, lastEpisodeCheck: $lastEpisodeCheck, progress: $progress, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening)';
}


}

/// @nodoc
abstract mixin class $PodcastCopyWith<$Res> implements $LibraryItemCopyWith<$Res> {
  factory $PodcastCopyWith(Podcast value, $Res Function(Podcast) _then) = _$PodcastCopyWithImpl;
@override @useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, int size, String? episodeId, String? title, String? authorName, String? description, String? language, bool explicit, List<String> genres, List<String> tags, List<PodcastEpisode> episodes, Uri? feedUrl, DateTime? lastEpisodeCheck, double progress, bool isFinished, bool hideFromContinueListening
});




}
/// @nodoc
class _$PodcastCopyWithImpl<$Res>
    implements $PodcastCopyWith<$Res> {
  _$PodcastCopyWithImpl(this._self, this._then);

  final Podcast _self;
  final $Res Function(Podcast) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? libraryId = null,Object? addedAt = null,Object? updatedAt = null,Object? isMissing = null,Object? size = null,Object? episodeId = freezed,Object? title = freezed,Object? authorName = freezed,Object? description = freezed,Object? language = freezed,Object? explicit = null,Object? genres = null,Object? tags = null,Object? episodes = null,Object? feedUrl = freezed,Object? lastEpisodeCheck = freezed,Object? progress = null,Object? isFinished = null,Object? hideFromContinueListening = null,}) {
  return _then(Podcast(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<PodcastEpisode>,feedUrl: freezed == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
