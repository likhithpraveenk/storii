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
/// @nodoc
mixin _$Shelf {

 String get id; String get label; ShelfType get type;
/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfCopyWith<Shelf> get copyWith => _$ShelfCopyWithImpl<Shelf>(this as Shelf, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type);

@override
String toString() {
  return 'Shelf(id: $id, label: $label, type: $type)';
}


}

/// @nodoc
abstract mixin class $ShelfCopyWith<$Res>  {
  factory $ShelfCopyWith(Shelf value, $Res Function(Shelf) _then) = _$ShelfCopyWithImpl;
@useResult
$Res call({
 String id, String label, ShelfType type
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String label,  ShelfType type,  List<LibraryItem> items)?  libraryItems,TResult Function( String id,  String label,  ShelfType type,  List<String> series)?  series,TResult Function( String id,  String label,  ShelfType type,  List<String> authors)?  authors,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LibraryItemsShelf() when libraryItems != null:
return libraryItems(_that.id,_that.label,_that.type,_that.items);case SeriesShelf() when series != null:
return series(_that.id,_that.label,_that.type,_that.series);case AuthorShelf() when authors != null:
return authors(_that.id,_that.label,_that.type,_that.authors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String label,  ShelfType type,  List<LibraryItem> items)  libraryItems,required TResult Function( String id,  String label,  ShelfType type,  List<String> series)  series,required TResult Function( String id,  String label,  ShelfType type,  List<String> authors)  authors,}) {final _that = this;
switch (_that) {
case LibraryItemsShelf():
return libraryItems(_that.id,_that.label,_that.type,_that.items);case SeriesShelf():
return series(_that.id,_that.label,_that.type,_that.series);case AuthorShelf():
return authors(_that.id,_that.label,_that.type,_that.authors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String label,  ShelfType type,  List<LibraryItem> items)?  libraryItems,TResult? Function( String id,  String label,  ShelfType type,  List<String> series)?  series,TResult? Function( String id,  String label,  ShelfType type,  List<String> authors)?  authors,}) {final _that = this;
switch (_that) {
case LibraryItemsShelf() when libraryItems != null:
return libraryItems(_that.id,_that.label,_that.type,_that.items);case SeriesShelf() when series != null:
return series(_that.id,_that.label,_that.type,_that.series);case AuthorShelf() when authors != null:
return authors(_that.id,_that.label,_that.type,_that.authors);case _:
  return null;

}
}

}

/// @nodoc


class LibraryItemsShelf extends Shelf {
  const LibraryItemsShelf({required this.id, required this.label, required this.type, required final  List<LibraryItem> items}): _items = items,super._();
  

@override final  String id;
@override final  String label;
@override final  ShelfType type;
 final  List<LibraryItem> _items;
 List<LibraryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemsShelfCopyWith<LibraryItemsShelf> get copyWith => _$LibraryItemsShelfCopyWithImpl<LibraryItemsShelf>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemsShelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'Shelf.libraryItems(id: $id, label: $label, type: $type, items: $items)';
}


}

/// @nodoc
abstract mixin class $LibraryItemsShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory $LibraryItemsShelfCopyWith(LibraryItemsShelf value, $Res Function(LibraryItemsShelf) _then) = _$LibraryItemsShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, ShelfType type, List<LibraryItem> items
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? items = null,}) {
  return _then(LibraryItemsShelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,
  ));
}


}

/// @nodoc


class SeriesShelf extends Shelf {
  const SeriesShelf({required this.id, required this.label, required this.type, required final  List<String> series}): _series = series,super._();
  

@override final  String id;
@override final  String label;
@override final  ShelfType type;
 final  List<String> _series;
 List<String> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}


/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesShelfCopyWith<SeriesShelf> get copyWith => _$SeriesShelfCopyWithImpl<SeriesShelf>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesShelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._series, _series));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type,const DeepCollectionEquality().hash(_series));

@override
String toString() {
  return 'Shelf.series(id: $id, label: $label, type: $type, series: $series)';
}


}

/// @nodoc
abstract mixin class $SeriesShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory $SeriesShelfCopyWith(SeriesShelf value, $Res Function(SeriesShelf) _then) = _$SeriesShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, ShelfType type, List<String> series
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? series = null,}) {
  return _then(SeriesShelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class AuthorShelf extends Shelf {
  const AuthorShelf({required this.id, required this.label, required this.type, required final  List<String> authors}): _authors = authors,super._();
  

@override final  String id;
@override final  String label;
@override final  ShelfType type;
 final  List<String> _authors;
 List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}


/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorShelfCopyWith<AuthorShelf> get copyWith => _$AuthorShelfCopyWithImpl<AuthorShelf>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorShelf&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._authors, _authors));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type,const DeepCollectionEquality().hash(_authors));

@override
String toString() {
  return 'Shelf.authors(id: $id, label: $label, type: $type, authors: $authors)';
}


}

/// @nodoc
abstract mixin class $AuthorShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory $AuthorShelfCopyWith(AuthorShelf value, $Res Function(AuthorShelf) _then) = _$AuthorShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, ShelfType type, List<String> authors
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? authors = null,}) {
  return _then(AuthorShelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
