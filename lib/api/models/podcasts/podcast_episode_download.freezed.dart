// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_episode_download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastEpisodeDownload {

 String get id; String get episodeDisplayTitle; Uri get url; String get libraryItemId; bool get isDownloading; bool get isFinished; bool get failed; DateTime? get startedAt; DateTime get createdAt; DateTime? get finishedAt;
/// Create a copy of PodcastEpisodeDownload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PodcastEpisodeDownloadCopyWith<PodcastEpisodeDownload> get copyWith => _$PodcastEpisodeDownloadCopyWithImpl<PodcastEpisodeDownload>(this as PodcastEpisodeDownload, _$identity);

  /// Serializes this PodcastEpisodeDownload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PodcastEpisodeDownload&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeDisplayTitle, episodeDisplayTitle) || other.episodeDisplayTitle == episodeDisplayTitle)&&(identical(other.url, url) || other.url == url)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.failed, failed) || other.failed == failed)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeDisplayTitle,url,libraryItemId,isDownloading,isFinished,failed,startedAt,createdAt,finishedAt);

@override
String toString() {
  return 'PodcastEpisodeDownload(id: $id, episodeDisplayTitle: $episodeDisplayTitle, url: $url, libraryItemId: $libraryItemId, isDownloading: $isDownloading, isFinished: $isFinished, failed: $failed, startedAt: $startedAt, createdAt: $createdAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $PodcastEpisodeDownloadCopyWith<$Res>  {
  factory $PodcastEpisodeDownloadCopyWith(PodcastEpisodeDownload value, $Res Function(PodcastEpisodeDownload) _then) = _$PodcastEpisodeDownloadCopyWithImpl;
@useResult
$Res call({
 String id, String episodeDisplayTitle, Uri url, String libraryItemId, bool isDownloading, bool isFinished, bool failed, DateTime? startedAt, DateTime createdAt, DateTime? finishedAt
});




}
/// @nodoc
class _$PodcastEpisodeDownloadCopyWithImpl<$Res>
    implements $PodcastEpisodeDownloadCopyWith<$Res> {
  _$PodcastEpisodeDownloadCopyWithImpl(this._self, this._then);

  final PodcastEpisodeDownload _self;
  final $Res Function(PodcastEpisodeDownload) _then;

/// Create a copy of PodcastEpisodeDownload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? episodeDisplayTitle = null,Object? url = null,Object? libraryItemId = null,Object? isDownloading = null,Object? isFinished = null,Object? failed = null,Object? startedAt = freezed,Object? createdAt = null,Object? finishedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeDisplayTitle: null == episodeDisplayTitle ? _self.episodeDisplayTitle : episodeDisplayTitle // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PodcastEpisodeDownload].
extension PodcastEpisodeDownloadPatterns on PodcastEpisodeDownload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PodcastEpisodeDownload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PodcastEpisodeDownload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PodcastEpisodeDownload value)  $default,){
final _that = this;
switch (_that) {
case _PodcastEpisodeDownload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PodcastEpisodeDownload value)?  $default,){
final _that = this;
switch (_that) {
case _PodcastEpisodeDownload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String episodeDisplayTitle,  Uri url,  String libraryItemId,  bool isDownloading,  bool isFinished,  bool failed,  DateTime? startedAt,  DateTime createdAt,  DateTime? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PodcastEpisodeDownload() when $default != null:
return $default(_that.id,_that.episodeDisplayTitle,_that.url,_that.libraryItemId,_that.isDownloading,_that.isFinished,_that.failed,_that.startedAt,_that.createdAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String episodeDisplayTitle,  Uri url,  String libraryItemId,  bool isDownloading,  bool isFinished,  bool failed,  DateTime? startedAt,  DateTime createdAt,  DateTime? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _PodcastEpisodeDownload():
return $default(_that.id,_that.episodeDisplayTitle,_that.url,_that.libraryItemId,_that.isDownloading,_that.isFinished,_that.failed,_that.startedAt,_that.createdAt,_that.finishedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String episodeDisplayTitle,  Uri url,  String libraryItemId,  bool isDownloading,  bool isFinished,  bool failed,  DateTime? startedAt,  DateTime createdAt,  DateTime? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _PodcastEpisodeDownload() when $default != null:
return $default(_that.id,_that.episodeDisplayTitle,_that.url,_that.libraryItemId,_that.isDownloading,_that.isFinished,_that.failed,_that.startedAt,_that.createdAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _PodcastEpisodeDownload implements PodcastEpisodeDownload {
  const _PodcastEpisodeDownload({required this.id, required this.episodeDisplayTitle, required this.url, required this.libraryItemId, required this.isDownloading, required this.isFinished, required this.failed, this.startedAt, required this.createdAt, this.finishedAt});
  factory _PodcastEpisodeDownload.fromJson(Map<String, dynamic> json) => _$PodcastEpisodeDownloadFromJson(json);

@override final  String id;
@override final  String episodeDisplayTitle;
@override final  Uri url;
@override final  String libraryItemId;
@override final  bool isDownloading;
@override final  bool isFinished;
@override final  bool failed;
@override final  DateTime? startedAt;
@override final  DateTime createdAt;
@override final  DateTime? finishedAt;

/// Create a copy of PodcastEpisodeDownload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastEpisodeDownloadCopyWith<_PodcastEpisodeDownload> get copyWith => __$PodcastEpisodeDownloadCopyWithImpl<_PodcastEpisodeDownload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PodcastEpisodeDownloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastEpisodeDownload&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeDisplayTitle, episodeDisplayTitle) || other.episodeDisplayTitle == episodeDisplayTitle)&&(identical(other.url, url) || other.url == url)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.failed, failed) || other.failed == failed)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeDisplayTitle,url,libraryItemId,isDownloading,isFinished,failed,startedAt,createdAt,finishedAt);

@override
String toString() {
  return 'PodcastEpisodeDownload(id: $id, episodeDisplayTitle: $episodeDisplayTitle, url: $url, libraryItemId: $libraryItemId, isDownloading: $isDownloading, isFinished: $isFinished, failed: $failed, startedAt: $startedAt, createdAt: $createdAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$PodcastEpisodeDownloadCopyWith<$Res> implements $PodcastEpisodeDownloadCopyWith<$Res> {
  factory _$PodcastEpisodeDownloadCopyWith(_PodcastEpisodeDownload value, $Res Function(_PodcastEpisodeDownload) _then) = __$PodcastEpisodeDownloadCopyWithImpl;
@override @useResult
$Res call({
 String id, String episodeDisplayTitle, Uri url, String libraryItemId, bool isDownloading, bool isFinished, bool failed, DateTime? startedAt, DateTime createdAt, DateTime? finishedAt
});




}
/// @nodoc
class __$PodcastEpisodeDownloadCopyWithImpl<$Res>
    implements _$PodcastEpisodeDownloadCopyWith<$Res> {
  __$PodcastEpisodeDownloadCopyWithImpl(this._self, this._then);

  final _PodcastEpisodeDownload _self;
  final $Res Function(_PodcastEpisodeDownload) _then;

/// Create a copy of PodcastEpisodeDownload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? episodeDisplayTitle = null,Object? url = null,Object? libraryItemId = null,Object? isDownloading = null,Object? isFinished = null,Object? failed = null,Object? startedAt = freezed,Object? createdAt = null,Object? finishedAt = freezed,}) {
  return _then(_PodcastEpisodeDownload(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeDisplayTitle: null == episodeDisplayTitle ? _self.episodeDisplayTitle : episodeDisplayTitle // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
