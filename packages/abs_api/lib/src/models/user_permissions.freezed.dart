// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_permissions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPermissions {

 bool? get download; bool? get update; bool? get delete; bool? get upload; bool? get createEreader; bool? get accessAllLibraries; bool? get accessAllTags; bool? get accessExplicitContent; bool? get selectedTagsNotAccessible;
/// Create a copy of UserPermissions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPermissionsCopyWith<UserPermissions> get copyWith => _$UserPermissionsCopyWithImpl<UserPermissions>(this as UserPermissions, _$identity);

  /// Serializes this UserPermissions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPermissions&&(identical(other.download, download) || other.download == download)&&(identical(other.update, update) || other.update == update)&&(identical(other.delete, delete) || other.delete == delete)&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.createEreader, createEreader) || other.createEreader == createEreader)&&(identical(other.accessAllLibraries, accessAllLibraries) || other.accessAllLibraries == accessAllLibraries)&&(identical(other.accessAllTags, accessAllTags) || other.accessAllTags == accessAllTags)&&(identical(other.accessExplicitContent, accessExplicitContent) || other.accessExplicitContent == accessExplicitContent)&&(identical(other.selectedTagsNotAccessible, selectedTagsNotAccessible) || other.selectedTagsNotAccessible == selectedTagsNotAccessible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,download,update,delete,upload,createEreader,accessAllLibraries,accessAllTags,accessExplicitContent,selectedTagsNotAccessible);

@override
String toString() {
  return 'UserPermissions(download: $download, update: $update, delete: $delete, upload: $upload, createEreader: $createEreader, accessAllLibraries: $accessAllLibraries, accessAllTags: $accessAllTags, accessExplicitContent: $accessExplicitContent, selectedTagsNotAccessible: $selectedTagsNotAccessible)';
}


}

/// @nodoc
abstract mixin class $UserPermissionsCopyWith<$Res>  {
  factory $UserPermissionsCopyWith(UserPermissions value, $Res Function(UserPermissions) _then) = _$UserPermissionsCopyWithImpl;
@useResult
$Res call({
 bool? download, bool? update, bool? delete, bool? upload, bool? createEreader, bool? accessAllLibraries, bool? accessAllTags, bool? accessExplicitContent, bool? selectedTagsNotAccessible
});




}
/// @nodoc
class _$UserPermissionsCopyWithImpl<$Res>
    implements $UserPermissionsCopyWith<$Res> {
  _$UserPermissionsCopyWithImpl(this._self, this._then);

  final UserPermissions _self;
  final $Res Function(UserPermissions) _then;

/// Create a copy of UserPermissions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? download = freezed,Object? update = freezed,Object? delete = freezed,Object? upload = freezed,Object? createEreader = freezed,Object? accessAllLibraries = freezed,Object? accessAllTags = freezed,Object? accessExplicitContent = freezed,Object? selectedTagsNotAccessible = freezed,}) {
  return _then(_self.copyWith(
download: freezed == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as bool?,update: freezed == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as bool?,delete: freezed == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as bool?,upload: freezed == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as bool?,createEreader: freezed == createEreader ? _self.createEreader : createEreader // ignore: cast_nullable_to_non_nullable
as bool?,accessAllLibraries: freezed == accessAllLibraries ? _self.accessAllLibraries : accessAllLibraries // ignore: cast_nullable_to_non_nullable
as bool?,accessAllTags: freezed == accessAllTags ? _self.accessAllTags : accessAllTags // ignore: cast_nullable_to_non_nullable
as bool?,accessExplicitContent: freezed == accessExplicitContent ? _self.accessExplicitContent : accessExplicitContent // ignore: cast_nullable_to_non_nullable
as bool?,selectedTagsNotAccessible: freezed == selectedTagsNotAccessible ? _self.selectedTagsNotAccessible : selectedTagsNotAccessible // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPermissions].
extension UserPermissionsPatterns on UserPermissions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPermissions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPermissions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPermissions value)  $default,){
final _that = this;
switch (_that) {
case _UserPermissions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPermissions value)?  $default,){
final _that = this;
switch (_that) {
case _UserPermissions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? download,  bool? update,  bool? delete,  bool? upload,  bool? createEreader,  bool? accessAllLibraries,  bool? accessAllTags,  bool? accessExplicitContent,  bool? selectedTagsNotAccessible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPermissions() when $default != null:
return $default(_that.download,_that.update,_that.delete,_that.upload,_that.createEreader,_that.accessAllLibraries,_that.accessAllTags,_that.accessExplicitContent,_that.selectedTagsNotAccessible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? download,  bool? update,  bool? delete,  bool? upload,  bool? createEreader,  bool? accessAllLibraries,  bool? accessAllTags,  bool? accessExplicitContent,  bool? selectedTagsNotAccessible)  $default,) {final _that = this;
switch (_that) {
case _UserPermissions():
return $default(_that.download,_that.update,_that.delete,_that.upload,_that.createEreader,_that.accessAllLibraries,_that.accessAllTags,_that.accessExplicitContent,_that.selectedTagsNotAccessible);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? download,  bool? update,  bool? delete,  bool? upload,  bool? createEreader,  bool? accessAllLibraries,  bool? accessAllTags,  bool? accessExplicitContent,  bool? selectedTagsNotAccessible)?  $default,) {final _that = this;
switch (_that) {
case _UserPermissions() when $default != null:
return $default(_that.download,_that.update,_that.delete,_that.upload,_that.createEreader,_that.accessAllLibraries,_that.accessAllTags,_that.accessExplicitContent,_that.selectedTagsNotAccessible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPermissions implements UserPermissions {
  const _UserPermissions({this.download, this.update, this.delete, this.upload, this.createEreader, this.accessAllLibraries, this.accessAllTags, this.accessExplicitContent, this.selectedTagsNotAccessible});
  factory _UserPermissions.fromJson(Map<String, dynamic> json) => _$UserPermissionsFromJson(json);

@override final  bool? download;
@override final  bool? update;
@override final  bool? delete;
@override final  bool? upload;
@override final  bool? createEreader;
@override final  bool? accessAllLibraries;
@override final  bool? accessAllTags;
@override final  bool? accessExplicitContent;
@override final  bool? selectedTagsNotAccessible;

/// Create a copy of UserPermissions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPermissionsCopyWith<_UserPermissions> get copyWith => __$UserPermissionsCopyWithImpl<_UserPermissions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPermissionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPermissions&&(identical(other.download, download) || other.download == download)&&(identical(other.update, update) || other.update == update)&&(identical(other.delete, delete) || other.delete == delete)&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.createEreader, createEreader) || other.createEreader == createEreader)&&(identical(other.accessAllLibraries, accessAllLibraries) || other.accessAllLibraries == accessAllLibraries)&&(identical(other.accessAllTags, accessAllTags) || other.accessAllTags == accessAllTags)&&(identical(other.accessExplicitContent, accessExplicitContent) || other.accessExplicitContent == accessExplicitContent)&&(identical(other.selectedTagsNotAccessible, selectedTagsNotAccessible) || other.selectedTagsNotAccessible == selectedTagsNotAccessible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,download,update,delete,upload,createEreader,accessAllLibraries,accessAllTags,accessExplicitContent,selectedTagsNotAccessible);

@override
String toString() {
  return 'UserPermissions(download: $download, update: $update, delete: $delete, upload: $upload, createEreader: $createEreader, accessAllLibraries: $accessAllLibraries, accessAllTags: $accessAllTags, accessExplicitContent: $accessExplicitContent, selectedTagsNotAccessible: $selectedTagsNotAccessible)';
}


}

/// @nodoc
abstract mixin class _$UserPermissionsCopyWith<$Res> implements $UserPermissionsCopyWith<$Res> {
  factory _$UserPermissionsCopyWith(_UserPermissions value, $Res Function(_UserPermissions) _then) = __$UserPermissionsCopyWithImpl;
@override @useResult
$Res call({
 bool? download, bool? update, bool? delete, bool? upload, bool? createEreader, bool? accessAllLibraries, bool? accessAllTags, bool? accessExplicitContent, bool? selectedTagsNotAccessible
});




}
/// @nodoc
class __$UserPermissionsCopyWithImpl<$Res>
    implements _$UserPermissionsCopyWith<$Res> {
  __$UserPermissionsCopyWithImpl(this._self, this._then);

  final _UserPermissions _self;
  final $Res Function(_UserPermissions) _then;

/// Create a copy of UserPermissions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? download = freezed,Object? update = freezed,Object? delete = freezed,Object? upload = freezed,Object? createEreader = freezed,Object? accessAllLibraries = freezed,Object? accessAllTags = freezed,Object? accessExplicitContent = freezed,Object? selectedTagsNotAccessible = freezed,}) {
  return _then(_UserPermissions(
download: freezed == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as bool?,update: freezed == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as bool?,delete: freezed == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as bool?,upload: freezed == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as bool?,createEreader: freezed == createEreader ? _self.createEreader : createEreader // ignore: cast_nullable_to_non_nullable
as bool?,accessAllLibraries: freezed == accessAllLibraries ? _self.accessAllLibraries : accessAllLibraries // ignore: cast_nullable_to_non_nullable
as bool?,accessAllTags: freezed == accessAllTags ? _self.accessAllTags : accessAllTags // ignore: cast_nullable_to_non_nullable
as bool?,accessExplicitContent: freezed == accessExplicitContent ? _self.accessExplicitContent : accessExplicitContent // ignore: cast_nullable_to_non_nullable
as bool?,selectedTagsNotAccessible: freezed == selectedTagsNotAccessible ? _self.selectedTagsNotAccessible : selectedTagsNotAccessible // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
