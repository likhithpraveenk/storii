// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceInfo {

 String? get id; String? get userId; String? get deviceId; String? get ipAddress; String? get browserName; String? get browserVersion; String? get osName; String? get osVersion; String? get deviceType; String? get manufacturer; String? get model; String? get sdkVersion; String? get clientName; String? get deviceName; String? get clientVersion;
/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoCopyWith<DeviceInfo> get copyWith => _$DeviceInfoCopyWithImpl<DeviceInfo>(this as DeviceInfo, _$identity);

  /// Serializes this DeviceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.browserName, browserName) || other.browserName == browserName)&&(identical(other.browserVersion, browserVersion) || other.browserVersion == browserVersion)&&(identical(other.osName, osName) || other.osName == osName)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.model, model) || other.model == model)&&(identical(other.sdkVersion, sdkVersion) || other.sdkVersion == sdkVersion)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.clientVersion, clientVersion) || other.clientVersion == clientVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,deviceId,ipAddress,browserName,browserVersion,osName,osVersion,deviceType,manufacturer,model,sdkVersion,clientName,deviceName,clientVersion);

@override
String toString() {
  return 'DeviceInfo(id: $id, userId: $userId, deviceId: $deviceId, ipAddress: $ipAddress, browserName: $browserName, browserVersion: $browserVersion, osName: $osName, osVersion: $osVersion, deviceType: $deviceType, manufacturer: $manufacturer, model: $model, sdkVersion: $sdkVersion, clientName: $clientName, deviceName: $deviceName, clientVersion: $clientVersion)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoCopyWith<$Res>  {
  factory $DeviceInfoCopyWith(DeviceInfo value, $Res Function(DeviceInfo) _then) = _$DeviceInfoCopyWithImpl;
@useResult
$Res call({
 String? id, String? userId, String? deviceId, String? ipAddress, String? browserName, String? browserVersion, String? osName, String? osVersion, String? deviceType, String? manufacturer, String? model, String? sdkVersion, String? clientName, String? deviceName, String? clientVersion
});




}
/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._self, this._then);

  final DeviceInfo _self;
  final $Res Function(DeviceInfo) _then;

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? deviceId = freezed,Object? ipAddress = freezed,Object? browserName = freezed,Object? browserVersion = freezed,Object? osName = freezed,Object? osVersion = freezed,Object? deviceType = freezed,Object? manufacturer = freezed,Object? model = freezed,Object? sdkVersion = freezed,Object? clientName = freezed,Object? deviceName = freezed,Object? clientVersion = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,browserName: freezed == browserName ? _self.browserName : browserName // ignore: cast_nullable_to_non_nullable
as String?,browserVersion: freezed == browserVersion ? _self.browserVersion : browserVersion // ignore: cast_nullable_to_non_nullable
as String?,osName: freezed == osName ? _self.osName : osName // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,sdkVersion: freezed == sdkVersion ? _self.sdkVersion : sdkVersion // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,clientVersion: freezed == clientVersion ? _self.clientVersion : clientVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceInfo].
extension DeviceInfoPatterns on DeviceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceInfo value)  $default,){
final _that = this;
switch (_that) {
case _DeviceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? userId,  String? deviceId,  String? ipAddress,  String? browserName,  String? browserVersion,  String? osName,  String? osVersion,  String? deviceType,  String? manufacturer,  String? model,  String? sdkVersion,  String? clientName,  String? deviceName,  String? clientVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.ipAddress,_that.browserName,_that.browserVersion,_that.osName,_that.osVersion,_that.deviceType,_that.manufacturer,_that.model,_that.sdkVersion,_that.clientName,_that.deviceName,_that.clientVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? userId,  String? deviceId,  String? ipAddress,  String? browserName,  String? browserVersion,  String? osName,  String? osVersion,  String? deviceType,  String? manufacturer,  String? model,  String? sdkVersion,  String? clientName,  String? deviceName,  String? clientVersion)  $default,) {final _that = this;
switch (_that) {
case _DeviceInfo():
return $default(_that.id,_that.userId,_that.deviceId,_that.ipAddress,_that.browserName,_that.browserVersion,_that.osName,_that.osVersion,_that.deviceType,_that.manufacturer,_that.model,_that.sdkVersion,_that.clientName,_that.deviceName,_that.clientVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? userId,  String? deviceId,  String? ipAddress,  String? browserName,  String? browserVersion,  String? osName,  String? osVersion,  String? deviceType,  String? manufacturer,  String? model,  String? sdkVersion,  String? clientName,  String? deviceName,  String? clientVersion)?  $default,) {final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.ipAddress,_that.browserName,_that.browserVersion,_that.osName,_that.osVersion,_that.deviceType,_that.manufacturer,_that.model,_that.sdkVersion,_that.clientName,_that.deviceName,_that.clientVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceInfo implements DeviceInfo {
  const _DeviceInfo({this.id, this.userId, this.deviceId, this.ipAddress, this.browserName, this.browserVersion, this.osName, this.osVersion, this.deviceType, this.manufacturer, this.model, this.sdkVersion, this.clientName, this.deviceName, this.clientVersion});
  factory _DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);

@override final  String? id;
@override final  String? userId;
@override final  String? deviceId;
@override final  String? ipAddress;
@override final  String? browserName;
@override final  String? browserVersion;
@override final  String? osName;
@override final  String? osVersion;
@override final  String? deviceType;
@override final  String? manufacturer;
@override final  String? model;
@override final  String? sdkVersion;
@override final  String? clientName;
@override final  String? deviceName;
@override final  String? clientVersion;

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceInfoCopyWith<_DeviceInfo> get copyWith => __$DeviceInfoCopyWithImpl<_DeviceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.browserName, browserName) || other.browserName == browserName)&&(identical(other.browserVersion, browserVersion) || other.browserVersion == browserVersion)&&(identical(other.osName, osName) || other.osName == osName)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.model, model) || other.model == model)&&(identical(other.sdkVersion, sdkVersion) || other.sdkVersion == sdkVersion)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.clientVersion, clientVersion) || other.clientVersion == clientVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,deviceId,ipAddress,browserName,browserVersion,osName,osVersion,deviceType,manufacturer,model,sdkVersion,clientName,deviceName,clientVersion);

@override
String toString() {
  return 'DeviceInfo(id: $id, userId: $userId, deviceId: $deviceId, ipAddress: $ipAddress, browserName: $browserName, browserVersion: $browserVersion, osName: $osName, osVersion: $osVersion, deviceType: $deviceType, manufacturer: $manufacturer, model: $model, sdkVersion: $sdkVersion, clientName: $clientName, deviceName: $deviceName, clientVersion: $clientVersion)';
}


}

/// @nodoc
abstract mixin class _$DeviceInfoCopyWith<$Res> implements $DeviceInfoCopyWith<$Res> {
  factory _$DeviceInfoCopyWith(_DeviceInfo value, $Res Function(_DeviceInfo) _then) = __$DeviceInfoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? userId, String? deviceId, String? ipAddress, String? browserName, String? browserVersion, String? osName, String? osVersion, String? deviceType, String? manufacturer, String? model, String? sdkVersion, String? clientName, String? deviceName, String? clientVersion
});




}
/// @nodoc
class __$DeviceInfoCopyWithImpl<$Res>
    implements _$DeviceInfoCopyWith<$Res> {
  __$DeviceInfoCopyWithImpl(this._self, this._then);

  final _DeviceInfo _self;
  final $Res Function(_DeviceInfo) _then;

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? deviceId = freezed,Object? ipAddress = freezed,Object? browserName = freezed,Object? browserVersion = freezed,Object? osName = freezed,Object? osVersion = freezed,Object? deviceType = freezed,Object? manufacturer = freezed,Object? model = freezed,Object? sdkVersion = freezed,Object? clientName = freezed,Object? deviceName = freezed,Object? clientVersion = freezed,}) {
  return _then(_DeviceInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,browserName: freezed == browserName ? _self.browserName : browserName // ignore: cast_nullable_to_non_nullable
as String?,browserVersion: freezed == browserVersion ? _self.browserVersion : browserVersion // ignore: cast_nullable_to_non_nullable
as String?,osName: freezed == osName ? _self.osName : osName // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,sdkVersion: freezed == sdkVersion ? _self.sdkVersion : sdkVersion // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,clientVersion: freezed == clientVersion ? _self.clientVersion : clientVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
