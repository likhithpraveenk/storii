// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_item_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchItemRequestParams {

 MetadataProvider get provider; String? get title; String? get author; bool get overrideDefaults; String? get isbn; String? get asin;
/// Create a copy of MatchItemRequestParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchItemRequestParamsCopyWith<MatchItemRequestParams> get copyWith => _$MatchItemRequestParamsCopyWithImpl<MatchItemRequestParams>(this as MatchItemRequestParams, _$identity);

  /// Serializes this MatchItemRequestParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchItemRequestParams&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.overrideDefaults, overrideDefaults) || other.overrideDefaults == overrideDefaults)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.asin, asin) || other.asin == asin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,title,author,overrideDefaults,isbn,asin);

@override
String toString() {
  return 'MatchItemRequestParams(provider: $provider, title: $title, author: $author, overrideDefaults: $overrideDefaults, isbn: $isbn, asin: $asin)';
}


}

/// @nodoc
abstract mixin class $MatchItemRequestParamsCopyWith<$Res>  {
  factory $MatchItemRequestParamsCopyWith(MatchItemRequestParams value, $Res Function(MatchItemRequestParams) _then) = _$MatchItemRequestParamsCopyWithImpl;
@useResult
$Res call({
 MetadataProvider provider, String? title, String? author, bool overrideDefaults, String? isbn, String? asin
});


$MetadataProviderCopyWith<$Res> get provider;

}
/// @nodoc
class _$MatchItemRequestParamsCopyWithImpl<$Res>
    implements $MatchItemRequestParamsCopyWith<$Res> {
  _$MatchItemRequestParamsCopyWithImpl(this._self, this._then);

  final MatchItemRequestParams _self;
  final $Res Function(MatchItemRequestParams) _then;

/// Create a copy of MatchItemRequestParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? title = freezed,Object? author = freezed,Object? overrideDefaults = null,Object? isbn = freezed,Object? asin = freezed,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as MetadataProvider,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,overrideDefaults: null == overrideDefaults ? _self.overrideDefaults : overrideDefaults // ignore: cast_nullable_to_non_nullable
as bool,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MatchItemRequestParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataProviderCopyWith<$Res> get provider {
  
  return $MetadataProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchItemRequestParams].
extension MatchItemRequestParamsPatterns on MatchItemRequestParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchItemRequestParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchItemRequestParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchItemRequestParams value)  $default,){
final _that = this;
switch (_that) {
case _MatchItemRequestParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchItemRequestParams value)?  $default,){
final _that = this;
switch (_that) {
case _MatchItemRequestParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetadataProvider provider,  String? title,  String? author,  bool overrideDefaults,  String? isbn,  String? asin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchItemRequestParams() when $default != null:
return $default(_that.provider,_that.title,_that.author,_that.overrideDefaults,_that.isbn,_that.asin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetadataProvider provider,  String? title,  String? author,  bool overrideDefaults,  String? isbn,  String? asin)  $default,) {final _that = this;
switch (_that) {
case _MatchItemRequestParams():
return $default(_that.provider,_that.title,_that.author,_that.overrideDefaults,_that.isbn,_that.asin);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetadataProvider provider,  String? title,  String? author,  bool overrideDefaults,  String? isbn,  String? asin)?  $default,) {final _that = this;
switch (_that) {
case _MatchItemRequestParams() when $default != null:
return $default(_that.provider,_that.title,_that.author,_that.overrideDefaults,_that.isbn,_that.asin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchItemRequestParams implements MatchItemRequestParams {
  const _MatchItemRequestParams({required this.provider, this.title, this.author, this.overrideDefaults = false, this.isbn, this.asin});
  factory _MatchItemRequestParams.fromJson(Map<String, dynamic> json) => _$MatchItemRequestParamsFromJson(json);

@override final  MetadataProvider provider;
@override final  String? title;
@override final  String? author;
@override@JsonKey() final  bool overrideDefaults;
@override final  String? isbn;
@override final  String? asin;

/// Create a copy of MatchItemRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchItemRequestParamsCopyWith<_MatchItemRequestParams> get copyWith => __$MatchItemRequestParamsCopyWithImpl<_MatchItemRequestParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchItemRequestParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchItemRequestParams&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.overrideDefaults, overrideDefaults) || other.overrideDefaults == overrideDefaults)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.asin, asin) || other.asin == asin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,title,author,overrideDefaults,isbn,asin);

@override
String toString() {
  return 'MatchItemRequestParams(provider: $provider, title: $title, author: $author, overrideDefaults: $overrideDefaults, isbn: $isbn, asin: $asin)';
}


}

/// @nodoc
abstract mixin class _$MatchItemRequestParamsCopyWith<$Res> implements $MatchItemRequestParamsCopyWith<$Res> {
  factory _$MatchItemRequestParamsCopyWith(_MatchItemRequestParams value, $Res Function(_MatchItemRequestParams) _then) = __$MatchItemRequestParamsCopyWithImpl;
@override @useResult
$Res call({
 MetadataProvider provider, String? title, String? author, bool overrideDefaults, String? isbn, String? asin
});


@override $MetadataProviderCopyWith<$Res> get provider;

}
/// @nodoc
class __$MatchItemRequestParamsCopyWithImpl<$Res>
    implements _$MatchItemRequestParamsCopyWith<$Res> {
  __$MatchItemRequestParamsCopyWithImpl(this._self, this._then);

  final _MatchItemRequestParams _self;
  final $Res Function(_MatchItemRequestParams) _then;

/// Create a copy of MatchItemRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? title = freezed,Object? author = freezed,Object? overrideDefaults = null,Object? isbn = freezed,Object? asin = freezed,}) {
  return _then(_MatchItemRequestParams(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as MetadataProvider,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,overrideDefaults: null == overrideDefaults ? _self.overrideDefaults : overrideDefaults // ignore: cast_nullable_to_non_nullable
as bool,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MatchItemRequestParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataProviderCopyWith<$Res> get provider {
  
  return $MetadataProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}

// dart format on
