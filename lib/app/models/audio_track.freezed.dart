// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioTrackDomain {

 int get index; Duration get startOffset; Duration get duration; String get title; String get contentUrl; String get mimeType;
/// Create a copy of AudioTrackDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioTrackDomainCopyWith<AudioTrackDomain> get copyWith => _$AudioTrackDomainCopyWithImpl<AudioTrackDomain>(this as AudioTrackDomain, _$identity);

  /// Serializes this AudioTrackDomain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioTrackDomain&&(identical(other.index, index) || other.index == index)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,startOffset,duration,title,contentUrl,mimeType);

@override
String toString() {
  return 'AudioTrackDomain(index: $index, startOffset: $startOffset, duration: $duration, title: $title, contentUrl: $contentUrl, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class $AudioTrackDomainCopyWith<$Res>  {
  factory $AudioTrackDomainCopyWith(AudioTrackDomain value, $Res Function(AudioTrackDomain) _then) = _$AudioTrackDomainCopyWithImpl;
@useResult
$Res call({
 int index, Duration startOffset, Duration duration, String title, String contentUrl, String mimeType
});




}
/// @nodoc
class _$AudioTrackDomainCopyWithImpl<$Res>
    implements $AudioTrackDomainCopyWith<$Res> {
  _$AudioTrackDomainCopyWithImpl(this._self, this._then);

  final AudioTrackDomain _self;
  final $Res Function(AudioTrackDomain) _then;

/// Create a copy of AudioTrackDomain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? startOffset = null,Object? duration = null,Object? title = null,Object? contentUrl = null,Object? mimeType = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,startOffset: null == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioTrackDomain].
extension AudioTrackDomainPatterns on AudioTrackDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioTrackDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioTrackDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioTrackDomain value)  $default,){
final _that = this;
switch (_that) {
case _AudioTrackDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioTrackDomain value)?  $default,){
final _that = this;
switch (_that) {
case _AudioTrackDomain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  Duration startOffset,  Duration duration,  String title,  String contentUrl,  String mimeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioTrackDomain() when $default != null:
return $default(_that.index,_that.startOffset,_that.duration,_that.title,_that.contentUrl,_that.mimeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  Duration startOffset,  Duration duration,  String title,  String contentUrl,  String mimeType)  $default,) {final _that = this;
switch (_that) {
case _AudioTrackDomain():
return $default(_that.index,_that.startOffset,_that.duration,_that.title,_that.contentUrl,_that.mimeType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  Duration startOffset,  Duration duration,  String title,  String contentUrl,  String mimeType)?  $default,) {final _that = this;
switch (_that) {
case _AudioTrackDomain() when $default != null:
return $default(_that.index,_that.startOffset,_that.duration,_that.title,_that.contentUrl,_that.mimeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioTrackDomain implements AudioTrackDomain {
  const _AudioTrackDomain({required this.index, required this.startOffset, required this.duration, required this.title, required this.contentUrl, required this.mimeType});
  factory _AudioTrackDomain.fromJson(Map<String, dynamic> json) => _$AudioTrackDomainFromJson(json);

@override final  int index;
@override final  Duration startOffset;
@override final  Duration duration;
@override final  String title;
@override final  String contentUrl;
@override final  String mimeType;

/// Create a copy of AudioTrackDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioTrackDomainCopyWith<_AudioTrackDomain> get copyWith => __$AudioTrackDomainCopyWithImpl<_AudioTrackDomain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioTrackDomainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioTrackDomain&&(identical(other.index, index) || other.index == index)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,startOffset,duration,title,contentUrl,mimeType);

@override
String toString() {
  return 'AudioTrackDomain(index: $index, startOffset: $startOffset, duration: $duration, title: $title, contentUrl: $contentUrl, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$AudioTrackDomainCopyWith<$Res> implements $AudioTrackDomainCopyWith<$Res> {
  factory _$AudioTrackDomainCopyWith(_AudioTrackDomain value, $Res Function(_AudioTrackDomain) _then) = __$AudioTrackDomainCopyWithImpl;
@override @useResult
$Res call({
 int index, Duration startOffset, Duration duration, String title, String contentUrl, String mimeType
});




}
/// @nodoc
class __$AudioTrackDomainCopyWithImpl<$Res>
    implements _$AudioTrackDomainCopyWith<$Res> {
  __$AudioTrackDomainCopyWithImpl(this._self, this._then);

  final _AudioTrackDomain _self;
  final $Res Function(_AudioTrackDomain) _then;

/// Create a copy of AudioTrackDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? startOffset = null,Object? duration = null,Object? title = null,Object? contentUrl = null,Object? mimeType = null,}) {
  return _then(_AudioTrackDomain(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,startOffset: null == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
