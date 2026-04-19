// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ebook_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EBookFile {

 String get ino; FileMetadata get metadata; String get ebookFormat; DateTime get addedAt; DateTime get updatedAt;
/// Create a copy of EBookFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EBookFileCopyWith<EBookFile> get copyWith => _$EBookFileCopyWithImpl<EBookFile>(this as EBookFile, _$identity);

  /// Serializes this EBookFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EBookFile&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.ebookFormat, ebookFormat) || other.ebookFormat == ebookFormat)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ino,metadata,ebookFormat,addedAt,updatedAt);

@override
String toString() {
  return 'EBookFile(ino: $ino, metadata: $metadata, ebookFormat: $ebookFormat, addedAt: $addedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EBookFileCopyWith<$Res>  {
  factory $EBookFileCopyWith(EBookFile value, $Res Function(EBookFile) _then) = _$EBookFileCopyWithImpl;
@useResult
$Res call({
 String ino, FileMetadata metadata, String ebookFormat, DateTime addedAt, DateTime updatedAt
});


$FileMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$EBookFileCopyWithImpl<$Res>
    implements $EBookFileCopyWith<$Res> {
  _$EBookFileCopyWithImpl(this._self, this._then);

  final EBookFile _self;
  final $Res Function(EBookFile) _then;

/// Create a copy of EBookFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ino = null,Object? metadata = null,Object? ebookFormat = null,Object? addedAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata,ebookFormat: null == ebookFormat ? _self.ebookFormat : ebookFormat // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of EBookFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res> get metadata {
  
  return $FileMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [EBookFile].
extension EBookFilePatterns on EBookFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EBookFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EBookFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EBookFile value)  $default,){
final _that = this;
switch (_that) {
case _EBookFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EBookFile value)?  $default,){
final _that = this;
switch (_that) {
case _EBookFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ino,  FileMetadata metadata,  String ebookFormat,  DateTime addedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EBookFile() when $default != null:
return $default(_that.ino,_that.metadata,_that.ebookFormat,_that.addedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ino,  FileMetadata metadata,  String ebookFormat,  DateTime addedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EBookFile():
return $default(_that.ino,_that.metadata,_that.ebookFormat,_that.addedAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ino,  FileMetadata metadata,  String ebookFormat,  DateTime addedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EBookFile() when $default != null:
return $default(_that.ino,_that.metadata,_that.ebookFormat,_that.addedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _EBookFile implements EBookFile {
  const _EBookFile({required this.ino, required this.metadata, required this.ebookFormat, required this.addedAt, required this.updatedAt});
  factory _EBookFile.fromJson(Map<String, dynamic> json) => _$EBookFileFromJson(json);

@override final  String ino;
@override final  FileMetadata metadata;
@override final  String ebookFormat;
@override final  DateTime addedAt;
@override final  DateTime updatedAt;

/// Create a copy of EBookFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EBookFileCopyWith<_EBookFile> get copyWith => __$EBookFileCopyWithImpl<_EBookFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EBookFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EBookFile&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.ebookFormat, ebookFormat) || other.ebookFormat == ebookFormat)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ino,metadata,ebookFormat,addedAt,updatedAt);

@override
String toString() {
  return 'EBookFile(ino: $ino, metadata: $metadata, ebookFormat: $ebookFormat, addedAt: $addedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EBookFileCopyWith<$Res> implements $EBookFileCopyWith<$Res> {
  factory _$EBookFileCopyWith(_EBookFile value, $Res Function(_EBookFile) _then) = __$EBookFileCopyWithImpl;
@override @useResult
$Res call({
 String ino, FileMetadata metadata, String ebookFormat, DateTime addedAt, DateTime updatedAt
});


@override $FileMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$EBookFileCopyWithImpl<$Res>
    implements _$EBookFileCopyWith<$Res> {
  __$EBookFileCopyWithImpl(this._self, this._then);

  final _EBookFile _self;
  final $Res Function(_EBookFile) _then;

/// Create a copy of EBookFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ino = null,Object? metadata = null,Object? ebookFormat = null,Object? addedAt = null,Object? updatedAt = null,}) {
  return _then(_EBookFile(
ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata,ebookFormat: null == ebookFormat ? _self.ebookFormat : ebookFormat // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of EBookFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res> get metadata {
  
  return $FileMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
