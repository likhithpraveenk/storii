// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorageLocation {

 String get name; String get uri; DownloadMediaType get mediaType; bool get isInternal;
/// Create a copy of StorageLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageLocationCopyWith<StorageLocation> get copyWith => _$StorageLocationCopyWithImpl<StorageLocation>(this as StorageLocation, _$identity);

  /// Serializes this StorageLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.isInternal, isInternal) || other.isInternal == isInternal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uri,mediaType,isInternal);

@override
String toString() {
  return 'StorageLocation(name: $name, uri: $uri, mediaType: $mediaType, isInternal: $isInternal)';
}


}

/// @nodoc
abstract mixin class $StorageLocationCopyWith<$Res>  {
  factory $StorageLocationCopyWith(StorageLocation value, $Res Function(StorageLocation) _then) = _$StorageLocationCopyWithImpl;
@useResult
$Res call({
 String name, String uri, DownloadMediaType mediaType, bool isInternal
});




}
/// @nodoc
class _$StorageLocationCopyWithImpl<$Res>
    implements $StorageLocationCopyWith<$Res> {
  _$StorageLocationCopyWithImpl(this._self, this._then);

  final StorageLocation _self;
  final $Res Function(StorageLocation) _then;

/// Create a copy of StorageLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uri = null,Object? mediaType = null,Object? isInternal = null,}) {
  return _then(StorageLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as DownloadMediaType,isInternal: null == isInternal ? _self.isInternal : isInternal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StorageLocation].
extension StorageLocationPatterns on StorageLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorageLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorageLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorageLocation value)  $default,){
final _that = this;
switch (_that) {
case _StorageLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorageLocation value)?  $default,){
final _that = this;
switch (_that) {
case _StorageLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String uri,  DownloadMediaType mediaType,  bool isInternal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorageLocation() when $default != null:
return $default(_that.name,_that.uri,_that.mediaType,_that.isInternal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String uri,  DownloadMediaType mediaType,  bool isInternal)  $default,) {final _that = this;
switch (_that) {
case _StorageLocation():
return $default(_that.name,_that.uri,_that.mediaType,_that.isInternal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String uri,  DownloadMediaType mediaType,  bool isInternal)?  $default,) {final _that = this;
switch (_that) {
case _StorageLocation() when $default != null:
return $default(_that.name,_that.uri,_that.mediaType,_that.isInternal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorageLocation extends StorageLocation {
  const _StorageLocation({required this.name, required this.uri, required this.mediaType, this.isInternal = false}): super._();
  factory _StorageLocation.fromJson(Map<String, dynamic> json) => _$StorageLocationFromJson(json);

@override final  String name;
@override final  String uri;
@override final  DownloadMediaType mediaType;
@override@JsonKey() final  bool isInternal;

/// Create a copy of StorageLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorageLocationCopyWith<_StorageLocation> get copyWith => __$StorageLocationCopyWithImpl<_StorageLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorageLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorageLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.isInternal, isInternal) || other.isInternal == isInternal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uri,mediaType,isInternal);

@override
String toString() {
  return 'StorageLocation(name: $name, uri: $uri, mediaType: $mediaType, isInternal: $isInternal)';
}


}

/// @nodoc
abstract mixin class _$StorageLocationCopyWith<$Res> implements $StorageLocationCopyWith<$Res> {
  factory _$StorageLocationCopyWith(_StorageLocation value, $Res Function(_StorageLocation) _then) = __$StorageLocationCopyWithImpl;
@override @useResult
$Res call({
 String name, String uri, DownloadMediaType mediaType, bool isInternal
});




}
/// @nodoc
class __$StorageLocationCopyWithImpl<$Res>
    implements _$StorageLocationCopyWith<$Res> {
  __$StorageLocationCopyWithImpl(this._self, this._then);

  final _StorageLocation _self;
  final $Res Function(_StorageLocation) _then;

/// Create a copy of StorageLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uri = null,Object? mediaType = null,Object? isInternal = null,}) {
  return _then(_StorageLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as DownloadMediaType,isInternal: null == isInternal ? _self.isInternal : isInternal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
