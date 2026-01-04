// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_feed_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastFeedMetadata {

 Uri get image; List<String> get categories; Uri get feedUrl; String get description; String get descriptionPlain; String get title; String get language; String get explicit; String get author; String get pubDate; Uri get link;
/// Create a copy of PodcastFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastFeedMetadataCopyWith<PodcastFeedMetadata> get copyWith => _$PodcastFeedMetadataCopyWithImpl<PodcastFeedMetadata>(this as PodcastFeedMetadata, _$identity);

  /// Serializes this PodcastFeedMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastFeedMetadata&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionPlain, descriptionPlain) || other.descriptionPlain == descriptionPlain)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.author, author) || other.author == author)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,const DeepCollectionEquality().hash(categories),feedUrl,description,descriptionPlain,title,language,explicit,author,pubDate,link);

@override
String toString() {
  return 'PodcastFeedMetadata(image: $image, categories: $categories, feedUrl: $feedUrl, description: $description, descriptionPlain: $descriptionPlain, title: $title, language: $language, explicit: $explicit, author: $author, pubDate: $pubDate, link: $link)';
}


}

/// @nodoc
abstract mixin class $PodcastFeedMetadataCopyWith<$Res>  {
  factory $PodcastFeedMetadataCopyWith(PodcastFeedMetadata value, $Res Function(PodcastFeedMetadata) _then) = _$PodcastFeedMetadataCopyWithImpl;
@useResult
$Res call({
 Uri image, List<String> categories, Uri feedUrl, String description, String descriptionPlain, String title, String language, String explicit, String author, String pubDate, Uri link
});




}
/// @nodoc
class _$PodcastFeedMetadataCopyWithImpl<$Res>
    implements $PodcastFeedMetadataCopyWith<$Res> {
  _$PodcastFeedMetadataCopyWithImpl(this._self, this._then);

  final PodcastFeedMetadata _self;
  final $Res Function(PodcastFeedMetadata) _then;

/// Create a copy of PodcastFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? categories = null,Object? feedUrl = null,Object? description = null,Object? descriptionPlain = null,Object? title = null,Object? language = null,Object? explicit = null,Object? author = null,Object? pubDate = null,Object? link = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uri,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,feedUrl: null == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionPlain: null == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}

}


/// Adds pattern-matching-related methods to [PodcastFeedMetadata].
extension PodcastFeedMetadataPatterns on PodcastFeedMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PodcastFeedMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PodcastFeedMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PodcastFeedMetadata value)  $default,){
final _that = this;
switch (_that) {
case _PodcastFeedMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PodcastFeedMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _PodcastFeedMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri image,  List<String> categories,  Uri feedUrl,  String description,  String descriptionPlain,  String title,  String language,  String explicit,  String author,  String pubDate,  Uri link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PodcastFeedMetadata() when $default != null:
return $default(_that.image,_that.categories,_that.feedUrl,_that.description,_that.descriptionPlain,_that.title,_that.language,_that.explicit,_that.author,_that.pubDate,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri image,  List<String> categories,  Uri feedUrl,  String description,  String descriptionPlain,  String title,  String language,  String explicit,  String author,  String pubDate,  Uri link)  $default,) {final _that = this;
switch (_that) {
case _PodcastFeedMetadata():
return $default(_that.image,_that.categories,_that.feedUrl,_that.description,_that.descriptionPlain,_that.title,_that.language,_that.explicit,_that.author,_that.pubDate,_that.link);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri image,  List<String> categories,  Uri feedUrl,  String description,  String descriptionPlain,  String title,  String language,  String explicit,  String author,  String pubDate,  Uri link)?  $default,) {final _that = this;
switch (_that) {
case _PodcastFeedMetadata() when $default != null:
return $default(_that.image,_that.categories,_that.feedUrl,_that.description,_that.descriptionPlain,_that.title,_that.language,_that.explicit,_that.author,_that.pubDate,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PodcastFeedMetadata implements PodcastFeedMetadata {
  const _PodcastFeedMetadata({required this.image, required final  List<String> categories, required this.feedUrl, required this.description, required this.descriptionPlain, required this.title, required this.language, required this.explicit, required this.author, required this.pubDate, required this.link}): _categories = categories;
  factory _PodcastFeedMetadata.fromJson(Map<String, dynamic> json) => _$PodcastFeedMetadataFromJson(json);

@override final  Uri image;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  Uri feedUrl;
@override final  String description;
@override final  String descriptionPlain;
@override final  String title;
@override final  String language;
@override final  String explicit;
@override final  String author;
@override final  String pubDate;
@override final  Uri link;

/// Create a copy of PodcastFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastFeedMetadataCopyWith<_PodcastFeedMetadata> get copyWith => __$PodcastFeedMetadataCopyWithImpl<_PodcastFeedMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastFeedMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastFeedMetadata&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionPlain, descriptionPlain) || other.descriptionPlain == descriptionPlain)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.author, author) || other.author == author)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,const DeepCollectionEquality().hash(_categories),feedUrl,description,descriptionPlain,title,language,explicit,author,pubDate,link);

@override
String toString() {
  return 'PodcastFeedMetadata(image: $image, categories: $categories, feedUrl: $feedUrl, description: $description, descriptionPlain: $descriptionPlain, title: $title, language: $language, explicit: $explicit, author: $author, pubDate: $pubDate, link: $link)';
}


}

/// @nodoc
abstract mixin class _$PodcastFeedMetadataCopyWith<$Res> implements $PodcastFeedMetadataCopyWith<$Res> {
  factory _$PodcastFeedMetadataCopyWith(_PodcastFeedMetadata value, $Res Function(_PodcastFeedMetadata) _then) = __$PodcastFeedMetadataCopyWithImpl;
@override @useResult
$Res call({
 Uri image, List<String> categories, Uri feedUrl, String description, String descriptionPlain, String title, String language, String explicit, String author, String pubDate, Uri link
});




}
/// @nodoc
class __$PodcastFeedMetadataCopyWithImpl<$Res>
    implements _$PodcastFeedMetadataCopyWith<$Res> {
  __$PodcastFeedMetadataCopyWithImpl(this._self, this._then);

  final _PodcastFeedMetadata _self;
  final $Res Function(_PodcastFeedMetadata) _then;

/// Create a copy of PodcastFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? categories = null,Object? feedUrl = null,Object? description = null,Object? descriptionPlain = null,Object? title = null,Object? language = null,Object? explicit = null,Object? author = null,Object? pubDate = null,Object? link = null,}) {
  return _then(_PodcastFeedMetadata(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uri,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,feedUrl: null == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionPlain: null == descriptionPlain ? _self.descriptionPlain : descriptionPlain // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}


}

// dart format on
