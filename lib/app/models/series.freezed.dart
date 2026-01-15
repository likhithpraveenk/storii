// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Series {

 String get id; String get name; String get libraryId; String? get nameIgnorePrefix; String? get description; DateTime? get addedAt; DateTime? get updatedAt; bool get isFinished; List<LibraryItem>? get books; List<String>? get libraryItemIdsFinished;
/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesCopyWith<Series> get copyWith => _$SeriesCopyWithImpl<Series>(this as Series, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Series&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&const DeepCollectionEquality().equals(other.books, books)&&const DeepCollectionEquality().equals(other.libraryItemIdsFinished, libraryItemIdsFinished));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,nameIgnorePrefix,description,addedAt,updatedAt,isFinished,const DeepCollectionEquality().hash(books),const DeepCollectionEquality().hash(libraryItemIdsFinished));

@override
String toString() {
  return 'Series(id: $id, name: $name, libraryId: $libraryId, nameIgnorePrefix: $nameIgnorePrefix, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, isFinished: $isFinished, books: $books, libraryItemIdsFinished: $libraryItemIdsFinished)';
}


}

/// @nodoc
abstract mixin class $SeriesCopyWith<$Res>  {
  factory $SeriesCopyWith(Series value, $Res Function(Series) _then) = _$SeriesCopyWithImpl;
@useResult
$Res call({
 String id, String name, String libraryId, String? nameIgnorePrefix, String? description, DateTime? addedAt, DateTime? updatedAt, bool isFinished, List<LibraryItem>? books, List<String>? libraryItemIdsFinished
});




}
/// @nodoc
class _$SeriesCopyWithImpl<$Res>
    implements $SeriesCopyWith<$Res> {
  _$SeriesCopyWithImpl(this._self, this._then);

  final Series _self;
  final $Res Function(Series) _then;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? libraryId = null,Object? nameIgnorePrefix = freezed,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isFinished = null,Object? books = freezed,Object? libraryItemIdsFinished = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: freezed == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,books: freezed == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>?,libraryItemIdsFinished: freezed == libraryItemIdsFinished ? _self.libraryItemIdsFinished : libraryItemIdsFinished // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Series].
extension SeriesPatterns on Series {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Series value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Series() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Series value)  $default,){
final _that = this;
switch (_that) {
case _Series():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Series value)?  $default,){
final _that = this;
switch (_that) {
case _Series() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  bool isFinished,  List<LibraryItem>? books,  List<String>? libraryItemIdsFinished)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Series() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.isFinished,_that.books,_that.libraryItemIdsFinished);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  bool isFinished,  List<LibraryItem>? books,  List<String>? libraryItemIdsFinished)  $default,) {final _that = this;
switch (_that) {
case _Series():
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.isFinished,_that.books,_that.libraryItemIdsFinished);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  bool isFinished,  List<LibraryItem>? books,  List<String>? libraryItemIdsFinished)?  $default,) {final _that = this;
switch (_that) {
case _Series() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.isFinished,_that.books,_that.libraryItemIdsFinished);case _:
  return null;

}
}

}

/// @nodoc


class _Series implements Series {
  const _Series({required this.id, required this.name, required this.libraryId, this.nameIgnorePrefix, this.description, this.addedAt, this.updatedAt, this.isFinished = false, final  List<LibraryItem>? books, final  List<String>? libraryItemIdsFinished}): _books = books,_libraryItemIdsFinished = libraryItemIdsFinished;
  

@override final  String id;
@override final  String name;
@override final  String libraryId;
@override final  String? nameIgnorePrefix;
@override final  String? description;
@override final  DateTime? addedAt;
@override final  DateTime? updatedAt;
@override@JsonKey() final  bool isFinished;
 final  List<LibraryItem>? _books;
@override List<LibraryItem>? get books {
  final value = _books;
  if (value == null) return null;
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _libraryItemIdsFinished;
@override List<String>? get libraryItemIdsFinished {
  final value = _libraryItemIdsFinished;
  if (value == null) return null;
  if (_libraryItemIdsFinished is EqualUnmodifiableListView) return _libraryItemIdsFinished;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesCopyWith<_Series> get copyWith => __$SeriesCopyWithImpl<_Series>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Series&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&const DeepCollectionEquality().equals(other._books, _books)&&const DeepCollectionEquality().equals(other._libraryItemIdsFinished, _libraryItemIdsFinished));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,nameIgnorePrefix,description,addedAt,updatedAt,isFinished,const DeepCollectionEquality().hash(_books),const DeepCollectionEquality().hash(_libraryItemIdsFinished));

@override
String toString() {
  return 'Series(id: $id, name: $name, libraryId: $libraryId, nameIgnorePrefix: $nameIgnorePrefix, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, isFinished: $isFinished, books: $books, libraryItemIdsFinished: $libraryItemIdsFinished)';
}


}

/// @nodoc
abstract mixin class _$SeriesCopyWith<$Res> implements $SeriesCopyWith<$Res> {
  factory _$SeriesCopyWith(_Series value, $Res Function(_Series) _then) = __$SeriesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String libraryId, String? nameIgnorePrefix, String? description, DateTime? addedAt, DateTime? updatedAt, bool isFinished, List<LibraryItem>? books, List<String>? libraryItemIdsFinished
});




}
/// @nodoc
class __$SeriesCopyWithImpl<$Res>
    implements _$SeriesCopyWith<$Res> {
  __$SeriesCopyWithImpl(this._self, this._then);

  final _Series _self;
  final $Res Function(_Series) _then;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? libraryId = null,Object? nameIgnorePrefix = freezed,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isFinished = null,Object? books = freezed,Object? libraryItemIdsFinished = freezed,}) {
  return _then(_Series(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: freezed == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,books: freezed == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>?,libraryItemIdsFinished: freezed == libraryItemIdsFinished ? _self._libraryItemIdsFinished : libraryItemIdsFinished // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
