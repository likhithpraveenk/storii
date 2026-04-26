// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioTrack {

 int get index; Duration get startOffset; Duration get duration; String get title; String get contentUrl; String? get mimeType; FileMetadata? get metadata; String? get ino; DateTime? get addedAt; DateTime? get updatedAt; int? get trackNumFromMeta; int? get discNumFromMeta; int? get trackNumFromFilename; int? get discNumFromFilename; bool? get manuallyVerified; bool? get exclude; String? get error; String? get format; int? get bitRate; String? get language; String? get codec; String? get timeBase; int? get channels; String? get channelLayout; List<BookChapter>? get chapters; String? get embeddedCoverArt; AudioMetaTags? get metaTags;
/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioTrackCopyWith<AudioTrack> get copyWith => _$AudioTrackCopyWithImpl<AudioTrack>(this as AudioTrack, _$identity);

  /// Serializes this AudioTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioTrack&&(identical(other.index, index) || other.index == index)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.trackNumFromMeta, trackNumFromMeta) || other.trackNumFromMeta == trackNumFromMeta)&&(identical(other.discNumFromMeta, discNumFromMeta) || other.discNumFromMeta == discNumFromMeta)&&(identical(other.trackNumFromFilename, trackNumFromFilename) || other.trackNumFromFilename == trackNumFromFilename)&&(identical(other.discNumFromFilename, discNumFromFilename) || other.discNumFromFilename == discNumFromFilename)&&(identical(other.manuallyVerified, manuallyVerified) || other.manuallyVerified == manuallyVerified)&&(identical(other.exclude, exclude) || other.exclude == exclude)&&(identical(other.error, error) || other.error == error)&&(identical(other.format, format) || other.format == format)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.language, language) || other.language == language)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.timeBase, timeBase) || other.timeBase == timeBase)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.embeddedCoverArt, embeddedCoverArt) || other.embeddedCoverArt == embeddedCoverArt)&&(identical(other.metaTags, metaTags) || other.metaTags == metaTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,index,startOffset,duration,title,contentUrl,mimeType,metadata,ino,addedAt,updatedAt,trackNumFromMeta,discNumFromMeta,trackNumFromFilename,discNumFromFilename,manuallyVerified,exclude,error,format,bitRate,language,codec,timeBase,channels,channelLayout,const DeepCollectionEquality().hash(chapters),embeddedCoverArt,metaTags]);

@override
String toString() {
  return 'AudioTrack(index: $index, startOffset: $startOffset, duration: $duration, title: $title, contentUrl: $contentUrl, mimeType: $mimeType, metadata: $metadata, ino: $ino, addedAt: $addedAt, updatedAt: $updatedAt, trackNumFromMeta: $trackNumFromMeta, discNumFromMeta: $discNumFromMeta, trackNumFromFilename: $trackNumFromFilename, discNumFromFilename: $discNumFromFilename, manuallyVerified: $manuallyVerified, exclude: $exclude, error: $error, format: $format, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, chapters: $chapters, embeddedCoverArt: $embeddedCoverArt, metaTags: $metaTags)';
}


}

/// @nodoc
abstract mixin class $AudioTrackCopyWith<$Res>  {
  factory $AudioTrackCopyWith(AudioTrack value, $Res Function(AudioTrack) _then) = _$AudioTrackCopyWithImpl;
@useResult
$Res call({
 int index, Duration startOffset, Duration duration, String title, String contentUrl, String? mimeType, FileMetadata? metadata, String? ino, DateTime? addedAt, DateTime? updatedAt, int? trackNumFromMeta, int? discNumFromMeta, int? trackNumFromFilename, int? discNumFromFilename, bool? manuallyVerified, bool? exclude, String? error, String? format, int? bitRate, String? language, String? codec, String? timeBase, int? channels, String? channelLayout, List<BookChapter>? chapters, String? embeddedCoverArt, AudioMetaTags? metaTags
});


$FileMetadataCopyWith<$Res>? get metadata;$AudioMetaTagsCopyWith<$Res>? get metaTags;

}
/// @nodoc
class _$AudioTrackCopyWithImpl<$Res>
    implements $AudioTrackCopyWith<$Res> {
  _$AudioTrackCopyWithImpl(this._self, this._then);

  final AudioTrack _self;
  final $Res Function(AudioTrack) _then;

/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? startOffset = null,Object? duration = null,Object? title = null,Object? contentUrl = null,Object? mimeType = freezed,Object? metadata = freezed,Object? ino = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? trackNumFromMeta = freezed,Object? discNumFromMeta = freezed,Object? trackNumFromFilename = freezed,Object? discNumFromFilename = freezed,Object? manuallyVerified = freezed,Object? exclude = freezed,Object? error = freezed,Object? format = freezed,Object? bitRate = freezed,Object? language = freezed,Object? codec = freezed,Object? timeBase = freezed,Object? channels = freezed,Object? channelLayout = freezed,Object? chapters = freezed,Object? embeddedCoverArt = freezed,Object? metaTags = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,startOffset: null == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata?,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trackNumFromMeta: freezed == trackNumFromMeta ? _self.trackNumFromMeta : trackNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,discNumFromMeta: freezed == discNumFromMeta ? _self.discNumFromMeta : discNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,trackNumFromFilename: freezed == trackNumFromFilename ? _self.trackNumFromFilename : trackNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,discNumFromFilename: freezed == discNumFromFilename ? _self.discNumFromFilename : discNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,manuallyVerified: freezed == manuallyVerified ? _self.manuallyVerified : manuallyVerified // ignore: cast_nullable_to_non_nullable
as bool?,exclude: freezed == exclude ? _self.exclude : exclude // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,timeBase: freezed == timeBase ? _self.timeBase : timeBase // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,embeddedCoverArt: freezed == embeddedCoverArt ? _self.embeddedCoverArt : embeddedCoverArt // ignore: cast_nullable_to_non_nullable
as String?,metaTags: freezed == metaTags ? _self.metaTags : metaTags // ignore: cast_nullable_to_non_nullable
as AudioMetaTags?,
  ));
}
/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $FileMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioMetaTagsCopyWith<$Res>? get metaTags {
    if (_self.metaTags == null) {
    return null;
  }

  return $AudioMetaTagsCopyWith<$Res>(_self.metaTags!, (value) {
    return _then(_self.copyWith(metaTags: value));
  });
}
}


/// Adds pattern-matching-related methods to [AudioTrack].
extension AudioTrackPatterns on AudioTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioTrack value)  $default,){
final _that = this;
switch (_that) {
case _AudioTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioTrack value)?  $default,){
final _that = this;
switch (_that) {
case _AudioTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  Duration startOffset,  Duration duration,  String title,  String contentUrl,  String? mimeType,  FileMetadata? metadata,  String? ino,  DateTime? addedAt,  DateTime? updatedAt,  int? trackNumFromMeta,  int? discNumFromMeta,  int? trackNumFromFilename,  int? discNumFromFilename,  bool? manuallyVerified,  bool? exclude,  String? error,  String? format,  int? bitRate,  String? language,  String? codec,  String? timeBase,  int? channels,  String? channelLayout,  List<BookChapter>? chapters,  String? embeddedCoverArt,  AudioMetaTags? metaTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioTrack() when $default != null:
return $default(_that.index,_that.startOffset,_that.duration,_that.title,_that.contentUrl,_that.mimeType,_that.metadata,_that.ino,_that.addedAt,_that.updatedAt,_that.trackNumFromMeta,_that.discNumFromMeta,_that.trackNumFromFilename,_that.discNumFromFilename,_that.manuallyVerified,_that.exclude,_that.error,_that.format,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.chapters,_that.embeddedCoverArt,_that.metaTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  Duration startOffset,  Duration duration,  String title,  String contentUrl,  String? mimeType,  FileMetadata? metadata,  String? ino,  DateTime? addedAt,  DateTime? updatedAt,  int? trackNumFromMeta,  int? discNumFromMeta,  int? trackNumFromFilename,  int? discNumFromFilename,  bool? manuallyVerified,  bool? exclude,  String? error,  String? format,  int? bitRate,  String? language,  String? codec,  String? timeBase,  int? channels,  String? channelLayout,  List<BookChapter>? chapters,  String? embeddedCoverArt,  AudioMetaTags? metaTags)  $default,) {final _that = this;
switch (_that) {
case _AudioTrack():
return $default(_that.index,_that.startOffset,_that.duration,_that.title,_that.contentUrl,_that.mimeType,_that.metadata,_that.ino,_that.addedAt,_that.updatedAt,_that.trackNumFromMeta,_that.discNumFromMeta,_that.trackNumFromFilename,_that.discNumFromFilename,_that.manuallyVerified,_that.exclude,_that.error,_that.format,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.chapters,_that.embeddedCoverArt,_that.metaTags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  Duration startOffset,  Duration duration,  String title,  String contentUrl,  String? mimeType,  FileMetadata? metadata,  String? ino,  DateTime? addedAt,  DateTime? updatedAt,  int? trackNumFromMeta,  int? discNumFromMeta,  int? trackNumFromFilename,  int? discNumFromFilename,  bool? manuallyVerified,  bool? exclude,  String? error,  String? format,  int? bitRate,  String? language,  String? codec,  String? timeBase,  int? channels,  String? channelLayout,  List<BookChapter>? chapters,  String? embeddedCoverArt,  AudioMetaTags? metaTags)?  $default,) {final _that = this;
switch (_that) {
case _AudioTrack() when $default != null:
return $default(_that.index,_that.startOffset,_that.duration,_that.title,_that.contentUrl,_that.mimeType,_that.metadata,_that.ino,_that.addedAt,_that.updatedAt,_that.trackNumFromMeta,_that.discNumFromMeta,_that.trackNumFromFilename,_that.discNumFromFilename,_that.manuallyVerified,_that.exclude,_that.error,_that.format,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.chapters,_that.embeddedCoverArt,_that.metaTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
@DurationPreciseSecondsConverter()
class _AudioTrack implements AudioTrack {
  const _AudioTrack({required this.index, required this.startOffset, required this.duration, required this.title, required this.contentUrl, this.mimeType, this.metadata, this.ino, this.addedAt, this.updatedAt, this.trackNumFromMeta, this.discNumFromMeta, this.trackNumFromFilename, this.discNumFromFilename, this.manuallyVerified, this.exclude, this.error, this.format, this.bitRate, this.language, this.codec, this.timeBase, this.channels, this.channelLayout, final  List<BookChapter>? chapters, this.embeddedCoverArt, this.metaTags}): _chapters = chapters;
  factory _AudioTrack.fromJson(Map<String, dynamic> json) => _$AudioTrackFromJson(json);

@override final  int index;
@override final  Duration startOffset;
@override final  Duration duration;
@override final  String title;
@override final  String contentUrl;
@override final  String? mimeType;
@override final  FileMetadata? metadata;
@override final  String? ino;
@override final  DateTime? addedAt;
@override final  DateTime? updatedAt;
@override final  int? trackNumFromMeta;
@override final  int? discNumFromMeta;
@override final  int? trackNumFromFilename;
@override final  int? discNumFromFilename;
@override final  bool? manuallyVerified;
@override final  bool? exclude;
@override final  String? error;
@override final  String? format;
@override final  int? bitRate;
@override final  String? language;
@override final  String? codec;
@override final  String? timeBase;
@override final  int? channels;
@override final  String? channelLayout;
 final  List<BookChapter>? _chapters;
@override List<BookChapter>? get chapters {
  final value = _chapters;
  if (value == null) return null;
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? embeddedCoverArt;
@override final  AudioMetaTags? metaTags;

/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioTrackCopyWith<_AudioTrack> get copyWith => __$AudioTrackCopyWithImpl<_AudioTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioTrack&&(identical(other.index, index) || other.index == index)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.trackNumFromMeta, trackNumFromMeta) || other.trackNumFromMeta == trackNumFromMeta)&&(identical(other.discNumFromMeta, discNumFromMeta) || other.discNumFromMeta == discNumFromMeta)&&(identical(other.trackNumFromFilename, trackNumFromFilename) || other.trackNumFromFilename == trackNumFromFilename)&&(identical(other.discNumFromFilename, discNumFromFilename) || other.discNumFromFilename == discNumFromFilename)&&(identical(other.manuallyVerified, manuallyVerified) || other.manuallyVerified == manuallyVerified)&&(identical(other.exclude, exclude) || other.exclude == exclude)&&(identical(other.error, error) || other.error == error)&&(identical(other.format, format) || other.format == format)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.language, language) || other.language == language)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.timeBase, timeBase) || other.timeBase == timeBase)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.embeddedCoverArt, embeddedCoverArt) || other.embeddedCoverArt == embeddedCoverArt)&&(identical(other.metaTags, metaTags) || other.metaTags == metaTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,index,startOffset,duration,title,contentUrl,mimeType,metadata,ino,addedAt,updatedAt,trackNumFromMeta,discNumFromMeta,trackNumFromFilename,discNumFromFilename,manuallyVerified,exclude,error,format,bitRate,language,codec,timeBase,channels,channelLayout,const DeepCollectionEquality().hash(_chapters),embeddedCoverArt,metaTags]);

@override
String toString() {
  return 'AudioTrack(index: $index, startOffset: $startOffset, duration: $duration, title: $title, contentUrl: $contentUrl, mimeType: $mimeType, metadata: $metadata, ino: $ino, addedAt: $addedAt, updatedAt: $updatedAt, trackNumFromMeta: $trackNumFromMeta, discNumFromMeta: $discNumFromMeta, trackNumFromFilename: $trackNumFromFilename, discNumFromFilename: $discNumFromFilename, manuallyVerified: $manuallyVerified, exclude: $exclude, error: $error, format: $format, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, chapters: $chapters, embeddedCoverArt: $embeddedCoverArt, metaTags: $metaTags)';
}


}

/// @nodoc
abstract mixin class _$AudioTrackCopyWith<$Res> implements $AudioTrackCopyWith<$Res> {
  factory _$AudioTrackCopyWith(_AudioTrack value, $Res Function(_AudioTrack) _then) = __$AudioTrackCopyWithImpl;
@override @useResult
$Res call({
 int index, Duration startOffset, Duration duration, String title, String contentUrl, String? mimeType, FileMetadata? metadata, String? ino, DateTime? addedAt, DateTime? updatedAt, int? trackNumFromMeta, int? discNumFromMeta, int? trackNumFromFilename, int? discNumFromFilename, bool? manuallyVerified, bool? exclude, String? error, String? format, int? bitRate, String? language, String? codec, String? timeBase, int? channels, String? channelLayout, List<BookChapter>? chapters, String? embeddedCoverArt, AudioMetaTags? metaTags
});


@override $FileMetadataCopyWith<$Res>? get metadata;@override $AudioMetaTagsCopyWith<$Res>? get metaTags;

}
/// @nodoc
class __$AudioTrackCopyWithImpl<$Res>
    implements _$AudioTrackCopyWith<$Res> {
  __$AudioTrackCopyWithImpl(this._self, this._then);

  final _AudioTrack _self;
  final $Res Function(_AudioTrack) _then;

/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? startOffset = null,Object? duration = null,Object? title = null,Object? contentUrl = null,Object? mimeType = freezed,Object? metadata = freezed,Object? ino = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? trackNumFromMeta = freezed,Object? discNumFromMeta = freezed,Object? trackNumFromFilename = freezed,Object? discNumFromFilename = freezed,Object? manuallyVerified = freezed,Object? exclude = freezed,Object? error = freezed,Object? format = freezed,Object? bitRate = freezed,Object? language = freezed,Object? codec = freezed,Object? timeBase = freezed,Object? channels = freezed,Object? channelLayout = freezed,Object? chapters = freezed,Object? embeddedCoverArt = freezed,Object? metaTags = freezed,}) {
  return _then(_AudioTrack(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,startOffset: null == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata?,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trackNumFromMeta: freezed == trackNumFromMeta ? _self.trackNumFromMeta : trackNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,discNumFromMeta: freezed == discNumFromMeta ? _self.discNumFromMeta : discNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,trackNumFromFilename: freezed == trackNumFromFilename ? _self.trackNumFromFilename : trackNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,discNumFromFilename: freezed == discNumFromFilename ? _self.discNumFromFilename : discNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,manuallyVerified: freezed == manuallyVerified ? _self.manuallyVerified : manuallyVerified // ignore: cast_nullable_to_non_nullable
as bool?,exclude: freezed == exclude ? _self.exclude : exclude // ignore: cast_nullable_to_non_nullable
as bool?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,timeBase: freezed == timeBase ? _self.timeBase : timeBase // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,chapters: freezed == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,embeddedCoverArt: freezed == embeddedCoverArt ? _self.embeddedCoverArt : embeddedCoverArt // ignore: cast_nullable_to_non_nullable
as String?,metaTags: freezed == metaTags ? _self.metaTags : metaTags // ignore: cast_nullable_to_non_nullable
as AudioMetaTags?,
  ));
}

/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $FileMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AudioTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioMetaTagsCopyWith<$Res>? get metaTags {
    if (_self.metaTags == null) {
    return null;
  }

  return $AudioMetaTagsCopyWith<$Res>(_self.metaTags!, (value) {
    return _then(_self.copyWith(metaTags: value));
  });
}
}

// dart format on
