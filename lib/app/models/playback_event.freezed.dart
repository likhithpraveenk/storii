// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaybackEvent {

 DateTime get timestamp; Duration get position; PlaybackEventKind get kind; bool get syncAttempt; bool get syncSuccess; bool get playbackError;
/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackEventCopyWith<PlaybackEvent> get copyWith => _$PlaybackEventCopyWithImpl<PlaybackEvent>(this as PlaybackEvent, _$identity);

  /// Serializes this PlaybackEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.position, position) || other.position == position)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.syncAttempt, syncAttempt) || other.syncAttempt == syncAttempt)&&(identical(other.syncSuccess, syncSuccess) || other.syncSuccess == syncSuccess)&&(identical(other.playbackError, playbackError) || other.playbackError == playbackError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,position,kind,syncAttempt,syncSuccess,playbackError);

@override
String toString() {
  return 'PlaybackEvent(timestamp: $timestamp, position: $position, kind: $kind, syncAttempt: $syncAttempt, syncSuccess: $syncSuccess, playbackError: $playbackError)';
}


}

/// @nodoc
abstract mixin class $PlaybackEventCopyWith<$Res>  {
  factory $PlaybackEventCopyWith(PlaybackEvent value, $Res Function(PlaybackEvent) _then) = _$PlaybackEventCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, Duration position, PlaybackEventKind kind, bool syncAttempt, bool syncSuccess, bool playbackError
});




}
/// @nodoc
class _$PlaybackEventCopyWithImpl<$Res>
    implements $PlaybackEventCopyWith<$Res> {
  _$PlaybackEventCopyWithImpl(this._self, this._then);

  final PlaybackEvent _self;
  final $Res Function(PlaybackEvent) _then;

/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? position = null,Object? kind = null,Object? syncAttempt = null,Object? syncSuccess = null,Object? playbackError = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlaybackEventKind,syncAttempt: null == syncAttempt ? _self.syncAttempt : syncAttempt // ignore: cast_nullable_to_non_nullable
as bool,syncSuccess: null == syncSuccess ? _self.syncSuccess : syncSuccess // ignore: cast_nullable_to_non_nullable
as bool,playbackError: null == playbackError ? _self.playbackError : playbackError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaybackEvent].
extension PlaybackEventPatterns on PlaybackEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybackEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybackEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybackEvent value)  $default,){
final _that = this;
switch (_that) {
case _PlaybackEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybackEvent value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybackEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  Duration position,  PlaybackEventKind kind,  bool syncAttempt,  bool syncSuccess,  bool playbackError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackEvent() when $default != null:
return $default(_that.timestamp,_that.position,_that.kind,_that.syncAttempt,_that.syncSuccess,_that.playbackError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  Duration position,  PlaybackEventKind kind,  bool syncAttempt,  bool syncSuccess,  bool playbackError)  $default,) {final _that = this;
switch (_that) {
case _PlaybackEvent():
return $default(_that.timestamp,_that.position,_that.kind,_that.syncAttempt,_that.syncSuccess,_that.playbackError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  Duration position,  PlaybackEventKind kind,  bool syncAttempt,  bool syncSuccess,  bool playbackError)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackEvent() when $default != null:
return $default(_that.timestamp,_that.position,_that.kind,_that.syncAttempt,_that.syncSuccess,_that.playbackError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaybackEvent implements PlaybackEvent {
  const _PlaybackEvent({required this.timestamp, required this.position, required this.kind, this.syncAttempt = false, this.syncSuccess = false, this.playbackError = false});
  factory _PlaybackEvent.fromJson(Map<String, dynamic> json) => _$PlaybackEventFromJson(json);

@override final  DateTime timestamp;
@override final  Duration position;
@override final  PlaybackEventKind kind;
@override@JsonKey() final  bool syncAttempt;
@override@JsonKey() final  bool syncSuccess;
@override@JsonKey() final  bool playbackError;

/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybackEventCopyWith<_PlaybackEvent> get copyWith => __$PlaybackEventCopyWithImpl<_PlaybackEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaybackEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.position, position) || other.position == position)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.syncAttempt, syncAttempt) || other.syncAttempt == syncAttempt)&&(identical(other.syncSuccess, syncSuccess) || other.syncSuccess == syncSuccess)&&(identical(other.playbackError, playbackError) || other.playbackError == playbackError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,position,kind,syncAttempt,syncSuccess,playbackError);

@override
String toString() {
  return 'PlaybackEvent(timestamp: $timestamp, position: $position, kind: $kind, syncAttempt: $syncAttempt, syncSuccess: $syncSuccess, playbackError: $playbackError)';
}


}

/// @nodoc
abstract mixin class _$PlaybackEventCopyWith<$Res> implements $PlaybackEventCopyWith<$Res> {
  factory _$PlaybackEventCopyWith(_PlaybackEvent value, $Res Function(_PlaybackEvent) _then) = __$PlaybackEventCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, Duration position, PlaybackEventKind kind, bool syncAttempt, bool syncSuccess, bool playbackError
});




}
/// @nodoc
class __$PlaybackEventCopyWithImpl<$Res>
    implements _$PlaybackEventCopyWith<$Res> {
  __$PlaybackEventCopyWithImpl(this._self, this._then);

  final _PlaybackEvent _self;
  final $Res Function(_PlaybackEvent) _then;

/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? position = null,Object? kind = null,Object? syncAttempt = null,Object? syncSuccess = null,Object? playbackError = null,}) {
  return _then(_PlaybackEvent(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlaybackEventKind,syncAttempt: null == syncAttempt ? _self.syncAttempt : syncAttempt // ignore: cast_nullable_to_non_nullable
as bool,syncSuccess: null == syncSuccess ? _self.syncSuccess : syncSuccess // ignore: cast_nullable_to_non_nullable
as bool,playbackError: null == playbackError ? _self.playbackError : playbackError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
