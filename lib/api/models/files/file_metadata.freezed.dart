// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileMetadata {

 String get filename; String get ext; String get path; String get relPath; int get size;@JsonKey(name: 'mtimeMs') DateTime get mtime;@JsonKey(name: 'ctimeMs') DateTime get ctime;@JsonKey(name: 'birthtimeMs') DateTime get birthtime;
/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<FileMetadata> get copyWith => _$FileMetadataCopyWithImpl<FileMetadata>(this as FileMetadata, _$identity);

  /// Serializes this FileMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileMetadata&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.size, size) || other.size == size)&&(identical(other.mtime, mtime) || other.mtime == mtime)&&(identical(other.ctime, ctime) || other.ctime == ctime)&&(identical(other.birthtime, birthtime) || other.birthtime == birthtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,ext,path,relPath,size,mtime,ctime,birthtime);

@override
String toString() {
  return 'FileMetadata(filename: $filename, ext: $ext, path: $path, relPath: $relPath, size: $size, mtime: $mtime, ctime: $ctime, birthtime: $birthtime)';
}


}

/// @nodoc
abstract mixin class $FileMetadataCopyWith<$Res>  {
  factory $FileMetadataCopyWith(FileMetadata value, $Res Function(FileMetadata) _then) = _$FileMetadataCopyWithImpl;
@useResult
$Res call({
 String filename, String ext, String path, String relPath, int size,@JsonKey(name: 'mtimeMs') DateTime mtime,@JsonKey(name: 'ctimeMs') DateTime ctime,@JsonKey(name: 'birthtimeMs') DateTime birthtime
});




}
/// @nodoc
class _$FileMetadataCopyWithImpl<$Res>
    implements $FileMetadataCopyWith<$Res> {
  _$FileMetadataCopyWithImpl(this._self, this._then);

  final FileMetadata _self;
  final $Res Function(FileMetadata) _then;

/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filename = null,Object? ext = null,Object? path = null,Object? relPath = null,Object? size = null,Object? mtime = null,Object? ctime = null,Object? birthtime = null,}) {
  return _then(_self.copyWith(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,ext: null == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mtime: null == mtime ? _self.mtime : mtime // ignore: cast_nullable_to_non_nullable
as DateTime,ctime: null == ctime ? _self.ctime : ctime // ignore: cast_nullable_to_non_nullable
as DateTime,birthtime: null == birthtime ? _self.birthtime : birthtime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FileMetadata].
extension FileMetadataPatterns on FileMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileMetadata value)  $default,){
final _that = this;
switch (_that) {
case _FileMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String filename,  String ext,  String path,  String relPath,  int size, @JsonKey(name: 'mtimeMs')  DateTime mtime, @JsonKey(name: 'ctimeMs')  DateTime ctime, @JsonKey(name: 'birthtimeMs')  DateTime birthtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
return $default(_that.filename,_that.ext,_that.path,_that.relPath,_that.size,_that.mtime,_that.ctime,_that.birthtime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String filename,  String ext,  String path,  String relPath,  int size, @JsonKey(name: 'mtimeMs')  DateTime mtime, @JsonKey(name: 'ctimeMs')  DateTime ctime, @JsonKey(name: 'birthtimeMs')  DateTime birthtime)  $default,) {final _that = this;
switch (_that) {
case _FileMetadata():
return $default(_that.filename,_that.ext,_that.path,_that.relPath,_that.size,_that.mtime,_that.ctime,_that.birthtime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String filename,  String ext,  String path,  String relPath,  int size, @JsonKey(name: 'mtimeMs')  DateTime mtime, @JsonKey(name: 'ctimeMs')  DateTime ctime, @JsonKey(name: 'birthtimeMs')  DateTime birthtime)?  $default,) {final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
return $default(_that.filename,_that.ext,_that.path,_that.relPath,_that.size,_that.mtime,_that.ctime,_that.birthtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _FileMetadata implements FileMetadata {
  const _FileMetadata({required this.filename, required this.ext, required this.path, required this.relPath, required this.size, @JsonKey(name: 'mtimeMs') required this.mtime, @JsonKey(name: 'ctimeMs') required this.ctime, @JsonKey(name: 'birthtimeMs') required this.birthtime});
  factory _FileMetadata.fromJson(Map<String, dynamic> json) => _$FileMetadataFromJson(json);

@override final  String filename;
@override final  String ext;
@override final  String path;
@override final  String relPath;
@override final  int size;
@override@JsonKey(name: 'mtimeMs') final  DateTime mtime;
@override@JsonKey(name: 'ctimeMs') final  DateTime ctime;
@override@JsonKey(name: 'birthtimeMs') final  DateTime birthtime;

/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileMetadataCopyWith<_FileMetadata> get copyWith => __$FileMetadataCopyWithImpl<_FileMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileMetadata&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.size, size) || other.size == size)&&(identical(other.mtime, mtime) || other.mtime == mtime)&&(identical(other.ctime, ctime) || other.ctime == ctime)&&(identical(other.birthtime, birthtime) || other.birthtime == birthtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,ext,path,relPath,size,mtime,ctime,birthtime);

@override
String toString() {
  return 'FileMetadata(filename: $filename, ext: $ext, path: $path, relPath: $relPath, size: $size, mtime: $mtime, ctime: $ctime, birthtime: $birthtime)';
}


}

/// @nodoc
abstract mixin class _$FileMetadataCopyWith<$Res> implements $FileMetadataCopyWith<$Res> {
  factory _$FileMetadataCopyWith(_FileMetadata value, $Res Function(_FileMetadata) _then) = __$FileMetadataCopyWithImpl;
@override @useResult
$Res call({
 String filename, String ext, String path, String relPath, int size,@JsonKey(name: 'mtimeMs') DateTime mtime,@JsonKey(name: 'ctimeMs') DateTime ctime,@JsonKey(name: 'birthtimeMs') DateTime birthtime
});




}
/// @nodoc
class __$FileMetadataCopyWithImpl<$Res>
    implements _$FileMetadataCopyWith<$Res> {
  __$FileMetadataCopyWithImpl(this._self, this._then);

  final _FileMetadata _self;
  final $Res Function(_FileMetadata) _then;

/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? ext = null,Object? path = null,Object? relPath = null,Object? size = null,Object? mtime = null,Object? ctime = null,Object? birthtime = null,}) {
  return _then(_FileMetadata(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,ext: null == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mtime: null == mtime ? _self.mtime : mtime // ignore: cast_nullable_to_non_nullable
as DateTime,ctime: null == ctime ? _self.ctime : ctime // ignore: cast_nullable_to_non_nullable
as DateTime,birthtime: null == birthtime ? _self.birthtime : birthtime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
