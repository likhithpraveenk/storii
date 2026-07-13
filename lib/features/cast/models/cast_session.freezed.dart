// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CastSession {

 CastStatus get status; CastDeviceInfo? get device; String? get error; CastTarget? get target; int get currentTrackIndex; Duration get initialPosition;/// current position
 Duration get currentGlobalPosition; String? get id; String? get libraryItemId; String? get episodeId;
/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CastSessionCopyWith<CastSession> get copyWith => _$CastSessionCopyWithImpl<CastSession>(this as CastSession, _$identity);

  /// Serializes this CastSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CastSession&&(identical(other.status, status) || other.status == status)&&(identical(other.device, device) || other.device == device)&&(identical(other.error, error) || other.error == error)&&(identical(other.target, target) || other.target == target)&&(identical(other.currentTrackIndex, currentTrackIndex) || other.currentTrackIndex == currentTrackIndex)&&(identical(other.initialPosition, initialPosition) || other.initialPosition == initialPosition)&&(identical(other.currentGlobalPosition, currentGlobalPosition) || other.currentGlobalPosition == currentGlobalPosition)&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,device,error,target,currentTrackIndex,initialPosition,currentGlobalPosition,id,libraryItemId,episodeId);

@override
String toString() {
  return 'CastSession(status: $status, device: $device, error: $error, target: $target, currentTrackIndex: $currentTrackIndex, initialPosition: $initialPosition, currentGlobalPosition: $currentGlobalPosition, id: $id, libraryItemId: $libraryItemId, episodeId: $episodeId)';
}


}

/// @nodoc
abstract mixin class $CastSessionCopyWith<$Res>  {
  factory $CastSessionCopyWith(CastSession value, $Res Function(CastSession) _then) = _$CastSessionCopyWithImpl;
@useResult
$Res call({
 CastStatus status, CastDeviceInfo? device, String? error, CastTarget? target, int currentTrackIndex, Duration initialPosition, Duration currentGlobalPosition, String? id, String? libraryItemId, String? episodeId
});


$CastDeviceInfoCopyWith<$Res>? get device;$CastTargetCopyWith<$Res>? get target;

}
/// @nodoc
class _$CastSessionCopyWithImpl<$Res>
    implements $CastSessionCopyWith<$Res> {
  _$CastSessionCopyWithImpl(this._self, this._then);

  final CastSession _self;
  final $Res Function(CastSession) _then;

/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? device = freezed,Object? error = freezed,Object? target = freezed,Object? currentTrackIndex = null,Object? initialPosition = null,Object? currentGlobalPosition = null,Object? id = freezed,Object? libraryItemId = freezed,Object? episodeId = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CastStatus,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as CastDeviceInfo?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as CastTarget?,currentTrackIndex: null == currentTrackIndex ? _self.currentTrackIndex : currentTrackIndex // ignore: cast_nullable_to_non_nullable
as int,initialPosition: null == initialPosition ? _self.initialPosition : initialPosition // ignore: cast_nullable_to_non_nullable
as Duration,currentGlobalPosition: null == currentGlobalPosition ? _self.currentGlobalPosition : currentGlobalPosition // ignore: cast_nullable_to_non_nullable
as Duration,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CastDeviceInfoCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $CastDeviceInfoCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CastTargetCopyWith<$Res>? get target {
    if (_self.target == null) {
    return null;
  }

  return $CastTargetCopyWith<$Res>(_self.target!, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [CastSession].
extension CastSessionPatterns on CastSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CastSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CastSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CastSession value)  $default,){
final _that = this;
switch (_that) {
case _CastSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CastSession value)?  $default,){
final _that = this;
switch (_that) {
case _CastSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CastStatus status,  CastDeviceInfo? device,  String? error,  CastTarget? target,  int currentTrackIndex,  Duration initialPosition,  Duration currentGlobalPosition,  String? id,  String? libraryItemId,  String? episodeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CastSession() when $default != null:
return $default(_that.status,_that.device,_that.error,_that.target,_that.currentTrackIndex,_that.initialPosition,_that.currentGlobalPosition,_that.id,_that.libraryItemId,_that.episodeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CastStatus status,  CastDeviceInfo? device,  String? error,  CastTarget? target,  int currentTrackIndex,  Duration initialPosition,  Duration currentGlobalPosition,  String? id,  String? libraryItemId,  String? episodeId)  $default,) {final _that = this;
switch (_that) {
case _CastSession():
return $default(_that.status,_that.device,_that.error,_that.target,_that.currentTrackIndex,_that.initialPosition,_that.currentGlobalPosition,_that.id,_that.libraryItemId,_that.episodeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CastStatus status,  CastDeviceInfo? device,  String? error,  CastTarget? target,  int currentTrackIndex,  Duration initialPosition,  Duration currentGlobalPosition,  String? id,  String? libraryItemId,  String? episodeId)?  $default,) {final _that = this;
switch (_that) {
case _CastSession() when $default != null:
return $default(_that.status,_that.device,_that.error,_that.target,_that.currentTrackIndex,_that.initialPosition,_that.currentGlobalPosition,_that.id,_that.libraryItemId,_that.episodeId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CastSession extends CastSession {
  const _CastSession({this.status = CastStatus.idle, this.device, this.error, this.target, this.currentTrackIndex = 0, this.initialPosition = Duration.zero, this.currentGlobalPosition = Duration.zero, this.id, this.libraryItemId, this.episodeId}): super._();
  factory _CastSession.fromJson(Map<String, dynamic> json) => _$CastSessionFromJson(json);

@override@JsonKey() final  CastStatus status;
@override final  CastDeviceInfo? device;
@override final  String? error;
@override final  CastTarget? target;
@override@JsonKey() final  int currentTrackIndex;
@override@JsonKey() final  Duration initialPosition;
/// current position
@override@JsonKey() final  Duration currentGlobalPosition;
@override final  String? id;
@override final  String? libraryItemId;
@override final  String? episodeId;

/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CastSessionCopyWith<_CastSession> get copyWith => __$CastSessionCopyWithImpl<_CastSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CastSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CastSession&&(identical(other.status, status) || other.status == status)&&(identical(other.device, device) || other.device == device)&&(identical(other.error, error) || other.error == error)&&(identical(other.target, target) || other.target == target)&&(identical(other.currentTrackIndex, currentTrackIndex) || other.currentTrackIndex == currentTrackIndex)&&(identical(other.initialPosition, initialPosition) || other.initialPosition == initialPosition)&&(identical(other.currentGlobalPosition, currentGlobalPosition) || other.currentGlobalPosition == currentGlobalPosition)&&(identical(other.id, id) || other.id == id)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,device,error,target,currentTrackIndex,initialPosition,currentGlobalPosition,id,libraryItemId,episodeId);

@override
String toString() {
  return 'CastSession(status: $status, device: $device, error: $error, target: $target, currentTrackIndex: $currentTrackIndex, initialPosition: $initialPosition, currentGlobalPosition: $currentGlobalPosition, id: $id, libraryItemId: $libraryItemId, episodeId: $episodeId)';
}


}

/// @nodoc
abstract mixin class _$CastSessionCopyWith<$Res> implements $CastSessionCopyWith<$Res> {
  factory _$CastSessionCopyWith(_CastSession value, $Res Function(_CastSession) _then) = __$CastSessionCopyWithImpl;
@override @useResult
$Res call({
 CastStatus status, CastDeviceInfo? device, String? error, CastTarget? target, int currentTrackIndex, Duration initialPosition, Duration currentGlobalPosition, String? id, String? libraryItemId, String? episodeId
});


@override $CastDeviceInfoCopyWith<$Res>? get device;@override $CastTargetCopyWith<$Res>? get target;

}
/// @nodoc
class __$CastSessionCopyWithImpl<$Res>
    implements _$CastSessionCopyWith<$Res> {
  __$CastSessionCopyWithImpl(this._self, this._then);

  final _CastSession _self;
  final $Res Function(_CastSession) _then;

/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? device = freezed,Object? error = freezed,Object? target = freezed,Object? currentTrackIndex = null,Object? initialPosition = null,Object? currentGlobalPosition = null,Object? id = freezed,Object? libraryItemId = freezed,Object? episodeId = freezed,}) {
  return _then(_CastSession(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CastStatus,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as CastDeviceInfo?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as CastTarget?,currentTrackIndex: null == currentTrackIndex ? _self.currentTrackIndex : currentTrackIndex // ignore: cast_nullable_to_non_nullable
as int,initialPosition: null == initialPosition ? _self.initialPosition : initialPosition // ignore: cast_nullable_to_non_nullable
as Duration,currentGlobalPosition: null == currentGlobalPosition ? _self.currentGlobalPosition : currentGlobalPosition // ignore: cast_nullable_to_non_nullable
as Duration,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CastDeviceInfoCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $CastDeviceInfoCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of CastSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CastTargetCopyWith<$Res>? get target {
    if (_self.target == null) {
    return null;
  }

  return $CastTargetCopyWith<$Res>(_self.target!, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

// dart format on
