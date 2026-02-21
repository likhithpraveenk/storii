// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Server {

 String get id; Uri get url;
/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerCopyWith<Server> get copyWith => _$ServerCopyWithImpl<Server>(this as Server, _$identity);

  /// Serializes this Server to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Server&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'Server(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $ServerCopyWith<$Res>  {
  factory $ServerCopyWith(Server value, $Res Function(Server) _then) = _$ServerCopyWithImpl;
@useResult
$Res call({
 String id, Uri url
});




}
/// @nodoc
class _$ServerCopyWithImpl<$Res>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._self, this._then);

  final Server _self;
  final $Res Function(Server) _then;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}

}


/// Adds pattern-matching-related methods to [Server].
extension ServerPatterns on Server {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Server value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Server() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Server value)  $default,){
final _that = this;
switch (_that) {
case _Server():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Server value)?  $default,){
final _that = this;
switch (_that) {
case _Server() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Uri url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Server() when $default != null:
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Uri url)  $default,) {final _that = this;
switch (_that) {
case _Server():
return $default(_that.id,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Uri url)?  $default,) {final _that = this;
switch (_that) {
case _Server() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Server implements Server {
  const _Server({required this.id, required this.url});
  factory _Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

@override final  String id;
@override final  Uri url;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerCopyWith<_Server> get copyWith => __$ServerCopyWithImpl<_Server>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Server&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'Server(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ServerCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) _then) = __$ServerCopyWithImpl;
@override @useResult
$Res call({
 String id, Uri url
});




}
/// @nodoc
class __$ServerCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(this._self, this._then);

  final _Server _self;
  final $Res Function(_Server) _then;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,}) {
  return _then(_Server(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}


}

// dart format on
