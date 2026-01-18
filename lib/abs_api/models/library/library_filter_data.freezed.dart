// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryFilterData {

 List<Author> get authors; List<String> get genres; List<String> get tags; List<Series> get series; List<String> get narrators; List<String> get languages;
/// Create a copy of LibraryFilterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryFilterDataCopyWith<LibraryFilterData> get copyWith => _$LibraryFilterDataCopyWithImpl<LibraryFilterData>(this as LibraryFilterData, _$identity);

  /// Serializes this LibraryFilterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryFilterData&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.series, series)&&const DeepCollectionEquality().equals(other.narrators, narrators)&&const DeepCollectionEquality().equals(other.languages, languages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(series),const DeepCollectionEquality().hash(narrators),const DeepCollectionEquality().hash(languages));

@override
String toString() {
  return 'LibraryFilterData(authors: $authors, genres: $genres, tags: $tags, series: $series, narrators: $narrators, languages: $languages)';
}


}

/// @nodoc
abstract mixin class $LibraryFilterDataCopyWith<$Res>  {
  factory $LibraryFilterDataCopyWith(LibraryFilterData value, $Res Function(LibraryFilterData) _then) = _$LibraryFilterDataCopyWithImpl;
@useResult
$Res call({
 List<Author> authors, List<String> genres, List<String> tags, List<Series> series, List<String> narrators, List<String> languages
});




}
/// @nodoc
class _$LibraryFilterDataCopyWithImpl<$Res>
    implements $LibraryFilterDataCopyWith<$Res> {
  _$LibraryFilterDataCopyWithImpl(this._self, this._then);

  final LibraryFilterData _self;
  final $Res Function(LibraryFilterData) _then;

/// Create a copy of LibraryFilterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authors = null,Object? genres = null,Object? tags = null,Object? series = null,Object? narrators = null,Object? languages = null,}) {
  return _then(_self.copyWith(
authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<Series>,narrators: null == narrators ? _self.narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryFilterData].
extension LibraryFilterDataPatterns on LibraryFilterData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryFilterData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryFilterData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryFilterData value)  $default,){
final _that = this;
switch (_that) {
case _LibraryFilterData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryFilterData value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryFilterData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Author> authors,  List<String> genres,  List<String> tags,  List<Series> series,  List<String> narrators,  List<String> languages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryFilterData() when $default != null:
return $default(_that.authors,_that.genres,_that.tags,_that.series,_that.narrators,_that.languages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Author> authors,  List<String> genres,  List<String> tags,  List<Series> series,  List<String> narrators,  List<String> languages)  $default,) {final _that = this;
switch (_that) {
case _LibraryFilterData():
return $default(_that.authors,_that.genres,_that.tags,_that.series,_that.narrators,_that.languages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Author> authors,  List<String> genres,  List<String> tags,  List<Series> series,  List<String> narrators,  List<String> languages)?  $default,) {final _that = this;
switch (_that) {
case _LibraryFilterData() when $default != null:
return $default(_that.authors,_that.genres,_that.tags,_that.series,_that.narrators,_that.languages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryFilterData implements LibraryFilterData {
  const _LibraryFilterData({required final  List<Author> authors, required final  List<String> genres, required final  List<String> tags, required final  List<Series> series, required final  List<String> narrators, required final  List<String> languages}): _authors = authors,_genres = genres,_tags = tags,_series = series,_narrators = narrators,_languages = languages;
  factory _LibraryFilterData.fromJson(Map<String, dynamic> json) => _$LibraryFilterDataFromJson(json);

 final  List<Author> _authors;
@override List<Author> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

 final  List<String> _genres;
@override List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<Series> _series;
@override List<Series> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}

 final  List<String> _narrators;
@override List<String> get narrators {
  if (_narrators is EqualUnmodifiableListView) return _narrators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_narrators);
}

 final  List<String> _languages;
@override List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}


/// Create a copy of LibraryFilterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryFilterDataCopyWith<_LibraryFilterData> get copyWith => __$LibraryFilterDataCopyWithImpl<_LibraryFilterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryFilterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryFilterData&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._series, _series)&&const DeepCollectionEquality().equals(other._narrators, _narrators)&&const DeepCollectionEquality().equals(other._languages, _languages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_series),const DeepCollectionEquality().hash(_narrators),const DeepCollectionEquality().hash(_languages));

@override
String toString() {
  return 'LibraryFilterData(authors: $authors, genres: $genres, tags: $tags, series: $series, narrators: $narrators, languages: $languages)';
}


}

/// @nodoc
abstract mixin class _$LibraryFilterDataCopyWith<$Res> implements $LibraryFilterDataCopyWith<$Res> {
  factory _$LibraryFilterDataCopyWith(_LibraryFilterData value, $Res Function(_LibraryFilterData) _then) = __$LibraryFilterDataCopyWithImpl;
@override @useResult
$Res call({
 List<Author> authors, List<String> genres, List<String> tags, List<Series> series, List<String> narrators, List<String> languages
});




}
/// @nodoc
class __$LibraryFilterDataCopyWithImpl<$Res>
    implements _$LibraryFilterDataCopyWith<$Res> {
  __$LibraryFilterDataCopyWithImpl(this._self, this._then);

  final _LibraryFilterData _self;
  final $Res Function(_LibraryFilterData) _then;

/// Create a copy of LibraryFilterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authors = null,Object? genres = null,Object? tags = null,Object? series = null,Object? narrators = null,Object? languages = null,}) {
  return _then(_LibraryFilterData(
authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<Series>,narrators: null == narrators ? _self._narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
