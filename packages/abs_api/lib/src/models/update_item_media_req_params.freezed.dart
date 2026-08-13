// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_item_media_req_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UpdateItemMediaReqParams _$UpdateItemMediaReqParamsFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'book':
          return UpdateBookReqParams.fromJson(
            json
          );
                case 'podcast':
          return UpdatePodcastReqParams.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UpdateItemMediaReqParams',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UpdateItemMediaReqParams {

 String? get coverPath; List<String>? get tags; UpdateMediaMetadataReqParams? get metadata;
/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateItemMediaReqParamsCopyWith<UpdateItemMediaReqParams> get copyWith => _$UpdateItemMediaReqParamsCopyWithImpl<UpdateItemMediaReqParams>(this as UpdateItemMediaReqParams, _$identity);

  /// Serializes this UpdateItemMediaReqParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateItemMediaReqParams&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverPath,const DeepCollectionEquality().hash(tags),metadata);

@override
String toString() {
  return 'UpdateItemMediaReqParams(coverPath: $coverPath, tags: $tags, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $UpdateItemMediaReqParamsCopyWith<$Res>  {
  factory $UpdateItemMediaReqParamsCopyWith(UpdateItemMediaReqParams value, $Res Function(UpdateItemMediaReqParams) _then) = _$UpdateItemMediaReqParamsCopyWithImpl;
@useResult
$Res call({
 String? coverPath, List<String>? tags, UpdateMediaMetadataReqParams? metadata
});


$UpdateMediaMetadataReqParamsCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$UpdateItemMediaReqParamsCopyWithImpl<$Res>
    implements $UpdateItemMediaReqParamsCopyWith<$Res> {
  _$UpdateItemMediaReqParamsCopyWithImpl(this._self, this._then);

  final UpdateItemMediaReqParams _self;
  final $Res Function(UpdateItemMediaReqParams) _then;

/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coverPath = freezed,Object? tags = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as UpdateMediaMetadataReqParams?,
  ));
}
/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateMediaMetadataReqParamsCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $UpdateMediaMetadataReqParamsCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateItemMediaReqParams].
extension UpdateItemMediaReqParamsPatterns on UpdateItemMediaReqParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateBookReqParams value)?  book,TResult Function( UpdatePodcastReqParams value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateBookReqParams() when book != null:
return book(_that);case UpdatePodcastReqParams() when podcast != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateBookReqParams value)  book,required TResult Function( UpdatePodcastReqParams value)  podcast,}){
final _that = this;
switch (_that) {
case UpdateBookReqParams():
return book(_that);case UpdatePodcastReqParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateBookReqParams value)?  book,TResult? Function( UpdatePodcastReqParams value)?  podcast,}){
final _that = this;
switch (_that) {
case UpdateBookReqParams() when book != null:
return book(_that);case UpdatePodcastReqParams() when podcast != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? coverPath,  List<String>? tags,  UpdateMediaMetadataReqParams? metadata,  List<BookChapter>? chapters)?  book,TResult Function( String? coverPath,  List<String>? tags,  UpdateMediaMetadataReqParams? metadata,  bool? autoDownloadEpisodes, @JsonKey(includeIfNull: true)  DateTime? lastEpisodeCheck,  int? maxEpisodesToKeep,  int? maxNewEpisodesToDownload)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateBookReqParams() when book != null:
return book(_that.coverPath,_that.tags,_that.metadata,_that.chapters);case UpdatePodcastReqParams() when podcast != null:
return podcast(_that.coverPath,_that.tags,_that.metadata,_that.autoDownloadEpisodes,_that.lastEpisodeCheck,_that.maxEpisodesToKeep,_that.maxNewEpisodesToDownload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? coverPath,  List<String>? tags,  UpdateMediaMetadataReqParams? metadata,  List<BookChapter>? chapters)  book,required TResult Function( String? coverPath,  List<String>? tags,  UpdateMediaMetadataReqParams? metadata,  bool? autoDownloadEpisodes, @JsonKey(includeIfNull: true)  DateTime? lastEpisodeCheck,  int? maxEpisodesToKeep,  int? maxNewEpisodesToDownload)  podcast,}) {final _that = this;
switch (_that) {
case UpdateBookReqParams():
return book(_that.coverPath,_that.tags,_that.metadata,_that.chapters);case UpdatePodcastReqParams():
return podcast(_that.coverPath,_that.tags,_that.metadata,_that.autoDownloadEpisodes,_that.lastEpisodeCheck,_that.maxEpisodesToKeep,_that.maxNewEpisodesToDownload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? coverPath,  List<String>? tags,  UpdateMediaMetadataReqParams? metadata,  List<BookChapter>? chapters)?  book,TResult? Function( String? coverPath,  List<String>? tags,  UpdateMediaMetadataReqParams? metadata,  bool? autoDownloadEpisodes, @JsonKey(includeIfNull: true)  DateTime? lastEpisodeCheck,  int? maxEpisodesToKeep,  int? maxNewEpisodesToDownload)?  podcast,}) {final _that = this;
switch (_that) {
case UpdateBookReqParams() when book != null:
return book(_that.coverPath,_that.tags,_that.metadata,_that.chapters);case UpdatePodcastReqParams() when podcast != null:
return podcast(_that.coverPath,_that.tags,_that.metadata,_that.autoDownloadEpisodes,_that.lastEpisodeCheck,_that.maxEpisodesToKeep,_that.maxNewEpisodesToDownload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UpdateBookReqParams implements UpdateItemMediaReqParams {
  const UpdateBookReqParams({this.coverPath, final  List<String>? tags, this.metadata, final  List<BookChapter>? chapters, final  String? $type}): _tags = tags,_chapters = chapters,$type = $type ?? 'book';
  factory UpdateBookReqParams.fromJson(Map<String, dynamic> json) => _$UpdateBookReqParamsFromJson(json);

@override final  String? coverPath;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  UpdateMediaMetadataReqParams? metadata;
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


/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBookReqParamsCopyWith<UpdateBookReqParams> get copyWith => _$UpdateBookReqParamsCopyWithImpl<UpdateBookReqParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBookReqParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBookReqParams&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._chapters, _chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverPath,const DeepCollectionEquality().hash(_tags),metadata,const DeepCollectionEquality().hash(_chapters));

@override
String toString() {
  return 'UpdateItemMediaReqParams.book(coverPath: $coverPath, tags: $tags, metadata: $metadata, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $UpdateBookReqParamsCopyWith<$Res> implements $UpdateItemMediaReqParamsCopyWith<$Res> {
  factory $UpdateBookReqParamsCopyWith(UpdateBookReqParams value, $Res Function(UpdateBookReqParams) _then) = _$UpdateBookReqParamsCopyWithImpl;
@override @useResult
$Res call({
 String? coverPath, List<String>? tags, UpdateMediaMetadataReqParams? metadata, List<BookChapter>? chapters
});


@override $UpdateMediaMetadataReqParamsCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$UpdateBookReqParamsCopyWithImpl<$Res>
    implements $UpdateBookReqParamsCopyWith<$Res> {
  _$UpdateBookReqParamsCopyWithImpl(this._self, this._then);

  final UpdateBookReqParams _self;
  final $Res Function(UpdateBookReqParams) _then;

/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coverPath = freezed,Object? tags = freezed,Object? metadata = freezed,Object? chapters = freezed,}) {
  return _then(UpdateBookReqParams(
coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as UpdateMediaMetadataReqParams?,chapters: freezed == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,
  ));
}

/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateMediaMetadataReqParamsCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $UpdateMediaMetadataReqParamsCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class UpdatePodcastReqParams implements UpdateItemMediaReqParams {
  const UpdatePodcastReqParams({this.coverPath, final  List<String>? tags, this.metadata, this.autoDownloadEpisodes, @JsonKey(includeIfNull: true) this.lastEpisodeCheck, this.maxEpisodesToKeep, this.maxNewEpisodesToDownload, final  String? $type}): _tags = tags,$type = $type ?? 'podcast';
  factory UpdatePodcastReqParams.fromJson(Map<String, dynamic> json) => _$UpdatePodcastReqParamsFromJson(json);

@override final  String? coverPath;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  UpdateMediaMetadataReqParams? metadata;
 final  bool? autoDownloadEpisodes;
@JsonKey(includeIfNull: true) final  DateTime? lastEpisodeCheck;
 final  int? maxEpisodesToKeep;
 final  int? maxNewEpisodesToDownload;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePodcastReqParamsCopyWith<UpdatePodcastReqParams> get copyWith => _$UpdatePodcastReqParamsCopyWithImpl<UpdatePodcastReqParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePodcastReqParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePodcastReqParams&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.autoDownloadEpisodes, autoDownloadEpisodes) || other.autoDownloadEpisodes == autoDownloadEpisodes)&&(identical(other.lastEpisodeCheck, lastEpisodeCheck) || other.lastEpisodeCheck == lastEpisodeCheck)&&(identical(other.maxEpisodesToKeep, maxEpisodesToKeep) || other.maxEpisodesToKeep == maxEpisodesToKeep)&&(identical(other.maxNewEpisodesToDownload, maxNewEpisodesToDownload) || other.maxNewEpisodesToDownload == maxNewEpisodesToDownload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverPath,const DeepCollectionEquality().hash(_tags),metadata,autoDownloadEpisodes,lastEpisodeCheck,maxEpisodesToKeep,maxNewEpisodesToDownload);

@override
String toString() {
  return 'UpdateItemMediaReqParams.podcast(coverPath: $coverPath, tags: $tags, metadata: $metadata, autoDownloadEpisodes: $autoDownloadEpisodes, lastEpisodeCheck: $lastEpisodeCheck, maxEpisodesToKeep: $maxEpisodesToKeep, maxNewEpisodesToDownload: $maxNewEpisodesToDownload)';
}


}

/// @nodoc
abstract mixin class $UpdatePodcastReqParamsCopyWith<$Res> implements $UpdateItemMediaReqParamsCopyWith<$Res> {
  factory $UpdatePodcastReqParamsCopyWith(UpdatePodcastReqParams value, $Res Function(UpdatePodcastReqParams) _then) = _$UpdatePodcastReqParamsCopyWithImpl;
@override @useResult
$Res call({
 String? coverPath, List<String>? tags, UpdateMediaMetadataReqParams? metadata, bool? autoDownloadEpisodes,@JsonKey(includeIfNull: true) DateTime? lastEpisodeCheck, int? maxEpisodesToKeep, int? maxNewEpisodesToDownload
});


@override $UpdateMediaMetadataReqParamsCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$UpdatePodcastReqParamsCopyWithImpl<$Res>
    implements $UpdatePodcastReqParamsCopyWith<$Res> {
  _$UpdatePodcastReqParamsCopyWithImpl(this._self, this._then);

  final UpdatePodcastReqParams _self;
  final $Res Function(UpdatePodcastReqParams) _then;

/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coverPath = freezed,Object? tags = freezed,Object? metadata = freezed,Object? autoDownloadEpisodes = freezed,Object? lastEpisodeCheck = freezed,Object? maxEpisodesToKeep = freezed,Object? maxNewEpisodesToDownload = freezed,}) {
  return _then(UpdatePodcastReqParams(
coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as UpdateMediaMetadataReqParams?,autoDownloadEpisodes: freezed == autoDownloadEpisodes ? _self.autoDownloadEpisodes : autoDownloadEpisodes // ignore: cast_nullable_to_non_nullable
as bool?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,maxEpisodesToKeep: freezed == maxEpisodesToKeep ? _self.maxEpisodesToKeep : maxEpisodesToKeep // ignore: cast_nullable_to_non_nullable
as int?,maxNewEpisodesToDownload: freezed == maxNewEpisodesToDownload ? _self.maxNewEpisodesToDownload : maxNewEpisodesToDownload // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of UpdateItemMediaReqParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateMediaMetadataReqParamsCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $UpdateMediaMetadataReqParamsCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

UpdateMediaMetadataReqParams _$UpdateMediaMetadataReqParamsFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'book':
          return UpdateBookMetadataReqParams.fromJson(
            json
          );
                case 'podcast':
          return UpdatePodcastMetadataReqParams.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UpdateMediaMetadataReqParams',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UpdateMediaMetadataReqParams {

 String? get title; List<String>? get genres; String? get description; String? get language; bool? get explicit;
/// Create a copy of UpdateMediaMetadataReqParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMediaMetadataReqParamsCopyWith<UpdateMediaMetadataReqParams> get copyWith => _$UpdateMediaMetadataReqParamsCopyWithImpl<UpdateMediaMetadataReqParams>(this as UpdateMediaMetadataReqParams, _$identity);

  /// Serializes this UpdateMediaMetadataReqParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMediaMetadataReqParams&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(genres),description,language,explicit);

@override
String toString() {
  return 'UpdateMediaMetadataReqParams(title: $title, genres: $genres, description: $description, language: $language, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $UpdateMediaMetadataReqParamsCopyWith<$Res>  {
  factory $UpdateMediaMetadataReqParamsCopyWith(UpdateMediaMetadataReqParams value, $Res Function(UpdateMediaMetadataReqParams) _then) = _$UpdateMediaMetadataReqParamsCopyWithImpl;
@useResult
$Res call({
 String? title, List<String>? genres, String? description, String? language, bool? explicit
});




}
/// @nodoc
class _$UpdateMediaMetadataReqParamsCopyWithImpl<$Res>
    implements $UpdateMediaMetadataReqParamsCopyWith<$Res> {
  _$UpdateMediaMetadataReqParamsCopyWithImpl(this._self, this._then);

  final UpdateMediaMetadataReqParams _self;
  final $Res Function(UpdateMediaMetadataReqParams) _then;

/// Create a copy of UpdateMediaMetadataReqParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? genres = freezed,Object? description = freezed,Object? language = freezed,Object? explicit = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: freezed == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateMediaMetadataReqParams].
extension UpdateMediaMetadataReqParamsPatterns on UpdateMediaMetadataReqParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateBookMetadataReqParams value)?  book,TResult Function( UpdatePodcastMetadataReqParams value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateBookMetadataReqParams() when book != null:
return book(_that);case UpdatePodcastMetadataReqParams() when podcast != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateBookMetadataReqParams value)  book,required TResult Function( UpdatePodcastMetadataReqParams value)  podcast,}){
final _that = this;
switch (_that) {
case UpdateBookMetadataReqParams():
return book(_that);case UpdatePodcastMetadataReqParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateBookMetadataReqParams value)?  book,TResult? Function( UpdatePodcastMetadataReqParams value)?  podcast,}){
final _that = this;
switch (_that) {
case UpdateBookMetadataReqParams() when book != null:
return book(_that);case UpdatePodcastMetadataReqParams() when podcast != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? title,  String? subtitle,  List<Author>? authors,  List<String>? narrators,  List<Series>? series,  List<String>? genres,  String? publishedYear,  String? publishedDate,  String? publisher,  String? description,  String? isbn,  String? asin,  String? language,  bool? explicit)?  book,TResult Function( String? title,  String? author,  String? description,  String? releaseDate,  List<String>? genres,  String? feedUrl,  String? imageUrl,  String? itunesPageUrl,  int? itunesId,  int? itunesArtistId,  bool? explicit,  String? language)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateBookMetadataReqParams() when book != null:
return book(_that.title,_that.subtitle,_that.authors,_that.narrators,_that.series,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.isbn,_that.asin,_that.language,_that.explicit);case UpdatePodcastMetadataReqParams() when podcast != null:
return podcast(_that.title,_that.author,_that.description,_that.releaseDate,_that.genres,_that.feedUrl,_that.imageUrl,_that.itunesPageUrl,_that.itunesId,_that.itunesArtistId,_that.explicit,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? title,  String? subtitle,  List<Author>? authors,  List<String>? narrators,  List<Series>? series,  List<String>? genres,  String? publishedYear,  String? publishedDate,  String? publisher,  String? description,  String? isbn,  String? asin,  String? language,  bool? explicit)  book,required TResult Function( String? title,  String? author,  String? description,  String? releaseDate,  List<String>? genres,  String? feedUrl,  String? imageUrl,  String? itunesPageUrl,  int? itunesId,  int? itunesArtistId,  bool? explicit,  String? language)  podcast,}) {final _that = this;
switch (_that) {
case UpdateBookMetadataReqParams():
return book(_that.title,_that.subtitle,_that.authors,_that.narrators,_that.series,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.isbn,_that.asin,_that.language,_that.explicit);case UpdatePodcastMetadataReqParams():
return podcast(_that.title,_that.author,_that.description,_that.releaseDate,_that.genres,_that.feedUrl,_that.imageUrl,_that.itunesPageUrl,_that.itunesId,_that.itunesArtistId,_that.explicit,_that.language);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? title,  String? subtitle,  List<Author>? authors,  List<String>? narrators,  List<Series>? series,  List<String>? genres,  String? publishedYear,  String? publishedDate,  String? publisher,  String? description,  String? isbn,  String? asin,  String? language,  bool? explicit)?  book,TResult? Function( String? title,  String? author,  String? description,  String? releaseDate,  List<String>? genres,  String? feedUrl,  String? imageUrl,  String? itunesPageUrl,  int? itunesId,  int? itunesArtistId,  bool? explicit,  String? language)?  podcast,}) {final _that = this;
switch (_that) {
case UpdateBookMetadataReqParams() when book != null:
return book(_that.title,_that.subtitle,_that.authors,_that.narrators,_that.series,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.isbn,_that.asin,_that.language,_that.explicit);case UpdatePodcastMetadataReqParams() when podcast != null:
return podcast(_that.title,_that.author,_that.description,_that.releaseDate,_that.genres,_that.feedUrl,_that.imageUrl,_that.itunesPageUrl,_that.itunesId,_that.itunesArtistId,_that.explicit,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UpdateBookMetadataReqParams implements UpdateMediaMetadataReqParams {
  const UpdateBookMetadataReqParams({this.title, this.subtitle, final  List<Author>? authors, final  List<String>? narrators, final  List<Series>? series, final  List<String>? genres, this.publishedYear, this.publishedDate, this.publisher, this.description, this.isbn, this.asin, this.language, this.explicit, final  String? $type}): _authors = authors,_narrators = narrators,_series = series,_genres = genres,$type = $type ?? 'book';
  factory UpdateBookMetadataReqParams.fromJson(Map<String, dynamic> json) => _$UpdateBookMetadataReqParamsFromJson(json);

@override final  String? title;
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
 List<Series>? get series {
  final value = _series;
  if (value == null) return null;
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? publishedYear;
 final  String? publishedDate;
 final  String? publisher;
@override final  String? description;
 final  String? isbn;
 final  String? asin;
@override final  String? language;
@override final  bool? explicit;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateMediaMetadataReqParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBookMetadataReqParamsCopyWith<UpdateBookMetadataReqParams> get copyWith => _$UpdateBookMetadataReqParamsCopyWithImpl<UpdateBookMetadataReqParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBookMetadataReqParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBookMetadataReqParams&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._narrators, _narrators)&&const DeepCollectionEquality().equals(other._series, _series)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.description, description) || other.description == description)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_narrators),const DeepCollectionEquality().hash(_series),const DeepCollectionEquality().hash(_genres),publishedYear,publishedDate,publisher,description,isbn,asin,language,explicit);

@override
String toString() {
  return 'UpdateMediaMetadataReqParams.book(title: $title, subtitle: $subtitle, authors: $authors, narrators: $narrators, series: $series, genres: $genres, publishedYear: $publishedYear, publishedDate: $publishedDate, publisher: $publisher, description: $description, isbn: $isbn, asin: $asin, language: $language, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $UpdateBookMetadataReqParamsCopyWith<$Res> implements $UpdateMediaMetadataReqParamsCopyWith<$Res> {
  factory $UpdateBookMetadataReqParamsCopyWith(UpdateBookMetadataReqParams value, $Res Function(UpdateBookMetadataReqParams) _then) = _$UpdateBookMetadataReqParamsCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? subtitle, List<Author>? authors, List<String>? narrators, List<Series>? series, List<String>? genres, String? publishedYear, String? publishedDate, String? publisher, String? description, String? isbn, String? asin, String? language, bool? explicit
});




}
/// @nodoc
class _$UpdateBookMetadataReqParamsCopyWithImpl<$Res>
    implements $UpdateBookMetadataReqParamsCopyWith<$Res> {
  _$UpdateBookMetadataReqParamsCopyWithImpl(this._self, this._then);

  final UpdateBookMetadataReqParams _self;
  final $Res Function(UpdateBookMetadataReqParams) _then;

/// Create a copy of UpdateMediaMetadataReqParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? subtitle = freezed,Object? authors = freezed,Object? narrators = freezed,Object? series = freezed,Object? genres = freezed,Object? publishedYear = freezed,Object? publishedDate = freezed,Object? publisher = freezed,Object? description = freezed,Object? isbn = freezed,Object? asin = freezed,Object? language = freezed,Object? explicit = freezed,}) {
  return _then(UpdateBookMetadataReqParams(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>?,narrators: freezed == narrators ? _self._narrators : narrators // ignore: cast_nullable_to_non_nullable
as List<String>?,series: freezed == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<Series>?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as String?,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: freezed == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdatePodcastMetadataReqParams implements UpdateMediaMetadataReqParams {
  const UpdatePodcastMetadataReqParams({this.title, this.author, this.description, this.releaseDate, final  List<String>? genres, this.feedUrl, this.imageUrl, this.itunesPageUrl, this.itunesId, this.itunesArtistId, this.explicit, this.language, final  String? $type}): _genres = genres,$type = $type ?? 'podcast';
  factory UpdatePodcastMetadataReqParams.fromJson(Map<String, dynamic> json) => _$UpdatePodcastMetadataReqParamsFromJson(json);

@override final  String? title;
 final  String? author;
@override final  String? description;
 final  String? releaseDate;
 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? feedUrl;
 final  String? imageUrl;
 final  String? itunesPageUrl;
 final  int? itunesId;
 final  int? itunesArtistId;
@override final  bool? explicit;
@override final  String? language;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateMediaMetadataReqParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePodcastMetadataReqParamsCopyWith<UpdatePodcastMetadataReqParams> get copyWith => _$UpdatePodcastMetadataReqParamsCopyWithImpl<UpdatePodcastMetadataReqParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePodcastMetadataReqParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePodcastMetadataReqParams&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.itunesPageUrl, itunesPageUrl) || other.itunesPageUrl == itunesPageUrl)&&(identical(other.itunesId, itunesId) || other.itunesId == itunesId)&&(identical(other.itunesArtistId, itunesArtistId) || other.itunesArtistId == itunesArtistId)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,author,description,releaseDate,const DeepCollectionEquality().hash(_genres),feedUrl,imageUrl,itunesPageUrl,itunesId,itunesArtistId,explicit,language);

@override
String toString() {
  return 'UpdateMediaMetadataReqParams.podcast(title: $title, author: $author, description: $description, releaseDate: $releaseDate, genres: $genres, feedUrl: $feedUrl, imageUrl: $imageUrl, itunesPageUrl: $itunesPageUrl, itunesId: $itunesId, itunesArtistId: $itunesArtistId, explicit: $explicit, language: $language)';
}


}

/// @nodoc
abstract mixin class $UpdatePodcastMetadataReqParamsCopyWith<$Res> implements $UpdateMediaMetadataReqParamsCopyWith<$Res> {
  factory $UpdatePodcastMetadataReqParamsCopyWith(UpdatePodcastMetadataReqParams value, $Res Function(UpdatePodcastMetadataReqParams) _then) = _$UpdatePodcastMetadataReqParamsCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? author, String? description, String? releaseDate, List<String>? genres, String? feedUrl, String? imageUrl, String? itunesPageUrl, int? itunesId, int? itunesArtistId, bool? explicit, String? language
});




}
/// @nodoc
class _$UpdatePodcastMetadataReqParamsCopyWithImpl<$Res>
    implements $UpdatePodcastMetadataReqParamsCopyWith<$Res> {
  _$UpdatePodcastMetadataReqParamsCopyWithImpl(this._self, this._then);

  final UpdatePodcastMetadataReqParams _self;
  final $Res Function(UpdatePodcastMetadataReqParams) _then;

/// Create a copy of UpdateMediaMetadataReqParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? author = freezed,Object? description = freezed,Object? releaseDate = freezed,Object? genres = freezed,Object? feedUrl = freezed,Object? imageUrl = freezed,Object? itunesPageUrl = freezed,Object? itunesId = freezed,Object? itunesArtistId = freezed,Object? explicit = freezed,Object? language = freezed,}) {
  return _then(UpdatePodcastMetadataReqParams(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,feedUrl: freezed == feedUrl ? _self.feedUrl : feedUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,itunesPageUrl: freezed == itunesPageUrl ? _self.itunesPageUrl : itunesPageUrl // ignore: cast_nullable_to_non_nullable
as String?,itunesId: freezed == itunesId ? _self.itunesId : itunesId // ignore: cast_nullable_to_non_nullable
as int?,itunesArtistId: freezed == itunesArtistId ? _self.itunesArtistId : itunesArtistId // ignore: cast_nullable_to_non_nullable
as int?,explicit: freezed == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
