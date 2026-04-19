// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerStatusResponse {

 String? get app; String? get serverVersion; bool get isInit; String? get language; List<AuthMethod>? get authMethods;@JsonKey(name: 'ConfigPath') String? get configPath;@JsonKey(name: 'MetadataPath') String? get metadataPath; AuthFormData? get authFormData;
/// Create a copy of ServerStatusResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerStatusResponseCopyWith<ServerStatusResponse> get copyWith => _$ServerStatusResponseCopyWithImpl<ServerStatusResponse>(this as ServerStatusResponse, _$identity);

  /// Serializes this ServerStatusResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerStatusResponse&&(identical(other.app, app) || other.app == app)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.isInit, isInit) || other.isInit == isInit)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.authMethods, authMethods)&&(identical(other.configPath, configPath) || other.configPath == configPath)&&(identical(other.metadataPath, metadataPath) || other.metadataPath == metadataPath)&&(identical(other.authFormData, authFormData) || other.authFormData == authFormData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,serverVersion,isInit,language,const DeepCollectionEquality().hash(authMethods),configPath,metadataPath,authFormData);

@override
String toString() {
  return 'ServerStatusResponse(app: $app, serverVersion: $serverVersion, isInit: $isInit, language: $language, authMethods: $authMethods, configPath: $configPath, metadataPath: $metadataPath, authFormData: $authFormData)';
}


}

/// @nodoc
abstract mixin class $ServerStatusResponseCopyWith<$Res>  {
  factory $ServerStatusResponseCopyWith(ServerStatusResponse value, $Res Function(ServerStatusResponse) _then) = _$ServerStatusResponseCopyWithImpl;
@useResult
$Res call({
 String? app, String? serverVersion, bool isInit, String? language, List<AuthMethod>? authMethods,@JsonKey(name: 'ConfigPath') String? configPath,@JsonKey(name: 'MetadataPath') String? metadataPath, AuthFormData? authFormData
});


$AuthFormDataCopyWith<$Res>? get authFormData;

}
/// @nodoc
class _$ServerStatusResponseCopyWithImpl<$Res>
    implements $ServerStatusResponseCopyWith<$Res> {
  _$ServerStatusResponseCopyWithImpl(this._self, this._then);

  final ServerStatusResponse _self;
  final $Res Function(ServerStatusResponse) _then;

/// Create a copy of ServerStatusResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? app = freezed,Object? serverVersion = freezed,Object? isInit = null,Object? language = freezed,Object? authMethods = freezed,Object? configPath = freezed,Object? metadataPath = freezed,Object? authFormData = freezed,}) {
  return _then(_self.copyWith(
app: freezed == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as String?,serverVersion: freezed == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String?,isInit: null == isInit ? _self.isInit : isInit // ignore: cast_nullable_to_non_nullable
as bool,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,authMethods: freezed == authMethods ? _self.authMethods : authMethods // ignore: cast_nullable_to_non_nullable
as List<AuthMethod>?,configPath: freezed == configPath ? _self.configPath : configPath // ignore: cast_nullable_to_non_nullable
as String?,metadataPath: freezed == metadataPath ? _self.metadataPath : metadataPath // ignore: cast_nullable_to_non_nullable
as String?,authFormData: freezed == authFormData ? _self.authFormData : authFormData // ignore: cast_nullable_to_non_nullable
as AuthFormData?,
  ));
}
/// Create a copy of ServerStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFormDataCopyWith<$Res>? get authFormData {
    if (_self.authFormData == null) {
    return null;
  }

  return $AuthFormDataCopyWith<$Res>(_self.authFormData!, (value) {
    return _then(_self.copyWith(authFormData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServerStatusResponse].
extension ServerStatusResponsePatterns on ServerStatusResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerStatusResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerStatusResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerStatusResponse value)  $default,){
final _that = this;
switch (_that) {
case _ServerStatusResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerStatusResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ServerStatusResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? app,  String? serverVersion,  bool isInit,  String? language,  List<AuthMethod>? authMethods, @JsonKey(name: 'ConfigPath')  String? configPath, @JsonKey(name: 'MetadataPath')  String? metadataPath,  AuthFormData? authFormData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerStatusResponse() when $default != null:
return $default(_that.app,_that.serverVersion,_that.isInit,_that.language,_that.authMethods,_that.configPath,_that.metadataPath,_that.authFormData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? app,  String? serverVersion,  bool isInit,  String? language,  List<AuthMethod>? authMethods, @JsonKey(name: 'ConfigPath')  String? configPath, @JsonKey(name: 'MetadataPath')  String? metadataPath,  AuthFormData? authFormData)  $default,) {final _that = this;
switch (_that) {
case _ServerStatusResponse():
return $default(_that.app,_that.serverVersion,_that.isInit,_that.language,_that.authMethods,_that.configPath,_that.metadataPath,_that.authFormData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? app,  String? serverVersion,  bool isInit,  String? language,  List<AuthMethod>? authMethods, @JsonKey(name: 'ConfigPath')  String? configPath, @JsonKey(name: 'MetadataPath')  String? metadataPath,  AuthFormData? authFormData)?  $default,) {final _that = this;
switch (_that) {
case _ServerStatusResponse() when $default != null:
return $default(_that.app,_that.serverVersion,_that.isInit,_that.language,_that.authMethods,_that.configPath,_that.metadataPath,_that.authFormData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerStatusResponse implements ServerStatusResponse {
  const _ServerStatusResponse({this.app, this.serverVersion, required this.isInit, this.language, final  List<AuthMethod>? authMethods, @JsonKey(name: 'ConfigPath') this.configPath, @JsonKey(name: 'MetadataPath') this.metadataPath, this.authFormData}): _authMethods = authMethods;
  factory _ServerStatusResponse.fromJson(Map<String, dynamic> json) => _$ServerStatusResponseFromJson(json);

@override final  String? app;
@override final  String? serverVersion;
@override final  bool isInit;
@override final  String? language;
 final  List<AuthMethod>? _authMethods;
@override List<AuthMethod>? get authMethods {
  final value = _authMethods;
  if (value == null) return null;
  if (_authMethods is EqualUnmodifiableListView) return _authMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'ConfigPath') final  String? configPath;
@override@JsonKey(name: 'MetadataPath') final  String? metadataPath;
@override final  AuthFormData? authFormData;

/// Create a copy of ServerStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerStatusResponseCopyWith<_ServerStatusResponse> get copyWith => __$ServerStatusResponseCopyWithImpl<_ServerStatusResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerStatusResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerStatusResponse&&(identical(other.app, app) || other.app == app)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.isInit, isInit) || other.isInit == isInit)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._authMethods, _authMethods)&&(identical(other.configPath, configPath) || other.configPath == configPath)&&(identical(other.metadataPath, metadataPath) || other.metadataPath == metadataPath)&&(identical(other.authFormData, authFormData) || other.authFormData == authFormData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,serverVersion,isInit,language,const DeepCollectionEquality().hash(_authMethods),configPath,metadataPath,authFormData);

@override
String toString() {
  return 'ServerStatusResponse(app: $app, serverVersion: $serverVersion, isInit: $isInit, language: $language, authMethods: $authMethods, configPath: $configPath, metadataPath: $metadataPath, authFormData: $authFormData)';
}


}

/// @nodoc
abstract mixin class _$ServerStatusResponseCopyWith<$Res> implements $ServerStatusResponseCopyWith<$Res> {
  factory _$ServerStatusResponseCopyWith(_ServerStatusResponse value, $Res Function(_ServerStatusResponse) _then) = __$ServerStatusResponseCopyWithImpl;
@override @useResult
$Res call({
 String? app, String? serverVersion, bool isInit, String? language, List<AuthMethod>? authMethods,@JsonKey(name: 'ConfigPath') String? configPath,@JsonKey(name: 'MetadataPath') String? metadataPath, AuthFormData? authFormData
});


@override $AuthFormDataCopyWith<$Res>? get authFormData;

}
/// @nodoc
class __$ServerStatusResponseCopyWithImpl<$Res>
    implements _$ServerStatusResponseCopyWith<$Res> {
  __$ServerStatusResponseCopyWithImpl(this._self, this._then);

  final _ServerStatusResponse _self;
  final $Res Function(_ServerStatusResponse) _then;

/// Create a copy of ServerStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? app = freezed,Object? serverVersion = freezed,Object? isInit = null,Object? language = freezed,Object? authMethods = freezed,Object? configPath = freezed,Object? metadataPath = freezed,Object? authFormData = freezed,}) {
  return _then(_ServerStatusResponse(
app: freezed == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as String?,serverVersion: freezed == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String?,isInit: null == isInit ? _self.isInit : isInit // ignore: cast_nullable_to_non_nullable
as bool,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,authMethods: freezed == authMethods ? _self._authMethods : authMethods // ignore: cast_nullable_to_non_nullable
as List<AuthMethod>?,configPath: freezed == configPath ? _self.configPath : configPath // ignore: cast_nullable_to_non_nullable
as String?,metadataPath: freezed == metadataPath ? _self.metadataPath : metadataPath // ignore: cast_nullable_to_non_nullable
as String?,authFormData: freezed == authFormData ? _self.authFormData : authFormData // ignore: cast_nullable_to_non_nullable
as AuthFormData?,
  ));
}

/// Create a copy of ServerStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFormDataCopyWith<$Res>? get authFormData {
    if (_self.authFormData == null) {
    return null;
  }

  return $AuthFormDataCopyWith<$Res>(_self.authFormData!, (value) {
    return _then(_self.copyWith(authFormData: value));
  });
}
}


/// @nodoc
mixin _$AuthFormData {

 String? get authLoginCustomMessage; String? get authOpenIDButtonText; bool? get authOpenIDAutoLaunch;
/// Create a copy of AuthFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFormDataCopyWith<AuthFormData> get copyWith => _$AuthFormDataCopyWithImpl<AuthFormData>(this as AuthFormData, _$identity);

  /// Serializes this AuthFormData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFormData&&(identical(other.authLoginCustomMessage, authLoginCustomMessage) || other.authLoginCustomMessage == authLoginCustomMessage)&&(identical(other.authOpenIDButtonText, authOpenIDButtonText) || other.authOpenIDButtonText == authOpenIDButtonText)&&(identical(other.authOpenIDAutoLaunch, authOpenIDAutoLaunch) || other.authOpenIDAutoLaunch == authOpenIDAutoLaunch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authLoginCustomMessage,authOpenIDButtonText,authOpenIDAutoLaunch);

@override
String toString() {
  return 'AuthFormData(authLoginCustomMessage: $authLoginCustomMessage, authOpenIDButtonText: $authOpenIDButtonText, authOpenIDAutoLaunch: $authOpenIDAutoLaunch)';
}


}

/// @nodoc
abstract mixin class $AuthFormDataCopyWith<$Res>  {
  factory $AuthFormDataCopyWith(AuthFormData value, $Res Function(AuthFormData) _then) = _$AuthFormDataCopyWithImpl;
@useResult
$Res call({
 String? authLoginCustomMessage, String? authOpenIDButtonText, bool? authOpenIDAutoLaunch
});




}
/// @nodoc
class _$AuthFormDataCopyWithImpl<$Res>
    implements $AuthFormDataCopyWith<$Res> {
  _$AuthFormDataCopyWithImpl(this._self, this._then);

  final AuthFormData _self;
  final $Res Function(AuthFormData) _then;

/// Create a copy of AuthFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authLoginCustomMessage = freezed,Object? authOpenIDButtonText = freezed,Object? authOpenIDAutoLaunch = freezed,}) {
  return _then(_self.copyWith(
authLoginCustomMessage: freezed == authLoginCustomMessage ? _self.authLoginCustomMessage : authLoginCustomMessage // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDButtonText: freezed == authOpenIDButtonText ? _self.authOpenIDButtonText : authOpenIDButtonText // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDAutoLaunch: freezed == authOpenIDAutoLaunch ? _self.authOpenIDAutoLaunch : authOpenIDAutoLaunch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFormData].
extension AuthFormDataPatterns on AuthFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthFormData value)  $default,){
final _that = this;
switch (_that) {
case _AuthFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthFormData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? authLoginCustomMessage,  String? authOpenIDButtonText,  bool? authOpenIDAutoLaunch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFormData() when $default != null:
return $default(_that.authLoginCustomMessage,_that.authOpenIDButtonText,_that.authOpenIDAutoLaunch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? authLoginCustomMessage,  String? authOpenIDButtonText,  bool? authOpenIDAutoLaunch)  $default,) {final _that = this;
switch (_that) {
case _AuthFormData():
return $default(_that.authLoginCustomMessage,_that.authOpenIDButtonText,_that.authOpenIDAutoLaunch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? authLoginCustomMessage,  String? authOpenIDButtonText,  bool? authOpenIDAutoLaunch)?  $default,) {final _that = this;
switch (_that) {
case _AuthFormData() when $default != null:
return $default(_that.authLoginCustomMessage,_that.authOpenIDButtonText,_that.authOpenIDAutoLaunch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthFormData implements AuthFormData {
  const _AuthFormData({this.authLoginCustomMessage, this.authOpenIDButtonText, this.authOpenIDAutoLaunch});
  factory _AuthFormData.fromJson(Map<String, dynamic> json) => _$AuthFormDataFromJson(json);

@override final  String? authLoginCustomMessage;
@override final  String? authOpenIDButtonText;
@override final  bool? authOpenIDAutoLaunch;

/// Create a copy of AuthFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFormDataCopyWith<_AuthFormData> get copyWith => __$AuthFormDataCopyWithImpl<_AuthFormData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthFormDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFormData&&(identical(other.authLoginCustomMessage, authLoginCustomMessage) || other.authLoginCustomMessage == authLoginCustomMessage)&&(identical(other.authOpenIDButtonText, authOpenIDButtonText) || other.authOpenIDButtonText == authOpenIDButtonText)&&(identical(other.authOpenIDAutoLaunch, authOpenIDAutoLaunch) || other.authOpenIDAutoLaunch == authOpenIDAutoLaunch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authLoginCustomMessage,authOpenIDButtonText,authOpenIDAutoLaunch);

@override
String toString() {
  return 'AuthFormData(authLoginCustomMessage: $authLoginCustomMessage, authOpenIDButtonText: $authOpenIDButtonText, authOpenIDAutoLaunch: $authOpenIDAutoLaunch)';
}


}

/// @nodoc
abstract mixin class _$AuthFormDataCopyWith<$Res> implements $AuthFormDataCopyWith<$Res> {
  factory _$AuthFormDataCopyWith(_AuthFormData value, $Res Function(_AuthFormData) _then) = __$AuthFormDataCopyWithImpl;
@override @useResult
$Res call({
 String? authLoginCustomMessage, String? authOpenIDButtonText, bool? authOpenIDAutoLaunch
});




}
/// @nodoc
class __$AuthFormDataCopyWithImpl<$Res>
    implements _$AuthFormDataCopyWith<$Res> {
  __$AuthFormDataCopyWithImpl(this._self, this._then);

  final _AuthFormData _self;
  final $Res Function(_AuthFormData) _then;

/// Create a copy of AuthFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authLoginCustomMessage = freezed,Object? authOpenIDButtonText = freezed,Object? authOpenIDAutoLaunch = freezed,}) {
  return _then(_AuthFormData(
authLoginCustomMessage: freezed == authLoginCustomMessage ? _self.authLoginCustomMessage : authLoginCustomMessage // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDButtonText: freezed == authOpenIDButtonText ? _self.authOpenIDButtonText : authOpenIDButtonText // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDAutoLaunch: freezed == authOpenIDAutoLaunch ? _self.authOpenIDAutoLaunch : authOpenIDAutoLaunch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
