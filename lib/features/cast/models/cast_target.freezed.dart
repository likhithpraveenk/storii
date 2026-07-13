// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CastTarget {

 Uri get serverUrl; List<AudioTrack> get tracks; String get sessionId; String get title;
/// Create a copy of CastTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CastTargetCopyWith<CastTarget> get copyWith => _$CastTargetCopyWithImpl<CastTarget>(this as CastTarget, _$identity);

  /// Serializes this CastTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CastTarget&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverUrl,const DeepCollectionEquality().hash(tracks),sessionId,title);

@override
String toString() {
  return 'CastTarget(serverUrl: $serverUrl, tracks: $tracks, sessionId: $sessionId, title: $title)';
}


}

/// @nodoc
abstract mixin class $CastTargetCopyWith<$Res>  {
  factory $CastTargetCopyWith(CastTarget value, $Res Function(CastTarget) _then) = _$CastTargetCopyWithImpl;
@useResult
$Res call({
 Uri serverUrl, List<AudioTrack> tracks, String sessionId, String title
});




}
/// @nodoc
class _$CastTargetCopyWithImpl<$Res>
    implements $CastTargetCopyWith<$Res> {
  _$CastTargetCopyWithImpl(this._self, this._then);

  final CastTarget _self;
  final $Res Function(CastTarget) _then;

/// Create a copy of CastTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? tracks = null,Object? sessionId = null,Object? title = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as Uri,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CastTarget].
extension CastTargetPatterns on CastTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CastTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CastTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CastTarget value)  $default,){
final _that = this;
switch (_that) {
case _CastTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CastTarget value)?  $default,){
final _that = this;
switch (_that) {
case _CastTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri serverUrl,  List<AudioTrack> tracks,  String sessionId,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CastTarget() when $default != null:
return $default(_that.serverUrl,_that.tracks,_that.sessionId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri serverUrl,  List<AudioTrack> tracks,  String sessionId,  String title)  $default,) {final _that = this;
switch (_that) {
case _CastTarget():
return $default(_that.serverUrl,_that.tracks,_that.sessionId,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri serverUrl,  List<AudioTrack> tracks,  String sessionId,  String title)?  $default,) {final _that = this;
switch (_that) {
case _CastTarget() when $default != null:
return $default(_that.serverUrl,_that.tracks,_that.sessionId,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CastTarget extends CastTarget {
  const _CastTarget({required this.serverUrl, required final  List<AudioTrack> tracks, required this.sessionId, required this.title}): _tracks = tracks,super._();
  factory _CastTarget.fromJson(Map<String, dynamic> json) => _$CastTargetFromJson(json);

@override final  Uri serverUrl;
 final  List<AudioTrack> _tracks;
@override List<AudioTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}

@override final  String sessionId;
@override final  String title;

/// Create a copy of CastTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CastTargetCopyWith<_CastTarget> get copyWith => __$CastTargetCopyWithImpl<_CastTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CastTargetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CastTarget&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverUrl,const DeepCollectionEquality().hash(_tracks),sessionId,title);

@override
String toString() {
  return 'CastTarget(serverUrl: $serverUrl, tracks: $tracks, sessionId: $sessionId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$CastTargetCopyWith<$Res> implements $CastTargetCopyWith<$Res> {
  factory _$CastTargetCopyWith(_CastTarget value, $Res Function(_CastTarget) _then) = __$CastTargetCopyWithImpl;
@override @useResult
$Res call({
 Uri serverUrl, List<AudioTrack> tracks, String sessionId, String title
});




}
/// @nodoc
class __$CastTargetCopyWithImpl<$Res>
    implements _$CastTargetCopyWith<$Res> {
  __$CastTargetCopyWithImpl(this._self, this._then);

  final _CastTarget _self;
  final $Res Function(_CastTarget) _then;

/// Create a copy of CastTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? tracks = null,Object? sessionId = null,Object? title = null,}) {
  return _then(_CastTarget(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as Uri,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
