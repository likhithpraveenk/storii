// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthorDomain {

 String get id; String get name; String get libraryId; String? get description; DateTime? get addedAt; DateTime? get updatedAt; int? get numBooks; List<Audiobook>? get books; List<SeriesDomain>? get series;
/// Create a copy of AuthorDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorDomainCopyWith<AuthorDomain> get copyWith => _$AuthorDomainCopyWithImpl<AuthorDomain>(this as AuthorDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks)&&const DeepCollectionEquality().equals(other.books, books)&&const DeepCollectionEquality().equals(other.series, series));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,description,addedAt,updatedAt,numBooks,const DeepCollectionEquality().hash(books),const DeepCollectionEquality().hash(series));

@override
String toString() {
  return 'AuthorDomain(id: $id, name: $name, libraryId: $libraryId, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, numBooks: $numBooks, books: $books, series: $series)';
}


}

/// @nodoc
abstract mixin class $AuthorDomainCopyWith<$Res>  {
  factory $AuthorDomainCopyWith(AuthorDomain value, $Res Function(AuthorDomain) _then) = _$AuthorDomainCopyWithImpl;
@useResult
$Res call({
 String id, String name, String libraryId, String? description, DateTime? addedAt, DateTime? updatedAt, int? numBooks, List<Audiobook>? books, List<SeriesDomain>? series
});




}
/// @nodoc
class _$AuthorDomainCopyWithImpl<$Res>
    implements $AuthorDomainCopyWith<$Res> {
  _$AuthorDomainCopyWithImpl(this._self, this._then);

  final AuthorDomain _self;
  final $Res Function(AuthorDomain) _then;

/// Create a copy of AuthorDomain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? libraryId = null,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? numBooks = freezed,Object? books = freezed,Object? series = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,books: freezed == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Audiobook>?,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<SeriesDomain>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorDomain].
extension AuthorDomainPatterns on AuthorDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorDomain value)  $default,){
final _that = this;
switch (_that) {
case _AuthorDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorDomain value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorDomain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String libraryId,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  int? numBooks,  List<Audiobook>? books,  List<SeriesDomain>? series)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorDomain() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.description,_that.addedAt,_that.updatedAt,_that.numBooks,_that.books,_that.series);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String libraryId,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  int? numBooks,  List<Audiobook>? books,  List<SeriesDomain>? series)  $default,) {final _that = this;
switch (_that) {
case _AuthorDomain():
return $default(_that.id,_that.name,_that.libraryId,_that.description,_that.addedAt,_that.updatedAt,_that.numBooks,_that.books,_that.series);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String libraryId,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  int? numBooks,  List<Audiobook>? books,  List<SeriesDomain>? series)?  $default,) {final _that = this;
switch (_that) {
case _AuthorDomain() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.description,_that.addedAt,_that.updatedAt,_that.numBooks,_that.books,_that.series);case _:
  return null;

}
}

}

/// @nodoc


class _AuthorDomain implements AuthorDomain {
  const _AuthorDomain({required this.id, required this.name, required this.libraryId, this.description, this.addedAt, this.updatedAt, this.numBooks, final  List<Audiobook>? books, final  List<SeriesDomain>? series}): _books = books,_series = series;
  

@override final  String id;
@override final  String name;
@override final  String libraryId;
@override final  String? description;
@override final  DateTime? addedAt;
@override final  DateTime? updatedAt;
@override final  int? numBooks;
 final  List<Audiobook>? _books;
@override List<Audiobook>? get books {
  final value = _books;
  if (value == null) return null;
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SeriesDomain>? _series;
@override List<SeriesDomain>? get series {
  final value = _series;
  if (value == null) return null;
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AuthorDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorDomainCopyWith<_AuthorDomain> get copyWith => __$AuthorDomainCopyWithImpl<_AuthorDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks)&&const DeepCollectionEquality().equals(other._books, _books)&&const DeepCollectionEquality().equals(other._series, _series));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,description,addedAt,updatedAt,numBooks,const DeepCollectionEquality().hash(_books),const DeepCollectionEquality().hash(_series));

@override
String toString() {
  return 'AuthorDomain(id: $id, name: $name, libraryId: $libraryId, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, numBooks: $numBooks, books: $books, series: $series)';
}


}

/// @nodoc
abstract mixin class _$AuthorDomainCopyWith<$Res> implements $AuthorDomainCopyWith<$Res> {
  factory _$AuthorDomainCopyWith(_AuthorDomain value, $Res Function(_AuthorDomain) _then) = __$AuthorDomainCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String libraryId, String? description, DateTime? addedAt, DateTime? updatedAt, int? numBooks, List<Audiobook>? books, List<SeriesDomain>? series
});




}
/// @nodoc
class __$AuthorDomainCopyWithImpl<$Res>
    implements _$AuthorDomainCopyWith<$Res> {
  __$AuthorDomainCopyWithImpl(this._self, this._then);

  final _AuthorDomain _self;
  final $Res Function(_AuthorDomain) _then;

/// Create a copy of AuthorDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? libraryId = null,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? numBooks = freezed,Object? books = freezed,Object? series = freezed,}) {
  return _then(_AuthorDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,books: freezed == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Audiobook>?,series: freezed == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<SeriesDomain>?,
  ));
}


}

// dart format on
