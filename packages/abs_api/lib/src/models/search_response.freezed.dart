// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchResponse {

 List<SearchResultItem> get narrators; List<Author> get authors; List<SearchResultItem> get tags; List<SearchResultItem> get genres;@JsonKey(readValue: _itemList) List<LibraryItem> get book;@JsonKey(readValue: _itemList) List<LibraryItem> get podcast;@JsonKey(readValue: _itemList) List<LibraryItem> get episodes;@JsonKey(readValue: _seriesCombined) List<Series> get series;
/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResponseCopyWith<SearchResponse> get copyWith => _$SearchResponseCopyWithImpl<SearchResponse>(this as SearchResponse, _$identity);

  /// Serializes this SearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResponse&&const DeepCollectionEquality().equals(other.narrators, narrators)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.book, book)&&const DeepCollectionEquality().equals(other.podcast, podcast)&&const DeepCollectionEquality().equals(other.episodes, episodes)&&const DeepCollectionEquality().equals(other.series, series));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(narrators),const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(book),const DeepCollectionEquality().hash(podcast),const DeepCollectionEquality().hash(episodes),const DeepCollectionEquality().hash(series));

@override
String toString() {
  return 'SearchResponse(narrators: $narrators, authors: $authors, tags: $tags, genres: $genres, book: $book, podcast: $podcast, episodes: $episodes, series: $series)';
}


}

/// @nodoc
abstract mixin class $SearchResponseCopyWith<$Res>  {
  factory $SearchResponseCopyWith(SearchResponse value, $Res Function(SearchResponse) _then) = _$SearchResponseCopyWithImpl;
@useResult
$Res call({
 List<SearchResultItem> narrators, List<Author> authors, List<SearchResultItem> tags, List<SearchResultItem> genres,@JsonKey(readValue: _itemList) List<LibraryItem> book,@JsonKey(readValue: _itemList) List<LibraryItem> podcast,@JsonKey(readValue: _itemList) List<LibraryItem> episodes,@JsonKey(readValue: _seriesCombined) List<Series> series
});




}
/// @nodoc
class _$SearchResponseCopyWithImpl<$Res>
    implements $SearchResponseCopyWith<$Res> {
  _$SearchResponseCopyWithImpl(this._self, this._then);

  final SearchResponse _self;
  final $Res Function(SearchResponse) _then;

/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? narrators = null,Object? authors = null,Object? tags = null,Object? genres = null,Object? book = null,Object? podcast = null,Object? episodes = null,Object? series = null,}) {
  return _then(_self.copyWith(
narrators: null == narrators ? _self.narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,podcast: null == podcast ? _self.podcast : podcast // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<Series>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResponse].
extension SearchResponsePatterns on SearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchResultItem> narrators,  List<Author> authors,  List<SearchResultItem> tags,  List<SearchResultItem> genres, @JsonKey(readValue: _itemList)  List<LibraryItem> book, @JsonKey(readValue: _itemList)  List<LibraryItem> podcast, @JsonKey(readValue: _itemList)  List<LibraryItem> episodes, @JsonKey(readValue: _seriesCombined)  List<Series> series)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
return $default(_that.narrators,_that.authors,_that.tags,_that.genres,_that.book,_that.podcast,_that.episodes,_that.series);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchResultItem> narrators,  List<Author> authors,  List<SearchResultItem> tags,  List<SearchResultItem> genres, @JsonKey(readValue: _itemList)  List<LibraryItem> book, @JsonKey(readValue: _itemList)  List<LibraryItem> podcast, @JsonKey(readValue: _itemList)  List<LibraryItem> episodes, @JsonKey(readValue: _seriesCombined)  List<Series> series)  $default,) {final _that = this;
switch (_that) {
case _SearchResponse():
return $default(_that.narrators,_that.authors,_that.tags,_that.genres,_that.book,_that.podcast,_that.episodes,_that.series);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchResultItem> narrators,  List<Author> authors,  List<SearchResultItem> tags,  List<SearchResultItem> genres, @JsonKey(readValue: _itemList)  List<LibraryItem> book, @JsonKey(readValue: _itemList)  List<LibraryItem> podcast, @JsonKey(readValue: _itemList)  List<LibraryItem> episodes, @JsonKey(readValue: _seriesCombined)  List<Series> series)?  $default,) {final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
return $default(_that.narrators,_that.authors,_that.tags,_that.genres,_that.book,_that.podcast,_that.episodes,_that.series);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResponse implements SearchResponse {
  const _SearchResponse({final  List<SearchResultItem> narrators = const [], final  List<Author> authors = const [], final  List<SearchResultItem> tags = const [], final  List<SearchResultItem> genres = const [], @JsonKey(readValue: _itemList) final  List<LibraryItem> book = const [], @JsonKey(readValue: _itemList) final  List<LibraryItem> podcast = const [], @JsonKey(readValue: _itemList) final  List<LibraryItem> episodes = const [], @JsonKey(readValue: _seriesCombined) final  List<Series> series = const []}): _narrators = narrators,_authors = authors,_tags = tags,_genres = genres,_book = book,_podcast = podcast,_episodes = episodes,_series = series;
  factory _SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);

 final  List<SearchResultItem> _narrators;
@override@JsonKey() List<SearchResultItem> get narrators {
  if (_narrators is EqualUnmodifiableListView) return _narrators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_narrators);
}

 final  List<Author> _authors;
@override@JsonKey() List<Author> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

 final  List<SearchResultItem> _tags;
@override@JsonKey() List<SearchResultItem> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<SearchResultItem> _genres;
@override@JsonKey() List<SearchResultItem> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<LibraryItem> _book;
@override@JsonKey(readValue: _itemList) List<LibraryItem> get book {
  if (_book is EqualUnmodifiableListView) return _book;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_book);
}

 final  List<LibraryItem> _podcast;
@override@JsonKey(readValue: _itemList) List<LibraryItem> get podcast {
  if (_podcast is EqualUnmodifiableListView) return _podcast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_podcast);
}

 final  List<LibraryItem> _episodes;
@override@JsonKey(readValue: _itemList) List<LibraryItem> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}

 final  List<Series> _series;
@override@JsonKey(readValue: _seriesCombined) List<Series> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}


/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResponseCopyWith<_SearchResponse> get copyWith => __$SearchResponseCopyWithImpl<_SearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResponse&&const DeepCollectionEquality().equals(other._narrators, _narrators)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._book, _book)&&const DeepCollectionEquality().equals(other._podcast, _podcast)&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&const DeepCollectionEquality().equals(other._series, _series));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_narrators),const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_book),const DeepCollectionEquality().hash(_podcast),const DeepCollectionEquality().hash(_episodes),const DeepCollectionEquality().hash(_series));

@override
String toString() {
  return 'SearchResponse(narrators: $narrators, authors: $authors, tags: $tags, genres: $genres, book: $book, podcast: $podcast, episodes: $episodes, series: $series)';
}


}

/// @nodoc
abstract mixin class _$SearchResponseCopyWith<$Res> implements $SearchResponseCopyWith<$Res> {
  factory _$SearchResponseCopyWith(_SearchResponse value, $Res Function(_SearchResponse) _then) = __$SearchResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SearchResultItem> narrators, List<Author> authors, List<SearchResultItem> tags, List<SearchResultItem> genres,@JsonKey(readValue: _itemList) List<LibraryItem> book,@JsonKey(readValue: _itemList) List<LibraryItem> podcast,@JsonKey(readValue: _itemList) List<LibraryItem> episodes,@JsonKey(readValue: _seriesCombined) List<Series> series
});




}
/// @nodoc
class __$SearchResponseCopyWithImpl<$Res>
    implements _$SearchResponseCopyWith<$Res> {
  __$SearchResponseCopyWithImpl(this._self, this._then);

  final _SearchResponse _self;
  final $Res Function(_SearchResponse) _then;

/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? narrators = null,Object? authors = null,Object? tags = null,Object? genres = null,Object? book = null,Object? podcast = null,Object? episodes = null,Object? series = null,}) {
  return _then(_SearchResponse(
narrators: null == narrators ? _self._narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,book: null == book ? _self._book : book // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,podcast: null == podcast ? _self._podcast : podcast // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<Series>,
  ));
}


}


/// @nodoc
mixin _$SearchResultItem {

 String get name; int get numBooks;
/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultItemCopyWith<SearchResultItem> get copyWith => _$SearchResultItemCopyWithImpl<SearchResultItem>(this as SearchResultItem, _$identity);

  /// Serializes this SearchResultItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultItem&&(identical(other.name, name) || other.name == name)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,numBooks);

@override
String toString() {
  return 'SearchResultItem(name: $name, numBooks: $numBooks)';
}


}

/// @nodoc
abstract mixin class $SearchResultItemCopyWith<$Res>  {
  factory $SearchResultItemCopyWith(SearchResultItem value, $Res Function(SearchResultItem) _then) = _$SearchResultItemCopyWithImpl;
@useResult
$Res call({
 String name, int numBooks
});




}
/// @nodoc
class _$SearchResultItemCopyWithImpl<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  _$SearchResultItemCopyWithImpl(this._self, this._then);

  final SearchResultItem _self;
  final $Res Function(SearchResultItem) _then;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? numBooks = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,numBooks: null == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultItem].
extension SearchResultItemPatterns on SearchResultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultItem value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultItem value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int numBooks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
return $default(_that.name,_that.numBooks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int numBooks)  $default,) {final _that = this;
switch (_that) {
case _SearchResultItem():
return $default(_that.name,_that.numBooks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int numBooks)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
return $default(_that.name,_that.numBooks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResultItem implements SearchResultItem {
  const _SearchResultItem({required this.name, this.numBooks = 0});
  factory _SearchResultItem.fromJson(Map<String, dynamic> json) => _$SearchResultItemFromJson(json);

@override final  String name;
@override@JsonKey() final  int numBooks;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultItemCopyWith<_SearchResultItem> get copyWith => __$SearchResultItemCopyWithImpl<_SearchResultItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultItem&&(identical(other.name, name) || other.name == name)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,numBooks);

@override
String toString() {
  return 'SearchResultItem(name: $name, numBooks: $numBooks)';
}


}

/// @nodoc
abstract mixin class _$SearchResultItemCopyWith<$Res> implements $SearchResultItemCopyWith<$Res> {
  factory _$SearchResultItemCopyWith(_SearchResultItem value, $Res Function(_SearchResultItem) _then) = __$SearchResultItemCopyWithImpl;
@override @useResult
$Res call({
 String name, int numBooks
});




}
/// @nodoc
class __$SearchResultItemCopyWithImpl<$Res>
    implements _$SearchResultItemCopyWith<$Res> {
  __$SearchResultItemCopyWithImpl(this._self, this._then);

  final _SearchResultItem _self;
  final $Res Function(_SearchResultItem) _then;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? numBooks = null,}) {
  return _then(_SearchResultItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,numBooks: null == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
