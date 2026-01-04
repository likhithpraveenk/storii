// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RssFeedMetadata {

 String get title; String get description; String get author; Uri get imageUrl; Uri get feedUrl; Uri get link; bool get explicit;
/// Create a copy of RssFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RssFeedMetadataCopyWith<RssFeedMetadata> get copyWith => _$RssFeedMetadataCopyWithImpl<RssFeedMetadata>(this as RssFeedMetadata, _$identity);

  /// Serializes this RssFeedMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RssFeedMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.link, link) || other.link == link)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,author,imageUrl,feedUrl,link,explicit);

@override
String toString() {
  return 'RssFeedMetadata(title: $title, description: $description, author: $author, imageUrl: $imageUrl, feedUrl: $feedUrl, link: $link, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $RssFeedMetadataCopyWith<$Res>  {
  factory $RssFeedMetadataCopyWith(RssFeedMetadata value, $Res Function(RssFeedMetadata) _then) = _$RssFeedMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String description, String author, Uri imageUrl, Uri feedUrl, Uri link, bool explicit
});




}
/// @nodoc
class _$RssFeedMetadataCopyWithImpl<$Res>
    implements $RssFeedMetadataCopyWith<$Res> {
  _$RssFeedMetadataCopyWithImpl(this._self, this._then);

  final RssFeedMetadata _self;
  final $Res Function(RssFeedMetadata) _then;

/// Create a copy of RssFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? author = null,Object? imageUrl = null,Object? feedUrl = null,Object? link = null,Object? explicit = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as Uri,feedUrl: null == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RssFeedMetadata].
extension RssFeedMetadataPatterns on RssFeedMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RssFeedMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RssFeedMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RssFeedMetadata value)  $default,){
final _that = this;
switch (_that) {
case _RssFeedMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RssFeedMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _RssFeedMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String author,  Uri imageUrl,  Uri feedUrl,  Uri link,  bool explicit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RssFeedMetadata() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.imageUrl,_that.feedUrl,_that.link,_that.explicit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String author,  Uri imageUrl,  Uri feedUrl,  Uri link,  bool explicit)  $default,) {final _that = this;
switch (_that) {
case _RssFeedMetadata():
return $default(_that.title,_that.description,_that.author,_that.imageUrl,_that.feedUrl,_that.link,_that.explicit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String author,  Uri imageUrl,  Uri feedUrl,  Uri link,  bool explicit)?  $default,) {final _that = this;
switch (_that) {
case _RssFeedMetadata() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.imageUrl,_that.feedUrl,_that.link,_that.explicit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RssFeedMetadata implements RssFeedMetadata {
  const _RssFeedMetadata({required this.title, required this.description, required this.author, required this.imageUrl, required this.feedUrl, required this.link, required this.explicit});
  factory _RssFeedMetadata.fromJson(Map<String, dynamic> json) => _$RssFeedMetadataFromJson(json);

@override final  String title;
@override final  String description;
@override final  String author;
@override final  Uri imageUrl;
@override final  Uri feedUrl;
@override final  Uri link;
@override final  bool explicit;

/// Create a copy of RssFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RssFeedMetadataCopyWith<_RssFeedMetadata> get copyWith => __$RssFeedMetadataCopyWithImpl<_RssFeedMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RssFeedMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RssFeedMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.link, link) || other.link == link)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,author,imageUrl,feedUrl,link,explicit);

@override
String toString() {
  return 'RssFeedMetadata(title: $title, description: $description, author: $author, imageUrl: $imageUrl, feedUrl: $feedUrl, link: $link, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class _$RssFeedMetadataCopyWith<$Res> implements $RssFeedMetadataCopyWith<$Res> {
  factory _$RssFeedMetadataCopyWith(_RssFeedMetadata value, $Res Function(_RssFeedMetadata) _then) = __$RssFeedMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String author, Uri imageUrl, Uri feedUrl, Uri link, bool explicit
});




}
/// @nodoc
class __$RssFeedMetadataCopyWithImpl<$Res>
    implements _$RssFeedMetadataCopyWith<$Res> {
  __$RssFeedMetadataCopyWithImpl(this._self, this._then);

  final _RssFeedMetadata _self;
  final $Res Function(_RssFeedMetadata) _then;

/// Create a copy of RssFeedMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? author = null,Object? imageUrl = null,Object? feedUrl = null,Object? link = null,Object? explicit = null,}) {
  return _then(_RssFeedMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as Uri,feedUrl: null == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as Uri,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
