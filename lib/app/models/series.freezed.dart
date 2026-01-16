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
mixin _$SeriesDomain {

 String get id; String get name; String get libraryId; String? get nameIgnorePrefix; String? get description; DateTime? get addedAt; DateTime? get updatedAt; bool get isFinished; List<ItemDomain>? get books; List<String>? get libraryItemIdsFinished;
/// Create a copy of SeriesDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesDomainCopyWith<SeriesDomain> get copyWith => _$SeriesDomainCopyWithImpl<SeriesDomain>(this as SeriesDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&const DeepCollectionEquality().equals(other.books, books)&&const DeepCollectionEquality().equals(other.libraryItemIdsFinished, libraryItemIdsFinished));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,nameIgnorePrefix,description,addedAt,updatedAt,isFinished,const DeepCollectionEquality().hash(books),const DeepCollectionEquality().hash(libraryItemIdsFinished));

@override
String toString() {
  return 'SeriesDomain(id: $id, name: $name, libraryId: $libraryId, nameIgnorePrefix: $nameIgnorePrefix, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, isFinished: $isFinished, books: $books, libraryItemIdsFinished: $libraryItemIdsFinished)';
}


}

/// @nodoc
abstract mixin class $SeriesDomainCopyWith<$Res>  {
  factory $SeriesDomainCopyWith(SeriesDomain value, $Res Function(SeriesDomain) _then) = _$SeriesDomainCopyWithImpl;
@useResult
$Res call({
 String id, String name, String libraryId, String? nameIgnorePrefix, String? description, DateTime? addedAt, DateTime? updatedAt, bool isFinished, List<ItemDomain>? books, List<String>? libraryItemIdsFinished
});




}
/// @nodoc
class _$SeriesDomainCopyWithImpl<$Res>
    implements $SeriesDomainCopyWith<$Res> {
  _$SeriesDomainCopyWithImpl(this._self, this._then);

  final SeriesDomain _self;
  final $Res Function(SeriesDomain) _then;

/// Create a copy of SeriesDomain
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
as List<ItemDomain>?,libraryItemIdsFinished: freezed == libraryItemIdsFinished ? _self.libraryItemIdsFinished : libraryItemIdsFinished // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesDomain].
extension SeriesDomainPatterns on SeriesDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesDomain value)  $default,){
final _that = this;
switch (_that) {
case _SeriesDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesDomain value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesDomain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  bool isFinished,  List<ItemDomain>? books,  List<String>? libraryItemIdsFinished)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesDomain() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  bool isFinished,  List<ItemDomain>? books,  List<String>? libraryItemIdsFinished)  $default,) {final _that = this;
switch (_that) {
case _SeriesDomain():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt,  bool isFinished,  List<ItemDomain>? books,  List<String>? libraryItemIdsFinished)?  $default,) {final _that = this;
switch (_that) {
case _SeriesDomain() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.isFinished,_that.books,_that.libraryItemIdsFinished);case _:
  return null;

}
}

}

/// @nodoc


class _SeriesDomain implements SeriesDomain {
  const _SeriesDomain({required this.id, required this.name, required this.libraryId, this.nameIgnorePrefix, this.description, this.addedAt, this.updatedAt, this.isFinished = false, final  List<ItemDomain>? books, final  List<String>? libraryItemIdsFinished}): _books = books,_libraryItemIdsFinished = libraryItemIdsFinished;
  

@override final  String id;
@override final  String name;
@override final  String libraryId;
@override final  String? nameIgnorePrefix;
@override final  String? description;
@override final  DateTime? addedAt;
@override final  DateTime? updatedAt;
@override@JsonKey() final  bool isFinished;
 final  List<ItemDomain>? _books;
@override List<ItemDomain>? get books {
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


/// Create a copy of SeriesDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesDomainCopyWith<_SeriesDomain> get copyWith => __$SeriesDomainCopyWithImpl<_SeriesDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&const DeepCollectionEquality().equals(other._books, _books)&&const DeepCollectionEquality().equals(other._libraryItemIdsFinished, _libraryItemIdsFinished));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,nameIgnorePrefix,description,addedAt,updatedAt,isFinished,const DeepCollectionEquality().hash(_books),const DeepCollectionEquality().hash(_libraryItemIdsFinished));

@override
String toString() {
  return 'SeriesDomain(id: $id, name: $name, libraryId: $libraryId, nameIgnorePrefix: $nameIgnorePrefix, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, isFinished: $isFinished, books: $books, libraryItemIdsFinished: $libraryItemIdsFinished)';
}


}

/// @nodoc
abstract mixin class _$SeriesDomainCopyWith<$Res> implements $SeriesDomainCopyWith<$Res> {
  factory _$SeriesDomainCopyWith(_SeriesDomain value, $Res Function(_SeriesDomain) _then) = __$SeriesDomainCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String libraryId, String? nameIgnorePrefix, String? description, DateTime? addedAt, DateTime? updatedAt, bool isFinished, List<ItemDomain>? books, List<String>? libraryItemIdsFinished
});




}
/// @nodoc
class __$SeriesDomainCopyWithImpl<$Res>
    implements _$SeriesDomainCopyWith<$Res> {
  __$SeriesDomainCopyWithImpl(this._self, this._then);

  final _SeriesDomain _self;
  final $Res Function(_SeriesDomain) _then;

/// Create a copy of SeriesDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? libraryId = null,Object? nameIgnorePrefix = freezed,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isFinished = null,Object? books = freezed,Object? libraryItemIdsFinished = freezed,}) {
  return _then(_SeriesDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: freezed == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,books: freezed == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<ItemDomain>?,libraryItemIdsFinished: freezed == libraryItemIdsFinished ? _self._libraryItemIdsFinished : libraryItemIdsFinished // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
