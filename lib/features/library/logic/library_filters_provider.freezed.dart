// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_filters_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {

 EnumHasValue get sortType; Filter get filter; bool get sortAscending; bool get isGridView; bool get collapseSeries; bool get stackTitle; bool get showTitle;
/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterStateCopyWith<FilterState> get copyWith => _$FilterStateCopyWithImpl<FilterState>(this as FilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterState&&(identical(other.sortType, sortType) || other.sortType == sortType)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.sortAscending, sortAscending) || other.sortAscending == sortAscending)&&(identical(other.isGridView, isGridView) || other.isGridView == isGridView)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries)&&(identical(other.stackTitle, stackTitle) || other.stackTitle == stackTitle)&&(identical(other.showTitle, showTitle) || other.showTitle == showTitle));
}


@override
int get hashCode => Object.hash(runtimeType,sortType,filter,sortAscending,isGridView,collapseSeries,stackTitle,showTitle);

@override
String toString() {
  return 'FilterState(sortType: $sortType, filter: $filter, sortAscending: $sortAscending, isGridView: $isGridView, collapseSeries: $collapseSeries, stackTitle: $stackTitle, showTitle: $showTitle)';
}


}

/// @nodoc
abstract mixin class $FilterStateCopyWith<$Res>  {
  factory $FilterStateCopyWith(FilterState value, $Res Function(FilterState) _then) = _$FilterStateCopyWithImpl;
@useResult
$Res call({
 EnumHasValue sortType, Filter filter, bool sortAscending, bool isGridView, bool collapseSeries, bool stackTitle, bool showTitle
});




}
/// @nodoc
class _$FilterStateCopyWithImpl<$Res>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._self, this._then);

  final FilterState _self;
  final $Res Function(FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sortType = null,Object? filter = null,Object? sortAscending = null,Object? isGridView = null,Object? collapseSeries = null,Object? stackTitle = null,Object? showTitle = null,}) {
  return _then(_self.copyWith(
sortType: null == sortType ? _self.sortType : sortType // ignore: cast_nullable_to_non_nullable
as EnumHasValue,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter,sortAscending: null == sortAscending ? _self.sortAscending : sortAscending // ignore: cast_nullable_to_non_nullable
as bool,isGridView: null == isGridView ? _self.isGridView : isGridView // ignore: cast_nullable_to_non_nullable
as bool,collapseSeries: null == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool,stackTitle: null == stackTitle ? _self.stackTitle : stackTitle // ignore: cast_nullable_to_non_nullable
as bool,showTitle: null == showTitle ? _self.showTitle : showTitle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterState].
extension FilterStatePatterns on FilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterState value)  $default,){
final _that = this;
switch (_that) {
case _FilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterState value)?  $default,){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EnumHasValue sortType,  Filter filter,  bool sortAscending,  bool isGridView,  bool collapseSeries,  bool stackTitle,  bool showTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.sortType,_that.filter,_that.sortAscending,_that.isGridView,_that.collapseSeries,_that.stackTitle,_that.showTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EnumHasValue sortType,  Filter filter,  bool sortAscending,  bool isGridView,  bool collapseSeries,  bool stackTitle,  bool showTitle)  $default,) {final _that = this;
switch (_that) {
case _FilterState():
return $default(_that.sortType,_that.filter,_that.sortAscending,_that.isGridView,_that.collapseSeries,_that.stackTitle,_that.showTitle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EnumHasValue sortType,  Filter filter,  bool sortAscending,  bool isGridView,  bool collapseSeries,  bool stackTitle,  bool showTitle)?  $default,) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.sortType,_that.filter,_that.sortAscending,_that.isGridView,_that.collapseSeries,_that.stackTitle,_that.showTitle);case _:
  return null;

}
}

}

/// @nodoc


class _FilterState implements FilterState {
  const _FilterState({required this.sortType, this.filter = const NoFilter(), this.sortAscending = true, this.isGridView = true, this.collapseSeries = false, this.stackTitle = false, this.showTitle = true});
  

@override final  EnumHasValue sortType;
@override@JsonKey() final  Filter filter;
@override@JsonKey() final  bool sortAscending;
@override@JsonKey() final  bool isGridView;
@override@JsonKey() final  bool collapseSeries;
@override@JsonKey() final  bool stackTitle;
@override@JsonKey() final  bool showTitle;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterStateCopyWith<_FilterState> get copyWith => __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterState&&(identical(other.sortType, sortType) || other.sortType == sortType)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.sortAscending, sortAscending) || other.sortAscending == sortAscending)&&(identical(other.isGridView, isGridView) || other.isGridView == isGridView)&&(identical(other.collapseSeries, collapseSeries) || other.collapseSeries == collapseSeries)&&(identical(other.stackTitle, stackTitle) || other.stackTitle == stackTitle)&&(identical(other.showTitle, showTitle) || other.showTitle == showTitle));
}


@override
int get hashCode => Object.hash(runtimeType,sortType,filter,sortAscending,isGridView,collapseSeries,stackTitle,showTitle);

@override
String toString() {
  return 'FilterState(sortType: $sortType, filter: $filter, sortAscending: $sortAscending, isGridView: $isGridView, collapseSeries: $collapseSeries, stackTitle: $stackTitle, showTitle: $showTitle)';
}


}

/// @nodoc
abstract mixin class _$FilterStateCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(_FilterState value, $Res Function(_FilterState) _then) = __$FilterStateCopyWithImpl;
@override @useResult
$Res call({
 EnumHasValue sortType, Filter filter, bool sortAscending, bool isGridView, bool collapseSeries, bool stackTitle, bool showTitle
});




}
/// @nodoc
class __$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._self, this._then);

  final _FilterState _self;
  final $Res Function(_FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortType = null,Object? filter = null,Object? sortAscending = null,Object? isGridView = null,Object? collapseSeries = null,Object? stackTitle = null,Object? showTitle = null,}) {
  return _then(_FilterState(
sortType: null == sortType ? _self.sortType : sortType // ignore: cast_nullable_to_non_nullable
as EnumHasValue,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter,sortAscending: null == sortAscending ? _self.sortAscending : sortAscending // ignore: cast_nullable_to_non_nullable
as bool,isGridView: null == isGridView ? _self.isGridView : isGridView // ignore: cast_nullable_to_non_nullable
as bool,collapseSeries: null == collapseSeries ? _self.collapseSeries : collapseSeries // ignore: cast_nullable_to_non_nullable
as bool,stackTitle: null == stackTitle ? _self.stackTitle : stackTitle // ignore: cast_nullable_to_non_nullable
as bool,showTitle: null == showTitle ? _self.showTitle : showTitle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
