// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InitEvent {

 String get userId; String get username; List<UserMinimal> get usersOnline;
/// Create a copy of InitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitEventCopyWith<InitEvent> get copyWith => _$InitEventCopyWithImpl<InitEvent>(this as InitEvent, _$identity);

  /// Serializes this InitEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InitEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitEvent&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.username, _this.username) || other.username == _this.username)&&const DeepCollectionEquality().equals(other.usersOnline, _this.usersOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InitEvent;
  return Object.hash(runtimeType,_this.userId,_this.username,const DeepCollectionEquality().hash(_this.usersOnline));
}

@override
String toString() {
  final _this = this as InitEvent;
  return 'InitEvent(userId: ${_this.userId}, username: ${_this.username}, usersOnline: ${_this.usersOnline})';
}


}

/// @nodoc
abstract mixin class $InitEventCopyWith<$Res>  {
  factory $InitEventCopyWith(InitEvent value, $Res Function(InitEvent) _then) = _$InitEventCopyWithImpl;
@useResult
$Res call({
 String userId, String username, List<UserMinimal> usersOnline
});




}
/// @nodoc
class _$InitEventCopyWithImpl<$Res>
    implements $InitEventCopyWith<$Res> {
  _$InitEventCopyWithImpl(this._self, this._then);

  final InitEvent _self;
  final $Res Function(InitEvent) _then;

/// Create a copy of InitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? username = null,Object? usersOnline = null,}) {
  return _then(InitEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usersOnline: null == usersOnline ? _self.usersOnline : usersOnline // ignore: cast_nullable_to_non_nullable
as List<UserMinimal>,
  ));
}

}


/// Adds pattern-matching-related methods to [InitEvent].
extension InitEventPatterns on InitEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitEvent value)  $default,){
final _that = this;
switch (_that) {
case _InitEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitEvent value)?  $default,){
final _that = this;
switch (_that) {
case _InitEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String username,  List<UserMinimal> usersOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitEvent() when $default != null:
return $default(_that.userId,_that.username,_that.usersOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String username,  List<UserMinimal> usersOnline)  $default,) {final _that = this;
switch (_that) {
case _InitEvent():
return $default(_that.userId,_that.username,_that.usersOnline);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String username,  List<UserMinimal> usersOnline)?  $default,) {final _that = this;
switch (_that) {
case _InitEvent() when $default != null:
return $default(_that.userId,_that.username,_that.usersOnline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InitEvent implements InitEvent {
  const _InitEvent({required this.userId, required this.username,  List<UserMinimal> usersOnline = const []}): _usersOnline = usersOnline;
  factory _InitEvent.fromJson(Map<String, dynamic> json) => _$InitEventFromJson(json);

@override final  String userId;
@override final  String username;
 final  List<UserMinimal> _usersOnline;
@override@JsonKey() List<UserMinimal> get usersOnline {
  if (_usersOnline is EqualUnmodifiableListView) return _usersOnline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usersOnline);
}


/// Create a copy of InitEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitEventCopyWith<_InitEvent> get copyWith => __$InitEventCopyWithImpl<_InitEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InitEventToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other.usersOnline, _usersOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,username,const DeepCollectionEquality().hash(_usersOnline));
}

@override
String toString() {
    return 'InitEvent(userId: $userId, username: $username, usersOnline: $usersOnline)';
}


}

/// @nodoc
abstract mixin class _$InitEventCopyWith<$Res> implements $InitEventCopyWith<$Res> {
  factory _$InitEventCopyWith(_InitEvent value, $Res Function(_InitEvent) _then) = __$InitEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String username, List<UserMinimal> usersOnline
});




}
/// @nodoc
class __$InitEventCopyWithImpl<$Res>
    implements _$InitEventCopyWith<$Res> {
  __$InitEventCopyWithImpl(this._self, this._then);

  final _InitEvent _self;
  final $Res Function(_InitEvent) _then;

/// Create a copy of InitEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? username = null,Object? usersOnline = null,}) {
  return _then(_InitEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usersOnline: null == usersOnline ? _self._usersOnline : usersOnline // ignore: cast_nullable_to_non_nullable
as List<UserMinimal>,
  ));
}


}

// dart format on
