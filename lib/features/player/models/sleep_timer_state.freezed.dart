// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SleepTimerState {

 SleepTimerMode get mode; Duration get remaining; bool get isPaused; int? get targetChapterIndex; Duration? get initialDuration; double? get originalVolume;
/// Create a copy of SleepTimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SleepTimerStateCopyWith<SleepTimerState> get copyWith => _$SleepTimerStateCopyWithImpl<SleepTimerState>(this as SleepTimerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SleepTimerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SleepTimerState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.remaining, _this.remaining) || other.remaining == _this.remaining)&&(identical(other.isPaused, _this.isPaused) || other.isPaused == _this.isPaused)&&(identical(other.targetChapterIndex, _this.targetChapterIndex) || other.targetChapterIndex == _this.targetChapterIndex)&&(identical(other.initialDuration, _this.initialDuration) || other.initialDuration == _this.initialDuration)&&(identical(other.originalVolume, _this.originalVolume) || other.originalVolume == _this.originalVolume));
}


@override
int get hashCode {
  final _this = this as SleepTimerState;
  return Object.hash(runtimeType,_this.mode,_this.remaining,_this.isPaused,_this.targetChapterIndex,_this.initialDuration,_this.originalVolume);
}

@override
String toString() {
  final _this = this as SleepTimerState;
  return 'SleepTimerState(mode: ${_this.mode}, remaining: ${_this.remaining}, isPaused: ${_this.isPaused}, targetChapterIndex: ${_this.targetChapterIndex}, initialDuration: ${_this.initialDuration}, originalVolume: ${_this.originalVolume})';
}


}

/// @nodoc
abstract mixin class $SleepTimerStateCopyWith<$Res>  {
  factory $SleepTimerStateCopyWith(SleepTimerState value, $Res Function(SleepTimerState) _then) = _$SleepTimerStateCopyWithImpl;
@useResult
$Res call({
 SleepTimerMode mode, Duration remaining, bool isPaused, int? targetChapterIndex, Duration? initialDuration, double? originalVolume
});




}
/// @nodoc
class _$SleepTimerStateCopyWithImpl<$Res>
    implements $SleepTimerStateCopyWith<$Res> {
  _$SleepTimerStateCopyWithImpl(this._self, this._then);

  final SleepTimerState _self;
  final $Res Function(SleepTimerState) _then;

/// Create a copy of SleepTimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? remaining = null,Object? isPaused = null,Object? targetChapterIndex = freezed,Object? initialDuration = freezed,Object? originalVolume = freezed,}) {
  return _then(SleepTimerState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SleepTimerMode,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as Duration,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,targetChapterIndex: freezed == targetChapterIndex ? _self.targetChapterIndex : targetChapterIndex // ignore: cast_nullable_to_non_nullable
as int?,initialDuration: freezed == initialDuration ? _self.initialDuration : initialDuration // ignore: cast_nullable_to_non_nullable
as Duration?,originalVolume: freezed == originalVolume ? _self.originalVolume : originalVolume // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SleepTimerState].
extension SleepTimerStatePatterns on SleepTimerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SleepTimerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SleepTimerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SleepTimerState value)  $default,){
final _that = this;
switch (_that) {
case _SleepTimerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SleepTimerState value)?  $default,){
final _that = this;
switch (_that) {
case _SleepTimerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SleepTimerMode mode,  Duration remaining,  bool isPaused,  int? targetChapterIndex,  Duration? initialDuration,  double? originalVolume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SleepTimerState() when $default != null:
return $default(_that.mode,_that.remaining,_that.isPaused,_that.targetChapterIndex,_that.initialDuration,_that.originalVolume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SleepTimerMode mode,  Duration remaining,  bool isPaused,  int? targetChapterIndex,  Duration? initialDuration,  double? originalVolume)  $default,) {final _that = this;
switch (_that) {
case _SleepTimerState():
return $default(_that.mode,_that.remaining,_that.isPaused,_that.targetChapterIndex,_that.initialDuration,_that.originalVolume);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SleepTimerMode mode,  Duration remaining,  bool isPaused,  int? targetChapterIndex,  Duration? initialDuration,  double? originalVolume)?  $default,) {final _that = this;
switch (_that) {
case _SleepTimerState() when $default != null:
return $default(_that.mode,_that.remaining,_that.isPaused,_that.targetChapterIndex,_that.initialDuration,_that.originalVolume);case _:
  return null;

}
}

}

/// @nodoc


class _SleepTimerState implements SleepTimerState {
  const _SleepTimerState({required this.mode, required this.remaining, required this.isPaused, this.targetChapterIndex, this.initialDuration, this.originalVolume});
  

@override final  SleepTimerMode mode;
@override final  Duration remaining;
@override final  bool isPaused;
@override final  int? targetChapterIndex;
@override final  Duration? initialDuration;
@override final  double? originalVolume;

/// Create a copy of SleepTimerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SleepTimerStateCopyWith<_SleepTimerState> get copyWith => __$SleepTimerStateCopyWithImpl<_SleepTimerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SleepTimerState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.targetChapterIndex, targetChapterIndex) || other.targetChapterIndex == targetChapterIndex)&&(identical(other.initialDuration, initialDuration) || other.initialDuration == initialDuration)&&(identical(other.originalVolume, originalVolume) || other.originalVolume == originalVolume));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,remaining,isPaused,targetChapterIndex,initialDuration,originalVolume);
}

@override
String toString() {
    return 'SleepTimerState(mode: $mode, remaining: $remaining, isPaused: $isPaused, targetChapterIndex: $targetChapterIndex, initialDuration: $initialDuration, originalVolume: $originalVolume)';
}


}

/// @nodoc
abstract mixin class _$SleepTimerStateCopyWith<$Res> implements $SleepTimerStateCopyWith<$Res> {
  factory _$SleepTimerStateCopyWith(_SleepTimerState value, $Res Function(_SleepTimerState) _then) = __$SleepTimerStateCopyWithImpl;
@override @useResult
$Res call({
 SleepTimerMode mode, Duration remaining, bool isPaused, int? targetChapterIndex, Duration? initialDuration, double? originalVolume
});




}
/// @nodoc
class __$SleepTimerStateCopyWithImpl<$Res>
    implements _$SleepTimerStateCopyWith<$Res> {
  __$SleepTimerStateCopyWithImpl(this._self, this._then);

  final _SleepTimerState _self;
  final $Res Function(_SleepTimerState) _then;

/// Create a copy of SleepTimerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? remaining = null,Object? isPaused = null,Object? targetChapterIndex = freezed,Object? initialDuration = freezed,Object? originalVolume = freezed,}) {
  return _then(_SleepTimerState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SleepTimerMode,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as Duration,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,targetChapterIndex: freezed == targetChapterIndex ? _self.targetChapterIndex : targetChapterIndex // ignore: cast_nullable_to_non_nullable
as int?,initialDuration: freezed == initialDuration ? _self.initialDuration : initialDuration // ignore: cast_nullable_to_non_nullable
as Duration?,originalVolume: freezed == originalVolume ? _self.originalVolume : originalVolume // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
