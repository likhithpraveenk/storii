// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetadataProvider {

 String get value; String get text;
/// Create a copy of MetadataProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataProviderCopyWith<MetadataProvider> get copyWith => _$MetadataProviderCopyWithImpl<MetadataProvider>(this as MetadataProvider, _$identity);

  /// Serializes this MetadataProvider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataProvider&&(identical(other.value, value) || other.value == value)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,text);

@override
String toString() {
  return 'MetadataProvider(value: $value, text: $text)';
}


}

/// @nodoc
abstract mixin class $MetadataProviderCopyWith<$Res>  {
  factory $MetadataProviderCopyWith(MetadataProvider value, $Res Function(MetadataProvider) _then) = _$MetadataProviderCopyWithImpl;
@useResult
$Res call({
 String value, String text
});




}
/// @nodoc
class _$MetadataProviderCopyWithImpl<$Res>
    implements $MetadataProviderCopyWith<$Res> {
  _$MetadataProviderCopyWithImpl(this._self, this._then);

  final MetadataProvider _self;
  final $Res Function(MetadataProvider) _then;

/// Create a copy of MetadataProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? text = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataProvider].
extension MetadataProviderPatterns on MetadataProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataProvider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataProvider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataProvider value)  $default,){
final _that = this;
switch (_that) {
case _MetadataProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataProvider value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataProvider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataProvider() when $default != null:
return $default(_that.value,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String text)  $default,) {final _that = this;
switch (_that) {
case _MetadataProvider():
return $default(_that.value,_that.text);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String text)?  $default,) {final _that = this;
switch (_that) {
case _MetadataProvider() when $default != null:
return $default(_that.value,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataProvider implements MetadataProvider {
  const _MetadataProvider({required this.value, required this.text});
  factory _MetadataProvider.fromJson(Map<String, dynamic> json) => _$MetadataProviderFromJson(json);

@override final  String value;
@override final  String text;

/// Create a copy of MetadataProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataProviderCopyWith<_MetadataProvider> get copyWith => __$MetadataProviderCopyWithImpl<_MetadataProvider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataProvider&&(identical(other.value, value) || other.value == value)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,text);

@override
String toString() {
  return 'MetadataProvider(value: $value, text: $text)';
}


}

/// @nodoc
abstract mixin class _$MetadataProviderCopyWith<$Res> implements $MetadataProviderCopyWith<$Res> {
  factory _$MetadataProviderCopyWith(_MetadataProvider value, $Res Function(_MetadataProvider) _then) = __$MetadataProviderCopyWithImpl;
@override @useResult
$Res call({
 String value, String text
});




}
/// @nodoc
class __$MetadataProviderCopyWithImpl<$Res>
    implements _$MetadataProviderCopyWith<$Res> {
  __$MetadataProviderCopyWithImpl(this._self, this._then);

  final _MetadataProvider _self;
  final $Res Function(_MetadataProvider) _then;

/// Create a copy of MetadataProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? text = null,}) {
  return _then(_MetadataProvider(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
