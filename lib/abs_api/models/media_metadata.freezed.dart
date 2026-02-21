// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MediaMetadata _$MediaMetadataFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'book':
          return BookMetadata.fromJson(
            json
          );
                case 'podcast':
          return PodcastMetadata.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MediaMetadata',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MediaMetadata {

 String? get title; String? get titleIgnorePrefix; List<String> get genres; String? get description; String? get language; bool get explicit;
/// Create a copy of MediaMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<MediaMetadata> get copyWith => _$MediaMetadataCopyWithImpl<MediaMetadata>(this as MediaMetadata, _$identity);

  /// Serializes this MediaMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.titleIgnorePrefix, titleIgnorePrefix) || other.titleIgnorePrefix == titleIgnorePrefix)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,titleIgnorePrefix,const DeepCollectionEquality().hash(genres),description,language,explicit);

@override
String toString() {
  return 'MediaMetadata(title: $title, titleIgnorePrefix: $titleIgnorePrefix, genres: $genres, description: $description, language: $language, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $MediaMetadataCopyWith<$Res>  {
  factory $MediaMetadataCopyWith(MediaMetadata value, $Res Function(MediaMetadata) _then) = _$MediaMetadataCopyWithImpl;
@useResult
$Res call({
 String? title, String? titleIgnorePrefix, List<String> genres, String? description, String? language, bool explicit
});




}
/// @nodoc
class _$MediaMetadataCopyWithImpl<$Res>
    implements $MediaMetadataCopyWith<$Res> {
  _$MediaMetadataCopyWithImpl(this._self, this._then);

  final MediaMetadata _self;
  final $Res Function(MediaMetadata) _then;

/// Create a copy of MediaMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? titleIgnorePrefix = freezed,Object? genres = null,Object? description = freezed,Object? language = freezed,Object? explicit = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleIgnorePrefix: freezed == titleIgnorePrefix ? _self.titleIgnorePrefix : titleIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaMetadata].
extension MediaMetadataPatterns on MediaMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookMetadata value)?  book,TResult Function( PodcastMetadata value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookMetadata() when book != null:
return book(_that);case PodcastMetadata() when podcast != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookMetadata value)  book,required TResult Function( PodcastMetadata value)  podcast,}){
final _that = this;
switch (_that) {
case BookMetadata():
return book(_that);case PodcastMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookMetadata value)?  book,TResult? Function( PodcastMetadata value)?  podcast,}){
final _that = this;
switch (_that) {
case BookMetadata() when book != null:
return book(_that);case PodcastMetadata() when podcast != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? title,  String? titleIgnorePrefix,  String? subtitle,  List<Author>? authors,  List<String>? narrators, @JsonKey(readValue: readSeries)  List<Series>? series,  List<String> genres,  String? publishedYear,  String? publishedDate,  String? publisher,  String? description,  String? isbn,  String? asin,  String? language,  bool explicit,  bool? abridged,  String? authorName,  String? authorNameLF,  String? narratorName,  String? seriesName,  String? descriptionPlain)?  book,TResult Function( String? title,  String? titleIgnorePrefix,  String? author,  String? description,  DateTime? releaseDate,  List<String> genres,  Uri? feedUrl,  Uri? imageUrl,  Uri? itunesPageUrl,  int? itunesId,  int? itunesArtistId,  bool explicit,  String? language)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookMetadata() when book != null:
return book(_that.title,_that.titleIgnorePrefix,_that.subtitle,_that.authors,_that.narrators,_that.series,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.isbn,_that.asin,_that.language,_that.explicit,_that.abridged,_that.authorName,_that.authorNameLF,_that.narratorName,_that.seriesName,_that.descriptionPlain);case PodcastMetadata() when podcast != null:
return podcast(_that.title,_that.titleIgnorePrefix,_that.author,_that.description,_that.releaseDate,_that.genres,_that.feedUrl,_that.imageUrl,_that.itunesPageUrl,_that.itunesId,_that.itunesArtistId,_that.explicit,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? title,  String? titleIgnorePrefix,  String? subtitle,  List<Author>? authors,  List<String>? narrators, @JsonKey(readValue: readSeries)  List<Series>? series,  List<String> genres,  String? publishedYear,  String? publishedDate,  String? publisher,  String? description,  String? isbn,  String? asin,  String? language,  bool explicit,  bool? abridged,  String? authorName,  String? authorNameLF,  String? narratorName,  String? seriesName,  String? descriptionPlain)  book,required TResult Function( String? title,  String? titleIgnorePrefix,  String? author,  String? description,  DateTime? releaseDate,  List<String> genres,  Uri? feedUrl,  Uri? imageUrl,  Uri? itunesPageUrl,  int? itunesId,  int? itunesArtistId,  bool explicit,  String? language)  podcast,}) {final _that = this;
switch (_that) {
case BookMetadata():
return book(_that.title,_that.titleIgnorePrefix,_that.subtitle,_that.authors,_that.narrators,_that.series,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.isbn,_that.asin,_that.language,_that.explicit,_that.abridged,_that.authorName,_that.authorNameLF,_that.narratorName,_that.seriesName,_that.descriptionPlain);case PodcastMetadata():
return podcast(_that.title,_that.titleIgnorePrefix,_that.author,_that.description,_that.releaseDate,_that.genres,_that.feedUrl,_that.imageUrl,_that.itunesPageUrl,_that.itunesId,_that.itunesArtistId,_that.explicit,_that.language);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? title,  String? titleIgnorePrefix,  String? subtitle,  List<Author>? authors,  List<String>? narrators, @JsonKey(readValue: readSeries)  List<Series>? series,  List<String> genres,  String? publishedYear,  String? publishedDate,  String? publisher,  String? description,  String? isbn,  String? asin,  String? language,  bool explicit,  bool? abridged,  String? authorName,  String? authorNameLF,  String? narratorName,  String? seriesName,  String? descriptionPlain)?  book,TResult? Function( String? title,  String? titleIgnorePrefix,  String? author,  String? description,  DateTime? releaseDate,  List<String> genres,  Uri? feedUrl,  Uri? imageUrl,  Uri? itunesPageUrl,  int? itunesId,  int? itunesArtistId,  bool explicit,  String? language)?  podcast,}) {final _that = this;
switch (_that) {
case BookMetadata() when book != null:
return book(_that.title,_that.titleIgnorePrefix,_that.subtitle,_that.authors,_that.narrators,_that.series,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.isbn,_that.asin,_that.language,_that.explicit,_that.abridged,_that.authorName,_that.authorNameLF,_that.narratorName,_that.seriesName,_that.descriptionPlain);case PodcastMetadata() when podcast != null:
return podcast(_that.title,_that.titleIgnorePrefix,_that.author,_that.description,_that.releaseDate,_that.genres,_that.feedUrl,_that.imageUrl,_that.itunesPageUrl,_that.itunesId,_that.itunesArtistId,_that.explicit,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class BookMetadata extends MediaMetadata {
  const BookMetadata({this.title, this.titleIgnorePrefix, this.subtitle, final  List<Author>? authors, final  List<String>? narrators, @JsonKey(readValue: readSeries) final  List<Series>? series, final  List<String> genres = const [], this.publishedYear, this.publishedDate, this.publisher, this.description, this.isbn, this.asin, this.language, this.explicit = false, this.abridged, this.authorName, this.authorNameLF, this.narratorName, this.seriesName, this.descriptionPlain, final  String? $type}): _authors = authors,_narrators = narrators,_series = series,_genres = genres,$type = $type ?? 'book',super._();
  factory BookMetadata.fromJson(Map<String, dynamic> json) => _$BookMetadataFromJson(json);

@override final  String? title;
@override final  String? titleIgnorePrefix;
 final  String? subtitle;
 final  List<Author>? _authors;
 List<Author>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _narrators;
 List<String>? get narrators {
  final value = _narrators;
  if (value == null) return null;
  if (_narrators is EqualUnmodifiableListView) return _narrators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Series>? _series;
@JsonKey(readValue: readSeries) List<Series>? get series {
  final value = _series;
  if (value == null) return null;
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String> _genres;
@override@JsonKey() List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  String? publishedYear;
 final  String? publishedDate;
 final  String? publisher;
@override final  String? description;
 final  String? isbn;
 final  String? asin;
@override final  String? language;
@override@JsonKey() final  bool explicit;
 final  bool? abridged;
 final  String? authorName;
 final  String? authorNameLF;
 final  String? narratorName;
 final  String? seriesName;
 final  String? descriptionPlain;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookMetadataCopyWith<BookMetadata> get copyWith => _$BookMetadataCopyWithImpl<BookMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.titleIgnorePrefix, titleIgnorePrefix) || other.titleIgnorePrefix == titleIgnorePrefix)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._narrators, _narrators)&&const DeepCollectionEquality().equals(other._series, _series)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.description, description) || other.description == description)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.abridged, abridged) || other.abridged == abridged)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorNameLF, authorNameLF) || other.authorNameLF == authorNameLF)&&(identical(other.narratorName, narratorName) || other.narratorName == narratorName)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.descriptionPlain, descriptionPlain) || other.descriptionPlain == descriptionPlain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,titleIgnorePrefix,subtitle,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_narrators),const DeepCollectionEquality().hash(_series),const DeepCollectionEquality().hash(_genres),publishedYear,publishedDate,publisher,description,isbn,asin,language,explicit,abridged,authorName,authorNameLF,narratorName,seriesName,descriptionPlain]);

@override
String toString() {
  return 'MediaMetadata.book(title: $title, titleIgnorePrefix: $titleIgnorePrefix, subtitle: $subtitle, authors: $authors, narrators: $narrators, series: $series, genres: $genres, publishedYear: $publishedYear, publishedDate: $publishedDate, publisher: $publisher, description: $description, isbn: $isbn, asin: $asin, language: $language, explicit: $explicit, abridged: $abridged, authorName: $authorName, authorNameLF: $authorNameLF, narratorName: $narratorName, seriesName: $seriesName, descriptionPlain: $descriptionPlain)';
}


}

/// @nodoc
abstract mixin class $BookMetadataCopyWith<$Res> implements $MediaMetadataCopyWith<$Res> {
  factory $BookMetadataCopyWith(BookMetadata value, $Res Function(BookMetadata) _then) = _$BookMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? titleIgnorePrefix, String? subtitle, List<Author>? authors, List<String>? narrators,@JsonKey(readValue: readSeries) List<Series>? series, List<String> genres, String? publishedYear, String? publishedDate, String? publisher, String? description, String? isbn, String? asin, String? language, bool explicit, bool? abridged, String? authorName, String? authorNameLF, String? narratorName, String? seriesName, String? descriptionPlain
});




}
/// @nodoc
class _$BookMetadataCopyWithImpl<$Res>
    implements $BookMetadataCopyWith<$Res> {
  _$BookMetadataCopyWithImpl(this._self, this._then);

  final BookMetadata _self;
  final $Res Function(BookMetadata) _then;

/// Create a copy of MediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? titleIgnorePrefix = freezed,Object? subtitle = freezed,Object? authors = freezed,Object? narrators = freezed,Object? series = freezed,Object? genres = null,Object? publishedYear = freezed,Object? publishedDate = freezed,Object? publisher = freezed,Object? description = freezed,Object? isbn = freezed,Object? asin = freezed,Object? language = freezed,Object? explicit = null,Object? abridged = freezed,Object? authorName = freezed,Object? authorNameLF = freezed,Object? narratorName = freezed,Object? seriesName = freezed,Object? descriptionPlain = freezed,}) {
  return _then(BookMetadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleIgnorePrefix: freezed == titleIgnorePrefix ? _self.titleIgnorePrefix : titleIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>?,narrators: freezed == narrators ? _self._narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<String>?,series: freezed == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<Series>?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as String?,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,abridged: freezed == abridged ? _self.abridged : abridged // ignore: cast_nullable_to_non_nullable
as bool?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,authorNameLF: freezed == authorNameLF ? _self.authorNameLF : authorNameLF // ignore: cast_nullable_to_non_nullable
as String?,narratorName: freezed == narratorName ? _self.narratorName : narratorName // ignore: cast_nullable_to_non_nullable
as String?,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,descriptionPlain: freezed == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PodcastMetadata extends MediaMetadata {
  const PodcastMetadata({this.title, this.titleIgnorePrefix, this.author, this.description, this.releaseDate, final  List<String> genres = const [], this.feedUrl, this.imageUrl, this.itunesPageUrl, this.itunesId, this.itunesArtistId, this.explicit = false, this.language, final  String? $type}): _genres = genres,$type = $type ?? 'podcast',super._();
  factory PodcastMetadata.fromJson(Map<String, dynamic> json) => _$PodcastMetadataFromJson(json);

@override final  String? title;
@override final  String? titleIgnorePrefix;
 final  String? author;
@override final  String? description;
 final  DateTime? releaseDate;
 final  List<String> _genres;
@override@JsonKey() List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  Uri? feedUrl;
 final  Uri? imageUrl;
 final  Uri? itunesPageUrl;
 final  int? itunesId;
 final  int? itunesArtistId;
@override@JsonKey() final  bool explicit;
@override final  String? language;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastMetadataCopyWith<PodcastMetadata> get copyWith => _$PodcastMetadataCopyWithImpl<PodcastMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.titleIgnorePrefix, titleIgnorePrefix) || other.titleIgnorePrefix == titleIgnorePrefix)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.itunesPageUrl, itunesPageUrl) || other.itunesPageUrl == itunesPageUrl)&&(identical(other.itunesId, itunesId) || other.itunesId == itunesId)&&(identical(other.itunesArtistId, itunesArtistId) || other.itunesArtistId == itunesArtistId)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,titleIgnorePrefix,author,description,releaseDate,const DeepCollectionEquality().hash(_genres),feedUrl,imageUrl,itunesPageUrl,itunesId,itunesArtistId,explicit,language);

@override
String toString() {
  return 'MediaMetadata.podcast(title: $title, titleIgnorePrefix: $titleIgnorePrefix, author: $author, description: $description, releaseDate: $releaseDate, genres: $genres, feedUrl: $feedUrl, imageUrl: $imageUrl, itunesPageUrl: $itunesPageUrl, itunesId: $itunesId, itunesArtistId: $itunesArtistId, explicit: $explicit, language: $language)';
}


}

/// @nodoc
abstract mixin class $PodcastMetadataCopyWith<$Res> implements $MediaMetadataCopyWith<$Res> {
  factory $PodcastMetadataCopyWith(PodcastMetadata value, $Res Function(PodcastMetadata) _then) = _$PodcastMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? titleIgnorePrefix, String? author, String? description, DateTime? releaseDate, List<String> genres, Uri? feedUrl, Uri? imageUrl, Uri? itunesPageUrl, int? itunesId, int? itunesArtistId, bool explicit, String? language
});




}
/// @nodoc
class _$PodcastMetadataCopyWithImpl<$Res>
    implements $PodcastMetadataCopyWith<$Res> {
  _$PodcastMetadataCopyWithImpl(this._self, this._then);

  final PodcastMetadata _self;
  final $Res Function(PodcastMetadata) _then;

/// Create a copy of MediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? titleIgnorePrefix = freezed,Object? author = freezed,Object? description = freezed,Object? releaseDate = freezed,Object? genres = null,Object? feedUrl = freezed,Object? imageUrl = freezed,Object? itunesPageUrl = freezed,Object? itunesId = freezed,Object? itunesArtistId = freezed,Object? explicit = null,Object? language = freezed,}) {
  return _then(PodcastMetadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleIgnorePrefix: freezed == titleIgnorePrefix ? _self.titleIgnorePrefix : titleIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,feedUrl: freezed == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as Uri?,itunesPageUrl: freezed == itunesPageUrl ? _self.itunesPageUrl : itunesPageUrl // ignore: cast_nullable_to_non_nullable
as Uri?,itunesId: freezed == itunesId ? _self.itunesId : itunesId // ignore: cast_nullable_to_non_nullable
as int?,itunesArtistId: freezed == itunesArtistId ? _self.itunesArtistId : itunesArtistId // ignore: cast_nullable_to_non_nullable
as int?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
