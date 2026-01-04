// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioFile {

 int get index; String get ino; FileMetadata get metadata; DateTime get addedAt; DateTime get updatedAt; int? get trackNumFromMeta; int? get discNumFromMeta; int? get trackNumFromFilename; int? get discNumFromFilename; bool get manuallyVerified; bool get exclude; String? get error; String? get format; Duration get duration; int get bitRate; String? get language; String get codec; String get timeBase; int get channels; String get channelLayout; List<BookChapter> get chapters; String? get embeddedCoverArt; AudioMetaTags get metaTags; String get mimeType;
/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioFileCopyWith<AudioFile> get copyWith => _$AudioFileCopyWithImpl<AudioFile>(this as AudioFile, _$identity);

  /// Serializes this AudioFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioFile&&(identical(other.index, index) || other.index == index)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.trackNumFromMeta, trackNumFromMeta) || other.trackNumFromMeta == trackNumFromMeta)&&(identical(other.discNumFromMeta, discNumFromMeta) || other.discNumFromMeta == discNumFromMeta)&&(identical(other.trackNumFromFilename, trackNumFromFilename) || other.trackNumFromFilename == trackNumFromFilename)&&(identical(other.discNumFromFilename, discNumFromFilename) || other.discNumFromFilename == discNumFromFilename)&&(identical(other.manuallyVerified, manuallyVerified) || other.manuallyVerified == manuallyVerified)&&(identical(other.exclude, exclude) || other.exclude == exclude)&&(identical(other.error, error) || other.error == error)&&(identical(other.format, format) || other.format == format)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.language, language) || other.language == language)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.timeBase, timeBase) || other.timeBase == timeBase)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.embeddedCoverArt, embeddedCoverArt) || other.embeddedCoverArt == embeddedCoverArt)&&(identical(other.metaTags, metaTags) || other.metaTags == metaTags)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,index,ino,metadata,addedAt,updatedAt,trackNumFromMeta,discNumFromMeta,trackNumFromFilename,discNumFromFilename,manuallyVerified,exclude,error,format,duration,bitRate,language,codec,timeBase,channels,channelLayout,const DeepCollectionEquality().hash(chapters),embeddedCoverArt,metaTags,mimeType]);

@override
String toString() {
  return 'AudioFile(index: $index, ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, trackNumFromMeta: $trackNumFromMeta, discNumFromMeta: $discNumFromMeta, trackNumFromFilename: $trackNumFromFilename, discNumFromFilename: $discNumFromFilename, manuallyVerified: $manuallyVerified, exclude: $exclude, error: $error, format: $format, duration: $duration, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, chapters: $chapters, embeddedCoverArt: $embeddedCoverArt, metaTags: $metaTags, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class $AudioFileCopyWith<$Res>  {
  factory $AudioFileCopyWith(AudioFile value, $Res Function(AudioFile) _then) = _$AudioFileCopyWithImpl;
@useResult
$Res call({
 int index, String ino, FileMetadata metadata, DateTime addedAt, DateTime updatedAt, int? trackNumFromMeta, int? discNumFromMeta, int? trackNumFromFilename, int? discNumFromFilename, bool manuallyVerified, bool exclude, String? error, String? format, Duration duration, int bitRate, String? language, String codec, String timeBase, int channels, String channelLayout, List<BookChapter> chapters, String? embeddedCoverArt, AudioMetaTags metaTags, String mimeType
});


$FileMetadataCopyWith<$Res> get metadata;$AudioMetaTagsCopyWith<$Res> get metaTags;

}
/// @nodoc
class _$AudioFileCopyWithImpl<$Res>
    implements $AudioFileCopyWith<$Res> {
  _$AudioFileCopyWithImpl(this._self, this._then);

  final AudioFile _self;
  final $Res Function(AudioFile) _then;

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? ino = null,Object? metadata = null,Object? addedAt = null,Object? updatedAt = null,Object? trackNumFromMeta = freezed,Object? discNumFromMeta = freezed,Object? trackNumFromFilename = freezed,Object? discNumFromFilename = freezed,Object? manuallyVerified = null,Object? exclude = null,Object? error = freezed,Object? format = freezed,Object? duration = null,Object? bitRate = null,Object? language = freezed,Object? codec = null,Object? timeBase = null,Object? channels = null,Object? channelLayout = null,Object? chapters = null,Object? embeddedCoverArt = freezed,Object? metaTags = null,Object? mimeType = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,trackNumFromMeta: freezed == trackNumFromMeta ? _self.trackNumFromMeta : trackNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,discNumFromMeta: freezed == discNumFromMeta ? _self.discNumFromMeta : discNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,trackNumFromFilename: freezed == trackNumFromFilename ? _self.trackNumFromFilename : trackNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,discNumFromFilename: freezed == discNumFromFilename ? _self.discNumFromFilename : discNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,manuallyVerified: null == manuallyVerified ? _self.manuallyVerified : manuallyVerified // ignore: cast_nullable_to_non_nullable
as bool,exclude: null == exclude ? _self.exclude : exclude // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,bitRate: null == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,timeBase: null == timeBase ? _self.timeBase : timeBase // ignore: cast_nullable_to_non_nullable
as String,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int,channelLayout: null == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,embeddedCoverArt: freezed == embeddedCoverArt ? _self.embeddedCoverArt : embeddedCoverArt // ignore: cast_nullable_to_non_nullable
as String?,metaTags: null == metaTags ? _self.metaTags : metaTags // ignore: cast_nullable_to_non_nullable
as AudioMetaTags,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res> get metadata {
  
  return $FileMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioMetaTagsCopyWith<$Res> get metaTags {
  
  return $AudioMetaTagsCopyWith<$Res>(_self.metaTags, (value) {
    return _then(_self.copyWith(metaTags: value));
  });
}
}


/// Adds pattern-matching-related methods to [AudioFile].
extension AudioFilePatterns on AudioFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioFile value)  $default,){
final _that = this;
switch (_that) {
case _AudioFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioFile value)?  $default,){
final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String ino,  FileMetadata metadata,  DateTime addedAt,  DateTime updatedAt,  int? trackNumFromMeta,  int? discNumFromMeta,  int? trackNumFromFilename,  int? discNumFromFilename,  bool manuallyVerified,  bool exclude,  String? error,  String? format,  Duration duration,  int bitRate,  String? language,  String codec,  String timeBase,  int channels,  String channelLayout,  List<BookChapter> chapters,  String? embeddedCoverArt,  AudioMetaTags metaTags,  String mimeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
return $default(_that.index,_that.ino,_that.metadata,_that.addedAt,_that.updatedAt,_that.trackNumFromMeta,_that.discNumFromMeta,_that.trackNumFromFilename,_that.discNumFromFilename,_that.manuallyVerified,_that.exclude,_that.error,_that.format,_that.duration,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.chapters,_that.embeddedCoverArt,_that.metaTags,_that.mimeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String ino,  FileMetadata metadata,  DateTime addedAt,  DateTime updatedAt,  int? trackNumFromMeta,  int? discNumFromMeta,  int? trackNumFromFilename,  int? discNumFromFilename,  bool manuallyVerified,  bool exclude,  String? error,  String? format,  Duration duration,  int bitRate,  String? language,  String codec,  String timeBase,  int channels,  String channelLayout,  List<BookChapter> chapters,  String? embeddedCoverArt,  AudioMetaTags metaTags,  String mimeType)  $default,) {final _that = this;
switch (_that) {
case _AudioFile():
return $default(_that.index,_that.ino,_that.metadata,_that.addedAt,_that.updatedAt,_that.trackNumFromMeta,_that.discNumFromMeta,_that.trackNumFromFilename,_that.discNumFromFilename,_that.manuallyVerified,_that.exclude,_that.error,_that.format,_that.duration,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.chapters,_that.embeddedCoverArt,_that.metaTags,_that.mimeType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String ino,  FileMetadata metadata,  DateTime addedAt,  DateTime updatedAt,  int? trackNumFromMeta,  int? discNumFromMeta,  int? trackNumFromFilename,  int? discNumFromFilename,  bool manuallyVerified,  bool exclude,  String? error,  String? format,  Duration duration,  int bitRate,  String? language,  String codec,  String timeBase,  int channels,  String channelLayout,  List<BookChapter> chapters,  String? embeddedCoverArt,  AudioMetaTags metaTags,  String mimeType)?  $default,) {final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
return $default(_that.index,_that.ino,_that.metadata,_that.addedAt,_that.updatedAt,_that.trackNumFromMeta,_that.discNumFromMeta,_that.trackNumFromFilename,_that.discNumFromFilename,_that.manuallyVerified,_that.exclude,_that.error,_that.format,_that.duration,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.chapters,_that.embeddedCoverArt,_that.metaTags,_that.mimeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
@DurationPreciseSecondsConverter()
class _AudioFile implements AudioFile {
  const _AudioFile({required this.index, required this.ino, required this.metadata, required this.addedAt, required this.updatedAt, this.trackNumFromMeta, this.discNumFromMeta, this.trackNumFromFilename, this.discNumFromFilename, required this.manuallyVerified, required this.exclude, this.error, this.format, required this.duration, required this.bitRate, this.language, required this.codec, required this.timeBase, required this.channels, required this.channelLayout, required final  List<BookChapter> chapters, this.embeddedCoverArt, required this.metaTags, required this.mimeType}): _chapters = chapters;
  factory _AudioFile.fromJson(Map<String, dynamic> json) => _$AudioFileFromJson(json);

@override final  int index;
@override final  String ino;
@override final  FileMetadata metadata;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;
@override final  int? trackNumFromMeta;
@override final  int? discNumFromMeta;
@override final  int? trackNumFromFilename;
@override final  int? discNumFromFilename;
@override final  bool manuallyVerified;
@override final  bool exclude;
@override final  String? error;
@override final  String? format;
@override final  Duration duration;
@override final  int bitRate;
@override final  String? language;
@override final  String codec;
@override final  String timeBase;
@override final  int channels;
@override final  String channelLayout;
 final  List<BookChapter> _chapters;
@override List<BookChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  String? embeddedCoverArt;
@override final  AudioMetaTags metaTags;
@override final  String mimeType;

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioFileCopyWith<_AudioFile> get copyWith => __$AudioFileCopyWithImpl<_AudioFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioFile&&(identical(other.index, index) || other.index == index)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.trackNumFromMeta, trackNumFromMeta) || other.trackNumFromMeta == trackNumFromMeta)&&(identical(other.discNumFromMeta, discNumFromMeta) || other.discNumFromMeta == discNumFromMeta)&&(identical(other.trackNumFromFilename, trackNumFromFilename) || other.trackNumFromFilename == trackNumFromFilename)&&(identical(other.discNumFromFilename, discNumFromFilename) || other.discNumFromFilename == discNumFromFilename)&&(identical(other.manuallyVerified, manuallyVerified) || other.manuallyVerified == manuallyVerified)&&(identical(other.exclude, exclude) || other.exclude == exclude)&&(identical(other.error, error) || other.error == error)&&(identical(other.format, format) || other.format == format)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.language, language) || other.language == language)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.timeBase, timeBase) || other.timeBase == timeBase)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.embeddedCoverArt, embeddedCoverArt) || other.embeddedCoverArt == embeddedCoverArt)&&(identical(other.metaTags, metaTags) || other.metaTags == metaTags)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,index,ino,metadata,addedAt,updatedAt,trackNumFromMeta,discNumFromMeta,trackNumFromFilename,discNumFromFilename,manuallyVerified,exclude,error,format,duration,bitRate,language,codec,timeBase,channels,channelLayout,const DeepCollectionEquality().hash(_chapters),embeddedCoverArt,metaTags,mimeType]);

@override
String toString() {
  return 'AudioFile(index: $index, ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, trackNumFromMeta: $trackNumFromMeta, discNumFromMeta: $discNumFromMeta, trackNumFromFilename: $trackNumFromFilename, discNumFromFilename: $discNumFromFilename, manuallyVerified: $manuallyVerified, exclude: $exclude, error: $error, format: $format, duration: $duration, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, chapters: $chapters, embeddedCoverArt: $embeddedCoverArt, metaTags: $metaTags, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$AudioFileCopyWith<$Res> implements $AudioFileCopyWith<$Res> {
  factory _$AudioFileCopyWith(_AudioFile value, $Res Function(_AudioFile) _then) = __$AudioFileCopyWithImpl;
@override @useResult
$Res call({
 int index, String ino, FileMetadata metadata, DateTime addedAt, DateTime updatedAt, int? trackNumFromMeta, int? discNumFromMeta, int? trackNumFromFilename, int? discNumFromFilename, bool manuallyVerified, bool exclude, String? error, String? format, Duration duration, int bitRate, String? language, String codec, String timeBase, int channels, String channelLayout, List<BookChapter> chapters, String? embeddedCoverArt, AudioMetaTags metaTags, String mimeType
});


@override $FileMetadataCopyWith<$Res> get metadata;@override $AudioMetaTagsCopyWith<$Res> get metaTags;

}
/// @nodoc
class __$AudioFileCopyWithImpl<$Res>
    implements _$AudioFileCopyWith<$Res> {
  __$AudioFileCopyWithImpl(this._self, this._then);

  final _AudioFile _self;
  final $Res Function(_AudioFile) _then;

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? ino = null,Object? metadata = null,Object? addedAt = null,Object? updatedAt = null,Object? trackNumFromMeta = freezed,Object? discNumFromMeta = freezed,Object? trackNumFromFilename = freezed,Object? discNumFromFilename = freezed,Object? manuallyVerified = null,Object? exclude = null,Object? error = freezed,Object? format = freezed,Object? duration = null,Object? bitRate = null,Object? language = freezed,Object? codec = null,Object? timeBase = null,Object? channels = null,Object? channelLayout = null,Object? chapters = null,Object? embeddedCoverArt = freezed,Object? metaTags = null,Object? mimeType = null,}) {
  return _then(_AudioFile(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,trackNumFromMeta: freezed == trackNumFromMeta ? _self.trackNumFromMeta : trackNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,discNumFromMeta: freezed == discNumFromMeta ? _self.discNumFromMeta : discNumFromMeta // ignore: cast_nullable_to_non_nullable
as int?,trackNumFromFilename: freezed == trackNumFromFilename ? _self.trackNumFromFilename : trackNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,discNumFromFilename: freezed == discNumFromFilename ? _self.discNumFromFilename : discNumFromFilename // ignore: cast_nullable_to_non_nullable
as int?,manuallyVerified: null == manuallyVerified ? _self.manuallyVerified : manuallyVerified // ignore: cast_nullable_to_non_nullable
as bool,exclude: null == exclude ? _self.exclude : exclude // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,bitRate: null == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,timeBase: null == timeBase ? _self.timeBase : timeBase // ignore: cast_nullable_to_non_nullable
as String,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int,channelLayout: null == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,embeddedCoverArt: freezed == embeddedCoverArt ? _self.embeddedCoverArt : embeddedCoverArt // ignore: cast_nullable_to_non_nullable
as String?,metaTags: null == metaTags ? _self.metaTags : metaTags // ignore: cast_nullable_to_non_nullable
as AudioMetaTags,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res> get metadata {
  
  return $FileMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioMetaTagsCopyWith<$Res> get metaTags {
  
  return $AudioMetaTagsCopyWith<$Res>(_self.metaTags, (value) {
    return _then(_self.copyWith(metaTags: value));
  });
}
}

// dart format on
