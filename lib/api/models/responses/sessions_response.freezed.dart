// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sessions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionsResponse {

 int get total; int get numPages; int get itemsPerPage; List<PlaybackSession> get sessions; String? get userFilter;
/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsResponseCopyWith<SessionsResponse> get copyWith => _$SessionsResponseCopyWithImpl<SessionsResponse>(this as SessionsResponse, _$identity);

  /// Serializes this SessionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.itemsPerPage, itemsPerPage) || other.itemsPerPage == itemsPerPage)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.userFilter, userFilter) || other.userFilter == userFilter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,numPages,itemsPerPage,const DeepCollectionEquality().hash(sessions),userFilter);

@override
String toString() {
  return 'SessionsResponse(total: $total, numPages: $numPages, itemsPerPage: $itemsPerPage, sessions: $sessions, userFilter: $userFilter)';
}


}

/// @nodoc
abstract mixin class $SessionsResponseCopyWith<$Res>  {
  factory $SessionsResponseCopyWith(SessionsResponse value, $Res Function(SessionsResponse) _then) = _$SessionsResponseCopyWithImpl;
@useResult
$Res call({
 int total, int numPages, int itemsPerPage, List<PlaybackSession> sessions, String? userFilter
});




}
/// @nodoc
class _$SessionsResponseCopyWithImpl<$Res>
    implements $SessionsResponseCopyWith<$Res> {
  _$SessionsResponseCopyWithImpl(this._self, this._then);

  final SessionsResponse _self;
  final $Res Function(SessionsResponse) _then;

/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? numPages = null,Object? itemsPerPage = null,Object? sessions = null,Object? userFilter = freezed,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,numPages: null == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int,itemsPerPage: null == itemsPerPage ? _self.itemsPerPage : itemsPerPage // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<PlaybackSession>,userFilter: freezed == userFilter ? _self.userFilter : userFilter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionsResponse].
extension SessionsResponsePatterns on SessionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int numPages,  int itemsPerPage,  List<PlaybackSession> sessions,  String? userFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
return $default(_that.total,_that.numPages,_that.itemsPerPage,_that.sessions,_that.userFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int numPages,  int itemsPerPage,  List<PlaybackSession> sessions,  String? userFilter)  $default,) {final _that = this;
switch (_that) {
case _SessionsResponse():
return $default(_that.total,_that.numPages,_that.itemsPerPage,_that.sessions,_that.userFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int numPages,  int itemsPerPage,  List<PlaybackSession> sessions,  String? userFilter)?  $default,) {final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
return $default(_that.total,_that.numPages,_that.itemsPerPage,_that.sessions,_that.userFilter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionsResponse implements SessionsResponse {
  const _SessionsResponse({required this.total, required this.numPages, required this.itemsPerPage, required final  List<PlaybackSession> sessions, this.userFilter}): _sessions = sessions;
  factory _SessionsResponse.fromJson(Map<String, dynamic> json) => _$SessionsResponseFromJson(json);

@override final  int total;
@override final  int numPages;
@override final  int itemsPerPage;
 final  List<PlaybackSession> _sessions;
@override List<PlaybackSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override final  String? userFilter;

/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionsResponseCopyWith<_SessionsResponse> get copyWith => __$SessionsResponseCopyWithImpl<_SessionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionsResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.itemsPerPage, itemsPerPage) || other.itemsPerPage == itemsPerPage)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.userFilter, userFilter) || other.userFilter == userFilter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,numPages,itemsPerPage,const DeepCollectionEquality().hash(_sessions),userFilter);

@override
String toString() {
  return 'SessionsResponse(total: $total, numPages: $numPages, itemsPerPage: $itemsPerPage, sessions: $sessions, userFilter: $userFilter)';
}


}

/// @nodoc
abstract mixin class _$SessionsResponseCopyWith<$Res> implements $SessionsResponseCopyWith<$Res> {
  factory _$SessionsResponseCopyWith(_SessionsResponse value, $Res Function(_SessionsResponse) _then) = __$SessionsResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int numPages, int itemsPerPage, List<PlaybackSession> sessions, String? userFilter
});




}
/// @nodoc
class __$SessionsResponseCopyWithImpl<$Res>
    implements _$SessionsResponseCopyWith<$Res> {
  __$SessionsResponseCopyWithImpl(this._self, this._then);

  final _SessionsResponse _self;
  final $Res Function(_SessionsResponse) _then;

/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? numPages = null,Object? itemsPerPage = null,Object? sessions = null,Object? userFilter = freezed,}) {
  return _then(_SessionsResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,numPages: null == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int,itemsPerPage: null == itemsPerPage ? _self.itemsPerPage : itemsPerPage // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<PlaybackSession>,userFilter: freezed == userFilter ? _self.userFilter : userFilter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
