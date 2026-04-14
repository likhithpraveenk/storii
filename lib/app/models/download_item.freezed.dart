// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadTrack {

 AudioTrack get audioTrack; String get localPath; int get bytesReceived; int get bytesTotal; DownloadStatus get status;
/// Create a copy of DownloadTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadTrackCopyWith<DownloadTrack> get copyWith => _$DownloadTrackCopyWithImpl<DownloadTrack>(this as DownloadTrack, _$identity);

  /// Serializes this DownloadTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadTrack&&(identical(other.audioTrack, audioTrack) || other.audioTrack == audioTrack)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.bytesReceived, bytesReceived) || other.bytesReceived == bytesReceived)&&(identical(other.bytesTotal, bytesTotal) || other.bytesTotal == bytesTotal)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,audioTrack,localPath,bytesReceived,bytesTotal,status);

@override
String toString() {
  return 'DownloadTrack(audioTrack: $audioTrack, localPath: $localPath, bytesReceived: $bytesReceived, bytesTotal: $bytesTotal, status: $status)';
}


}

/// @nodoc
abstract mixin class $DownloadTrackCopyWith<$Res>  {
  factory $DownloadTrackCopyWith(DownloadTrack value, $Res Function(DownloadTrack) _then) = _$DownloadTrackCopyWithImpl;
@useResult
$Res call({
 AudioTrack audioTrack, String localPath, int bytesReceived, int bytesTotal, DownloadStatus status
});


$AudioTrackCopyWith<$Res> get audioTrack;

}
/// @nodoc
class _$DownloadTrackCopyWithImpl<$Res>
    implements $DownloadTrackCopyWith<$Res> {
  _$DownloadTrackCopyWithImpl(this._self, this._then);

  final DownloadTrack _self;
  final $Res Function(DownloadTrack) _then;

/// Create a copy of DownloadTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? audioTrack = null,Object? localPath = null,Object? bytesReceived = null,Object? bytesTotal = null,Object? status = null,}) {
  return _then(_self.copyWith(
audioTrack: null == audioTrack ? _self.audioTrack : audioTrack // ignore: cast_nullable_to_non_nullable
as AudioTrack,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,bytesReceived: null == bytesReceived ? _self.bytesReceived : bytesReceived // ignore: cast_nullable_to_non_nullable
as int,bytesTotal: null == bytesTotal ? _self.bytesTotal : bytesTotal // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DownloadStatus,
  ));
}
/// Create a copy of DownloadTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioTrackCopyWith<$Res> get audioTrack {
  
  return $AudioTrackCopyWith<$Res>(_self.audioTrack, (value) {
    return _then(_self.copyWith(audioTrack: value));
  });
}
}


/// Adds pattern-matching-related methods to [DownloadTrack].
extension DownloadTrackPatterns on DownloadTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadTrack value)  $default,){
final _that = this;
switch (_that) {
case _DownloadTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadTrack value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AudioTrack audioTrack,  String localPath,  int bytesReceived,  int bytesTotal,  DownloadStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadTrack() when $default != null:
return $default(_that.audioTrack,_that.localPath,_that.bytesReceived,_that.bytesTotal,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AudioTrack audioTrack,  String localPath,  int bytesReceived,  int bytesTotal,  DownloadStatus status)  $default,) {final _that = this;
switch (_that) {
case _DownloadTrack():
return $default(_that.audioTrack,_that.localPath,_that.bytesReceived,_that.bytesTotal,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AudioTrack audioTrack,  String localPath,  int bytesReceived,  int bytesTotal,  DownloadStatus status)?  $default,) {final _that = this;
switch (_that) {
case _DownloadTrack() when $default != null:
return $default(_that.audioTrack,_that.localPath,_that.bytesReceived,_that.bytesTotal,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadTrack implements DownloadTrack {
  const _DownloadTrack({required this.audioTrack, required this.localPath, this.bytesReceived = 0, this.bytesTotal = 0, this.status = DownloadStatus.queued});
  factory _DownloadTrack.fromJson(Map<String, dynamic> json) => _$DownloadTrackFromJson(json);

@override final  AudioTrack audioTrack;
@override final  String localPath;
@override@JsonKey() final  int bytesReceived;
@override@JsonKey() final  int bytesTotal;
@override@JsonKey() final  DownloadStatus status;

/// Create a copy of DownloadTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadTrackCopyWith<_DownloadTrack> get copyWith => __$DownloadTrackCopyWithImpl<_DownloadTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadTrack&&(identical(other.audioTrack, audioTrack) || other.audioTrack == audioTrack)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.bytesReceived, bytesReceived) || other.bytesReceived == bytesReceived)&&(identical(other.bytesTotal, bytesTotal) || other.bytesTotal == bytesTotal)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,audioTrack,localPath,bytesReceived,bytesTotal,status);

@override
String toString() {
  return 'DownloadTrack(audioTrack: $audioTrack, localPath: $localPath, bytesReceived: $bytesReceived, bytesTotal: $bytesTotal, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DownloadTrackCopyWith<$Res> implements $DownloadTrackCopyWith<$Res> {
  factory _$DownloadTrackCopyWith(_DownloadTrack value, $Res Function(_DownloadTrack) _then) = __$DownloadTrackCopyWithImpl;
@override @useResult
$Res call({
 AudioTrack audioTrack, String localPath, int bytesReceived, int bytesTotal, DownloadStatus status
});


@override $AudioTrackCopyWith<$Res> get audioTrack;

}
/// @nodoc
class __$DownloadTrackCopyWithImpl<$Res>
    implements _$DownloadTrackCopyWith<$Res> {
  __$DownloadTrackCopyWithImpl(this._self, this._then);

  final _DownloadTrack _self;
  final $Res Function(_DownloadTrack) _then;

/// Create a copy of DownloadTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? audioTrack = null,Object? localPath = null,Object? bytesReceived = null,Object? bytesTotal = null,Object? status = null,}) {
  return _then(_DownloadTrack(
audioTrack: null == audioTrack ? _self.audioTrack : audioTrack // ignore: cast_nullable_to_non_nullable
as AudioTrack,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,bytesReceived: null == bytesReceived ? _self.bytesReceived : bytesReceived // ignore: cast_nullable_to_non_nullable
as int,bytesTotal: null == bytesTotal ? _self.bytesTotal : bytesTotal // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DownloadStatus,
  ));
}

/// Create a copy of DownloadTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioTrackCopyWith<$Res> get audioTrack {
  
  return $AudioTrackCopyWith<$Res>(_self.audioTrack, (value) {
    return _then(_self.copyWith(audioTrack: value));
  });
}
}


/// @nodoc
mixin _$DownloadItem {

 String get libraryItemId; String get title; String get author; List<DownloadTrack> get tracks; DownloadStatus get status; int get totalBytes; int get receivedBytes; DateTime? get startedAt;
/// Create a copy of DownloadItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadItemCopyWith<DownloadItem> get copyWith => _$DownloadItemCopyWithImpl<DownloadItem>(this as DownloadItem, _$identity);

  /// Serializes this DownloadItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadItem&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.receivedBytes, receivedBytes) || other.receivedBytes == receivedBytes)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryItemId,title,author,const DeepCollectionEquality().hash(tracks),status,totalBytes,receivedBytes,startedAt);

@override
String toString() {
  return 'DownloadItem(libraryItemId: $libraryItemId, title: $title, author: $author, tracks: $tracks, status: $status, totalBytes: $totalBytes, receivedBytes: $receivedBytes, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class $DownloadItemCopyWith<$Res>  {
  factory $DownloadItemCopyWith(DownloadItem value, $Res Function(DownloadItem) _then) = _$DownloadItemCopyWithImpl;
@useResult
$Res call({
 String libraryItemId, String title, String author, List<DownloadTrack> tracks, DownloadStatus status, int totalBytes, int receivedBytes, DateTime? startedAt
});




}
/// @nodoc
class _$DownloadItemCopyWithImpl<$Res>
    implements $DownloadItemCopyWith<$Res> {
  _$DownloadItemCopyWithImpl(this._self, this._then);

  final DownloadItem _self;
  final $Res Function(DownloadItem) _then;

/// Create a copy of DownloadItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryItemId = null,Object? title = null,Object? author = null,Object? tracks = null,Object? status = null,Object? totalBytes = null,Object? receivedBytes = null,Object? startedAt = freezed,}) {
  return _then(_self.copyWith(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<DownloadTrack>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DownloadStatus,totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as int,receivedBytes: null == receivedBytes ? _self.receivedBytes : receivedBytes // ignore: cast_nullable_to_non_nullable
as int,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadItem].
extension DownloadItemPatterns on DownloadItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadItem value)  $default,){
final _that = this;
switch (_that) {
case _DownloadItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadItem value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String libraryItemId,  String title,  String author,  List<DownloadTrack> tracks,  DownloadStatus status,  int totalBytes,  int receivedBytes,  DateTime? startedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadItem() when $default != null:
return $default(_that.libraryItemId,_that.title,_that.author,_that.tracks,_that.status,_that.totalBytes,_that.receivedBytes,_that.startedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String libraryItemId,  String title,  String author,  List<DownloadTrack> tracks,  DownloadStatus status,  int totalBytes,  int receivedBytes,  DateTime? startedAt)  $default,) {final _that = this;
switch (_that) {
case _DownloadItem():
return $default(_that.libraryItemId,_that.title,_that.author,_that.tracks,_that.status,_that.totalBytes,_that.receivedBytes,_that.startedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String libraryItemId,  String title,  String author,  List<DownloadTrack> tracks,  DownloadStatus status,  int totalBytes,  int receivedBytes,  DateTime? startedAt)?  $default,) {final _that = this;
switch (_that) {
case _DownloadItem() when $default != null:
return $default(_that.libraryItemId,_that.title,_that.author,_that.tracks,_that.status,_that.totalBytes,_that.receivedBytes,_that.startedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadItem extends DownloadItem {
  const _DownloadItem({required this.libraryItemId, required this.title, required this.author, required final  List<DownloadTrack> tracks, this.status = DownloadStatus.queued, this.totalBytes = 0, this.receivedBytes = 0, this.startedAt}): _tracks = tracks,super._();
  factory _DownloadItem.fromJson(Map<String, dynamic> json) => _$DownloadItemFromJson(json);

@override final  String libraryItemId;
@override final  String title;
@override final  String author;
 final  List<DownloadTrack> _tracks;
@override List<DownloadTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}

@override@JsonKey() final  DownloadStatus status;
@override@JsonKey() final  int totalBytes;
@override@JsonKey() final  int receivedBytes;
@override final  DateTime? startedAt;

/// Create a copy of DownloadItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadItemCopyWith<_DownloadItem> get copyWith => __$DownloadItemCopyWithImpl<_DownloadItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadItem&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.receivedBytes, receivedBytes) || other.receivedBytes == receivedBytes)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryItemId,title,author,const DeepCollectionEquality().hash(_tracks),status,totalBytes,receivedBytes,startedAt);

@override
String toString() {
  return 'DownloadItem(libraryItemId: $libraryItemId, title: $title, author: $author, tracks: $tracks, status: $status, totalBytes: $totalBytes, receivedBytes: $receivedBytes, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class _$DownloadItemCopyWith<$Res> implements $DownloadItemCopyWith<$Res> {
  factory _$DownloadItemCopyWith(_DownloadItem value, $Res Function(_DownloadItem) _then) = __$DownloadItemCopyWithImpl;
@override @useResult
$Res call({
 String libraryItemId, String title, String author, List<DownloadTrack> tracks, DownloadStatus status, int totalBytes, int receivedBytes, DateTime? startedAt
});




}
/// @nodoc
class __$DownloadItemCopyWithImpl<$Res>
    implements _$DownloadItemCopyWith<$Res> {
  __$DownloadItemCopyWithImpl(this._self, this._then);

  final _DownloadItem _self;
  final $Res Function(_DownloadItem) _then;

/// Create a copy of DownloadItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryItemId = null,Object? title = null,Object? author = null,Object? tracks = null,Object? status = null,Object? totalBytes = null,Object? receivedBytes = null,Object? startedAt = freezed,}) {
  return _then(_DownloadItem(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<DownloadTrack>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DownloadStatus,totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as int,receivedBytes: null == receivedBytes ? _self.receivedBytes : receivedBytes // ignore: cast_nullable_to_non_nullable
as int,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
