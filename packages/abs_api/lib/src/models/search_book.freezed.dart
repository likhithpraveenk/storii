// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchBook {

 String? get title; String? get subtitle; String? get author; String? get narrator; String? get publisher; String? get publishedYear; String? get description; String? get cover; String? get asin; String? get isbn; List<String> get genres; List<String> get tags; List<SearchSeries> get series; String? get language;@DurationMinConverter() Duration? get duration; String? get region; String? get rating; bool get abridged; String? get descriptionPlain; double get matchConfidence;
/// Create a copy of SearchBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchBookCopyWith<SearchBook> get copyWith => _$SearchBookCopyWithImpl<SearchBook>(this as SearchBook, _$identity);

  /// Serializes this SearchBook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SearchBook;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchBook&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.narrator, _this.narrator) || other.narrator == _this.narrator)&&(identical(other.publisher, _this.publisher) || other.publisher == _this.publisher)&&(identical(other.publishedYear, _this.publishedYear) || other.publishedYear == _this.publishedYear)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.cover, _this.cover) || other.cover == _this.cover)&&(identical(other.asin, _this.asin) || other.asin == _this.asin)&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn)&&const DeepCollectionEquality().equals(other.genres, _this.genres)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.series, _this.series)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.abridged, _this.abridged) || other.abridged == _this.abridged)&&(identical(other.descriptionPlain, _this.descriptionPlain) || other.descriptionPlain == _this.descriptionPlain)&&(identical(other.matchConfidence, _this.matchConfidence) || other.matchConfidence == _this.matchConfidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SearchBook;
  return Object.hashAll([runtimeType,_this.title,_this.subtitle,_this.author,_this.narrator,_this.publisher,_this.publishedYear,_this.description,_this.cover,_this.asin,_this.isbn,const DeepCollectionEquality().hash(_this.genres),const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.series),_this.language,_this.duration,_this.region,_this.rating,_this.abridged,_this.descriptionPlain,_this.matchConfidence]);
}

@override
String toString() {
  final _this = this as SearchBook;
  return 'SearchBook(title: ${_this.title}, subtitle: ${_this.subtitle}, author: ${_this.author}, narrator: ${_this.narrator}, publisher: ${_this.publisher}, publishedYear: ${_this.publishedYear}, description: ${_this.description}, cover: ${_this.cover}, asin: ${_this.asin}, isbn: ${_this.isbn}, genres: ${_this.genres}, tags: ${_this.tags}, series: ${_this.series}, language: ${_this.language}, duration: ${_this.duration}, region: ${_this.region}, rating: ${_this.rating}, abridged: ${_this.abridged}, descriptionPlain: ${_this.descriptionPlain}, matchConfidence: ${_this.matchConfidence})';
}


}

/// @nodoc
abstract mixin class $SearchBookCopyWith<$Res>  {
  factory $SearchBookCopyWith(SearchBook value, $Res Function(SearchBook) _then) = _$SearchBookCopyWithImpl;
@useResult
$Res call({
 String? title, String? subtitle, String? author, String? narrator, String? publisher, String? publishedYear, String? description, String? cover, String? asin, String? isbn, List<String> genres, List<String> tags, List<SearchSeries> series, String? language,@DurationMinConverter() Duration? duration, String? region, String? rating, bool abridged, String? descriptionPlain, double matchConfidence
});




}
/// @nodoc
class _$SearchBookCopyWithImpl<$Res>
    implements $SearchBookCopyWith<$Res> {
  _$SearchBookCopyWithImpl(this._self, this._then);

  final SearchBook _self;
  final $Res Function(SearchBook) _then;

/// Create a copy of SearchBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? subtitle = freezed,Object? author = freezed,Object? narrator = freezed,Object? publisher = freezed,Object? publishedYear = freezed,Object? description = freezed,Object? cover = freezed,Object? asin = freezed,Object? isbn = freezed,Object? genres = null,Object? tags = null,Object? series = null,Object? language = freezed,Object? duration = freezed,Object? region = freezed,Object? rating = freezed,Object? abridged = null,Object? descriptionPlain = freezed,Object? matchConfidence = null,}) {
  return _then(SearchBook(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<SearchSeries>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String?,abridged: null == abridged ? _self.abridged : abridged // ignore: cast_nullable_to_non_nullable
as bool,descriptionPlain: freezed == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String?,matchConfidence: null == matchConfidence ? _self.matchConfidence : matchConfidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchBook].
extension SearchBookPatterns on SearchBook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchBook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchBook value)  $default,){
final _that = this;
switch (_that) {
case _SearchBook():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchBook value)?  $default,){
final _that = this;
switch (_that) {
case _SearchBook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? subtitle,  String? author,  String? narrator,  String? publisher,  String? publishedYear,  String? description,  String? cover,  String? asin,  String? isbn,  List<String> genres,  List<String> tags,  List<SearchSeries> series,  String? language, @DurationMinConverter()  Duration? duration,  String? region,  String? rating,  bool abridged,  String? descriptionPlain,  double matchConfidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchBook() when $default != null:
return $default(_that.title,_that.subtitle,_that.author,_that.narrator,_that.publisher,_that.publishedYear,_that.description,_that.cover,_that.asin,_that.isbn,_that.genres,_that.tags,_that.series,_that.language,_that.duration,_that.region,_that.rating,_that.abridged,_that.descriptionPlain,_that.matchConfidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? subtitle,  String? author,  String? narrator,  String? publisher,  String? publishedYear,  String? description,  String? cover,  String? asin,  String? isbn,  List<String> genres,  List<String> tags,  List<SearchSeries> series,  String? language, @DurationMinConverter()  Duration? duration,  String? region,  String? rating,  bool abridged,  String? descriptionPlain,  double matchConfidence)  $default,) {final _that = this;
switch (_that) {
case _SearchBook():
return $default(_that.title,_that.subtitle,_that.author,_that.narrator,_that.publisher,_that.publishedYear,_that.description,_that.cover,_that.asin,_that.isbn,_that.genres,_that.tags,_that.series,_that.language,_that.duration,_that.region,_that.rating,_that.abridged,_that.descriptionPlain,_that.matchConfidence);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? subtitle,  String? author,  String? narrator,  String? publisher,  String? publishedYear,  String? description,  String? cover,  String? asin,  String? isbn,  List<String> genres,  List<String> tags,  List<SearchSeries> series,  String? language, @DurationMinConverter()  Duration? duration,  String? region,  String? rating,  bool abridged,  String? descriptionPlain,  double matchConfidence)?  $default,) {final _that = this;
switch (_that) {
case _SearchBook() when $default != null:
return $default(_that.title,_that.subtitle,_that.author,_that.narrator,_that.publisher,_that.publishedYear,_that.description,_that.cover,_that.asin,_that.isbn,_that.genres,_that.tags,_that.series,_that.language,_that.duration,_that.region,_that.rating,_that.abridged,_that.descriptionPlain,_that.matchConfidence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchBook implements SearchBook {
  const _SearchBook({this.title, this.subtitle, this.author, this.narrator, this.publisher, this.publishedYear, this.description, this.cover, this.asin, this.isbn,  List<String> genres = const [],  List<String> tags = const [],  List<SearchSeries> series = const [], this.language, @DurationMinConverter() this.duration, this.region, this.rating, this.abridged = false, this.descriptionPlain, this.matchConfidence = 0}): _genres = genres,_tags = tags,_series = series;
  factory _SearchBook.fromJson(Map<String, dynamic> json) => _$SearchBookFromJson(json);

@override final  String? title;
@override final  String? subtitle;
@override final  String? author;
@override final  String? narrator;
@override final  String? publisher;
@override final  String? publishedYear;
@override final  String? description;
@override final  String? cover;
@override final  String? asin;
@override final  String? isbn;
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

 final  List<SearchSeries> _series;
@override@JsonKey() List<SearchSeries> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}

@override final  String? language;
@override@DurationMinConverter() final  Duration? duration;
@override final  String? region;
@override final  String? rating;
@override@JsonKey() final  bool abridged;
@override final  String? descriptionPlain;
@override@JsonKey() final  double matchConfidence;

/// Create a copy of SearchBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchBookCopyWith<_SearchBook> get copyWith => __$SearchBookCopyWithImpl<_SearchBook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchBookToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchBook&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.author, author) || other.author == author)&&(identical(other.narrator, narrator) || other.narrator == narrator)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&const DeepCollectionEquality().equals(other.genres, _genres)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.series, _series)&&(identical(other.language, language) || other.language == language)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.region, region) || other.region == region)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.abridged, abridged) || other.abridged == abridged)&&(identical(other.descriptionPlain, descriptionPlain) || other.descriptionPlain == descriptionPlain)&&(identical(other.matchConfidence, matchConfidence) || other.matchConfidence == matchConfidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,title,subtitle,author,narrator,publisher,publishedYear,description,cover,asin,isbn,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_series),language,duration,region,rating,abridged,descriptionPlain,matchConfidence]);
}

@override
String toString() {
    return 'SearchBook(title: $title, subtitle: $subtitle, author: $author, narrator: $narrator, publisher: $publisher, publishedYear: $publishedYear, description: $description, cover: $cover, asin: $asin, isbn: $isbn, genres: $genres, tags: $tags, series: $series, language: $language, duration: $duration, region: $region, rating: $rating, abridged: $abridged, descriptionPlain: $descriptionPlain, matchConfidence: $matchConfidence)';
}


}

/// @nodoc
abstract mixin class _$SearchBookCopyWith<$Res> implements $SearchBookCopyWith<$Res> {
  factory _$SearchBookCopyWith(_SearchBook value, $Res Function(_SearchBook) _then) = __$SearchBookCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? subtitle, String? author, String? narrator, String? publisher, String? publishedYear, String? description, String? cover, String? asin, String? isbn, List<String> genres, List<String> tags, List<SearchSeries> series, String? language,@DurationMinConverter() Duration? duration, String? region, String? rating, bool abridged, String? descriptionPlain, double matchConfidence
});




}
/// @nodoc
class __$SearchBookCopyWithImpl<$Res>
    implements _$SearchBookCopyWith<$Res> {
  __$SearchBookCopyWithImpl(this._self, this._then);

  final _SearchBook _self;
  final $Res Function(_SearchBook) _then;

/// Create a copy of SearchBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? subtitle = freezed,Object? author = freezed,Object? narrator = freezed,Object? publisher = freezed,Object? publishedYear = freezed,Object? description = freezed,Object? cover = freezed,Object? asin = freezed,Object? isbn = freezed,Object? genres = null,Object? tags = null,Object? series = null,Object? language = freezed,Object? duration = freezed,Object? region = freezed,Object? rating = freezed,Object? abridged = null,Object? descriptionPlain = freezed,Object? matchConfidence = null,}) {
  return _then(_SearchBook(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<SearchSeries>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String?,abridged: null == abridged ? _self.abridged : abridged // ignore: cast_nullable_to_non_nullable
as bool,descriptionPlain: freezed == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String?,matchConfidence: null == matchConfidence ? _self.matchConfidence : matchConfidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SearchSeries {

 String get series; String? get sequence;
/// Create a copy of SearchSeries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSeriesCopyWith<SearchSeries> get copyWith => _$SearchSeriesCopyWithImpl<SearchSeries>(this as SearchSeries, _$identity);

  /// Serializes this SearchSeries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SearchSeries;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSeries&&(identical(other.series, _this.series) || other.series == _this.series)&&(identical(other.sequence, _this.sequence) || other.sequence == _this.sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SearchSeries;
  return Object.hash(runtimeType,_this.series,_this.sequence);
}

@override
String toString() {
  final _this = this as SearchSeries;
  return 'SearchSeries(series: ${_this.series}, sequence: ${_this.sequence})';
}


}

/// @nodoc
abstract mixin class $SearchSeriesCopyWith<$Res>  {
  factory $SearchSeriesCopyWith(SearchSeries value, $Res Function(SearchSeries) _then) = _$SearchSeriesCopyWithImpl;
@useResult
$Res call({
 String series, String? sequence
});




}
/// @nodoc
class _$SearchSeriesCopyWithImpl<$Res>
    implements $SearchSeriesCopyWith<$Res> {
  _$SearchSeriesCopyWithImpl(this._self, this._then);

  final SearchSeries _self;
  final $Res Function(SearchSeries) _then;

/// Create a copy of SearchSeries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? series = null,Object? sequence = freezed,}) {
  return _then(SearchSeries(
series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSeries].
extension SearchSeriesPatterns on SearchSeries {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSeries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSeries() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSeries value)  $default,){
final _that = this;
switch (_that) {
case _SearchSeries():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSeries value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSeries() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String series,  String? sequence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSeries() when $default != null:
return $default(_that.series,_that.sequence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String series,  String? sequence)  $default,) {final _that = this;
switch (_that) {
case _SearchSeries():
return $default(_that.series,_that.sequence);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String series,  String? sequence)?  $default,) {final _that = this;
switch (_that) {
case _SearchSeries() when $default != null:
return $default(_that.series,_that.sequence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSeries implements SearchSeries {
  const _SearchSeries({required this.series, this.sequence});
  factory _SearchSeries.fromJson(Map<String, dynamic> json) => _$SearchSeriesFromJson(json);

@override final  String series;
@override final  String? sequence;

/// Create a copy of SearchSeries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSeriesCopyWith<_SearchSeries> get copyWith => __$SearchSeriesCopyWithImpl<_SearchSeries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSeriesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSeries&&(identical(other.series, series) || other.series == series)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,series,sequence);
}

@override
String toString() {
    return 'SearchSeries(series: $series, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class _$SearchSeriesCopyWith<$Res> implements $SearchSeriesCopyWith<$Res> {
  factory _$SearchSeriesCopyWith(_SearchSeries value, $Res Function(_SearchSeries) _then) = __$SearchSeriesCopyWithImpl;
@override @useResult
$Res call({
 String series, String? sequence
});




}
/// @nodoc
class __$SearchSeriesCopyWithImpl<$Res>
    implements _$SearchSeriesCopyWith<$Res> {
  __$SearchSeriesCopyWithImpl(this._self, this._then);

  final _SearchSeries _self;
  final $Res Function(_SearchSeries) _then;

/// Create a copy of SearchSeries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? series = null,Object? sequence = freezed,}) {
  return _then(_SearchSeries(
series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
