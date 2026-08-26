// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_collection_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCollectionRequestParams {

 String get libraryId; String get name; List<String> get books;
/// Create a copy of CreateCollectionRequestParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCollectionRequestParamsCopyWith<CreateCollectionRequestParams> get copyWith => _$CreateCollectionRequestParamsCopyWithImpl<CreateCollectionRequestParams>(this as CreateCollectionRequestParams, _$identity);

  /// Serializes this CreateCollectionRequestParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCollectionRequestParams&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,name,const DeepCollectionEquality().hash(books));

@override
String toString() {
  return 'CreateCollectionRequestParams(libraryId: $libraryId, name: $name, books: $books)';
}


}

/// @nodoc
abstract mixin class $CreateCollectionRequestParamsCopyWith<$Res>  {
  factory $CreateCollectionRequestParamsCopyWith(CreateCollectionRequestParams value, $Res Function(CreateCollectionRequestParams) _then) = _$CreateCollectionRequestParamsCopyWithImpl;
@useResult
$Res call({
 String libraryId, String name, List<String> books
});




}
/// @nodoc
class _$CreateCollectionRequestParamsCopyWithImpl<$Res>
    implements $CreateCollectionRequestParamsCopyWith<$Res> {
  _$CreateCollectionRequestParamsCopyWithImpl(this._self, this._then);

  final CreateCollectionRequestParams _self;
  final $Res Function(CreateCollectionRequestParams) _then;

/// Create a copy of CreateCollectionRequestParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryId = null,Object? name = null,Object? books = null,}) {
  return _then(CreateCollectionRequestParams(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCollectionRequestParams].
extension CreateCollectionRequestParamsPatterns on CreateCollectionRequestParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCollectionRequestParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCollectionRequestParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCollectionRequestParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateCollectionRequestParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCollectionRequestParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCollectionRequestParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String libraryId,  String name,  List<String> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCollectionRequestParams() when $default != null:
return $default(_that.libraryId,_that.name,_that.books);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String libraryId,  String name,  List<String> books)  $default,) {final _that = this;
switch (_that) {
case _CreateCollectionRequestParams():
return $default(_that.libraryId,_that.name,_that.books);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String libraryId,  String name,  List<String> books)?  $default,) {final _that = this;
switch (_that) {
case _CreateCollectionRequestParams() when $default != null:
return $default(_that.libraryId,_that.name,_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCollectionRequestParams implements CreateCollectionRequestParams {
  const _CreateCollectionRequestParams({required this.libraryId, required this.name, required  List<String> books}): _books = books;
  factory _CreateCollectionRequestParams.fromJson(Map<String, dynamic> json) => _$CreateCollectionRequestParamsFromJson(json);

@override final  String libraryId;
@override final  String name;
 final  List<String> _books;
@override List<String> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of CreateCollectionRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCollectionRequestParamsCopyWith<_CreateCollectionRequestParams> get copyWith => __$CreateCollectionRequestParamsCopyWithImpl<_CreateCollectionRequestParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCollectionRequestParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCollectionRequestParams&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,name,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'CreateCollectionRequestParams(libraryId: $libraryId, name: $name, books: $books)';
}


}

/// @nodoc
abstract mixin class _$CreateCollectionRequestParamsCopyWith<$Res> implements $CreateCollectionRequestParamsCopyWith<$Res> {
  factory _$CreateCollectionRequestParamsCopyWith(_CreateCollectionRequestParams value, $Res Function(_CreateCollectionRequestParams) _then) = __$CreateCollectionRequestParamsCopyWithImpl;
@override @useResult
$Res call({
 String libraryId, String name, List<String> books
});




}
/// @nodoc
class __$CreateCollectionRequestParamsCopyWithImpl<$Res>
    implements _$CreateCollectionRequestParamsCopyWith<$Res> {
  __$CreateCollectionRequestParamsCopyWithImpl(this._self, this._then);

  final _CreateCollectionRequestParams _self;
  final $Res Function(_CreateCollectionRequestParams) _then;

/// Create a copy of CreateCollectionRequestParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryId = null,Object? name = null,Object? books = null,}) {
  return _then(_CreateCollectionRequestParams(
libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
