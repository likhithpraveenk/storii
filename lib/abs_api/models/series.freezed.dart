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

 String get id; String get name; String? get libraryId; String? get nameIgnorePrefix;// Common Metadata
 String? get description; DateTime? get addedAt; DateTime? get updatedAt;// Content / Collections
@JsonKey(readValue: _booksOrItems) List<LibraryItem> get books; int? get numBooks;// Sequence & Sorting
 String? get sequence; String? get seriesSequenceList;// Progress & States
 List<String>? get libraryItemIds; SeriesProgress? get progress; bool? get inProgress; bool? get hasActiveBook; bool? get hideFromContinueListening; DateTime? get bookInProgressLastUpdate; LibraryItem? get firstBookUnread;
/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesCopyWith<Series> get copyWith => _$SeriesCopyWithImpl<Series>(this as Series, _$identity);

  /// Serializes this Series to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Series&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.seriesSequenceList, seriesSequenceList) || other.seriesSequenceList == seriesSequenceList)&&const DeepCollectionEquality().equals(other.libraryItemIds, libraryItemIds)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.hasActiveBook, hasActiveBook) || other.hasActiveBook == hasActiveBook)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening)&&(identical(other.bookInProgressLastUpdate, bookInProgressLastUpdate) || other.bookInProgressLastUpdate == bookInProgressLastUpdate)&&(identical(other.firstBookUnread, firstBookUnread) || other.firstBookUnread == firstBookUnread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,nameIgnorePrefix,description,addedAt,updatedAt,const DeepCollectionEquality().hash(books),numBooks,sequence,seriesSequenceList,const DeepCollectionEquality().hash(libraryItemIds),progress,inProgress,hasActiveBook,hideFromContinueListening,bookInProgressLastUpdate,firstBookUnread);

@override
String toString() {
  return 'Series(id: $id, name: $name, libraryId: $libraryId, nameIgnorePrefix: $nameIgnorePrefix, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, books: $books, numBooks: $numBooks, sequence: $sequence, seriesSequenceList: $seriesSequenceList, libraryItemIds: $libraryItemIds, progress: $progress, inProgress: $inProgress, hasActiveBook: $hasActiveBook, hideFromContinueListening: $hideFromContinueListening, bookInProgressLastUpdate: $bookInProgressLastUpdate, firstBookUnread: $firstBookUnread)';
}


}

/// @nodoc
abstract mixin class $SeriesCopyWith<$Res>  {
  factory $SeriesCopyWith(Series value, $Res Function(Series) _then) = _$SeriesCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? libraryId, String? nameIgnorePrefix, String? description, DateTime? addedAt, DateTime? updatedAt,@JsonKey(readValue: _booksOrItems) List<LibraryItem> books, int? numBooks, String? sequence, String? seriesSequenceList, List<String>? libraryItemIds, SeriesProgress? progress, bool? inProgress, bool? hasActiveBook, bool? hideFromContinueListening, DateTime? bookInProgressLastUpdate, LibraryItem? firstBookUnread
});


$SeriesProgressCopyWith<$Res>? get progress;$LibraryItemCopyWith<$Res>? get firstBookUnread;

}
/// @nodoc
class _$SeriesCopyWithImpl<$Res>
    implements $SeriesCopyWith<$Res> {
  _$SeriesCopyWithImpl(this._self, this._then);

  final Series _self;
  final $Res Function(Series) _then;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? libraryId = freezed,Object? nameIgnorePrefix = freezed,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? books = null,Object? numBooks = freezed,Object? sequence = freezed,Object? seriesSequenceList = freezed,Object? libraryItemIds = freezed,Object? progress = freezed,Object? inProgress = freezed,Object? hasActiveBook = freezed,Object? hideFromContinueListening = freezed,Object? bookInProgressLastUpdate = freezed,Object? firstBookUnread = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: freezed == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String?,nameIgnorePrefix: freezed == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as String?,seriesSequenceList: freezed == seriesSequenceList ? _self.seriesSequenceList : seriesSequenceList // ignore: cast_nullable_to_non_nullable
as String?,libraryItemIds: freezed == libraryItemIds ? _self.libraryItemIds : libraryItemIds // ignore: cast_nullable_to_non_nullable
as List<String>?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as SeriesProgress?,inProgress: freezed == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as bool?,hasActiveBook: freezed == hasActiveBook ? _self.hasActiveBook : hasActiveBook // ignore: cast_nullable_to_non_nullable
as bool?,hideFromContinueListening: freezed == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool?,bookInProgressLastUpdate: freezed == bookInProgressLastUpdate ? _self.bookInProgressLastUpdate : bookInProgressLastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstBookUnread: freezed == firstBookUnread ? _self.firstBookUnread : firstBookUnread // ignore: cast_nullable_to_non_nullable
as LibraryItem?,
  ));
}
/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $SeriesProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<$Res>? get firstBookUnread {
    if (_self.firstBookUnread == null) {
    return null;
  }

  return $LibraryItemCopyWith<$Res>(_self.firstBookUnread!, (value) {
    return _then(_self.copyWith(firstBookUnread: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt, @JsonKey(readValue: _booksOrItems)  List<LibraryItem> books,  int? numBooks,  String? sequence,  String? seriesSequenceList,  List<String>? libraryItemIds,  SeriesProgress? progress,  bool? inProgress,  bool? hasActiveBook,  bool? hideFromContinueListening,  DateTime? bookInProgressLastUpdate,  LibraryItem? firstBookUnread)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Series() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.books,_that.numBooks,_that.sequence,_that.seriesSequenceList,_that.libraryItemIds,_that.progress,_that.inProgress,_that.hasActiveBook,_that.hideFromContinueListening,_that.bookInProgressLastUpdate,_that.firstBookUnread);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt, @JsonKey(readValue: _booksOrItems)  List<LibraryItem> books,  int? numBooks,  String? sequence,  String? seriesSequenceList,  List<String>? libraryItemIds,  SeriesProgress? progress,  bool? inProgress,  bool? hasActiveBook,  bool? hideFromContinueListening,  DateTime? bookInProgressLastUpdate,  LibraryItem? firstBookUnread)  $default,) {final _that = this;
switch (_that) {
case _Series():
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.books,_that.numBooks,_that.sequence,_that.seriesSequenceList,_that.libraryItemIds,_that.progress,_that.inProgress,_that.hasActiveBook,_that.hideFromContinueListening,_that.bookInProgressLastUpdate,_that.firstBookUnread);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? libraryId,  String? nameIgnorePrefix,  String? description,  DateTime? addedAt,  DateTime? updatedAt, @JsonKey(readValue: _booksOrItems)  List<LibraryItem> books,  int? numBooks,  String? sequence,  String? seriesSequenceList,  List<String>? libraryItemIds,  SeriesProgress? progress,  bool? inProgress,  bool? hasActiveBook,  bool? hideFromContinueListening,  DateTime? bookInProgressLastUpdate,  LibraryItem? firstBookUnread)?  $default,) {final _that = this;
switch (_that) {
case _Series() when $default != null:
return $default(_that.id,_that.name,_that.libraryId,_that.nameIgnorePrefix,_that.description,_that.addedAt,_that.updatedAt,_that.books,_that.numBooks,_that.sequence,_that.seriesSequenceList,_that.libraryItemIds,_that.progress,_that.inProgress,_that.hasActiveBook,_that.hideFromContinueListening,_that.bookInProgressLastUpdate,_that.firstBookUnread);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
@DurationPreciseSecondsConverter()
class _Series implements Series {
  const _Series({required this.id, required this.name, this.libraryId, this.nameIgnorePrefix, this.description, this.addedAt, this.updatedAt, @JsonKey(readValue: _booksOrItems) final  List<LibraryItem> books = const [], this.numBooks, this.sequence, this.seriesSequenceList, final  List<String>? libraryItemIds, this.progress, this.inProgress, this.hasActiveBook, this.hideFromContinueListening, this.bookInProgressLastUpdate, this.firstBookUnread}): _books = books,_libraryItemIds = libraryItemIds;
  factory _Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? libraryId;
@override final  String? nameIgnorePrefix;
// Common Metadata
@override final  String? description;
@override final  DateTime? addedAt;
@override final  DateTime? updatedAt;
// Content / Collections
 final  List<LibraryItem> _books;
// Content / Collections
@override@JsonKey(readValue: _booksOrItems) List<LibraryItem> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

@override final  int? numBooks;
// Sequence & Sorting
@override final  String? sequence;
@override final  String? seriesSequenceList;
// Progress & States
 final  List<String>? _libraryItemIds;
// Progress & States
@override List<String>? get libraryItemIds {
  final value = _libraryItemIds;
  if (value == null) return null;
  if (_libraryItemIds is EqualUnmodifiableListView) return _libraryItemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  SeriesProgress? progress;
@override final  bool? inProgress;
@override final  bool? hasActiveBook;
@override final  bool? hideFromContinueListening;
@override final  DateTime? bookInProgressLastUpdate;
@override final  LibraryItem? firstBookUnread;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesCopyWith<_Series> get copyWith => __$SeriesCopyWithImpl<_Series>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Series&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.description, description) || other.description == description)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.seriesSequenceList, seriesSequenceList) || other.seriesSequenceList == seriesSequenceList)&&const DeepCollectionEquality().equals(other._libraryItemIds, _libraryItemIds)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.hasActiveBook, hasActiveBook) || other.hasActiveBook == hasActiveBook)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening)&&(identical(other.bookInProgressLastUpdate, bookInProgressLastUpdate) || other.bookInProgressLastUpdate == bookInProgressLastUpdate)&&(identical(other.firstBookUnread, firstBookUnread) || other.firstBookUnread == firstBookUnread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,libraryId,nameIgnorePrefix,description,addedAt,updatedAt,const DeepCollectionEquality().hash(_books),numBooks,sequence,seriesSequenceList,const DeepCollectionEquality().hash(_libraryItemIds),progress,inProgress,hasActiveBook,hideFromContinueListening,bookInProgressLastUpdate,firstBookUnread);

@override
String toString() {
  return 'Series(id: $id, name: $name, libraryId: $libraryId, nameIgnorePrefix: $nameIgnorePrefix, description: $description, addedAt: $addedAt, updatedAt: $updatedAt, books: $books, numBooks: $numBooks, sequence: $sequence, seriesSequenceList: $seriesSequenceList, libraryItemIds: $libraryItemIds, progress: $progress, inProgress: $inProgress, hasActiveBook: $hasActiveBook, hideFromContinueListening: $hideFromContinueListening, bookInProgressLastUpdate: $bookInProgressLastUpdate, firstBookUnread: $firstBookUnread)';
}


}

/// @nodoc
abstract mixin class _$SeriesCopyWith<$Res> implements $SeriesCopyWith<$Res> {
  factory _$SeriesCopyWith(_Series value, $Res Function(_Series) _then) = __$SeriesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? libraryId, String? nameIgnorePrefix, String? description, DateTime? addedAt, DateTime? updatedAt,@JsonKey(readValue: _booksOrItems) List<LibraryItem> books, int? numBooks, String? sequence, String? seriesSequenceList, List<String>? libraryItemIds, SeriesProgress? progress, bool? inProgress, bool? hasActiveBook, bool? hideFromContinueListening, DateTime? bookInProgressLastUpdate, LibraryItem? firstBookUnread
});


@override $SeriesProgressCopyWith<$Res>? get progress;@override $LibraryItemCopyWith<$Res>? get firstBookUnread;

}
/// @nodoc
class __$SeriesCopyWithImpl<$Res>
    implements _$SeriesCopyWith<$Res> {
  __$SeriesCopyWithImpl(this._self, this._then);

  final _Series _self;
  final $Res Function(_Series) _then;

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? libraryId = freezed,Object? nameIgnorePrefix = freezed,Object? description = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? books = null,Object? numBooks = freezed,Object? sequence = freezed,Object? seriesSequenceList = freezed,Object? libraryItemIds = freezed,Object? progress = freezed,Object? inProgress = freezed,Object? hasActiveBook = freezed,Object? hideFromContinueListening = freezed,Object? bookInProgressLastUpdate = freezed,Object? firstBookUnread = freezed,}) {
  return _then(_Series(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,libraryId: freezed == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String?,nameIgnorePrefix: freezed == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<LibraryItem>,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as String?,seriesSequenceList: freezed == seriesSequenceList ? _self.seriesSequenceList : seriesSequenceList // ignore: cast_nullable_to_non_nullable
as String?,libraryItemIds: freezed == libraryItemIds ? _self._libraryItemIds : libraryItemIds // ignore: cast_nullable_to_non_nullable
as List<String>?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as SeriesProgress?,inProgress: freezed == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as bool?,hasActiveBook: freezed == hasActiveBook ? _self.hasActiveBook : hasActiveBook // ignore: cast_nullable_to_non_nullable
as bool?,hideFromContinueListening: freezed == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool?,bookInProgressLastUpdate: freezed == bookInProgressLastUpdate ? _self.bookInProgressLastUpdate : bookInProgressLastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstBookUnread: freezed == firstBookUnread ? _self.firstBookUnread : firstBookUnread // ignore: cast_nullable_to_non_nullable
as LibraryItem?,
  ));
}

/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $SeriesProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of Series
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<$Res>? get firstBookUnread {
    if (_self.firstBookUnread == null) {
    return null;
  }

  return $LibraryItemCopyWith<$Res>(_self.firstBookUnread!, (value) {
    return _then(_self.copyWith(firstBookUnread: value));
  });
}
}

// dart format on
