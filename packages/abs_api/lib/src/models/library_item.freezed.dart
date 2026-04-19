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

 String get id; String get libraryId; DateTime get addedAt; DateTime get updatedAt; bool get isMissing; MediaType get mediaType; Media get media; int? get size; String? get sequence; String? get seriesSequence; MediaProgress? get userMediaProgress; List<PodcastEpisodeDownload>? get episodesDownloading; Series? get collapsedSeries;
/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<LibraryItem> get copyWith => _$LibraryItemCopyWithImpl<LibraryItem>(this as LibraryItem, _$identity);

  /// Serializes this LibraryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.size, size) || other.size == size)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.seriesSequence, seriesSequence) || other.seriesSequence == seriesSequence)&&(identical(other.userMediaProgress, userMediaProgress) || other.userMediaProgress == userMediaProgress)&&const DeepCollectionEquality().equals(other.episodesDownloading, episodesDownloading)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,libraryId,addedAt,updatedAt,isMissing,mediaType,media,size,sequence,seriesSequence,userMediaProgress,const DeepCollectionEquality().hash(episodesDownloading),collapsedSeries);

@override
String toString() {
  return 'LibraryItem(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, mediaType: $mediaType, media: $media, size: $size, sequence: $sequence, seriesSequence: $seriesSequence, userMediaProgress: $userMediaProgress, episodesDownloading: $episodesDownloading, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class $LibraryItemCopyWith<$Res>  {
  factory $LibraryItemCopyWith(LibraryItem value, $Res Function(LibraryItem) _then) = _$LibraryItemCopyWithImpl;
@useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, MediaType mediaType, Media media, int? size, String? sequence, String? seriesSequence, MediaProgress? userMediaProgress, List<PodcastEpisodeDownload>? episodesDownloading, Series? collapsedSeries
});


$MediaCopyWith<$Res> get media;$MediaProgressCopyWith<$Res>? get userMediaProgress;$SeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class _$LibraryItemCopyWithImpl<$Res>
    implements $LibraryItemCopyWith<$Res> {
  _$LibraryItemCopyWithImpl(this._self, this._then);

  final LibraryItem _self;
  final $Res Function(LibraryItem) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? libraryId = null,Object? addedAt = null,Object? updatedAt = null,Object? isMissing = null,Object? mediaType = null,Object? media = null,Object? size = freezed,Object? sequence = freezed,Object? seriesSequence = freezed,Object? userMediaProgress = freezed,Object? episodesDownloading = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as String?,seriesSequence: freezed == seriesSequence ? _self.seriesSequence : seriesSequence // ignore: cast_nullable_to_non_nullable
as String?,userMediaProgress: freezed == userMediaProgress ? _self.userMediaProgress : userMediaProgress // ignore: cast_nullable_to_non_nullable
as MediaProgress?,episodesDownloading: freezed == episodesDownloading ? _self.episodesDownloading : episodesDownloading // ignore: cast_nullable_to_non_nullable
as List<PodcastEpisodeDownload>?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as Series?,
  ));
}
/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaProgressCopyWith<$Res>? get userMediaProgress {
    if (_self.userMediaProgress == null) {
    return null;
  }

  return $MediaProgressCopyWith<$Res>(_self.userMediaProgress!, (value) {
    return _then(_self.copyWith(userMediaProgress: value));
  });
}/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesCopyWith<$Res>? get collapsedSeries {
    if (_self.collapsedSeries == null) {
    return null;
  }

  return $SeriesCopyWith<$Res>(_self.collapsedSeries!, (value) {
    return _then(_self.copyWith(collapsedSeries: value));
  });
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItem value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItem value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  MediaType mediaType,  Media media,  int? size,  String? sequence,  String? seriesSequence,  MediaProgress? userMediaProgress,  List<PodcastEpisodeDownload>? episodesDownloading,  Series? collapsedSeries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
return $default(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.mediaType,_that.media,_that.size,_that.sequence,_that.seriesSequence,_that.userMediaProgress,_that.episodesDownloading,_that.collapsedSeries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  MediaType mediaType,  Media media,  int? size,  String? sequence,  String? seriesSequence,  MediaProgress? userMediaProgress,  List<PodcastEpisodeDownload>? episodesDownloading,  Series? collapsedSeries)  $default,) {final _that = this;
switch (_that) {
case _LibraryItem():
return $default(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.mediaType,_that.media,_that.size,_that.sequence,_that.seriesSequence,_that.userMediaProgress,_that.episodesDownloading,_that.collapsedSeries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String libraryId,  DateTime addedAt,  DateTime updatedAt,  bool isMissing,  MediaType mediaType,  Media media,  int? size,  String? sequence,  String? seriesSequence,  MediaProgress? userMediaProgress,  List<PodcastEpisodeDownload>? episodesDownloading,  Series? collapsedSeries)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
return $default(_that.id,_that.libraryId,_that.addedAt,_that.updatedAt,_that.isMissing,_that.mediaType,_that.media,_that.size,_that.sequence,_that.seriesSequence,_that.userMediaProgress,_that.episodesDownloading,_that.collapsedSeries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _LibraryItem implements LibraryItem {
  const _LibraryItem({required this.id, required this.libraryId, required this.addedAt, required this.updatedAt, required this.isMissing, required this.mediaType, required this.media, this.size, this.sequence, this.seriesSequence, this.userMediaProgress, final  List<PodcastEpisodeDownload>? episodesDownloading, this.collapsedSeries}): _episodesDownloading = episodesDownloading;
  factory _LibraryItem.fromJson(Map<String, dynamic> json) => _$LibraryItemFromJson(json);

@override final  String id;
@override final  String libraryId;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;
@override final  bool isMissing;
@override final  MediaType mediaType;
@override final  Media media;
@override final  int? size;
@override final  String? sequence;
@override final  String? seriesSequence;
@override final  MediaProgress? userMediaProgress;
 final  List<PodcastEpisodeDownload>? _episodesDownloading;
@override List<PodcastEpisodeDownload>? get episodesDownloading {
  final value = _episodesDownloading;
  if (value == null) return null;
  if (_episodesDownloading is EqualUnmodifiableListView) return _episodesDownloading;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Series? collapsedSeries;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemCopyWith<_LibraryItem> get copyWith => __$LibraryItemCopyWithImpl<_LibraryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.size, size) || other.size == size)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.seriesSequence, seriesSequence) || other.seriesSequence == seriesSequence)&&(identical(other.userMediaProgress, userMediaProgress) || other.userMediaProgress == userMediaProgress)&&const DeepCollectionEquality().equals(other._episodesDownloading, _episodesDownloading)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,libraryId,addedAt,updatedAt,isMissing,mediaType,media,size,sequence,seriesSequence,userMediaProgress,const DeepCollectionEquality().hash(_episodesDownloading),collapsedSeries);

@override
String toString() {
  return 'LibraryItem(id: $id, libraryId: $libraryId, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, mediaType: $mediaType, media: $media, size: $size, sequence: $sequence, seriesSequence: $seriesSequence, userMediaProgress: $userMediaProgress, episodesDownloading: $episodesDownloading, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemCopyWith<$Res> implements $LibraryItemCopyWith<$Res> {
  factory _$LibraryItemCopyWith(_LibraryItem value, $Res Function(_LibraryItem) _then) = __$LibraryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String libraryId, DateTime addedAt, DateTime updatedAt, bool isMissing, MediaType mediaType, Media media, int? size, String? sequence, String? seriesSequence, MediaProgress? userMediaProgress, List<PodcastEpisodeDownload>? episodesDownloading, Series? collapsedSeries
});


@override $MediaCopyWith<$Res> get media;@override $MediaProgressCopyWith<$Res>? get userMediaProgress;@override $SeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class __$LibraryItemCopyWithImpl<$Res>
    implements _$LibraryItemCopyWith<$Res> {
  __$LibraryItemCopyWithImpl(this._self, this._then);

  final _LibraryItem _self;
  final $Res Function(_LibraryItem) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? libraryId = null,Object? addedAt = null,Object? updatedAt = null,Object? isMissing = null,Object? mediaType = null,Object? media = null,Object? size = freezed,Object? sequence = freezed,Object? seriesSequence = freezed,Object? userMediaProgress = freezed,Object? episodesDownloading = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_LibraryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as String?,seriesSequence: freezed == seriesSequence ? _self.seriesSequence : seriesSequence // ignore: cast_nullable_to_non_nullable
as String?,userMediaProgress: freezed == userMediaProgress ? _self.userMediaProgress : userMediaProgress // ignore: cast_nullable_to_non_nullable
as MediaProgress?,episodesDownloading: freezed == episodesDownloading ? _self._episodesDownloading : episodesDownloading // ignore: cast_nullable_to_non_nullable
as List<PodcastEpisodeDownload>?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as Series?,
  ));
}

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaProgressCopyWith<$Res>? get userMediaProgress {
    if (_self.userMediaProgress == null) {
    return null;
  }

  return $MediaProgressCopyWith<$Res>(_self.userMediaProgress!, (value) {
    return _then(_self.copyWith(userMediaProgress: value));
  });
}/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesCopyWith<$Res>? get collapsedSeries {
    if (_self.collapsedSeries == null) {
    return null;
  }

  return $SeriesCopyWith<$Res>(_self.collapsedSeries!, (value) {
    return _then(_self.copyWith(collapsedSeries: value));
  });
}
}

// dart format on
