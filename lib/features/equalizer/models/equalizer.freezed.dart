// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equalizer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EqualizerPreset {

 String get id; String get name; Map<EqualizerFrequency, double> get bands; bool get builtIn;
/// Create a copy of EqualizerPreset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EqualizerPresetCopyWith<EqualizerPreset> get copyWith => _$EqualizerPresetCopyWithImpl<EqualizerPreset>(this as EqualizerPreset, _$identity);

  /// Serializes this EqualizerPreset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EqualizerPreset;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EqualizerPreset&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.bands, _this.bands)&&(identical(other.builtIn, _this.builtIn) || other.builtIn == _this.builtIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EqualizerPreset;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.bands),_this.builtIn);
}

@override
String toString() {
  final _this = this as EqualizerPreset;
  return 'EqualizerPreset(id: ${_this.id}, name: ${_this.name}, bands: ${_this.bands}, builtIn: ${_this.builtIn})';
}


}

/// @nodoc
abstract mixin class $EqualizerPresetCopyWith<$Res>  {
  factory $EqualizerPresetCopyWith(EqualizerPreset value, $Res Function(EqualizerPreset) _then) = _$EqualizerPresetCopyWithImpl;
@useResult
$Res call({
 String id, String name, Map<EqualizerFrequency, double> bands, bool builtIn
});




}
/// @nodoc
class _$EqualizerPresetCopyWithImpl<$Res>
    implements $EqualizerPresetCopyWith<$Res> {
  _$EqualizerPresetCopyWithImpl(this._self, this._then);

  final EqualizerPreset _self;
  final $Res Function(EqualizerPreset) _then;

/// Create a copy of EqualizerPreset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bands = null,Object? builtIn = null,}) {
  return _then(EqualizerPreset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bands: null == bands ? _self.bands : bands // ignore: cast_nullable_to_non_nullable
as Map<EqualizerFrequency, double>,builtIn: null == builtIn ? _self.builtIn : builtIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EqualizerPreset].
extension EqualizerPresetPatterns on EqualizerPreset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EqualizerPreset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EqualizerPreset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EqualizerPreset value)  $default,){
final _that = this;
switch (_that) {
case _EqualizerPreset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EqualizerPreset value)?  $default,){
final _that = this;
switch (_that) {
case _EqualizerPreset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Map<EqualizerFrequency, double> bands,  bool builtIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EqualizerPreset() when $default != null:
return $default(_that.id,_that.name,_that.bands,_that.builtIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Map<EqualizerFrequency, double> bands,  bool builtIn)  $default,) {final _that = this;
switch (_that) {
case _EqualizerPreset():
return $default(_that.id,_that.name,_that.bands,_that.builtIn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Map<EqualizerFrequency, double> bands,  bool builtIn)?  $default,) {final _that = this;
switch (_that) {
case _EqualizerPreset() when $default != null:
return $default(_that.id,_that.name,_that.bands,_that.builtIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EqualizerPreset implements EqualizerPreset {
  const _EqualizerPreset({required this.id, required this.name,  Map<EqualizerFrequency, double> bands = const <EqualizerFrequency, double>{}, this.builtIn = false}): _bands = bands;
  factory _EqualizerPreset.fromJson(Map<String, dynamic> json) => _$EqualizerPresetFromJson(json);

@override final  String id;
@override final  String name;
 final  Map<EqualizerFrequency, double> _bands;
@override@JsonKey() Map<EqualizerFrequency, double> get bands {
  if (_bands is EqualUnmodifiableMapView) return _bands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bands);
}

@override@JsonKey() final  bool builtIn;

/// Create a copy of EqualizerPreset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EqualizerPresetCopyWith<_EqualizerPreset> get copyWith => __$EqualizerPresetCopyWithImpl<_EqualizerPreset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EqualizerPresetToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EqualizerPreset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.bands, _bands)&&(identical(other.builtIn, builtIn) || other.builtIn == builtIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_bands),builtIn);
}

@override
String toString() {
    return 'EqualizerPreset(id: $id, name: $name, bands: $bands, builtIn: $builtIn)';
}


}

/// @nodoc
abstract mixin class _$EqualizerPresetCopyWith<$Res> implements $EqualizerPresetCopyWith<$Res> {
  factory _$EqualizerPresetCopyWith(_EqualizerPreset value, $Res Function(_EqualizerPreset) _then) = __$EqualizerPresetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Map<EqualizerFrequency, double> bands, bool builtIn
});




}
/// @nodoc
class __$EqualizerPresetCopyWithImpl<$Res>
    implements _$EqualizerPresetCopyWith<$Res> {
  __$EqualizerPresetCopyWithImpl(this._self, this._then);

  final _EqualizerPreset _self;
  final $Res Function(_EqualizerPreset) _then;

/// Create a copy of EqualizerPreset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bands = null,Object? builtIn = null,}) {
  return _then(_EqualizerPreset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bands: null == bands ? _self._bands : bands // ignore: cast_nullable_to_non_nullable
as Map<EqualizerFrequency, double>,builtIn: null == builtIn ? _self.builtIn : builtIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$EqualizerDraft {

 String get presetId; EqualizerPreset? get preset; Map<EqualizerFrequency, double> get bands;
/// Create a copy of EqualizerDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EqualizerDraftCopyWith<EqualizerDraft> get copyWith => _$EqualizerDraftCopyWithImpl<EqualizerDraft>(this as EqualizerDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EqualizerDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EqualizerDraft&&(identical(other.presetId, _this.presetId) || other.presetId == _this.presetId)&&(identical(other.preset, _this.preset) || other.preset == _this.preset)&&const DeepCollectionEquality().equals(other.bands, _this.bands));
}


@override
int get hashCode {
  final _this = this as EqualizerDraft;
  return Object.hash(runtimeType,_this.presetId,_this.preset,const DeepCollectionEquality().hash(_this.bands));
}

@override
String toString() {
  final _this = this as EqualizerDraft;
  return 'EqualizerDraft(presetId: ${_this.presetId}, preset: ${_this.preset}, bands: ${_this.bands})';
}


}

/// @nodoc
abstract mixin class $EqualizerDraftCopyWith<$Res>  {
  factory $EqualizerDraftCopyWith(EqualizerDraft value, $Res Function(EqualizerDraft) _then) = _$EqualizerDraftCopyWithImpl;
@useResult
$Res call({
 String presetId, EqualizerPreset? preset, Map<EqualizerFrequency, double> bands
});


$EqualizerPresetCopyWith<$Res>? get preset;

}
/// @nodoc
class _$EqualizerDraftCopyWithImpl<$Res>
    implements $EqualizerDraftCopyWith<$Res> {
  _$EqualizerDraftCopyWithImpl(this._self, this._then);

  final EqualizerDraft _self;
  final $Res Function(EqualizerDraft) _then;

/// Create a copy of EqualizerDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? presetId = null,Object? preset = freezed,Object? bands = null,}) {
  return _then(EqualizerDraft(
presetId: null == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as String,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as EqualizerPreset?,bands: null == bands ? _self.bands : bands // ignore: cast_nullable_to_non_nullable
as Map<EqualizerFrequency, double>,
  ));
}
/// Create a copy of EqualizerDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EqualizerPresetCopyWith<$Res>? get preset {
    if (_self.preset == null) {
    return null;
  }

  return $EqualizerPresetCopyWith<$Res>(_self.preset!, (value) {
    return _then(_self.copyWith(preset: value));
  });
}
}


/// Adds pattern-matching-related methods to [EqualizerDraft].
extension EqualizerDraftPatterns on EqualizerDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EqualizerDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EqualizerDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EqualizerDraft value)  $default,){
final _that = this;
switch (_that) {
case _EqualizerDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EqualizerDraft value)?  $default,){
final _that = this;
switch (_that) {
case _EqualizerDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String presetId,  EqualizerPreset? preset,  Map<EqualizerFrequency, double> bands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EqualizerDraft() when $default != null:
return $default(_that.presetId,_that.preset,_that.bands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String presetId,  EqualizerPreset? preset,  Map<EqualizerFrequency, double> bands)  $default,) {final _that = this;
switch (_that) {
case _EqualizerDraft():
return $default(_that.presetId,_that.preset,_that.bands);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String presetId,  EqualizerPreset? preset,  Map<EqualizerFrequency, double> bands)?  $default,) {final _that = this;
switch (_that) {
case _EqualizerDraft() when $default != null:
return $default(_that.presetId,_that.preset,_that.bands);case _:
  return null;

}
}

}

/// @nodoc


class _EqualizerDraft extends EqualizerDraft {
  const _EqualizerDraft({required this.presetId, required this.preset,  Map<EqualizerFrequency, double> bands = const <EqualizerFrequency, double>{}}): _bands = bands,super._();
  

@override final  String presetId;
@override final  EqualizerPreset? preset;
 final  Map<EqualizerFrequency, double> _bands;
@override@JsonKey() Map<EqualizerFrequency, double> get bands {
  if (_bands is EqualUnmodifiableMapView) return _bands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bands);
}


/// Create a copy of EqualizerDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EqualizerDraftCopyWith<_EqualizerDraft> get copyWith => __$EqualizerDraftCopyWithImpl<_EqualizerDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EqualizerDraft&&(identical(other.presetId, presetId) || other.presetId == presetId)&&(identical(other.preset, preset) || other.preset == preset)&&const DeepCollectionEquality().equals(other.bands, _bands));
}


@override
int get hashCode {
    return Object.hash(runtimeType,presetId,preset,const DeepCollectionEquality().hash(_bands));
}

@override
String toString() {
    return 'EqualizerDraft(presetId: $presetId, preset: $preset, bands: $bands)';
}


}

/// @nodoc
abstract mixin class _$EqualizerDraftCopyWith<$Res> implements $EqualizerDraftCopyWith<$Res> {
  factory _$EqualizerDraftCopyWith(_EqualizerDraft value, $Res Function(_EqualizerDraft) _then) = __$EqualizerDraftCopyWithImpl;
@override @useResult
$Res call({
 String presetId, EqualizerPreset? preset, Map<EqualizerFrequency, double> bands
});


@override $EqualizerPresetCopyWith<$Res>? get preset;

}
/// @nodoc
class __$EqualizerDraftCopyWithImpl<$Res>
    implements _$EqualizerDraftCopyWith<$Res> {
  __$EqualizerDraftCopyWithImpl(this._self, this._then);

  final _EqualizerDraft _self;
  final $Res Function(_EqualizerDraft) _then;

/// Create a copy of EqualizerDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presetId = null,Object? preset = freezed,Object? bands = null,}) {
  return _then(_EqualizerDraft(
presetId: null == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as String,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as EqualizerPreset?,bands: null == bands ? _self._bands : bands // ignore: cast_nullable_to_non_nullable
as Map<EqualizerFrequency, double>,
  ));
}

/// Create a copy of EqualizerDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EqualizerPresetCopyWith<$Res>? get preset {
    if (_self.preset == null) {
    return null;
  }

  return $EqualizerPresetCopyWith<$Res>(_self.preset!, (value) {
    return _then(_self.copyWith(preset: value));
  });
}
}

// dart format on
