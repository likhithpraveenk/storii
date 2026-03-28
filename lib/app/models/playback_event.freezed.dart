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
mixin _$ServerSyncResult {

 bool get attempted; bool get success; String? get message;
/// Create a copy of ServerSyncResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSyncResultCopyWith<ServerSyncResult> get copyWith => _$ServerSyncResultCopyWithImpl<ServerSyncResult>(this as ServerSyncResult, _$identity);

  /// Serializes this ServerSyncResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSyncResult&&(identical(other.attempted, attempted) || other.attempted == attempted)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attempted,success,message);

@override
String toString() {
  return 'ServerSyncResult(attempted: $attempted, success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerSyncResultCopyWith<$Res>  {
  factory $ServerSyncResultCopyWith(ServerSyncResult value, $Res Function(ServerSyncResult) _then) = _$ServerSyncResultCopyWithImpl;
@useResult
$Res call({
 bool attempted, bool success, String? message
});




}
/// @nodoc
class _$ServerSyncResultCopyWithImpl<$Res>
    implements $ServerSyncResultCopyWith<$Res> {
  _$ServerSyncResultCopyWithImpl(this._self, this._then);

  final ServerSyncResult _self;
  final $Res Function(ServerSyncResult) _then;

/// Create a copy of ServerSyncResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attempted = null,Object? success = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
attempted: null == attempted ? _self.attempted : attempted // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerSyncResult].
extension ServerSyncResultPatterns on ServerSyncResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerSyncResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerSyncResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerSyncResult value)  $default,){
final _that = this;
switch (_that) {
case _ServerSyncResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerSyncResult value)?  $default,){
final _that = this;
switch (_that) {
case _ServerSyncResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool attempted,  bool success,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerSyncResult() when $default != null:
return $default(_that.attempted,_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool attempted,  bool success,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ServerSyncResult():
return $default(_that.attempted,_that.success,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool attempted,  bool success,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ServerSyncResult() when $default != null:
return $default(_that.attempted,_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerSyncResult implements ServerSyncResult {
  const _ServerSyncResult({required this.attempted, required this.success, this.message});
  factory _ServerSyncResult.fromJson(Map<String, dynamic> json) => _$ServerSyncResultFromJson(json);

@override final  bool attempted;
@override final  bool success;
@override final  String? message;

/// Create a copy of ServerSyncResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerSyncResultCopyWith<_ServerSyncResult> get copyWith => __$ServerSyncResultCopyWithImpl<_ServerSyncResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerSyncResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerSyncResult&&(identical(other.attempted, attempted) || other.attempted == attempted)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attempted,success,message);

@override
String toString() {
  return 'ServerSyncResult(attempted: $attempted, success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerSyncResultCopyWith<$Res> implements $ServerSyncResultCopyWith<$Res> {
  factory _$ServerSyncResultCopyWith(_ServerSyncResult value, $Res Function(_ServerSyncResult) _then) = __$ServerSyncResultCopyWithImpl;
@override @useResult
$Res call({
 bool attempted, bool success, String? message
});




}
/// @nodoc
class __$ServerSyncResultCopyWithImpl<$Res>
    implements _$ServerSyncResultCopyWith<$Res> {
  __$ServerSyncResultCopyWithImpl(this._self, this._then);

  final _ServerSyncResult _self;
  final $Res Function(_ServerSyncResult) _then;

/// Create a copy of ServerSyncResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attempted = null,Object? success = null,Object? message = freezed,}) {
  return _then(_ServerSyncResult(
attempted: null == attempted ? _self.attempted : attempted // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlaybackEvent {

 DateTime get timestamp; Duration get position; PlaybackEventKind get kind; ServerSyncResult? get syncResult;
/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackEventCopyWith<PlaybackEvent> get copyWith => _$PlaybackEventCopyWithImpl<PlaybackEvent>(this as PlaybackEvent, _$identity);

  /// Serializes this PlaybackEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.position, position) || other.position == position)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.syncResult, syncResult) || other.syncResult == syncResult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,position,kind,syncResult);

@override
String toString() {
  return 'PlaybackEvent(timestamp: $timestamp, position: $position, kind: $kind, syncResult: $syncResult)';
}


}

/// @nodoc
abstract mixin class $PlaybackEventCopyWith<$Res>  {
  factory $PlaybackEventCopyWith(PlaybackEvent value, $Res Function(PlaybackEvent) _then) = _$PlaybackEventCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, Duration position, PlaybackEventKind kind, ServerSyncResult? syncResult
});


$ServerSyncResultCopyWith<$Res>? get syncResult;

}
/// @nodoc
class _$PlaybackEventCopyWithImpl<$Res>
    implements $PlaybackEventCopyWith<$Res> {
  _$PlaybackEventCopyWithImpl(this._self, this._then);

  final PlaybackEvent _self;
  final $Res Function(PlaybackEvent) _then;

/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? position = null,Object? kind = null,Object? syncResult = freezed,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlaybackEventKind,syncResult: freezed == syncResult ? _self.syncResult : syncResult // ignore: cast_nullable_to_non_nullable
as ServerSyncResult?,
  ));
}
/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerSyncResultCopyWith<$Res>? get syncResult {
    if (_self.syncResult == null) {
    return null;
  }

  return $ServerSyncResultCopyWith<$Res>(_self.syncResult!, (value) {
    return _then(_self.copyWith(syncResult: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  Duration position,  PlaybackEventKind kind,  ServerSyncResult? syncResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackEvent() when $default != null:
return $default(_that.timestamp,_that.position,_that.kind,_that.syncResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  Duration position,  PlaybackEventKind kind,  ServerSyncResult? syncResult)  $default,) {final _that = this;
switch (_that) {
case _PlaybackEvent():
return $default(_that.timestamp,_that.position,_that.kind,_that.syncResult);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  Duration position,  PlaybackEventKind kind,  ServerSyncResult? syncResult)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackEvent() when $default != null:
return $default(_that.timestamp,_that.position,_that.kind,_that.syncResult);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaybackEvent implements PlaybackEvent {
  const _PlaybackEvent({required this.timestamp, required this.position, required this.kind, this.syncResult});
  factory _PlaybackEvent.fromJson(Map<String, dynamic> json) => _$PlaybackEventFromJson(json);

@override final  DateTime timestamp;
@override final  Duration position;
@override final  PlaybackEventKind kind;
@override final  ServerSyncResult? syncResult;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.position, position) || other.position == position)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.syncResult, syncResult) || other.syncResult == syncResult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,position,kind,syncResult);

@override
String toString() {
  return 'PlaybackEvent(timestamp: $timestamp, position: $position, kind: $kind, syncResult: $syncResult)';
}


}

/// @nodoc
abstract mixin class _$PlaybackEventCopyWith<$Res> implements $PlaybackEventCopyWith<$Res> {
  factory _$PlaybackEventCopyWith(_PlaybackEvent value, $Res Function(_PlaybackEvent) _then) = __$PlaybackEventCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, Duration position, PlaybackEventKind kind, ServerSyncResult? syncResult
});


@override $ServerSyncResultCopyWith<$Res>? get syncResult;

}
/// @nodoc
class __$PlaybackEventCopyWithImpl<$Res>
    implements _$PlaybackEventCopyWith<$Res> {
  __$PlaybackEventCopyWithImpl(this._self, this._then);

  final _PlaybackEvent _self;
  final $Res Function(_PlaybackEvent) _then;

/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? position = null,Object? kind = null,Object? syncResult = freezed,}) {
  return _then(_PlaybackEvent(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlaybackEventKind,syncResult: freezed == syncResult ? _self.syncResult : syncResult // ignore: cast_nullable_to_non_nullable
as ServerSyncResult?,
  ));
}

/// Create a copy of PlaybackEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerSyncResultCopyWith<$Res>? get syncResult {
    if (_self.syncResult == null) {
    return null;
  }

  return $ServerSyncResultCopyWith<$Res>(_self.syncResult!, (value) {
    return _then(_self.copyWith(syncResult: value));
  });
}
}

// dart format on
