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
mixin _$ShelfDomain {

 String get id; String get label; ShelfType get type;
/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfDomainCopyWith<ShelfDomain> get copyWith => _$ShelfDomainCopyWithImpl<ShelfDomain>(this as ShelfDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type);

@override
String toString() {
  return 'ShelfDomain(id: $id, label: $label, type: $type)';
}


}

/// @nodoc
abstract mixin class $ShelfDomainCopyWith<$Res>  {
  factory $ShelfDomainCopyWith(ShelfDomain value, $Res Function(ShelfDomain) _then) = _$ShelfDomainCopyWithImpl;
@useResult
$Res call({
 String id, String label, ShelfType type
});




}
/// @nodoc
class _$ShelfDomainCopyWithImpl<$Res>
    implements $ShelfDomainCopyWith<$Res> {
  _$ShelfDomainCopyWithImpl(this._self, this._then);

  final ShelfDomain _self;
  final $Res Function(ShelfDomain) _then;

/// Create a copy of ShelfDomain
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


/// Adds pattern-matching-related methods to [ShelfDomain].
extension ShelfDomainPatterns on ShelfDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ItemShelfDomain value)?  libraryItems,TResult Function( SeriesShelfDomain value)?  series,TResult Function( AuthorShelfDomain value)?  authors,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ItemShelfDomain() when libraryItems != null:
return libraryItems(_that);case SeriesShelfDomain() when series != null:
return series(_that);case AuthorShelfDomain() when authors != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ItemShelfDomain value)  libraryItems,required TResult Function( SeriesShelfDomain value)  series,required TResult Function( AuthorShelfDomain value)  authors,}){
final _that = this;
switch (_that) {
case ItemShelfDomain():
return libraryItems(_that);case SeriesShelfDomain():
return series(_that);case AuthorShelfDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ItemShelfDomain value)?  libraryItems,TResult? Function( SeriesShelfDomain value)?  series,TResult? Function( AuthorShelfDomain value)?  authors,}){
final _that = this;
switch (_that) {
case ItemShelfDomain() when libraryItems != null:
return libraryItems(_that);case SeriesShelfDomain() when series != null:
return series(_that);case AuthorShelfDomain() when authors != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String label,  ShelfType type,  List<ItemDomain> items)?  libraryItems,TResult Function( String id,  String label,  ShelfType type,  List<SeriesDomain> series)?  series,TResult Function( String id,  String label,  ShelfType type,  List<AuthorDomain> authors)?  authors,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ItemShelfDomain() when libraryItems != null:
return libraryItems(_that.id,_that.label,_that.type,_that.items);case SeriesShelfDomain() when series != null:
return series(_that.id,_that.label,_that.type,_that.series);case AuthorShelfDomain() when authors != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String label,  ShelfType type,  List<ItemDomain> items)  libraryItems,required TResult Function( String id,  String label,  ShelfType type,  List<SeriesDomain> series)  series,required TResult Function( String id,  String label,  ShelfType type,  List<AuthorDomain> authors)  authors,}) {final _that = this;
switch (_that) {
case ItemShelfDomain():
return libraryItems(_that.id,_that.label,_that.type,_that.items);case SeriesShelfDomain():
return series(_that.id,_that.label,_that.type,_that.series);case AuthorShelfDomain():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String label,  ShelfType type,  List<ItemDomain> items)?  libraryItems,TResult? Function( String id,  String label,  ShelfType type,  List<SeriesDomain> series)?  series,TResult? Function( String id,  String label,  ShelfType type,  List<AuthorDomain> authors)?  authors,}) {final _that = this;
switch (_that) {
case ItemShelfDomain() when libraryItems != null:
return libraryItems(_that.id,_that.label,_that.type,_that.items);case SeriesShelfDomain() when series != null:
return series(_that.id,_that.label,_that.type,_that.series);case AuthorShelfDomain() when authors != null:
return authors(_that.id,_that.label,_that.type,_that.authors);case _:
  return null;

}
}

}

/// @nodoc


class ItemShelfDomain extends ShelfDomain {
  const ItemShelfDomain({required this.id, required this.label, required this.type, required final  List<ItemDomain> items}): _items = items,super._();
  

@override final  String id;
@override final  String label;
@override final  ShelfType type;
 final  List<ItemDomain> _items;
 List<ItemDomain> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemShelfDomainCopyWith<ItemShelfDomain> get copyWith => _$ItemShelfDomainCopyWithImpl<ItemShelfDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemShelfDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ShelfDomain.libraryItems(id: $id, label: $label, type: $type, items: $items)';
}


}

/// @nodoc
abstract mixin class $ItemShelfDomainCopyWith<$Res> implements $ShelfDomainCopyWith<$Res> {
  factory $ItemShelfDomainCopyWith(ItemShelfDomain value, $Res Function(ItemShelfDomain) _then) = _$ItemShelfDomainCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, ShelfType type, List<ItemDomain> items
});




}
/// @nodoc
class _$ItemShelfDomainCopyWithImpl<$Res>
    implements $ItemShelfDomainCopyWith<$Res> {
  _$ItemShelfDomainCopyWithImpl(this._self, this._then);

  final ItemShelfDomain _self;
  final $Res Function(ItemShelfDomain) _then;

/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? items = null,}) {
  return _then(ItemShelfDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ItemDomain>,
  ));
}


}

/// @nodoc


class SeriesShelfDomain extends ShelfDomain {
  const SeriesShelfDomain({required this.id, required this.label, required this.type, required final  List<SeriesDomain> series}): _series = series,super._();
  

@override final  String id;
@override final  String label;
@override final  ShelfType type;
 final  List<SeriesDomain> _series;
 List<SeriesDomain> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}


/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesShelfDomainCopyWith<SeriesShelfDomain> get copyWith => _$SeriesShelfDomainCopyWithImpl<SeriesShelfDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesShelfDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._series, _series));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type,const DeepCollectionEquality().hash(_series));

@override
String toString() {
  return 'ShelfDomain.series(id: $id, label: $label, type: $type, series: $series)';
}


}

/// @nodoc
abstract mixin class $SeriesShelfDomainCopyWith<$Res> implements $ShelfDomainCopyWith<$Res> {
  factory $SeriesShelfDomainCopyWith(SeriesShelfDomain value, $Res Function(SeriesShelfDomain) _then) = _$SeriesShelfDomainCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, ShelfType type, List<SeriesDomain> series
});




}
/// @nodoc
class _$SeriesShelfDomainCopyWithImpl<$Res>
    implements $SeriesShelfDomainCopyWith<$Res> {
  _$SeriesShelfDomainCopyWithImpl(this._self, this._then);

  final SeriesShelfDomain _self;
  final $Res Function(SeriesShelfDomain) _then;

/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? series = null,}) {
  return _then(SeriesShelfDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<SeriesDomain>,
  ));
}


}

/// @nodoc


class AuthorShelfDomain extends ShelfDomain {
  const AuthorShelfDomain({required this.id, required this.label, required this.type, required final  List<AuthorDomain> authors}): _authors = authors,super._();
  

@override final  String id;
@override final  String label;
@override final  ShelfType type;
 final  List<AuthorDomain> _authors;
 List<AuthorDomain> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}


/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorShelfDomainCopyWith<AuthorShelfDomain> get copyWith => _$AuthorShelfDomainCopyWithImpl<AuthorShelfDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorShelfDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._authors, _authors));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,type,const DeepCollectionEquality().hash(_authors));

@override
String toString() {
  return 'ShelfDomain.authors(id: $id, label: $label, type: $type, authors: $authors)';
}


}

/// @nodoc
abstract mixin class $AuthorShelfDomainCopyWith<$Res> implements $ShelfDomainCopyWith<$Res> {
  factory $AuthorShelfDomainCopyWith(AuthorShelfDomain value, $Res Function(AuthorShelfDomain) _then) = _$AuthorShelfDomainCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, ShelfType type, List<AuthorDomain> authors
});




}
/// @nodoc
class _$AuthorShelfDomainCopyWithImpl<$Res>
    implements $AuthorShelfDomainCopyWith<$Res> {
  _$AuthorShelfDomainCopyWithImpl(this._self, this._then);

  final AuthorShelfDomain _self;
  final $Res Function(AuthorShelfDomain) _then;

/// Create a copy of ShelfDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? authors = null,}) {
  return _then(AuthorShelfDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShelfType,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<AuthorDomain>,
  ));
}


}

// dart format on
