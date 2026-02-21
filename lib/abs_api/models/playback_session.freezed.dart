// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaybackSession {

 String get id; String get userId; String get libraryId; String get libraryItemId; String? get episodeId; MediaType get mediaType; MediaMetadata get mediaMetadata; List<BookChapter> get chapters; String get displayTitle; String get displayAuthor; String? get coverPath; Duration get duration; PlayMethod get playMethod; String get mediaPlayer; DeviceInfo? get deviceInfo; String get date; String get dayOfWeek; Duration get timeListening; Duration get startTime; Duration get currentTime; DateTime get startedAt; DateTime get updatedAt; SessionUser? get user; List<AudioTrack>? get audioTracks; LibraryItem? get libraryItem;
/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackSessionCopyWith<PlaybackSession> get copyWith => _$PlaybackSessionCopyWithImpl<PlaybackSession>(this as PlaybackSession, _$identity);

  /// Serializes this PlaybackSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaMetadata, mediaMetadata) || other.mediaMetadata == mediaMetadata)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.displayTitle, displayTitle) || other.displayTitle == displayTitle)&&(identical(other.displayAuthor, displayAuthor) || other.displayAuthor == displayAuthor)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.playMethod, playMethod) || other.playMethod == playMethod)&&(identical(other.mediaPlayer, mediaPlayer) || other.mediaPlayer == mediaPlayer)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.timeListening, timeListening) || other.timeListening == timeListening)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.audioTracks, audioTracks)&&(identical(other.libraryItem, libraryItem) || other.libraryItem == libraryItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,libraryId,libraryItemId,episodeId,mediaType,mediaMetadata,const DeepCollectionEquality().hash(chapters),displayTitle,displayAuthor,coverPath,duration,playMethod,mediaPlayer,deviceInfo,date,dayOfWeek,timeListening,startTime,currentTime,startedAt,updatedAt,user,const DeepCollectionEquality().hash(audioTracks),libraryItem]);

@override
String toString() {
  return 'PlaybackSession(id: $id, userId: $userId, libraryId: $libraryId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaType: $mediaType, mediaMetadata: $mediaMetadata, chapters: $chapters, displayTitle: $displayTitle, displayAuthor: $displayAuthor, coverPath: $coverPath, duration: $duration, playMethod: $playMethod, mediaPlayer: $mediaPlayer, deviceInfo: $deviceInfo, date: $date, dayOfWeek: $dayOfWeek, timeListening: $timeListening, startTime: $startTime, currentTime: $currentTime, startedAt: $startedAt, updatedAt: $updatedAt, user: $user, audioTracks: $audioTracks, libraryItem: $libraryItem)';
}


}

/// @nodoc
abstract mixin class $PlaybackSessionCopyWith<$Res>  {
  factory $PlaybackSessionCopyWith(PlaybackSession value, $Res Function(PlaybackSession) _then) = _$PlaybackSessionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String libraryId, String libraryItemId, String? episodeId, MediaType mediaType, MediaMetadata mediaMetadata, List<BookChapter> chapters, String displayTitle, String displayAuthor, String? coverPath, Duration duration, PlayMethod playMethod, String mediaPlayer, DeviceInfo? deviceInfo, String date, String dayOfWeek, Duration timeListening, Duration startTime, Duration currentTime, DateTime startedAt, DateTime updatedAt, SessionUser? user, List<AudioTrack>? audioTracks, LibraryItem? libraryItem
});


$MediaMetadataCopyWith<$Res> get mediaMetadata;$DeviceInfoCopyWith<$Res>? get deviceInfo;$SessionUserCopyWith<$Res>? get user;$LibraryItemCopyWith<$Res>? get libraryItem;

}
/// @nodoc
class _$PlaybackSessionCopyWithImpl<$Res>
    implements $PlaybackSessionCopyWith<$Res> {
  _$PlaybackSessionCopyWithImpl(this._self, this._then);

  final PlaybackSession _self;
  final $Res Function(PlaybackSession) _then;

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? libraryId = null,Object? libraryItemId = null,Object? episodeId = freezed,Object? mediaType = null,Object? mediaMetadata = null,Object? chapters = null,Object? displayTitle = null,Object? displayAuthor = null,Object? coverPath = freezed,Object? duration = null,Object? playMethod = null,Object? mediaPlayer = null,Object? deviceInfo = freezed,Object? date = null,Object? dayOfWeek = null,Object? timeListening = null,Object? startTime = null,Object? currentTime = null,Object? startedAt = null,Object? updatedAt = null,Object? user = freezed,Object? audioTracks = freezed,Object? libraryItem = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,mediaMetadata: null == mediaMetadata ? _self.mediaMetadata : mediaMetadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,displayTitle: null == displayTitle ? _self.displayTitle : displayTitle // ignore: cast_nullable_to_non_nullable
as String,displayAuthor: null == displayAuthor ? _self.displayAuthor : displayAuthor // ignore: cast_nullable_to_non_nullable
as String,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,playMethod: null == playMethod ? _self.playMethod : playMethod // ignore: cast_nullable_to_non_nullable
as PlayMethod,mediaPlayer: null == mediaPlayer ? _self.mediaPlayer : mediaPlayer // ignore: cast_nullable_to_non_nullable
as String,deviceInfo: freezed == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as DeviceInfo?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,timeListening: null == timeListening ? _self.timeListening : timeListening // ignore: cast_nullable_to_non_nullable
as Duration,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Duration,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as Duration,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUser?,audioTracks: freezed == audioTracks ? _self.audioTracks : audioTracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>?,libraryItem: freezed == libraryItem ? _self.libraryItem : libraryItem // ignore: cast_nullable_to_non_nullable
as LibraryItem?,
  ));
}
/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get mediaMetadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.mediaMetadata, (value) {
    return _then(_self.copyWith(mediaMetadata: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceInfoCopyWith<$Res>? get deviceInfo {
    if (_self.deviceInfo == null) {
    return null;
  }

  return $DeviceInfoCopyWith<$Res>(_self.deviceInfo!, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SessionUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<$Res>? get libraryItem {
    if (_self.libraryItem == null) {
    return null;
  }

  return $LibraryItemCopyWith<$Res>(_self.libraryItem!, (value) {
    return _then(_self.copyWith(libraryItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaybackSession].
extension PlaybackSessionPatterns on PlaybackSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybackSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybackSession value)  $default,){
final _that = this;
switch (_that) {
case _PlaybackSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybackSession value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String libraryId,  String libraryItemId,  String? episodeId,  MediaType mediaType,  MediaMetadata mediaMetadata,  List<BookChapter> chapters,  String displayTitle,  String displayAuthor,  String? coverPath,  Duration duration,  PlayMethod playMethod,  String mediaPlayer,  DeviceInfo? deviceInfo,  String date,  String dayOfWeek,  Duration timeListening,  Duration startTime,  Duration currentTime,  DateTime startedAt,  DateTime updatedAt,  SessionUser? user,  List<AudioTrack>? audioTracks,  LibraryItem? libraryItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
return $default(_that.id,_that.userId,_that.libraryId,_that.libraryItemId,_that.episodeId,_that.mediaType,_that.mediaMetadata,_that.chapters,_that.displayTitle,_that.displayAuthor,_that.coverPath,_that.duration,_that.playMethod,_that.mediaPlayer,_that.deviceInfo,_that.date,_that.dayOfWeek,_that.timeListening,_that.startTime,_that.currentTime,_that.startedAt,_that.updatedAt,_that.user,_that.audioTracks,_that.libraryItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String libraryId,  String libraryItemId,  String? episodeId,  MediaType mediaType,  MediaMetadata mediaMetadata,  List<BookChapter> chapters,  String displayTitle,  String displayAuthor,  String? coverPath,  Duration duration,  PlayMethod playMethod,  String mediaPlayer,  DeviceInfo? deviceInfo,  String date,  String dayOfWeek,  Duration timeListening,  Duration startTime,  Duration currentTime,  DateTime startedAt,  DateTime updatedAt,  SessionUser? user,  List<AudioTrack>? audioTracks,  LibraryItem? libraryItem)  $default,) {final _that = this;
switch (_that) {
case _PlaybackSession():
return $default(_that.id,_that.userId,_that.libraryId,_that.libraryItemId,_that.episodeId,_that.mediaType,_that.mediaMetadata,_that.chapters,_that.displayTitle,_that.displayAuthor,_that.coverPath,_that.duration,_that.playMethod,_that.mediaPlayer,_that.deviceInfo,_that.date,_that.dayOfWeek,_that.timeListening,_that.startTime,_that.currentTime,_that.startedAt,_that.updatedAt,_that.user,_that.audioTracks,_that.libraryItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String libraryId,  String libraryItemId,  String? episodeId,  MediaType mediaType,  MediaMetadata mediaMetadata,  List<BookChapter> chapters,  String displayTitle,  String displayAuthor,  String? coverPath,  Duration duration,  PlayMethod playMethod,  String mediaPlayer,  DeviceInfo? deviceInfo,  String date,  String dayOfWeek,  Duration timeListening,  Duration startTime,  Duration currentTime,  DateTime startedAt,  DateTime updatedAt,  SessionUser? user,  List<AudioTrack>? audioTracks,  LibraryItem? libraryItem)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
return $default(_that.id,_that.userId,_that.libraryId,_that.libraryItemId,_that.episodeId,_that.mediaType,_that.mediaMetadata,_that.chapters,_that.displayTitle,_that.displayAuthor,_that.coverPath,_that.duration,_that.playMethod,_that.mediaPlayer,_that.deviceInfo,_that.date,_that.dayOfWeek,_that.timeListening,_that.startTime,_that.currentTime,_that.startedAt,_that.updatedAt,_that.user,_that.audioTracks,_that.libraryItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
@DurationPreciseSecondsConverter()
class _PlaybackSession implements PlaybackSession {
  const _PlaybackSession({required this.id, required this.userId, required this.libraryId, required this.libraryItemId, this.episodeId, required this.mediaType, required this.mediaMetadata, required final  List<BookChapter> chapters, required this.displayTitle, required this.displayAuthor, this.coverPath, required this.duration, required this.playMethod, required this.mediaPlayer, this.deviceInfo, required this.date, required this.dayOfWeek, required this.timeListening, required this.startTime, required this.currentTime, required this.startedAt, required this.updatedAt, this.user, final  List<AudioTrack>? audioTracks, this.libraryItem}): _chapters = chapters,_audioTracks = audioTracks;
  factory _PlaybackSession.fromJson(Map<String, dynamic> json) => _$PlaybackSessionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String libraryId;
@override final  String libraryItemId;
@override final  String? episodeId;
@override final  MediaType mediaType;
@override final  MediaMetadata mediaMetadata;
 final  List<BookChapter> _chapters;
@override List<BookChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  String displayTitle;
@override final  String displayAuthor;
@override final  String? coverPath;
@override final  Duration duration;
@override final  PlayMethod playMethod;
@override final  String mediaPlayer;
@override final  DeviceInfo? deviceInfo;
@override final  String date;
@override final  String dayOfWeek;
@override final  Duration timeListening;
@override final  Duration startTime;
@override final  Duration currentTime;
@override final  DateTime startedAt;
@override final  DateTime updatedAt;
@override final  SessionUser? user;
 final  List<AudioTrack>? _audioTracks;
@override List<AudioTrack>? get audioTracks {
  final value = _audioTracks;
  if (value == null) return null;
  if (_audioTracks is EqualUnmodifiableListView) return _audioTracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  LibraryItem? libraryItem;

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybackSessionCopyWith<_PlaybackSession> get copyWith => __$PlaybackSessionCopyWithImpl<_PlaybackSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaybackSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaMetadata, mediaMetadata) || other.mediaMetadata == mediaMetadata)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.displayTitle, displayTitle) || other.displayTitle == displayTitle)&&(identical(other.displayAuthor, displayAuthor) || other.displayAuthor == displayAuthor)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.playMethod, playMethod) || other.playMethod == playMethod)&&(identical(other.mediaPlayer, mediaPlayer) || other.mediaPlayer == mediaPlayer)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.timeListening, timeListening) || other.timeListening == timeListening)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._audioTracks, _audioTracks)&&(identical(other.libraryItem, libraryItem) || other.libraryItem == libraryItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,libraryId,libraryItemId,episodeId,mediaType,mediaMetadata,const DeepCollectionEquality().hash(_chapters),displayTitle,displayAuthor,coverPath,duration,playMethod,mediaPlayer,deviceInfo,date,dayOfWeek,timeListening,startTime,currentTime,startedAt,updatedAt,user,const DeepCollectionEquality().hash(_audioTracks),libraryItem]);

@override
String toString() {
  return 'PlaybackSession(id: $id, userId: $userId, libraryId: $libraryId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaType: $mediaType, mediaMetadata: $mediaMetadata, chapters: $chapters, displayTitle: $displayTitle, displayAuthor: $displayAuthor, coverPath: $coverPath, duration: $duration, playMethod: $playMethod, mediaPlayer: $mediaPlayer, deviceInfo: $deviceInfo, date: $date, dayOfWeek: $dayOfWeek, timeListening: $timeListening, startTime: $startTime, currentTime: $currentTime, startedAt: $startedAt, updatedAt: $updatedAt, user: $user, audioTracks: $audioTracks, libraryItem: $libraryItem)';
}


}

/// @nodoc
abstract mixin class _$PlaybackSessionCopyWith<$Res> implements $PlaybackSessionCopyWith<$Res> {
  factory _$PlaybackSessionCopyWith(_PlaybackSession value, $Res Function(_PlaybackSession) _then) = __$PlaybackSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String libraryId, String libraryItemId, String? episodeId, MediaType mediaType, MediaMetadata mediaMetadata, List<BookChapter> chapters, String displayTitle, String displayAuthor, String? coverPath, Duration duration, PlayMethod playMethod, String mediaPlayer, DeviceInfo? deviceInfo, String date, String dayOfWeek, Duration timeListening, Duration startTime, Duration currentTime, DateTime startedAt, DateTime updatedAt, SessionUser? user, List<AudioTrack>? audioTracks, LibraryItem? libraryItem
});


@override $MediaMetadataCopyWith<$Res> get mediaMetadata;@override $DeviceInfoCopyWith<$Res>? get deviceInfo;@override $SessionUserCopyWith<$Res>? get user;@override $LibraryItemCopyWith<$Res>? get libraryItem;

}
/// @nodoc
class __$PlaybackSessionCopyWithImpl<$Res>
    implements _$PlaybackSessionCopyWith<$Res> {
  __$PlaybackSessionCopyWithImpl(this._self, this._then);

  final _PlaybackSession _self;
  final $Res Function(_PlaybackSession) _then;

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? libraryId = null,Object? libraryItemId = null,Object? episodeId = freezed,Object? mediaType = null,Object? mediaMetadata = null,Object? chapters = null,Object? displayTitle = null,Object? displayAuthor = null,Object? coverPath = freezed,Object? duration = null,Object? playMethod = null,Object? mediaPlayer = null,Object? deviceInfo = freezed,Object? date = null,Object? dayOfWeek = null,Object? timeListening = null,Object? startTime = null,Object? currentTime = null,Object? startedAt = null,Object? updatedAt = null,Object? user = freezed,Object? audioTracks = freezed,Object? libraryItem = freezed,}) {
  return _then(_PlaybackSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,mediaMetadata: null == mediaMetadata ? _self.mediaMetadata : mediaMetadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,displayTitle: null == displayTitle ? _self.displayTitle : displayTitle // ignore: cast_nullable_to_non_nullable
as String,displayAuthor: null == displayAuthor ? _self.displayAuthor : displayAuthor // ignore: cast_nullable_to_non_nullable
as String,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,playMethod: null == playMethod ? _self.playMethod : playMethod // ignore: cast_nullable_to_non_nullable
as PlayMethod,mediaPlayer: null == mediaPlayer ? _self.mediaPlayer : mediaPlayer // ignore: cast_nullable_to_non_nullable
as String,deviceInfo: freezed == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as DeviceInfo?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,timeListening: null == timeListening ? _self.timeListening : timeListening // ignore: cast_nullable_to_non_nullable
as Duration,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Duration,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as Duration,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUser?,audioTracks: freezed == audioTracks ? _self._audioTracks : audioTracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>?,libraryItem: freezed == libraryItem ? _self.libraryItem : libraryItem // ignore: cast_nullable_to_non_nullable
as LibraryItem?,
  ));
}

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get mediaMetadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.mediaMetadata, (value) {
    return _then(_self.copyWith(mediaMetadata: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceInfoCopyWith<$Res>? get deviceInfo {
    if (_self.deviceInfo == null) {
    return null;
  }

  return $DeviceInfoCopyWith<$Res>(_self.deviceInfo!, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SessionUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<$Res>? get libraryItem {
    if (_self.libraryItem == null) {
    return null;
  }

  return $LibraryItemCopyWith<$Res>(_self.libraryItem!, (value) {
    return _then(_self.copyWith(libraryItem: value));
  });
}
}

// dart format on
