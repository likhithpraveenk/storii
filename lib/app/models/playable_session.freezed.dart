// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playable_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayableSession {

 String get libraryId; String get id; String get itemId; String get sessionId; Uri get cover; String get title; String get authorName; List<AudioTrack> get queue; List<BookChapter> get chapters; PlayableType get content; Duration get duration;
/// Create a copy of PlayableSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayableSessionCopyWith<PlayableSession> get copyWith => _$PlayableSessionCopyWithImpl<PlayableSession>(this as PlayableSession, _$identity);

  /// Serializes this PlayableSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayableSession&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other.queue, queue)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.content, content) || other.content == content)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,id,itemId,sessionId,cover,title,authorName,const DeepCollectionEquality().hash(queue),const DeepCollectionEquality().hash(chapters),content,duration);

@override
String toString() {
  return 'PlayableSession(libraryId: $libraryId, id: $id, itemId: $itemId, sessionId: $sessionId, cover: $cover, title: $title, authorName: $authorName, queue: $queue, chapters: $chapters, content: $content, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $PlayableSessionCopyWith<$Res>  {
  factory $PlayableSessionCopyWith(PlayableSession value, $Res Function(PlayableSession) _then) = _$PlayableSessionCopyWithImpl;
@useResult
$Res call({
 String libraryId, String id, String itemId, String sessionId, Uri cover, String title, String authorName, List<AudioTrack> queue, List<BookChapter> chapters, PlayableType content, Duration duration
});




}
/// @nodoc
class _$PlayableSessionCopyWithImpl<$Res>
    implements $PlayableSessionCopyWith<$Res> {
  _$PlayableSessionCopyWithImpl(this._self, this._then);

  final PlayableSession _self;
  final $Res Function(PlayableSession) _then;

/// Create a copy of PlayableSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryId = null,Object? id = null,Object? itemId = null,Object? sessionId = null,Object? cover = null,Object? title = null,Object? authorName = null,Object? queue = null,Object? chapters = null,Object? content = null,Object? duration = null,}) {
  return _then(_self.copyWith(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Uri,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as PlayableType,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayableSession].
extension PlayableSessionPatterns on PlayableSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayableSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayableSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayableSession value)  $default,){
final _that = this;
switch (_that) {
case _PlayableSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayableSession value)?  $default,){
final _that = this;
switch (_that) {
case _PlayableSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String libraryId,  String id,  String itemId,  String sessionId,  Uri cover,  String title,  String authorName,  List<AudioTrack> queue,  List<BookChapter> chapters,  PlayableType content,  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayableSession() when $default != null:
return $default(_that.libraryId,_that.id,_that.itemId,_that.sessionId,_that.cover,_that.title,_that.authorName,_that.queue,_that.chapters,_that.content,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String libraryId,  String id,  String itemId,  String sessionId,  Uri cover,  String title,  String authorName,  List<AudioTrack> queue,  List<BookChapter> chapters,  PlayableType content,  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _PlayableSession():
return $default(_that.libraryId,_that.id,_that.itemId,_that.sessionId,_that.cover,_that.title,_that.authorName,_that.queue,_that.chapters,_that.content,_that.duration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String libraryId,  String id,  String itemId,  String sessionId,  Uri cover,  String title,  String authorName,  List<AudioTrack> queue,  List<BookChapter> chapters,  PlayableType content,  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _PlayableSession() when $default != null:
return $default(_that.libraryId,_that.id,_that.itemId,_that.sessionId,_that.cover,_that.title,_that.authorName,_that.queue,_that.chapters,_that.content,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayableSession extends PlayableSession {
  const _PlayableSession({required this.libraryId, required this.id, required this.itemId, required this.sessionId, required this.cover, required this.title, required this.authorName, required final  List<AudioTrack> queue, required final  List<BookChapter> chapters, required this.content, required this.duration}): _queue = queue,_chapters = chapters,super._();
  factory _PlayableSession.fromJson(Map<String, dynamic> json) => _$PlayableSessionFromJson(json);

@override final  String libraryId;
@override final  String id;
@override final  String itemId;
@override final  String sessionId;
@override final  Uri cover;
@override final  String title;
@override final  String authorName;
 final  List<AudioTrack> _queue;
@override List<AudioTrack> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}

 final  List<BookChapter> _chapters;
@override List<BookChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  PlayableType content;
@override final  Duration duration;

/// Create a copy of PlayableSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayableSessionCopyWith<_PlayableSession> get copyWith => __$PlayableSessionCopyWithImpl<_PlayableSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayableSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayableSession&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other._queue, _queue)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.content, content) || other.content == content)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,id,itemId,sessionId,cover,title,authorName,const DeepCollectionEquality().hash(_queue),const DeepCollectionEquality().hash(_chapters),content,duration);

@override
String toString() {
  return 'PlayableSession(libraryId: $libraryId, id: $id, itemId: $itemId, sessionId: $sessionId, cover: $cover, title: $title, authorName: $authorName, queue: $queue, chapters: $chapters, content: $content, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$PlayableSessionCopyWith<$Res> implements $PlayableSessionCopyWith<$Res> {
  factory _$PlayableSessionCopyWith(_PlayableSession value, $Res Function(_PlayableSession) _then) = __$PlayableSessionCopyWithImpl;
@override @useResult
$Res call({
 String libraryId, String id, String itemId, String sessionId, Uri cover, String title, String authorName, List<AudioTrack> queue, List<BookChapter> chapters, PlayableType content, Duration duration
});




}
/// @nodoc
class __$PlayableSessionCopyWithImpl<$Res>
    implements _$PlayableSessionCopyWith<$Res> {
  __$PlayableSessionCopyWithImpl(this._self, this._then);

  final _PlayableSession _self;
  final $Res Function(_PlayableSession) _then;

/// Create a copy of PlayableSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryId = null,Object? id = null,Object? itemId = null,Object? sessionId = null,Object? cover = null,Object? title = null,Object? authorName = null,Object? queue = null,Object? chapters = null,Object? content = null,Object? duration = null,}) {
  return _then(_PlayableSession(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Uri,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as PlayableType,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
