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
mixin _$Author {

 String get id; String get name; String? get lastFirst; String? get libraryId; String? get asin; String? get description; String? get imagePath; DateTime? get addedAt; DateTime? get updatedAt; int? get numBooks; List<LibraryItem>? get libraryItems; List<Series>? get series;
/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorCopyWith<Author> get copyWith => _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Author&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastFirst, lastFirst) || other.lastFirst == lastFirst)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks)&&const DeepCollectionEquality().equals(other.libraryItems, libraryItems)&&const DeepCollectionEquality().equals(other.series, series));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,lastFirst,libraryId,asin,description,imagePath,addedAt,updatedAt,numBooks,const DeepCollectionEquality().hash(libraryItems),const DeepCollectionEquality().hash(series));

@override
String toString() {
  return 'Author(id: $id, name: $name, lastFirst: $lastFirst, libraryId: $libraryId, asin: $asin, description: $description, imagePath: $imagePath, addedAt: $addedAt, updatedAt: $updatedAt, numBooks: $numBooks, libraryItems: $libraryItems, series: $series)';
}


}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res>  {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) = _$AuthorCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? lastFirst, String? libraryId, String? asin, String? description, String? imagePath, DateTime? addedAt, DateTime? updatedAt, int? numBooks, List<LibraryItem>? libraryItems, List<Series>? series
});




}
/// @nodoc
class _$AuthorCopyWithImpl<$Res>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? lastFirst = freezed,Object? libraryId = freezed,Object? asin = freezed,Object? description = freezed,Object? imagePath = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? numBooks = freezed,Object? libraryItems = freezed,Object? series = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastFirst: freezed == lastFirst ? _self.lastFirst : lastFirst // ignore: cast_nullable_to_non_nullable
as String?,libraryId: freezed == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,libraryItems: freezed == libraryItems ? _self.libraryItems : libraryItems // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>?,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<Series>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Author].
extension AuthorPatterns on Author {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Author value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Author() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Author value)  $default,){
final _that = this;
switch (_that) {
case _Author():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Author value)?  $default,){
final _that = this;
switch (_that) {
case _Author() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? lastFirst,  String? libraryId,  String? asin,  String? description,  String? imagePath,  DateTime? addedAt,  DateTime? updatedAt,  int? numBooks,  List<LibraryItem>? libraryItems,  List<Series>? series)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.id,_that.name,_that.lastFirst,_that.libraryId,_that.asin,_that.description,_that.imagePath,_that.addedAt,_that.updatedAt,_that.numBooks,_that.libraryItems,_that.series);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? lastFirst,  String? libraryId,  String? asin,  String? description,  String? imagePath,  DateTime? addedAt,  DateTime? updatedAt,  int? numBooks,  List<LibraryItem>? libraryItems,  List<Series>? series)  $default,) {final _that = this;
switch (_that) {
case _Author():
return $default(_that.id,_that.name,_that.lastFirst,_that.libraryId,_that.asin,_that.description,_that.imagePath,_that.addedAt,_that.updatedAt,_that.numBooks,_that.libraryItems,_that.series);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? lastFirst,  String? libraryId,  String? asin,  String? description,  String? imagePath,  DateTime? addedAt,  DateTime? updatedAt,  int? numBooks,  List<LibraryItem>? libraryItems,  List<Series>? series)?  $default,) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.id,_that.name,_that.lastFirst,_that.libraryId,_that.asin,_that.description,_that.imagePath,_that.addedAt,_that.updatedAt,_that.numBooks,_that.libraryItems,_that.series);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _Author implements Author {
  const _Author({required this.id, required this.name, this.lastFirst, this.libraryId, this.asin, this.description, this.imagePath, this.addedAt, this.updatedAt, this.numBooks, final  List<LibraryItem>? libraryItems, final  List<Series>? series}): _libraryItems = libraryItems,_series = series;
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? lastFirst;
@override final  String? libraryId;
@override final  String? asin;
@override final  String? description;
@override final  String? imagePath;
@override final  DateTime? addedAt;
@override final  DateTime? updatedAt;
@override final  int? numBooks;
 final  List<LibraryItem>? _libraryItems;
@override List<LibraryItem>? get libraryItems {
  final value = _libraryItems;
  if (value == null) return null;
  if (_libraryItems is EqualUnmodifiableListView) return _libraryItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Series>? _series;
@override List<Series>? get series {
  final value = _series;
  if (value == null) return null;
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorCopyWith<_Author> get copyWith => __$AuthorCopyWithImpl<_Author>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Author&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastFirst, lastFirst) || other.lastFirst == lastFirst)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks)&&const DeepCollectionEquality().equals(other._libraryItems, _libraryItems)&&const DeepCollectionEquality().equals(other._series, _series));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,lastFirst,libraryId,asin,description,imagePath,addedAt,updatedAt,numBooks,const DeepCollectionEquality().hash(_libraryItems),const DeepCollectionEquality().hash(_series));

@override
String toString() {
  return 'Author(id: $id, name: $name, lastFirst: $lastFirst, libraryId: $libraryId, asin: $asin, description: $description, imagePath: $imagePath, addedAt: $addedAt, updatedAt: $updatedAt, numBooks: $numBooks, libraryItems: $libraryItems, series: $series)';
}


}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) = __$AuthorCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? lastFirst, String? libraryId, String? asin, String? description, String? imagePath, DateTime? addedAt, DateTime? updatedAt, int? numBooks, List<LibraryItem>? libraryItems, List<Series>? series
});




}
/// @nodoc
class __$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? lastFirst = freezed,Object? libraryId = freezed,Object? asin = freezed,Object? description = freezed,Object? imagePath = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? numBooks = freezed,Object? libraryItems = freezed,Object? series = freezed,}) {
  return _then(_Author(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastFirst: freezed == lastFirst ? _self.lastFirst : lastFirst // ignore: cast_nullable_to_non_nullable
as String?,libraryId: freezed == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,libraryItems: freezed == libraryItems ? _self._libraryItems : libraryItems // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>?,series: freezed == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<Series>?,
  ));
}


}

// dart format on
