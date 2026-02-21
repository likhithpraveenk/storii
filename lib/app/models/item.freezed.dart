// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemDomain {

 String get id; String get libraryId; DateTime get addedAt; DateTime get updatedAt; bool get isMissing; int get size; String? get title; String? get authorName; String? get description; String? get language; bool get explicit; List<String> get genres; List<String> get tags; double get progress; bool get isFinished; bool get hideFromContinueListening;
/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemDomainCopyWith<ItemDomain> get copyWith => _$ItemDomainCopyWithImpl<ItemDomain>(this as ItemDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.size, size) || other.size == size)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening));
}


@override
int get hashCode => Object.hash(runtimeType,id,libraryId,addedAt,updatedAt,isMissing,size,title,authorName,description,language,explicit,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(tags),progress,isFinished,hideFromContinueListening);

@override
String toString() {
  return 'ItemDomain(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, size: $size, title: $title, authorName: $authorName, description: $description, language: $language, explicit: $explicit, genres: $genres, tags: $tags, progress: $progress, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening)';
}


}

/// @nodoc
abstract mixin class $ItemDomainCopyWith<$Res>  {
  factory $ItemDomainCopyWith(ItemDomain value, $Res Function(ItemDomain) _then) = _$ItemDomainCopyWithImpl;
@useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, int size, String? title, String? authorName, String? description, String? language, bool explicit, List<String> genres, List<String> tags, double progress, bool isFinished, bool hideFromContinueListening
});




}
/// @nodoc
class _$ItemDomainCopyWithImpl<$Res>
    implements $ItemDomainCopyWith<$Res> {
  _$ItemDomainCopyWithImpl(this._self, this._then);

  final ItemDomain _self;
  final $Res Function(ItemDomain) _then;

/// Create a copy of ItemDomain
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


/// Adds pattern-matching-related methods to [ItemDomain].
extension ItemDomainPatterns on ItemDomain {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  Duration duration,  String? title,  List<AuthorDomain> authors,  String? authorName,  List<SeriesDomain> series,  String? seriesSequence,  String? description,  String? language,  bool explicit,  List<String> narrators,  List<String> genres,  List<String> tags,  List<AudioTrack> tracks,  List<BookChapter> chapters,  double progress,  Duration currentOffset,  bool isFinished,  bool hideFromContinueListening)?  audiobook,TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  String? episodeId,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> genres,  List<String> tags,  List<PodcastEpisodeDomain> episodes,  Uri? feedUrl,  DateTime? lastEpisodeCheck,  double progress,  bool isFinished,  bool hideFromContinueListening)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Audiobook() when audiobook != null:
return audiobook(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.duration,_that.title,_that.authors,_that.authorName,_that.series,_that.seriesSequence,_that.description,_that.language,_that.explicit,_that.narrators,_that.genres,_that.tags,_that.tracks,_that.chapters,_that.progress,_that.currentOffset,_that.isFinished,_that.hideFromContinueListening);case Podcast() when podcast != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  Duration duration,  String? title,  List<AuthorDomain> authors,  String? authorName,  List<SeriesDomain> series,  String? seriesSequence,  String? description,  String? language,  bool explicit,  List<String> narrators,  List<String> genres,  List<String> tags,  List<AudioTrack> tracks,  List<BookChapter> chapters,  double progress,  Duration currentOffset,  bool isFinished,  bool hideFromContinueListening)  audiobook,required TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  String? episodeId,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> genres,  List<String> tags,  List<PodcastEpisodeDomain> episodes,  Uri? feedUrl,  DateTime? lastEpisodeCheck,  double progress,  bool isFinished,  bool hideFromContinueListening)  podcast,}) {final _that = this;
switch (_that) {
case Audiobook():
return audiobook(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.duration,_that.title,_that.authors,_that.authorName,_that.series,_that.seriesSequence,_that.description,_that.language,_that.explicit,_that.narrators,_that.genres,_that.tags,_that.tracks,_that.chapters,_that.progress,_that.currentOffset,_that.isFinished,_that.hideFromContinueListening);case Podcast():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  Duration duration,  String? title,  List<AuthorDomain> authors,  String? authorName,  List<SeriesDomain> series,  String? seriesSequence,  String? description,  String? language,  bool explicit,  List<String> narrators,  List<String> genres,  List<String> tags,  List<AudioTrack> tracks,  List<BookChapter> chapters,  double progress,  Duration currentOffset,  bool isFinished,  bool hideFromContinueListening)?  audiobook,TResult? Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  int size,  String? episodeId,  String? title,  String? authorName,  String? description,  String? language,  bool explicit,  List<String> genres,  List<String> tags,  List<PodcastEpisodeDomain> episodes,  Uri? feedUrl,  DateTime? lastEpisodeCheck,  double progress,  bool isFinished,  bool hideFromContinueListening)?  podcast,}) {final _that = this;
switch (_that) {
case Audiobook() when audiobook != null:
return audiobook(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.duration,_that.title,_that.authors,_that.authorName,_that.series,_that.seriesSequence,_that.description,_that.language,_that.explicit,_that.narrators,_that.genres,_that.tags,_that.tracks,_that.chapters,_that.progress,_that.currentOffset,_that.isFinished,_that.hideFromContinueListening);case Podcast() when podcast != null:
return podcast(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.size,_that.episodeId,_that.title,_that.authorName,_that.description,_that.language,_that.explicit,_that.genres,_that.tags,_that.episodes,_that.feedUrl,_that.lastEpisodeCheck,_that.progress,_that.isFinished,_that.hideFromContinueListening);case _:
  return null;

}
}

}

/// @nodoc


class Audiobook extends ItemDomain {
  const Audiobook({required this.id, required this.libraryId, required this.addedAt, required this.updatedAt, required this.isMissing, required this.size, required this.duration, this.title, final  List<AuthorDomain> authors = const [], this.authorName, final  List<SeriesDomain> series = const [], this.seriesSequence, this.description, this.language, this.explicit = false, final  List<String> narrators = const [], final  List<String> genres = const [], final  List<String> tags = const [], final  List<AudioTrack> tracks = const [], final  List<BookChapter> chapters = const [], this.progress = 0, this.currentOffset = Duration.zero, this.isFinished = false, this.hideFromContinueListening = false}): _authors = authors,_series = series,_narrators = narrators,_genres = genres,_tags = tags,_tracks = tracks,_chapters = chapters,super._();
  

@override final  String id;
@override final  String libraryId;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;
@override final  bool isMissing;
@override final  int size;
 final  Duration duration;
@override final  String? title;
 final  List<AuthorDomain> _authors;
@JsonKey() List<AuthorDomain> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  String? authorName;
 final  List<SeriesDomain> _series;
@JsonKey() List<SeriesDomain> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}

 final  String? seriesSequence;
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
@JsonKey() final  Duration currentOffset;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool hideFromContinueListening;

/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudiobookCopyWith<Audiobook> get copyWith => _$AudiobookCopyWithImpl<Audiobook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Audiobook&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.size, size) || other.size == size)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other._series, _series)&&(identical(other.seriesSequence, seriesSequence) || other.seriesSequence == seriesSequence)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other._narrators, _narrators)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.currentOffset, currentOffset) || other.currentOffset == currentOffset)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,libraryId,addedAt,updatedAt,isMissing,size,duration,title,const DeepCollectionEquality().hash(_authors),authorName,const DeepCollectionEquality().hash(_series),seriesSequence,description,language,explicit,const DeepCollectionEquality().hash(_narrators),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_chapters),progress,currentOffset,isFinished,hideFromContinueListening]);

@override
String toString() {
  return 'ItemDomain.audiobook(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, size: $size, duration: $duration, title: $title, authors: $authors, authorName: $authorName, series: $series, seriesSequence: $seriesSequence, description: $description, language: $language, explicit: $explicit, narrators: $narrators, genres: $genres, tags: $tags, tracks: $tracks, chapters: $chapters, progress: $progress, currentOffset: $currentOffset, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening)';
}


}

/// @nodoc
abstract mixin class $AudiobookCopyWith<$Res> implements $ItemDomainCopyWith<$Res> {
  factory $AudiobookCopyWith(Audiobook value, $Res Function(Audiobook) _then) = _$AudiobookCopyWithImpl;
@override @useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, int size, Duration duration, String? title, List<AuthorDomain> authors, String? authorName, List<SeriesDomain> series, String? seriesSequence, String? description, String? language, bool explicit, List<String> narrators, List<String> genres, List<String> tags, List<AudioTrack> tracks, List<BookChapter> chapters, double progress, Duration currentOffset, bool isFinished, bool hideFromContinueListening
});




}
/// @nodoc
class _$AudiobookCopyWithImpl<$Res>
    implements $AudiobookCopyWith<$Res> {
  _$AudiobookCopyWithImpl(this._self, this._then);

  final Audiobook _self;
  final $Res Function(Audiobook) _then;

/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? libraryId = null,Object? addedAt = null,Object? updatedAt = null,Object? isMissing = null,Object? size = null,Object? duration = null,Object? title = freezed,Object? authors = null,Object? authorName = freezed,Object? series = null,Object? seriesSequence = freezed,Object? description = freezed,Object? language = freezed,Object? explicit = null,Object? narrators = null,Object? genres = null,Object? tags = null,Object? tracks = null,Object? chapters = null,Object? progress = null,Object? currentOffset = null,Object? isFinished = null,Object? hideFromContinueListening = null,}) {
  return _then(Audiobook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<AuthorDomain>,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<SeriesDomain>,seriesSequence: freezed == seriesSequence ? _self.seriesSequence : seriesSequence // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,narrators: null == narrators ? _self._narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<String>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,currentOffset: null == currentOffset ? _self.currentOffset : currentOffset // ignore: cast_nullable_to_non_nullable
as Duration,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Podcast extends ItemDomain {
  const Podcast({required this.id, required this.libraryId, required this.addedAt, required this.updatedAt, required this.isMissing, required this.size, this.episodeId, this.title, this.authorName, this.description, this.language, this.explicit = false, final  List<String> genres = const [], final  List<String> tags = const [], final  List<PodcastEpisodeDomain> episodes = const [], this.feedUrl, this.lastEpisodeCheck, this.progress = 0, this.isFinished = false, this.hideFromContinueListening = false}): _genres = genres,_tags = tags,_episodes = episodes,super._();
  

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

 final  List<PodcastEpisodeDomain> _episodes;
@JsonKey() List<PodcastEpisodeDomain> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}

 final  Uri? feedUrl;
 final  DateTime? lastEpisodeCheck;
@override@JsonKey() final  double progress;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool hideFromContinueListening;

/// Create a copy of ItemDomain
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
  return 'ItemDomain.podcast(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, size: $size, episodeId: $episodeId, title: $title, authorName: $authorName, description: $description, language: $language, explicit: $explicit, genres: $genres, tags: $tags, episodes: $episodes, feedUrl: $feedUrl, lastEpisodeCheck: $lastEpisodeCheck, progress: $progress, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening)';
}


}

/// @nodoc
abstract mixin class $PodcastCopyWith<$Res> implements $ItemDomainCopyWith<$Res> {
  factory $PodcastCopyWith(Podcast value, $Res Function(Podcast) _then) = _$PodcastCopyWithImpl;
@override @useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, int size, String? episodeId, String? title, String? authorName, String? description, String? language, bool explicit, List<String> genres, List<String> tags, List<PodcastEpisodeDomain> episodes, Uri? feedUrl, DateTime? lastEpisodeCheck, double progress, bool isFinished, bool hideFromContinueListening
});




}
/// @nodoc
class _$PodcastCopyWithImpl<$Res>
    implements $PodcastCopyWith<$Res> {
  _$PodcastCopyWithImpl(this._self, this._then);

  final Podcast _self;
  final $Res Function(Podcast) _then;

/// Create a copy of ItemDomain
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
as List<PodcastEpisodeDomain>,feedUrl: freezed == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
