// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata_providers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetadataProvidersResponse {

 List<MetadataProvider> get books; List<MetadataProvider> get booksCovers; List<MetadataProvider> get podcasts;
/// Create a copy of MetadataProvidersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataProvidersResponseCopyWith<MetadataProvidersResponse> get copyWith => _$MetadataProvidersResponseCopyWithImpl<MetadataProvidersResponse>(this as MetadataProvidersResponse, _$identity);

  /// Serializes this MetadataProvidersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataProvidersResponse&&const DeepCollectionEquality().equals(other.books, books)&&const DeepCollectionEquality().equals(other.booksCovers, booksCovers)&&const DeepCollectionEquality().equals(other.podcasts, podcasts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(books),const DeepCollectionEquality().hash(booksCovers),const DeepCollectionEquality().hash(podcasts));

@override
String toString() {
  return 'MetadataProvidersResponse(books: $books, booksCovers: $booksCovers, podcasts: $podcasts)';
}


}

/// @nodoc
abstract mixin class $MetadataProvidersResponseCopyWith<$Res>  {
  factory $MetadataProvidersResponseCopyWith(MetadataProvidersResponse value, $Res Function(MetadataProvidersResponse) _then) = _$MetadataProvidersResponseCopyWithImpl;
@useResult
$Res call({
 List<MetadataProvider> books, List<MetadataProvider> booksCovers, List<MetadataProvider> podcasts
});




}
/// @nodoc
class _$MetadataProvidersResponseCopyWithImpl<$Res>
    implements $MetadataProvidersResponseCopyWith<$Res> {
  _$MetadataProvidersResponseCopyWithImpl(this._self, this._then);

  final MetadataProvidersResponse _self;
  final $Res Function(MetadataProvidersResponse) _then;

/// Create a copy of MetadataProvidersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? books = null,Object? booksCovers = null,Object? podcasts = null,}) {
  return _then(MetadataProvidersResponse(
books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<MetadataProvider>,booksCovers: null == booksCovers ? _self.booksCovers : booksCovers // ignore: cast_nullable_to_non_nullable
as List<MetadataProvider>,podcasts: null == podcasts ? _self.podcasts : podcasts // ignore: cast_nullable_to_non_nullable
as List<MetadataProvider>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataProvidersResponse].
extension MetadataProvidersResponsePatterns on MetadataProvidersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataProvidersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataProvidersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataProvidersResponse value)  $default,){
final _that = this;
switch (_that) {
case _MetadataProvidersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataProvidersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataProvidersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MetadataProvider> books,  List<MetadataProvider> booksCovers,  List<MetadataProvider> podcasts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataProvidersResponse() when $default != null:
return $default(_that.books,_that.booksCovers,_that.podcasts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MetadataProvider> books,  List<MetadataProvider> booksCovers,  List<MetadataProvider> podcasts)  $default,) {final _that = this;
switch (_that) {
case _MetadataProvidersResponse():
return $default(_that.books,_that.booksCovers,_that.podcasts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MetadataProvider> books,  List<MetadataProvider> booksCovers,  List<MetadataProvider> podcasts)?  $default,) {final _that = this;
switch (_that) {
case _MetadataProvidersResponse() when $default != null:
return $default(_that.books,_that.booksCovers,_that.podcasts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataProvidersResponse implements MetadataProvidersResponse {
  const _MetadataProvidersResponse({ List<MetadataProvider> books = const [],  List<MetadataProvider> booksCovers = const [],  List<MetadataProvider> podcasts = const []}): _books = books,_booksCovers = booksCovers,_podcasts = podcasts;
  factory _MetadataProvidersResponse.fromJson(Map<String, dynamic> json) => _$MetadataProvidersResponseFromJson(json);

 final  List<MetadataProvider> _books;
@override@JsonKey() List<MetadataProvider> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

 final  List<MetadataProvider> _booksCovers;
@override@JsonKey() List<MetadataProvider> get booksCovers {
  if (_booksCovers is EqualUnmodifiableListView) return _booksCovers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_booksCovers);
}

 final  List<MetadataProvider> _podcasts;
@override@JsonKey() List<MetadataProvider> get podcasts {
  if (_podcasts is EqualUnmodifiableListView) return _podcasts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_podcasts);
}


/// Create a copy of MetadataProvidersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataProvidersResponseCopyWith<_MetadataProvidersResponse> get copyWith => __$MetadataProvidersResponseCopyWithImpl<_MetadataProvidersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataProvidersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataProvidersResponse&&const DeepCollectionEquality().equals(other._books, _books)&&const DeepCollectionEquality().equals(other._booksCovers, _booksCovers)&&const DeepCollectionEquality().equals(other._podcasts, _podcasts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books),const DeepCollectionEquality().hash(_booksCovers),const DeepCollectionEquality().hash(_podcasts));

@override
String toString() {
  return 'MetadataProvidersResponse(books: $books, booksCovers: $booksCovers, podcasts: $podcasts)';
}


}

/// @nodoc
abstract mixin class _$MetadataProvidersResponseCopyWith<$Res> implements $MetadataProvidersResponseCopyWith<$Res> {
  factory _$MetadataProvidersResponseCopyWith(_MetadataProvidersResponse value, $Res Function(_MetadataProvidersResponse) _then) = __$MetadataProvidersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MetadataProvider> books, List<MetadataProvider> booksCovers, List<MetadataProvider> podcasts
});




}
/// @nodoc
class __$MetadataProvidersResponseCopyWithImpl<$Res>
    implements _$MetadataProvidersResponseCopyWith<$Res> {
  __$MetadataProvidersResponseCopyWithImpl(this._self, this._then);

  final _MetadataProvidersResponse _self;
  final $Res Function(_MetadataProvidersResponse) _then;

/// Create a copy of MetadataProvidersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? books = null,Object? booksCovers = null,Object? podcasts = null,}) {
  return _then(_MetadataProvidersResponse(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<MetadataProvider>,booksCovers: null == booksCovers ? _self._booksCovers : booksCovers // ignore: cast_nullable_to_non_nullable
as List<MetadataProvider>,podcasts: null == podcasts ? _self._podcasts : podcasts // ignore: cast_nullable_to_non_nullable
as List<MetadataProvider>,
  ));
}


}

// dart format on
