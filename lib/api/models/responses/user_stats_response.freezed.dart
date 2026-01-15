// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatsResponse {

 Duration get totalTime; Map<String, ItemsListenedToResponse> get items;@JsonKey(toJson: _daysToJson) Map<DateTime, Duration> get days; Map<DayOfTheWeek, Duration> get dayOfWeek; Duration get today; List<PlaybackSession> get recentSessions;
/// Create a copy of UserStatsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsResponseCopyWith<UserStatsResponse> get copyWith => _$UserStatsResponseCopyWithImpl<UserStatsResponse>(this as UserStatsResponse, _$identity);

  /// Serializes this UserStatsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatsResponse&&(identical(other.totalTime, totalTime) || other.totalTime == totalTime)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.days, days)&&const DeepCollectionEquality().equals(other.dayOfWeek, dayOfWeek)&&(identical(other.today, today) || other.today == today)&&const DeepCollectionEquality().equals(other.recentSessions, recentSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTime,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(days),const DeepCollectionEquality().hash(dayOfWeek),today,const DeepCollectionEquality().hash(recentSessions));

@override
String toString() {
  return 'UserStatsResponse(totalTime: $totalTime, items: $items, days: $days, dayOfWeek: $dayOfWeek, today: $today, recentSessions: $recentSessions)';
}


}

/// @nodoc
abstract mixin class $UserStatsResponseCopyWith<$Res>  {
  factory $UserStatsResponseCopyWith(UserStatsResponse value, $Res Function(UserStatsResponse) _then) = _$UserStatsResponseCopyWithImpl;
@useResult
$Res call({
 Duration totalTime, Map<String, ItemsListenedToResponse> items,@JsonKey(toJson: _daysToJson) Map<DateTime, Duration> days, Map<DayOfTheWeek, Duration> dayOfWeek, Duration today, List<PlaybackSession> recentSessions
});




}
/// @nodoc
class _$UserStatsResponseCopyWithImpl<$Res>
    implements $UserStatsResponseCopyWith<$Res> {
  _$UserStatsResponseCopyWithImpl(this._self, this._then);

  final UserStatsResponse _self;
  final $Res Function(UserStatsResponse) _then;

/// Create a copy of UserStatsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalTime = null,Object? items = null,Object? days = null,Object? dayOfWeek = null,Object? today = null,Object? recentSessions = null,}) {
  return _then(_self.copyWith(
totalTime: null == totalTime ? _self.totalTime : totalTime // ignore: cast_nullable_to_non_nullable
as Duration,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as Map<String, ItemsListenedToResponse>,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as Map<DateTime, Duration>,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as Map<DayOfTheWeek, Duration>,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as Duration,recentSessions: null == recentSessions ? _self.recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<PlaybackSession>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStatsResponse].
extension UserStatsResponsePatterns on UserStatsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatsResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserStatsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration totalTime,  Map<String, ItemsListenedToResponse> items, @JsonKey(toJson: _daysToJson)  Map<DateTime, Duration> days,  Map<DayOfTheWeek, Duration> dayOfWeek,  Duration today,  List<PlaybackSession> recentSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatsResponse() when $default != null:
return $default(_that.totalTime,_that.items,_that.days,_that.dayOfWeek,_that.today,_that.recentSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration totalTime,  Map<String, ItemsListenedToResponse> items, @JsonKey(toJson: _daysToJson)  Map<DateTime, Duration> days,  Map<DayOfTheWeek, Duration> dayOfWeek,  Duration today,  List<PlaybackSession> recentSessions)  $default,) {final _that = this;
switch (_that) {
case _UserStatsResponse():
return $default(_that.totalTime,_that.items,_that.days,_that.dayOfWeek,_that.today,_that.recentSessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration totalTime,  Map<String, ItemsListenedToResponse> items, @JsonKey(toJson: _daysToJson)  Map<DateTime, Duration> days,  Map<DayOfTheWeek, Duration> dayOfWeek,  Duration today,  List<PlaybackSession> recentSessions)?  $default,) {final _that = this;
switch (_that) {
case _UserStatsResponse() when $default != null:
return $default(_that.totalTime,_that.items,_that.days,_that.dayOfWeek,_that.today,_that.recentSessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DurationSecConverter()
class _UserStatsResponse implements UserStatsResponse {
  const _UserStatsResponse({required this.totalTime, required final  Map<String, ItemsListenedToResponse> items, @JsonKey(toJson: _daysToJson) required final  Map<DateTime, Duration> days, required final  Map<DayOfTheWeek, Duration> dayOfWeek, required this.today, required final  List<PlaybackSession> recentSessions}): _items = items,_days = days,_dayOfWeek = dayOfWeek,_recentSessions = recentSessions;
  factory _UserStatsResponse.fromJson(Map<String, dynamic> json) => _$UserStatsResponseFromJson(json);

@override final  Duration totalTime;
 final  Map<String, ItemsListenedToResponse> _items;
@override Map<String, ItemsListenedToResponse> get items {
  if (_items is EqualUnmodifiableMapView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_items);
}

 final  Map<DateTime, Duration> _days;
@override@JsonKey(toJson: _daysToJson) Map<DateTime, Duration> get days {
  if (_days is EqualUnmodifiableMapView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_days);
}

 final  Map<DayOfTheWeek, Duration> _dayOfWeek;
@override Map<DayOfTheWeek, Duration> get dayOfWeek {
  if (_dayOfWeek is EqualUnmodifiableMapView) return _dayOfWeek;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_dayOfWeek);
}

@override final  Duration today;
 final  List<PlaybackSession> _recentSessions;
@override List<PlaybackSession> get recentSessions {
  if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSessions);
}


/// Create a copy of UserStatsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsResponseCopyWith<_UserStatsResponse> get copyWith => __$UserStatsResponseCopyWithImpl<_UserStatsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatsResponse&&(identical(other.totalTime, totalTime) || other.totalTime == totalTime)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._days, _days)&&const DeepCollectionEquality().equals(other._dayOfWeek, _dayOfWeek)&&(identical(other.today, today) || other.today == today)&&const DeepCollectionEquality().equals(other._recentSessions, _recentSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTime,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_days),const DeepCollectionEquality().hash(_dayOfWeek),today,const DeepCollectionEquality().hash(_recentSessions));

@override
String toString() {
  return 'UserStatsResponse(totalTime: $totalTime, items: $items, days: $days, dayOfWeek: $dayOfWeek, today: $today, recentSessions: $recentSessions)';
}


}

/// @nodoc
abstract mixin class _$UserStatsResponseCopyWith<$Res> implements $UserStatsResponseCopyWith<$Res> {
  factory _$UserStatsResponseCopyWith(_UserStatsResponse value, $Res Function(_UserStatsResponse) _then) = __$UserStatsResponseCopyWithImpl;
@override @useResult
$Res call({
 Duration totalTime, Map<String, ItemsListenedToResponse> items,@JsonKey(toJson: _daysToJson) Map<DateTime, Duration> days, Map<DayOfTheWeek, Duration> dayOfWeek, Duration today, List<PlaybackSession> recentSessions
});




}
/// @nodoc
class __$UserStatsResponseCopyWithImpl<$Res>
    implements _$UserStatsResponseCopyWith<$Res> {
  __$UserStatsResponseCopyWithImpl(this._self, this._then);

  final _UserStatsResponse _self;
  final $Res Function(_UserStatsResponse) _then;

/// Create a copy of UserStatsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalTime = null,Object? items = null,Object? days = null,Object? dayOfWeek = null,Object? today = null,Object? recentSessions = null,}) {
  return _then(_UserStatsResponse(
totalTime: null == totalTime ? _self.totalTime : totalTime // ignore: cast_nullable_to_non_nullable
as Duration,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as Map<String, ItemsListenedToResponse>,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as Map<DateTime, Duration>,dayOfWeek: null == dayOfWeek ? _self._dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as Map<DayOfTheWeek, Duration>,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as Duration,recentSessions: null == recentSessions ? _self._recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<PlaybackSession>,
  ));
}


}


/// @nodoc
mixin _$ItemsListenedToResponse {

@JsonKey(name: 'id') String get libraryItemId; Duration get timeListening; MediaMetadata get mediaMetadata;
/// Create a copy of ItemsListenedToResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemsListenedToResponseCopyWith<ItemsListenedToResponse> get copyWith => _$ItemsListenedToResponseCopyWithImpl<ItemsListenedToResponse>(this as ItemsListenedToResponse, _$identity);

  /// Serializes this ItemsListenedToResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemsListenedToResponse&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.timeListening, timeListening) || other.timeListening == timeListening)&&(identical(other.mediaMetadata, mediaMetadata) || other.mediaMetadata == mediaMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryItemId,timeListening,mediaMetadata);

@override
String toString() {
  return 'ItemsListenedToResponse(libraryItemId: $libraryItemId, timeListening: $timeListening, mediaMetadata: $mediaMetadata)';
}


}

/// @nodoc
abstract mixin class $ItemsListenedToResponseCopyWith<$Res>  {
  factory $ItemsListenedToResponseCopyWith(ItemsListenedToResponse value, $Res Function(ItemsListenedToResponse) _then) = _$ItemsListenedToResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String libraryItemId, Duration timeListening, MediaMetadata mediaMetadata
});


$MediaMetadataCopyWith<$Res> get mediaMetadata;

}
/// @nodoc
class _$ItemsListenedToResponseCopyWithImpl<$Res>
    implements $ItemsListenedToResponseCopyWith<$Res> {
  _$ItemsListenedToResponseCopyWithImpl(this._self, this._then);

  final ItemsListenedToResponse _self;
  final $Res Function(ItemsListenedToResponse) _then;

/// Create a copy of ItemsListenedToResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryItemId = null,Object? timeListening = null,Object? mediaMetadata = null,}) {
  return _then(_self.copyWith(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,timeListening: null == timeListening ? _self.timeListening : timeListening // ignore: cast_nullable_to_non_nullable
as Duration,mediaMetadata: null == mediaMetadata ? _self.mediaMetadata : mediaMetadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,
  ));
}
/// Create a copy of ItemsListenedToResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get mediaMetadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.mediaMetadata, (value) {
    return _then(_self.copyWith(mediaMetadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemsListenedToResponse].
extension ItemsListenedToResponsePatterns on ItemsListenedToResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemsListenedToResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemsListenedToResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemsListenedToResponse value)  $default,){
final _that = this;
switch (_that) {
case _ItemsListenedToResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemsListenedToResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ItemsListenedToResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String libraryItemId,  Duration timeListening,  MediaMetadata mediaMetadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemsListenedToResponse() when $default != null:
return $default(_that.libraryItemId,_that.timeListening,_that.mediaMetadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String libraryItemId,  Duration timeListening,  MediaMetadata mediaMetadata)  $default,) {final _that = this;
switch (_that) {
case _ItemsListenedToResponse():
return $default(_that.libraryItemId,_that.timeListening,_that.mediaMetadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String libraryItemId,  Duration timeListening,  MediaMetadata mediaMetadata)?  $default,) {final _that = this;
switch (_that) {
case _ItemsListenedToResponse() when $default != null:
return $default(_that.libraryItemId,_that.timeListening,_that.mediaMetadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DurationSecConverter()
class _ItemsListenedToResponse implements ItemsListenedToResponse {
  const _ItemsListenedToResponse({@JsonKey(name: 'id') required this.libraryItemId, required this.timeListening, required this.mediaMetadata});
  factory _ItemsListenedToResponse.fromJson(Map<String, dynamic> json) => _$ItemsListenedToResponseFromJson(json);

@override@JsonKey(name: 'id') final  String libraryItemId;
@override final  Duration timeListening;
@override final  MediaMetadata mediaMetadata;

/// Create a copy of ItemsListenedToResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemsListenedToResponseCopyWith<_ItemsListenedToResponse> get copyWith => __$ItemsListenedToResponseCopyWithImpl<_ItemsListenedToResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemsListenedToResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemsListenedToResponse&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.timeListening, timeListening) || other.timeListening == timeListening)&&(identical(other.mediaMetadata, mediaMetadata) || other.mediaMetadata == mediaMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryItemId,timeListening,mediaMetadata);

@override
String toString() {
  return 'ItemsListenedToResponse(libraryItemId: $libraryItemId, timeListening: $timeListening, mediaMetadata: $mediaMetadata)';
}


}

/// @nodoc
abstract mixin class _$ItemsListenedToResponseCopyWith<$Res> implements $ItemsListenedToResponseCopyWith<$Res> {
  factory _$ItemsListenedToResponseCopyWith(_ItemsListenedToResponse value, $Res Function(_ItemsListenedToResponse) _then) = __$ItemsListenedToResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String libraryItemId, Duration timeListening, MediaMetadata mediaMetadata
});


@override $MediaMetadataCopyWith<$Res> get mediaMetadata;

}
/// @nodoc
class __$ItemsListenedToResponseCopyWithImpl<$Res>
    implements _$ItemsListenedToResponseCopyWith<$Res> {
  __$ItemsListenedToResponseCopyWithImpl(this._self, this._then);

  final _ItemsListenedToResponse _self;
  final $Res Function(_ItemsListenedToResponse) _then;

/// Create a copy of ItemsListenedToResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryItemId = null,Object? timeListening = null,Object? mediaMetadata = null,}) {
  return _then(_ItemsListenedToResponse(
libraryItemId: null == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String,timeListening: null == timeListening ? _self.timeListening : timeListening // ignore: cast_nullable_to_non_nullable
as Duration,mediaMetadata: null == mediaMetadata ? _self.mediaMetadata : mediaMetadata // ignore: cast_nullable_to_non_nullable
as MediaMetadata,
  ));
}

/// Create a copy of ItemsListenedToResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaMetadataCopyWith<$Res> get mediaMetadata {
  
  return $MediaMetadataCopyWith<$Res>(_self.mediaMetadata, (value) {
    return _then(_self.copyWith(mediaMetadata: value));
  });
}
}

// dart format on
