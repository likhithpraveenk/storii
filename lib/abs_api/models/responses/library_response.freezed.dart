// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryResponse {

@JsonKey(name: 'filterdata') LibraryFilterData get filterData; int get issues; int get numUserPlaylists; Library get library;
/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryResponseCopyWith<LibraryResponse> get copyWith => _$LibraryResponseCopyWithImpl<LibraryResponse>(this as LibraryResponse, _$identity);

  /// Serializes this LibraryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryResponse&&(identical(other.filterData, filterData) || other.filterData == filterData)&&(identical(other.issues, issues) || other.issues == issues)&&(identical(other.numUserPlaylists, numUserPlaylists) || other.numUserPlaylists == numUserPlaylists)&&(identical(other.library, library) || other.library == library));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filterData,issues,numUserPlaylists,library);

@override
String toString() {
  return 'LibraryResponse(filterData: $filterData, issues: $issues, numUserPlaylists: $numUserPlaylists, library: $library)';
}


}

/// @nodoc
abstract mixin class $LibraryResponseCopyWith<$Res>  {
  factory $LibraryResponseCopyWith(LibraryResponse value, $Res Function(LibraryResponse) _then) = _$LibraryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'filterdata') LibraryFilterData filterData, int issues, int numUserPlaylists, Library library
});


$LibraryFilterDataCopyWith<$Res> get filterData;$LibraryCopyWith<$Res> get library;

}
/// @nodoc
class _$LibraryResponseCopyWithImpl<$Res>
    implements $LibraryResponseCopyWith<$Res> {
  _$LibraryResponseCopyWithImpl(this._self, this._then);

  final LibraryResponse _self;
  final $Res Function(LibraryResponse) _then;

/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filterData = null,Object? issues = null,Object? numUserPlaylists = null,Object? library = null,}) {
  return _then(_self.copyWith(
filterData: null == filterData ? _self.filterData : filterData // ignore: cast_nullable_to_non_nullable
as LibraryFilterData,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as int,numUserPlaylists: null == numUserPlaylists ? _self.numUserPlaylists : numUserPlaylists // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as Library,
  ));
}
/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryFilterDataCopyWith<$Res> get filterData {
  
  return $LibraryFilterDataCopyWith<$Res>(_self.filterData, (value) {
    return _then(_self.copyWith(filterData: value));
  });
}/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryCopyWith<$Res> get library {
  
  return $LibraryCopyWith<$Res>(_self.library, (value) {
    return _then(_self.copyWith(library: value));
  });
}
}


/// Adds pattern-matching-related methods to [LibraryResponse].
extension LibraryResponsePatterns on LibraryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryResponse value)  $default,){
final _that = this;
switch (_that) {
case _LibraryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'filterdata')  LibraryFilterData filterData,  int issues,  int numUserPlaylists,  Library library)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryResponse() when $default != null:
return $default(_that.filterData,_that.issues,_that.numUserPlaylists,_that.library);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'filterdata')  LibraryFilterData filterData,  int issues,  int numUserPlaylists,  Library library)  $default,) {final _that = this;
switch (_that) {
case _LibraryResponse():
return $default(_that.filterData,_that.issues,_that.numUserPlaylists,_that.library);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'filterdata')  LibraryFilterData filterData,  int issues,  int numUserPlaylists,  Library library)?  $default,) {final _that = this;
switch (_that) {
case _LibraryResponse() when $default != null:
return $default(_that.filterData,_that.issues,_that.numUserPlaylists,_that.library);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryResponse implements LibraryResponse {
  const _LibraryResponse({@JsonKey(name: 'filterdata') required this.filterData, required this.issues, required this.numUserPlaylists, required this.library});
  factory _LibraryResponse.fromJson(Map<String, dynamic> json) => _$LibraryResponseFromJson(json);

@override@JsonKey(name: 'filterdata') final  LibraryFilterData filterData;
@override final  int issues;
@override final  int numUserPlaylists;
@override final  Library library;

/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryResponseCopyWith<_LibraryResponse> get copyWith => __$LibraryResponseCopyWithImpl<_LibraryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryResponse&&(identical(other.filterData, filterData) || other.filterData == filterData)&&(identical(other.issues, issues) || other.issues == issues)&&(identical(other.numUserPlaylists, numUserPlaylists) || other.numUserPlaylists == numUserPlaylists)&&(identical(other.library, library) || other.library == library));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filterData,issues,numUserPlaylists,library);

@override
String toString() {
  return 'LibraryResponse(filterData: $filterData, issues: $issues, numUserPlaylists: $numUserPlaylists, library: $library)';
}


}

/// @nodoc
abstract mixin class _$LibraryResponseCopyWith<$Res> implements $LibraryResponseCopyWith<$Res> {
  factory _$LibraryResponseCopyWith(_LibraryResponse value, $Res Function(_LibraryResponse) _then) = __$LibraryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'filterdata') LibraryFilterData filterData, int issues, int numUserPlaylists, Library library
});


@override $LibraryFilterDataCopyWith<$Res> get filterData;@override $LibraryCopyWith<$Res> get library;

}
/// @nodoc
class __$LibraryResponseCopyWithImpl<$Res>
    implements _$LibraryResponseCopyWith<$Res> {
  __$LibraryResponseCopyWithImpl(this._self, this._then);

  final _LibraryResponse _self;
  final $Res Function(_LibraryResponse) _then;

/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filterData = null,Object? issues = null,Object? numUserPlaylists = null,Object? library = null,}) {
  return _then(_LibraryResponse(
filterData: null == filterData ? _self.filterData : filterData // ignore: cast_nullable_to_non_nullable
as LibraryFilterData,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as int,numUserPlaylists: null == numUserPlaylists ? _self.numUserPlaylists : numUserPlaylists // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as Library,
  ));
}

/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryFilterDataCopyWith<$Res> get filterData {
  
  return $LibraryFilterDataCopyWith<$Res>(_self.filterData, (value) {
    return _then(_self.copyWith(filterData: value));
  });
}/// Create a copy of LibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryCopyWith<$Res> get library {
  
  return $LibraryCopyWith<$Res>(_self.library, (value) {
    return _then(_self.copyWith(library: value));
  });
}
}

// dart format on
