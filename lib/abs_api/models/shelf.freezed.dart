// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Shelf _$ShelfFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'libraryItems':
          return LibraryItemsShelf.fromJson(
            json
          );
                case 'series':
          return SeriesShelf.fromJson(
            json
          );
                case 'authors':
          return AuthorShelf.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Shelf',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Shelf {

 String get id; String get label; String get labelStringKey; ShelfType get type; List<Object> get entities; int get total;
/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfCopyWith<Shelf> get copyWith => _$ShelfCopyWithImpl<Shelf>(this as Shelf, _$identity);

  /// Serializes this Shelf to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.labelStringKey, labelStringKey) || other.labelStringKey == labelStringKey)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.entities, entities)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,labelStringKey,type,const DeepCollectionEquality().hash(entities),total);

@override
String toString() {
  return 'Shelf(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, total: $total)';
}


}

/// @nodoc
abstract mixin class $ShelfCopyWith<$Res>  {
  factory $ShelfCopyWith(Shelf value, $Res Function(Shelf) _then) = _$ShelfCopyWithImpl;
@useResult
$Res call({
 String id, String label, String labelStringKey, ShelfType type, int total
});




}
/// @nodoc
class _$ShelfCopyWithImpl<$Res>
    implements $ShelfCopyWith<$Res> {
  _$ShelfCopyWithImpl(this._self, this._then);

  final Shelf _self;
  final $Res Function(Shelf) _then;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? labelStringKey = null,Object? type = null,Object? total = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,labelStringKey: null == labelStringKey ? _self.labelStringKey : labelStringKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Shelf].
extension ShelfPatterns on Shelf {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LibraryItemsShelf value)?  libraryItems,TResult Function( SeriesShelf value)?  series,TResult Function( AuthorShelf value)?  authors,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LibraryItemsShelf() when libraryItems != null:
return libraryItems(_that);case SeriesShelf() when series != null:
return series(_that);case AuthorShelf() when authors != null:
return authors(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LibraryItemsShelf value)  libraryItems,required TResult Function( SeriesShelf value)  series,required TResult Function( AuthorShelf value)  authors,}){
final _that = this;
switch (_that) {
case LibraryItemsShelf():
return libraryItems(_that);case SeriesShelf():
return series(_that);case AuthorShelf():
return authors(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LibraryItemsShelf value)?  libraryItems,TResult? Function( SeriesShelf value)?  series,TResult? Function( AuthorShelf value)?  authors,}){
final _that = this;
switch (_that) {
case LibraryItemsShelf() when libraryItems != null:
return libraryItems(_that);case SeriesShelf() when series != null:
return series(_that);case AuthorShelf() when authors != null:
return authors(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<LibraryItem> entities,  int total)?  libraryItems,TResult Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<Series> entities,  int total)?  series,TResult Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<Author> entities,  int total)?  authors,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LibraryItemsShelf() when libraryItems != null:
return libraryItems(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case SeriesShelf() when series != null:
return series(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case AuthorShelf() when authors != null:
return authors(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<LibraryItem> entities,  int total)  libraryItems,required TResult Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<Series> entities,  int total)  series,required TResult Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<Author> entities,  int total)  authors,}) {final _that = this;
switch (_that) {
case LibraryItemsShelf():
return libraryItems(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case SeriesShelf():
return series(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case AuthorShelf():
return authors(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<LibraryItem> entities,  int total)?  libraryItems,TResult? Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<Series> entities,  int total)?  series,TResult? Function( String id,  String label,  String labelStringKey,  ShelfType type,  List<Author> entities,  int total)?  authors,}) {final _that = this;
switch (_that) {
case LibraryItemsShelf() when libraryItems != null:
return libraryItems(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case SeriesShelf() when series != null:
return series(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case AuthorShelf() when authors != null:
return authors(_that.id,_that.label,_that.labelStringKey,_that.type,_that.entities,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class LibraryItemsShelf implements Shelf {
  const LibraryItemsShelf({required this.id, required this.label, required this.labelStringKey, required this.type, required final  List<LibraryItem> entities, required this.total, final  String? $type}): _entities = entities,$type = $type ?? 'libraryItems';
  factory LibraryItemsShelf.fromJson(Map<String, dynamic> json) => _$LibraryItemsShelfFromJson(json);

@override final  String id;
@override final  String label;
@override final  String labelStringKey;
@override final  ShelfType type;
 final  List<LibraryItem> _entities;
@override List<LibraryItem> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}

@override final  int total;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemsShelfCopyWith<LibraryItemsShelf> get copyWith => _$LibraryItemsShelfCopyWithImpl<LibraryItemsShelf>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryItemsShelfToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemsShelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.labelStringKey, labelStringKey) || other.labelStringKey == labelStringKey)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._entities, _entities)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,labelStringKey,type,const DeepCollectionEquality().hash(_entities),total);

@override
String toString() {
  return 'Shelf.libraryItems(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, total: $total)';
}


}

/// @nodoc
abstract mixin class $LibraryItemsShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory $LibraryItemsShelfCopyWith(LibraryItemsShelf value, $Res Function(LibraryItemsShelf) _then) = _$LibraryItemsShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String labelStringKey, ShelfType type, List<LibraryItem> entities, int total
});




}
/// @nodoc
class _$LibraryItemsShelfCopyWithImpl<$Res>
    implements $LibraryItemsShelfCopyWith<$Res> {
  _$LibraryItemsShelfCopyWithImpl(this._self, this._then);

  final LibraryItemsShelf _self;
  final $Res Function(LibraryItemsShelf) _then;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? labelStringKey = null,Object? type = null,Object? entities = null,Object? total = null,}) {
  return _then(LibraryItemsShelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,labelStringKey: null == labelStringKey ? _self.labelStringKey : labelStringKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SeriesShelf implements Shelf {
  const SeriesShelf({required this.id, required this.label, required this.labelStringKey, required this.type, required final  List<Series> entities, required this.total, final  String? $type}): _entities = entities,$type = $type ?? 'series';
  factory SeriesShelf.fromJson(Map<String, dynamic> json) => _$SeriesShelfFromJson(json);

@override final  String id;
@override final  String label;
@override final  String labelStringKey;
@override final  ShelfType type;
 final  List<Series> _entities;
@override List<Series> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}

@override final  int total;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesShelfCopyWith<SeriesShelf> get copyWith => _$SeriesShelfCopyWithImpl<SeriesShelf>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesShelfToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesShelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.labelStringKey, labelStringKey) || other.labelStringKey == labelStringKey)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._entities, _entities)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,labelStringKey,type,const DeepCollectionEquality().hash(_entities),total);

@override
String toString() {
  return 'Shelf.series(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, total: $total)';
}


}

/// @nodoc
abstract mixin class $SeriesShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory $SeriesShelfCopyWith(SeriesShelf value, $Res Function(SeriesShelf) _then) = _$SeriesShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String labelStringKey, ShelfType type, List<Series> entities, int total
});




}
/// @nodoc
class _$SeriesShelfCopyWithImpl<$Res>
    implements $SeriesShelfCopyWith<$Res> {
  _$SeriesShelfCopyWithImpl(this._self, this._then);

  final SeriesShelf _self;
  final $Res Function(SeriesShelf) _then;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? labelStringKey = null,Object? type = null,Object? entities = null,Object? total = null,}) {
  return _then(SeriesShelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,labelStringKey: null == labelStringKey ? _self.labelStringKey : labelStringKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<Series>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AuthorShelf implements Shelf {
  const AuthorShelf({required this.id, required this.label, required this.labelStringKey, required this.type, required final  List<Author> entities, required this.total, final  String? $type}): _entities = entities,$type = $type ?? 'authors';
  factory AuthorShelf.fromJson(Map<String, dynamic> json) => _$AuthorShelfFromJson(json);

@override final  String id;
@override final  String label;
@override final  String labelStringKey;
@override final  ShelfType type;
 final  List<Author> _entities;
@override List<Author> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}

@override final  int total;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorShelfCopyWith<AuthorShelf> get copyWith => _$AuthorShelfCopyWithImpl<AuthorShelf>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorShelfToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorShelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.labelStringKey, labelStringKey) || other.labelStringKey == labelStringKey)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._entities, _entities)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,labelStringKey,type,const DeepCollectionEquality().hash(_entities),total);

@override
String toString() {
  return 'Shelf.authors(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, total: $total)';
}


}

/// @nodoc
abstract mixin class $AuthorShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory $AuthorShelfCopyWith(AuthorShelf value, $Res Function(AuthorShelf) _then) = _$AuthorShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String labelStringKey, ShelfType type, List<Author> entities, int total
});




}
/// @nodoc
class _$AuthorShelfCopyWithImpl<$Res>
    implements $AuthorShelfCopyWith<$Res> {
  _$AuthorShelfCopyWithImpl(this._self, this._then);

  final AuthorShelf _self;
  final $Res Function(AuthorShelf) _then;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? labelStringKey = null,Object? type = null,Object? entities = null,Object? total = null,}) {
  return _then(AuthorShelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,labelStringKey: null == labelStringKey ? _self.labelStringKey : labelStringKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<Author>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
