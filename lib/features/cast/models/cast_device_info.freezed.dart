// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CastDeviceInfo _$CastDeviceInfoFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'default':
          return GenericDeviceInfo.fromJson(
            json
          );
                case 'dlna':
          return DlnaDeviceInfo.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CastDeviceInfo',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CastDeviceInfo {

 String get id; String get name; String get subtitle;
/// Create a copy of CastDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CastDeviceInfoCopyWith<CastDeviceInfo> get copyWith => _$CastDeviceInfoCopyWithImpl<CastDeviceInfo>(this as CastDeviceInfo, _$identity);

  /// Serializes this CastDeviceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CastDeviceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,subtitle);

@override
String toString() {
  return 'CastDeviceInfo(id: $id, name: $name, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $CastDeviceInfoCopyWith<$Res>  {
  factory $CastDeviceInfoCopyWith(CastDeviceInfo value, $Res Function(CastDeviceInfo) _then) = _$CastDeviceInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String subtitle
});




}
/// @nodoc
class _$CastDeviceInfoCopyWithImpl<$Res>
    implements $CastDeviceInfoCopyWith<$Res> {
  _$CastDeviceInfoCopyWithImpl(this._self, this._then);

  final CastDeviceInfo _self;
  final $Res Function(CastDeviceInfo) _then;

/// Create a copy of CastDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? subtitle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CastDeviceInfo].
extension CastDeviceInfoPatterns on CastDeviceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( GenericDeviceInfo value)?  $default,{TResult Function( DlnaDeviceInfo value)?  dlna,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenericDeviceInfo() when $default != null:
return $default(_that);case DlnaDeviceInfo() when dlna != null:
return dlna(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( GenericDeviceInfo value)  $default,{required TResult Function( DlnaDeviceInfo value)  dlna,}){
final _that = this;
switch (_that) {
case GenericDeviceInfo():
return $default(_that);case DlnaDeviceInfo():
return dlna(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( GenericDeviceInfo value)?  $default,{TResult? Function( DlnaDeviceInfo value)?  dlna,}){
final _that = this;
switch (_that) {
case GenericDeviceInfo() when $default != null:
return $default(_that);case DlnaDeviceInfo() when dlna != null:
return dlna(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String subtitle)?  $default,{TResult Function( String id,  String name,  String subtitle)?  dlna,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenericDeviceInfo() when $default != null:
return $default(_that.id,_that.name,_that.subtitle);case DlnaDeviceInfo() when dlna != null:
return dlna(_that.id,_that.name,_that.subtitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String subtitle)  $default,{required TResult Function( String id,  String name,  String subtitle)  dlna,}) {final _that = this;
switch (_that) {
case GenericDeviceInfo():
return $default(_that.id,_that.name,_that.subtitle);case DlnaDeviceInfo():
return dlna(_that.id,_that.name,_that.subtitle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String subtitle)?  $default,{TResult? Function( String id,  String name,  String subtitle)?  dlna,}) {final _that = this;
switch (_that) {
case GenericDeviceInfo() when $default != null:
return $default(_that.id,_that.name,_that.subtitle);case DlnaDeviceInfo() when dlna != null:
return dlna(_that.id,_that.name,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GenericDeviceInfo extends CastDeviceInfo {
  const GenericDeviceInfo({required this.id, required this.name, required this.subtitle, final  String? $type}): $type = $type ?? 'default',super._();
  factory GenericDeviceInfo.fromJson(Map<String, dynamic> json) => _$GenericDeviceInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String subtitle;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CastDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericDeviceInfoCopyWith<GenericDeviceInfo> get copyWith => _$GenericDeviceInfoCopyWithImpl<GenericDeviceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenericDeviceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericDeviceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,subtitle);

@override
String toString() {
  return 'CastDeviceInfo(id: $id, name: $name, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $GenericDeviceInfoCopyWith<$Res> implements $CastDeviceInfoCopyWith<$Res> {
  factory $GenericDeviceInfoCopyWith(GenericDeviceInfo value, $Res Function(GenericDeviceInfo) _then) = _$GenericDeviceInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String subtitle
});




}
/// @nodoc
class _$GenericDeviceInfoCopyWithImpl<$Res>
    implements $GenericDeviceInfoCopyWith<$Res> {
  _$GenericDeviceInfoCopyWithImpl(this._self, this._then);

  final GenericDeviceInfo _self;
  final $Res Function(GenericDeviceInfo) _then;

/// Create a copy of CastDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? subtitle = null,}) {
  return _then(GenericDeviceInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DlnaDeviceInfo extends CastDeviceInfo {
  const DlnaDeviceInfo({required this.id, required this.name, required this.subtitle, final  String? $type}): $type = $type ?? 'dlna',super._();
  factory DlnaDeviceInfo.fromJson(Map<String, dynamic> json) => _$DlnaDeviceInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String subtitle;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CastDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DlnaDeviceInfoCopyWith<DlnaDeviceInfo> get copyWith => _$DlnaDeviceInfoCopyWithImpl<DlnaDeviceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DlnaDeviceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DlnaDeviceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,subtitle);

@override
String toString() {
  return 'CastDeviceInfo.dlna(id: $id, name: $name, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $DlnaDeviceInfoCopyWith<$Res> implements $CastDeviceInfoCopyWith<$Res> {
  factory $DlnaDeviceInfoCopyWith(DlnaDeviceInfo value, $Res Function(DlnaDeviceInfo) _then) = _$DlnaDeviceInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String subtitle
});




}
/// @nodoc
class _$DlnaDeviceInfoCopyWithImpl<$Res>
    implements $DlnaDeviceInfoCopyWith<$Res> {
  _$DlnaDeviceInfoCopyWithImpl(this._self, this._then);

  final DlnaDeviceInfo _self;
  final $Res Function(DlnaDeviceInfo) _then;

/// Create a copy of CastDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? subtitle = null,}) {
  return _then(DlnaDeviceInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
