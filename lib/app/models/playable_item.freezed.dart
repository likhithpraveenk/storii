// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playable_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PlayableItem _$PlayableItemFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'audiobook':
          return AudiobookItem.fromJson(
            json
          );
                case 'podcast':
          return PodcastItem.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'PlayableItem',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$PlayableItem {

 String get libraryId; String get id; String get sessionId; Uri get cover; String? get title; String? get authorName; List<AudioTrack> get tracks; Duration get duration;
/// Create a copy of PlayableItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayableItemCopyWith<PlayableItem> get copyWith => _$PlayableItemCopyWithImpl<PlayableItem>(this as PlayableItem, _$identity);

  /// Serializes this PlayableItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayableItem&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,id,sessionId,cover,title,authorName,const DeepCollectionEquality().hash(tracks),duration);

@override
String toString() {
  return 'PlayableItem(libraryId: $libraryId, id: $id, sessionId: $sessionId, cover: $cover, title: $title, authorName: $authorName, tracks: $tracks, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $PlayableItemCopyWith<$Res>  {
  factory $PlayableItemCopyWith(PlayableItem value, $Res Function(PlayableItem) _then) = _$PlayableItemCopyWithImpl;
@useResult
$Res call({
 String libraryId, String id, String sessionId, Uri cover, String? title, String? authorName, List<AudioTrack> tracks, Duration duration
});




}
/// @nodoc
class _$PlayableItemCopyWithImpl<$Res>
    implements $PlayableItemCopyWith<$Res> {
  _$PlayableItemCopyWithImpl(this._self, this._then);

  final PlayableItem _self;
  final $Res Function(PlayableItem) _then;

/// Create a copy of PlayableItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryId = null,Object? id = null,Object? sessionId = null,Object? cover = null,Object? title = freezed,Object? authorName = freezed,Object? tracks = null,Object? duration = null,}) {
  return _then(_self.copyWith(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Uri,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayableItem].
extension PlayableItemPatterns on PlayableItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AudiobookItem value)?  audiobook,TResult Function( PodcastItem value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AudiobookItem() when audiobook != null:
return audiobook(_that);case PodcastItem() when podcast != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AudiobookItem value)  audiobook,required TResult Function( PodcastItem value)  podcast,}){
final _that = this;
switch (_that) {
case AudiobookItem():
return audiobook(_that);case PodcastItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AudiobookItem value)?  audiobook,TResult? Function( PodcastItem value)?  podcast,}){
final _that = this;
switch (_that) {
case AudiobookItem() when audiobook != null:
return audiobook(_that);case PodcastItem() when podcast != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String libraryId,  String id,  String sessionId,  Uri cover,  String? title,  String? authorName,  List<AudioTrack> tracks,  List<BookChapter> chapters,  Duration duration)?  audiobook,TResult Function( String libraryId,  String id,  String podcastId,  String sessionId,  String? title,  String? authorName,  String? podcastTitle,  Uri cover,  List<AudioTrack> tracks,  Duration duration)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AudiobookItem() when audiobook != null:
return audiobook(_that.libraryId,_that.id,_that.sessionId,_that.cover,_that.title,_that.authorName,_that.tracks,_that.chapters,_that.duration);case PodcastItem() when podcast != null:
return podcast(_that.libraryId,_that.id,_that.podcastId,_that.sessionId,_that.title,_that.authorName,_that.podcastTitle,_that.cover,_that.tracks,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String libraryId,  String id,  String sessionId,  Uri cover,  String? title,  String? authorName,  List<AudioTrack> tracks,  List<BookChapter> chapters,  Duration duration)  audiobook,required TResult Function( String libraryId,  String id,  String podcastId,  String sessionId,  String? title,  String? authorName,  String? podcastTitle,  Uri cover,  List<AudioTrack> tracks,  Duration duration)  podcast,}) {final _that = this;
switch (_that) {
case AudiobookItem():
return audiobook(_that.libraryId,_that.id,_that.sessionId,_that.cover,_that.title,_that.authorName,_that.tracks,_that.chapters,_that.duration);case PodcastItem():
return podcast(_that.libraryId,_that.id,_that.podcastId,_that.sessionId,_that.title,_that.authorName,_that.podcastTitle,_that.cover,_that.tracks,_that.duration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String libraryId,  String id,  String sessionId,  Uri cover,  String? title,  String? authorName,  List<AudioTrack> tracks,  List<BookChapter> chapters,  Duration duration)?  audiobook,TResult? Function( String libraryId,  String id,  String podcastId,  String sessionId,  String? title,  String? authorName,  String? podcastTitle,  Uri cover,  List<AudioTrack> tracks,  Duration duration)?  podcast,}) {final _that = this;
switch (_that) {
case AudiobookItem() when audiobook != null:
return audiobook(_that.libraryId,_that.id,_that.sessionId,_that.cover,_that.title,_that.authorName,_that.tracks,_that.chapters,_that.duration);case PodcastItem() when podcast != null:
return podcast(_that.libraryId,_that.id,_that.podcastId,_that.sessionId,_that.title,_that.authorName,_that.podcastTitle,_that.cover,_that.tracks,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AudiobookItem extends PlayableItem {
  const AudiobookItem({required this.libraryId, required this.id, required this.sessionId, required this.cover, this.title, this.authorName, required final  List<AudioTrack> tracks, required final  List<BookChapter> chapters, required this.duration, final  String? $type}): _tracks = tracks,_chapters = chapters,$type = $type ?? 'audiobook',super._();
  factory AudiobookItem.fromJson(Map<String, dynamic> json) => _$AudiobookItemFromJson(json);

@override final  String libraryId;
@override final  String id;
@override final  String sessionId;
@override final  Uri cover;
@override final  String? title;
@override final  String? authorName;
 final  List<AudioTrack> _tracks;
@override List<AudioTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}

 final  List<BookChapter> _chapters;
 List<BookChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  Duration duration;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PlayableItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudiobookItemCopyWith<AudiobookItem> get copyWith => _$AudiobookItemCopyWithImpl<AudiobookItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudiobookItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudiobookItem&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,id,sessionId,cover,title,authorName,const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_chapters),duration);

@override
String toString() {
  return 'PlayableItem.audiobook(libraryId: $libraryId, id: $id, sessionId: $sessionId, cover: $cover, title: $title, authorName: $authorName, tracks: $tracks, chapters: $chapters, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $AudiobookItemCopyWith<$Res> implements $PlayableItemCopyWith<$Res> {
  factory $AudiobookItemCopyWith(AudiobookItem value, $Res Function(AudiobookItem) _then) = _$AudiobookItemCopyWithImpl;
@override @useResult
$Res call({
 String libraryId, String id, String sessionId, Uri cover, String? title, String? authorName, List<AudioTrack> tracks, List<BookChapter> chapters, Duration duration
});




}
/// @nodoc
class _$AudiobookItemCopyWithImpl<$Res>
    implements $AudiobookItemCopyWith<$Res> {
  _$AudiobookItemCopyWithImpl(this._self, this._then);

  final AudiobookItem _self;
  final $Res Function(AudiobookItem) _then;

/// Create a copy of PlayableItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryId = null,Object? id = null,Object? sessionId = null,Object? cover = null,Object? title = freezed,Object? authorName = freezed,Object? tracks = null,Object? chapters = null,Object? duration = null,}) {
  return _then(AudiobookItem(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Uri,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PodcastItem extends PlayableItem {
  const PodcastItem({required this.libraryId, required this.id, required this.podcastId, required this.sessionId, this.title, this.authorName, this.podcastTitle, required this.cover, required final  List<AudioTrack> tracks, required this.duration, final  String? $type}): _tracks = tracks,$type = $type ?? 'podcast',super._();
  factory PodcastItem.fromJson(Map<String, dynamic> json) => _$PodcastItemFromJson(json);

@override final  String libraryId;
@override final  String id;
// episodeId
 final  String podcastId;
@override final  String sessionId;
@override final  String? title;
@override final  String? authorName;
 final  String? podcastTitle;
@override final  Uri cover;
 final  List<AudioTrack> _tracks;
@override List<AudioTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}

@override final  Duration duration;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PlayableItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastItemCopyWith<PodcastItem> get copyWith => _$PodcastItemCopyWithImpl<PodcastItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastItem&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.podcastId, podcastId) || other.podcastId == podcastId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.podcastTitle, podcastTitle) || other.podcastTitle == podcastTitle)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,id,podcastId,sessionId,title,authorName,podcastTitle,cover,const DeepCollectionEquality().hash(_tracks),duration);

@override
String toString() {
  return 'PlayableItem.podcast(libraryId: $libraryId, id: $id, podcastId: $podcastId, sessionId: $sessionId, title: $title, authorName: $authorName, podcastTitle: $podcastTitle, cover: $cover, tracks: $tracks, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $PodcastItemCopyWith<$Res> implements $PlayableItemCopyWith<$Res> {
  factory $PodcastItemCopyWith(PodcastItem value, $Res Function(PodcastItem) _then) = _$PodcastItemCopyWithImpl;
@override @useResult
$Res call({
 String libraryId, String id, String podcastId, String sessionId, String? title, String? authorName, String? podcastTitle, Uri cover, List<AudioTrack> tracks, Duration duration
});




}
/// @nodoc
class _$PodcastItemCopyWithImpl<$Res>
    implements $PodcastItemCopyWith<$Res> {
  _$PodcastItemCopyWithImpl(this._self, this._then);

  final PodcastItem _self;
  final $Res Function(PodcastItem) _then;

/// Create a copy of PlayableItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryId = null,Object? id = null,Object? podcastId = null,Object? sessionId = null,Object? title = freezed,Object? authorName = freezed,Object? podcastTitle = freezed,Object? cover = null,Object? tracks = null,Object? duration = null,}) {
  return _then(PodcastItem(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,podcastId: null == podcastId ? _self.podcastId : podcastId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,podcastTitle: freezed == podcastTitle ? _self.podcastTitle : podcastTitle // ignore: cast_nullable_to_non_nullable
as String?,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Uri,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
