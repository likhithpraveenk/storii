// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileUpload {

 String get filename;
/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadCopyWith<FileUpload> get copyWith => _$FileUploadCopyWithImpl<FileUpload>(this as FileUpload, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUpload&&(identical(other.filename, filename) || other.filename == filename));
}


@override
int get hashCode => Object.hash(runtimeType,filename);

@override
String toString() {
  return 'FileUpload(filename: $filename)';
}


}

/// @nodoc
abstract mixin class $FileUploadCopyWith<$Res>  {
  factory $FileUploadCopyWith(FileUpload value, $Res Function(FileUpload) _then) = _$FileUploadCopyWithImpl;
@useResult
$Res call({
 String filename
});




}
/// @nodoc
class _$FileUploadCopyWithImpl<$Res>
    implements $FileUploadCopyWith<$Res> {
  _$FileUploadCopyWithImpl(this._self, this._then);

  final FileUpload _self;
  final $Res Function(FileUpload) _then;

/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filename = null,}) {
  return _then(_self.copyWith(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileUpload].
extension FileUploadPatterns on FileUpload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileUpload value)?  $default,{TResult Function( FileUploadBytes value)?  fromBytes,TResult Function( FileUploadPath value)?  fromPath,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileUpload() when $default != null:
return $default(_that);case FileUploadBytes() when fromBytes != null:
return fromBytes(_that);case FileUploadPath() when fromPath != null:
return fromPath(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileUpload value)  $default,{required TResult Function( FileUploadBytes value)  fromBytes,required TResult Function( FileUploadPath value)  fromPath,}){
final _that = this;
switch (_that) {
case _FileUpload():
return $default(_that);case FileUploadBytes():
return fromBytes(_that);case FileUploadPath():
return fromPath(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileUpload value)?  $default,{TResult? Function( FileUploadBytes value)?  fromBytes,TResult? Function( FileUploadPath value)?  fromPath,}){
final _that = this;
switch (_that) {
case _FileUpload() when $default != null:
return $default(_that);case FileUploadBytes() when fromBytes != null:
return fromBytes(_that);case FileUploadPath() when fromPath != null:
return fromPath(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String filename,  Stream<List<int>> byteStream,  int length)?  $default,{TResult Function( String filename,  List<int> bytes)?  fromBytes,TResult Function( String filename,  String filePath)?  fromPath,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileUpload() when $default != null:
return $default(_that.filename,_that.byteStream,_that.length);case FileUploadBytes() when fromBytes != null:
return fromBytes(_that.filename,_that.bytes);case FileUploadPath() when fromPath != null:
return fromPath(_that.filename,_that.filePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String filename,  Stream<List<int>> byteStream,  int length)  $default,{required TResult Function( String filename,  List<int> bytes)  fromBytes,required TResult Function( String filename,  String filePath)  fromPath,}) {final _that = this;
switch (_that) {
case _FileUpload():
return $default(_that.filename,_that.byteStream,_that.length);case FileUploadBytes():
return fromBytes(_that.filename,_that.bytes);case FileUploadPath():
return fromPath(_that.filename,_that.filePath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String filename,  Stream<List<int>> byteStream,  int length)?  $default,{TResult? Function( String filename,  List<int> bytes)?  fromBytes,TResult? Function( String filename,  String filePath)?  fromPath,}) {final _that = this;
switch (_that) {
case _FileUpload() when $default != null:
return $default(_that.filename,_that.byteStream,_that.length);case FileUploadBytes() when fromBytes != null:
return fromBytes(_that.filename,_that.bytes);case FileUploadPath() when fromPath != null:
return fromPath(_that.filename,_that.filePath);case _:
  return null;

}
}

}

/// @nodoc


class _FileUpload implements FileUpload {
  const _FileUpload({required this.filename, required this.byteStream, required this.length});
  

@override final  String filename;
 final  Stream<List<int>> byteStream;
/// The size of the file, in bytes.
 final  int length;

/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileUploadCopyWith<_FileUpload> get copyWith => __$FileUploadCopyWithImpl<_FileUpload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileUpload&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.byteStream, byteStream) || other.byteStream == byteStream)&&(identical(other.length, length) || other.length == length));
}


@override
int get hashCode => Object.hash(runtimeType,filename,byteStream,length);

@override
String toString() {
  return 'FileUpload(filename: $filename, byteStream: $byteStream, length: $length)';
}


}

/// @nodoc
abstract mixin class _$FileUploadCopyWith<$Res> implements $FileUploadCopyWith<$Res> {
  factory _$FileUploadCopyWith(_FileUpload value, $Res Function(_FileUpload) _then) = __$FileUploadCopyWithImpl;
@override @useResult
$Res call({
 String filename, Stream<List<int>> byteStream, int length
});




}
/// @nodoc
class __$FileUploadCopyWithImpl<$Res>
    implements _$FileUploadCopyWith<$Res> {
  __$FileUploadCopyWithImpl(this._self, this._then);

  final _FileUpload _self;
  final $Res Function(_FileUpload) _then;

/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? byteStream = null,Object? length = null,}) {
  return _then(_FileUpload(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,byteStream: null == byteStream ? _self.byteStream : byteStream // ignore: cast_nullable_to_non_nullable
as Stream<List<int>>,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FileUploadBytes implements FileUpload {
  const FileUploadBytes({required this.filename, required final  List<int> bytes}): _bytes = bytes;
  

@override final  String filename;
 final  List<int> _bytes;
 List<int> get bytes {
  if (_bytes is EqualUnmodifiableListView) return _bytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bytes);
}


/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadBytesCopyWith<FileUploadBytes> get copyWith => _$FileUploadBytesCopyWithImpl<FileUploadBytes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadBytes&&(identical(other.filename, filename) || other.filename == filename)&&const DeepCollectionEquality().equals(other._bytes, _bytes));
}


@override
int get hashCode => Object.hash(runtimeType,filename,const DeepCollectionEquality().hash(_bytes));

@override
String toString() {
  return 'FileUpload.fromBytes(filename: $filename, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $FileUploadBytesCopyWith<$Res> implements $FileUploadCopyWith<$Res> {
  factory $FileUploadBytesCopyWith(FileUploadBytes value, $Res Function(FileUploadBytes) _then) = _$FileUploadBytesCopyWithImpl;
@override @useResult
$Res call({
 String filename, List<int> bytes
});




}
/// @nodoc
class _$FileUploadBytesCopyWithImpl<$Res>
    implements $FileUploadBytesCopyWith<$Res> {
  _$FileUploadBytesCopyWithImpl(this._self, this._then);

  final FileUploadBytes _self;
  final $Res Function(FileUploadBytes) _then;

/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? bytes = null,}) {
  return _then(FileUploadBytes(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,bytes: null == bytes ? _self._bytes : bytes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class FileUploadPath implements FileUpload {
  const FileUploadPath({required this.filename, required this.filePath});
  

@override final  String filename;
 final  String filePath;

/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadPathCopyWith<FileUploadPath> get copyWith => _$FileUploadPathCopyWithImpl<FileUploadPath>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadPath&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,filename,filePath);

@override
String toString() {
  return 'FileUpload.fromPath(filename: $filename, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $FileUploadPathCopyWith<$Res> implements $FileUploadCopyWith<$Res> {
  factory $FileUploadPathCopyWith(FileUploadPath value, $Res Function(FileUploadPath) _then) = _$FileUploadPathCopyWithImpl;
@override @useResult
$Res call({
 String filename, String filePath
});




}
/// @nodoc
class _$FileUploadPathCopyWithImpl<$Res>
    implements $FileUploadPathCopyWith<$Res> {
  _$FileUploadPathCopyWithImpl(this._self, this._then);

  final FileUploadPath _self;
  final $Res Function(FileUploadPath) _then;

/// Create a copy of FileUpload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? filePath = null,}) {
  return _then(FileUploadPath(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
