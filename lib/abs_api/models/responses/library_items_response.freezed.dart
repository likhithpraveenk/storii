// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_items_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryItemsResponse {

 List<LibraryItem> get results; int get total; int get limit; int get page; String? get sortBy; bool get sortDesc; Filter? get filterBy; MediaType get mediaType; bool get minified;@JsonKey(name: 'collapseseries') bool get collapseSeries; String get include;
/// Create a copy of LibraryItemsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemsResponseCopyWith<LibraryItemsResponse> get copyWith => _$LibraryItemsResponseCopyWithImpl<LibraryItemsResponse>(this as LibraryItemsResponse, _$identity);

  /// Serializes this LibraryItemsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemsResponse&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDesc, sortDesc) || other.sortDesc == sortDesc)&&(identical(other.filterBy, filterBy) || other.filterBy == filterBy)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.minified, minified) || other.minified == minified)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries)&&(identical(other.include, include) || other.include == include));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),total,limit,page,sortBy,sortDesc,filterBy,mediaType,minified,collapseSeries,include);

@override
String toString() {
  return 'LibraryItemsResponse(results: $results, total: $total, limit: $limit, page: $page, sortBy: $sortBy, sortDesc: $sortDesc, filterBy: $filterBy, mediaType: $mediaType, minified: $minified, collapseSeries: $collapseSeries, include: $include)';
}


}

/// @nodoc
abstract mixin class $LibraryItemsResponseCopyWith<$Res>  {
  factory $LibraryItemsResponseCopyWith(LibraryItemsResponse value, $Res Function(LibraryItemsResponse) _then) = _$LibraryItemsResponseCopyWithImpl;
@useResult
$Res call({
 List<LibraryItem> results, int total, int limit, int page, String? sortBy, bool sortDesc, Filter? filterBy, MediaType mediaType, bool minified,@JsonKey(name: 'collapseseries') bool collapseSeries, String include
});




}
/// @nodoc
class _$LibraryItemsResponseCopyWithImpl<$Res>
    implements $LibraryItemsResponseCopyWith<$Res> {
  _$LibraryItemsResponseCopyWithImpl(this._self, this._then);

  final LibraryItemsResponse _self;
  final $Res Function(LibraryItemsResponse) _then;

/// Create a copy of LibraryItemsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? total = null,Object? limit = null,Object? page = null,Object? sortBy = freezed,Object? sortDesc = null,Object? filterBy = freezed,Object? mediaType = null,Object? minified = null,Object? collapseSeries = null,Object? include = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortDesc: null == sortDesc ? _self.sortDesc : sortDesc // ignore: cast_nullable_to_non_nullable
as bool,filterBy: freezed == filterBy ? _self.filterBy : filterBy // ignore: cast_nullable_to_non_nullable
as Filter?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,minified: null == minified ? _self.minified : minified // ignore: cast_nullable_to_non_nullable
as bool,collapseSeries: null == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool,include: null == include ? _self.include : include // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryItemsResponse].
extension LibraryItemsResponsePatterns on LibraryItemsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItemsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItemsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItemsResponse value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItemsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItemsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItemsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LibraryItem> results,  int total,  int limit,  int page,  String? sortBy,  bool sortDesc,  Filter? filterBy,  MediaType mediaType,  bool minified, @JsonKey(name: 'collapseseries')  bool collapseSeries,  String include)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItemsResponse() when $default != null:
return $default(_that.results,_that.total,_that.limit,_that.page,_that.sortBy,_that.sortDesc,_that.filterBy,_that.mediaType,_that.minified,_that.collapseSeries,_that.include);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LibraryItem> results,  int total,  int limit,  int page,  String? sortBy,  bool sortDesc,  Filter? filterBy,  MediaType mediaType,  bool minified, @JsonKey(name: 'collapseseries')  bool collapseSeries,  String include)  $default,) {final _that = this;
switch (_that) {
case _LibraryItemsResponse():
return $default(_that.results,_that.total,_that.limit,_that.page,_that.sortBy,_that.sortDesc,_that.filterBy,_that.mediaType,_that.minified,_that.collapseSeries,_that.include);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LibraryItem> results,  int total,  int limit,  int page,  String? sortBy,  bool sortDesc,  Filter? filterBy,  MediaType mediaType,  bool minified, @JsonKey(name: 'collapseseries')  bool collapseSeries,  String include)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItemsResponse() when $default != null:
return $default(_that.results,_that.total,_that.limit,_that.page,_that.sortBy,_that.sortDesc,_that.filterBy,_that.mediaType,_that.minified,_that.collapseSeries,_that.include);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@FilterConverter()
class _LibraryItemsResponse implements LibraryItemsResponse {
  const _LibraryItemsResponse({required final  List<LibraryItem> results, required this.total, required this.limit, required this.page, this.sortBy, required this.sortDesc, this.filterBy, required this.mediaType, required this.minified, @JsonKey(name: 'collapseseries') required this.collapseSeries, required this.include}): _results = results;
  factory _LibraryItemsResponse.fromJson(Map<String, dynamic> json) => _$LibraryItemsResponseFromJson(json);

 final  List<LibraryItem> _results;
@override List<LibraryItem> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  int total;
@override final  int limit;
@override final  int page;
@override final  String? sortBy;
@override final  bool sortDesc;
@override final  Filter? filterBy;
@override final  MediaType mediaType;
@override final  bool minified;
@override@JsonKey(name: 'collapseseries') final  bool collapseSeries;
@override final  String include;

/// Create a copy of LibraryItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemsResponseCopyWith<_LibraryItemsResponse> get copyWith => __$LibraryItemsResponseCopyWithImpl<_LibraryItemsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryItemsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItemsResponse&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDesc, sortDesc) || other.sortDesc == sortDesc)&&(identical(other.filterBy, filterBy) || other.filterBy == filterBy)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.minified, minified) || other.minified == minified)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries)&&(identical(other.include, include) || other.include == include));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),total,limit,page,sortBy,sortDesc,filterBy,mediaType,minified,collapseSeries,include);

@override
String toString() {
  return 'LibraryItemsResponse(results: $results, total: $total, limit: $limit, page: $page, sortBy: $sortBy, sortDesc: $sortDesc, filterBy: $filterBy, mediaType: $mediaType, minified: $minified, collapseSeries: $collapseSeries, include: $include)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemsResponseCopyWith<$Res> implements $LibraryItemsResponseCopyWith<$Res> {
  factory _$LibraryItemsResponseCopyWith(_LibraryItemsResponse value, $Res Function(_LibraryItemsResponse) _then) = __$LibraryItemsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<LibraryItem> results, int total, int limit, int page, String? sortBy, bool sortDesc, Filter? filterBy, MediaType mediaType, bool minified,@JsonKey(name: 'collapseseries') bool collapseSeries, String include
});




}
/// @nodoc
class __$LibraryItemsResponseCopyWithImpl<$Res>
    implements _$LibraryItemsResponseCopyWith<$Res> {
  __$LibraryItemsResponseCopyWithImpl(this._self, this._then);

  final _LibraryItemsResponse _self;
  final $Res Function(_LibraryItemsResponse) _then;

/// Create a copy of LibraryItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? total = null,Object? limit = null,Object? page = null,Object? sortBy = freezed,Object? sortDesc = null,Object? filterBy = freezed,Object? mediaType = null,Object? minified = null,Object? collapseSeries = null,Object? include = null,}) {
  return _then(_LibraryItemsResponse(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortDesc: null == sortDesc ? _self.sortDesc : sortDesc // ignore: cast_nullable_to_non_nullable
as bool,filterBy: freezed == filterBy ? _self.filterBy : filterBy // ignore: cast_nullable_to_non_nullable
as Filter?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,minified: null == minified ? _self.minified : minified // ignore: cast_nullable_to_non_nullable
as bool,collapseSeries: null == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool,include: null == include ? _self.include : include // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
