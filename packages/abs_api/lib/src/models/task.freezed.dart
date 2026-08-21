// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {

 String? get id; String? get action; TaskData? get data; String? get title; List<String>? get titleSubs; String? get description; List<String>? get descriptionSubs; String? get error; List<String>? get errorSubs; bool get showSuccess; bool get isFailed; bool get isFinished; DateTime? get startedAt; DateTime? get finishedAt;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.data, data) || other.data == data)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.titleSubs, titleSubs)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.descriptionSubs, descriptionSubs)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.errorSubs, errorSubs)&&(identical(other.showSuccess, showSuccess) || other.showSuccess == showSuccess)&&(identical(other.isFailed, isFailed) || other.isFailed == isFailed)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,data,title,const DeepCollectionEquality().hash(titleSubs),description,const DeepCollectionEquality().hash(descriptionSubs),error,const DeepCollectionEquality().hash(errorSubs),showSuccess,isFailed,isFinished,startedAt,finishedAt);

@override
String toString() {
  return 'Task(id: $id, action: $action, data: $data, title: $title, titleSubs: $titleSubs, description: $description, descriptionSubs: $descriptionSubs, error: $error, errorSubs: $errorSubs, showSuccess: $showSuccess, isFailed: $isFailed, isFinished: $isFinished, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 String? id, String? action, TaskData? data, String? title, List<String>? titleSubs, String? description, List<String>? descriptionSubs, String? error, List<String>? errorSubs, bool showSuccess, bool isFailed, bool isFinished, DateTime? startedAt, DateTime? finishedAt
});


$TaskDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? action = freezed,Object? data = freezed,Object? title = freezed,Object? titleSubs = freezed,Object? description = freezed,Object? descriptionSubs = freezed,Object? error = freezed,Object? errorSubs = freezed,Object? showSuccess = null,Object? isFailed = null,Object? isFinished = null,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(Task(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TaskData?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleSubs: freezed == titleSubs ? _self.titleSubs : titleSubs // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionSubs: freezed == descriptionSubs ? _self.descriptionSubs : descriptionSubs // ignore: cast_nullable_to_non_nullable
as List<String>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorSubs: freezed == errorSubs ? _self.errorSubs : errorSubs // ignore: cast_nullable_to_non_nullable
as List<String>?,showSuccess: null == showSuccess ? _self.showSuccess : showSuccess // ignore: cast_nullable_to_non_nullable
as bool,isFailed: null == isFailed ? _self.isFailed : isFailed // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TaskDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? action,  TaskData? data,  String? title,  List<String>? titleSubs,  String? description,  List<String>? descriptionSubs,  String? error,  List<String>? errorSubs,  bool showSuccess,  bool isFailed,  bool isFinished,  DateTime? startedAt,  DateTime? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.action,_that.data,_that.title,_that.titleSubs,_that.description,_that.descriptionSubs,_that.error,_that.errorSubs,_that.showSuccess,_that.isFailed,_that.isFinished,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? action,  TaskData? data,  String? title,  List<String>? titleSubs,  String? description,  List<String>? descriptionSubs,  String? error,  List<String>? errorSubs,  bool showSuccess,  bool isFailed,  bool isFinished,  DateTime? startedAt,  DateTime? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.action,_that.data,_that.title,_that.titleSubs,_that.description,_that.descriptionSubs,_that.error,_that.errorSubs,_that.showSuccess,_that.isFailed,_that.isFinished,_that.startedAt,_that.finishedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? action,  TaskData? data,  String? title,  List<String>? titleSubs,  String? description,  List<String>? descriptionSubs,  String? error,  List<String>? errorSubs,  bool showSuccess,  bool isFailed,  bool isFinished,  DateTime? startedAt,  DateTime? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.action,_that.data,_that.title,_that.titleSubs,_that.description,_that.descriptionSubs,_that.error,_that.errorSubs,_that.showSuccess,_that.isFailed,_that.isFinished,_that.startedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _Task implements Task {
  const _Task({this.id, this.action, this.data, this.title,  List<String>? titleSubs, this.description,  List<String>? descriptionSubs, this.error,  List<String>? errorSubs, this.showSuccess = false, this.isFailed = false, this.isFinished = false, this.startedAt, this.finishedAt}): _titleSubs = titleSubs,_descriptionSubs = descriptionSubs,_errorSubs = errorSubs;
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override final  String? id;
@override final  String? action;
@override final  TaskData? data;
@override final  String? title;
 final  List<String>? _titleSubs;
@override List<String>? get titleSubs {
  final value = _titleSubs;
  if (value == null) return null;
  if (_titleSubs is EqualUnmodifiableListView) return _titleSubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? description;
 final  List<String>? _descriptionSubs;
@override List<String>? get descriptionSubs {
  final value = _descriptionSubs;
  if (value == null) return null;
  if (_descriptionSubs is EqualUnmodifiableListView) return _descriptionSubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? error;
 final  List<String>? _errorSubs;
@override List<String>? get errorSubs {
  final value = _errorSubs;
  if (value == null) return null;
  if (_errorSubs is EqualUnmodifiableListView) return _errorSubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool showSuccess;
@override@JsonKey() final  bool isFailed;
@override@JsonKey() final  bool isFinished;
@override final  DateTime? startedAt;
@override final  DateTime? finishedAt;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.data, data) || other.data == data)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._titleSubs, _titleSubs)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._descriptionSubs, _descriptionSubs)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._errorSubs, _errorSubs)&&(identical(other.showSuccess, showSuccess) || other.showSuccess == showSuccess)&&(identical(other.isFailed, isFailed) || other.isFailed == isFailed)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,data,title,const DeepCollectionEquality().hash(_titleSubs),description,const DeepCollectionEquality().hash(_descriptionSubs),error,const DeepCollectionEquality().hash(_errorSubs),showSuccess,isFailed,isFinished,startedAt,finishedAt);

@override
String toString() {
  return 'Task(id: $id, action: $action, data: $data, title: $title, titleSubs: $titleSubs, description: $description, descriptionSubs: $descriptionSubs, error: $error, errorSubs: $errorSubs, showSuccess: $showSuccess, isFailed: $isFailed, isFinished: $isFinished, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? action, TaskData? data, String? title, List<String>? titleSubs, String? description, List<String>? descriptionSubs, String? error, List<String>? errorSubs, bool showSuccess, bool isFailed, bool isFinished, DateTime? startedAt, DateTime? finishedAt
});


@override $TaskDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? action = freezed,Object? data = freezed,Object? title = freezed,Object? titleSubs = freezed,Object? description = freezed,Object? descriptionSubs = freezed,Object? error = freezed,Object? errorSubs = freezed,Object? showSuccess = null,Object? isFailed = null,Object? isFinished = null,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_Task(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TaskData?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleSubs: freezed == titleSubs ? _self._titleSubs : titleSubs // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionSubs: freezed == descriptionSubs ? _self._descriptionSubs : descriptionSubs // ignore: cast_nullable_to_non_nullable
as List<String>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorSubs: freezed == errorSubs ? _self._errorSubs : errorSubs // ignore: cast_nullable_to_non_nullable
as List<String>?,showSuccess: null == showSuccess ? _self.showSuccess : showSuccess // ignore: cast_nullable_to_non_nullable
as bool,isFailed: null == isFailed ? _self.isFailed : isFailed // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TaskDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$TaskData {

 String? get libraryId; String? get libraryName; MediaType? get libraryMediaType; TaskScanResults? get scanResults;
/// Create a copy of TaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDataCopyWith<TaskData> get copyWith => _$TaskDataCopyWithImpl<TaskData>(this as TaskData, _$identity);

  /// Serializes this TaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskData&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.libraryName, libraryName) || other.libraryName == libraryName)&&(identical(other.libraryMediaType, libraryMediaType) || other.libraryMediaType == libraryMediaType)&&(identical(other.scanResults, scanResults) || other.scanResults == scanResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,libraryName,libraryMediaType,scanResults);

@override
String toString() {
  return 'TaskData(libraryId: $libraryId, libraryName: $libraryName, libraryMediaType: $libraryMediaType, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class $TaskDataCopyWith<$Res>  {
  factory $TaskDataCopyWith(TaskData value, $Res Function(TaskData) _then) = _$TaskDataCopyWithImpl;
@useResult
$Res call({
 String? libraryId, String? libraryName, MediaType? libraryMediaType, TaskScanResults? scanResults
});


$TaskScanResultsCopyWith<$Res>? get scanResults;

}
/// @nodoc
class _$TaskDataCopyWithImpl<$Res>
    implements $TaskDataCopyWith<$Res> {
  _$TaskDataCopyWithImpl(this._self, this._then);

  final TaskData _self;
  final $Res Function(TaskData) _then;

/// Create a copy of TaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraryId = freezed,Object? libraryName = freezed,Object? libraryMediaType = freezed,Object? scanResults = freezed,}) {
  return _then(TaskData(
libraryId: freezed == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String?,libraryName: freezed == libraryName ? _self.libraryName : libraryName // ignore: cast_nullable_to_non_nullable
as String?,libraryMediaType: freezed == libraryMediaType ? _self.libraryMediaType : libraryMediaType // ignore: cast_nullable_to_non_nullable
as MediaType?,scanResults: freezed == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as TaskScanResults?,
  ));
}
/// Create a copy of TaskData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskScanResultsCopyWith<$Res>? get scanResults {
    if (_self.scanResults == null) {
    return null;
  }

  return $TaskScanResultsCopyWith<$Res>(_self.scanResults!, (value) {
    return _then(_self.copyWith(scanResults: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskData].
extension TaskDataPatterns on TaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskData value)  $default,){
final _that = this;
switch (_that) {
case _TaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskData value)?  $default,){
final _that = this;
switch (_that) {
case _TaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? libraryId,  String? libraryName,  MediaType? libraryMediaType,  TaskScanResults? scanResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskData() when $default != null:
return $default(_that.libraryId,_that.libraryName,_that.libraryMediaType,_that.scanResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? libraryId,  String? libraryName,  MediaType? libraryMediaType,  TaskScanResults? scanResults)  $default,) {final _that = this;
switch (_that) {
case _TaskData():
return $default(_that.libraryId,_that.libraryName,_that.libraryMediaType,_that.scanResults);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? libraryId,  String? libraryName,  MediaType? libraryMediaType,  TaskScanResults? scanResults)?  $default,) {final _that = this;
switch (_that) {
case _TaskData() when $default != null:
return $default(_that.libraryId,_that.libraryName,_that.libraryMediaType,_that.scanResults);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskData implements TaskData {
  const _TaskData({this.libraryId, this.libraryName, this.libraryMediaType, this.scanResults});
  factory _TaskData.fromJson(Map<String, dynamic> json) => _$TaskDataFromJson(json);

@override final  String? libraryId;
@override final  String? libraryName;
@override final  MediaType? libraryMediaType;
@override final  TaskScanResults? scanResults;

/// Create a copy of TaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDataCopyWith<_TaskData> get copyWith => __$TaskDataCopyWithImpl<_TaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskData&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.libraryName, libraryName) || other.libraryName == libraryName)&&(identical(other.libraryMediaType, libraryMediaType) || other.libraryMediaType == libraryMediaType)&&(identical(other.scanResults, scanResults) || other.scanResults == scanResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,libraryId,libraryName,libraryMediaType,scanResults);

@override
String toString() {
  return 'TaskData(libraryId: $libraryId, libraryName: $libraryName, libraryMediaType: $libraryMediaType, scanResults: $scanResults)';
}


}

/// @nodoc
abstract mixin class _$TaskDataCopyWith<$Res> implements $TaskDataCopyWith<$Res> {
  factory _$TaskDataCopyWith(_TaskData value, $Res Function(_TaskData) _then) = __$TaskDataCopyWithImpl;
@override @useResult
$Res call({
 String? libraryId, String? libraryName, MediaType? libraryMediaType, TaskScanResults? scanResults
});


@override $TaskScanResultsCopyWith<$Res>? get scanResults;

}
/// @nodoc
class __$TaskDataCopyWithImpl<$Res>
    implements _$TaskDataCopyWith<$Res> {
  __$TaskDataCopyWithImpl(this._self, this._then);

  final _TaskData _self;
  final $Res Function(_TaskData) _then;

/// Create a copy of TaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraryId = freezed,Object? libraryName = freezed,Object? libraryMediaType = freezed,Object? scanResults = freezed,}) {
  return _then(_TaskData(
libraryId: freezed == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String?,libraryName: freezed == libraryName ? _self.libraryName : libraryName // ignore: cast_nullable_to_non_nullable
as String?,libraryMediaType: freezed == libraryMediaType ? _self.libraryMediaType : libraryMediaType // ignore: cast_nullable_to_non_nullable
as MediaType?,scanResults: freezed == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as TaskScanResults?,
  ));
}

/// Create a copy of TaskData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskScanResultsCopyWith<$Res>? get scanResults {
    if (_self.scanResults == null) {
    return null;
  }

  return $TaskScanResultsCopyWith<$Res>(_self.scanResults!, (value) {
    return _then(_self.copyWith(scanResults: value));
  });
}
}


/// @nodoc
mixin _$TaskScanResults {

 int? get added; int? get updated; int? get missing; int? get elapsed; String? get text;
/// Create a copy of TaskScanResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskScanResultsCopyWith<TaskScanResults> get copyWith => _$TaskScanResultsCopyWithImpl<TaskScanResults>(this as TaskScanResults, _$identity);

  /// Serializes this TaskScanResults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskScanResults&&(identical(other.added, added) || other.added == added)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.missing, missing) || other.missing == missing)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,added,updated,missing,elapsed,text);

@override
String toString() {
  return 'TaskScanResults(added: $added, updated: $updated, missing: $missing, elapsed: $elapsed, text: $text)';
}


}

/// @nodoc
abstract mixin class $TaskScanResultsCopyWith<$Res>  {
  factory $TaskScanResultsCopyWith(TaskScanResults value, $Res Function(TaskScanResults) _then) = _$TaskScanResultsCopyWithImpl;
@useResult
$Res call({
 int? added, int? updated, int? missing, int? elapsed, String? text
});




}
/// @nodoc
class _$TaskScanResultsCopyWithImpl<$Res>
    implements $TaskScanResultsCopyWith<$Res> {
  _$TaskScanResultsCopyWithImpl(this._self, this._then);

  final TaskScanResults _self;
  final $Res Function(TaskScanResults) _then;

/// Create a copy of TaskScanResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = freezed,Object? updated = freezed,Object? missing = freezed,Object? elapsed = freezed,Object? text = freezed,}) {
  return _then(TaskScanResults(
added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as int?,missing: freezed == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as int?,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskScanResults].
extension TaskScanResultsPatterns on TaskScanResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskScanResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskScanResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskScanResults value)  $default,){
final _that = this;
switch (_that) {
case _TaskScanResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskScanResults value)?  $default,){
final _that = this;
switch (_that) {
case _TaskScanResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? added,  int? updated,  int? missing,  int? elapsed,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskScanResults() when $default != null:
return $default(_that.added,_that.updated,_that.missing,_that.elapsed,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? added,  int? updated,  int? missing,  int? elapsed,  String? text)  $default,) {final _that = this;
switch (_that) {
case _TaskScanResults():
return $default(_that.added,_that.updated,_that.missing,_that.elapsed,_that.text);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? added,  int? updated,  int? missing,  int? elapsed,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _TaskScanResults() when $default != null:
return $default(_that.added,_that.updated,_that.missing,_that.elapsed,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskScanResults implements TaskScanResults {
  const _TaskScanResults({this.added, this.updated, this.missing, this.elapsed, this.text});
  factory _TaskScanResults.fromJson(Map<String, dynamic> json) => _$TaskScanResultsFromJson(json);

@override final  int? added;
@override final  int? updated;
@override final  int? missing;
@override final  int? elapsed;
@override final  String? text;

/// Create a copy of TaskScanResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskScanResultsCopyWith<_TaskScanResults> get copyWith => __$TaskScanResultsCopyWithImpl<_TaskScanResults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskScanResultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskScanResults&&(identical(other.added, added) || other.added == added)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.missing, missing) || other.missing == missing)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,added,updated,missing,elapsed,text);

@override
String toString() {
  return 'TaskScanResults(added: $added, updated: $updated, missing: $missing, elapsed: $elapsed, text: $text)';
}


}

/// @nodoc
abstract mixin class _$TaskScanResultsCopyWith<$Res> implements $TaskScanResultsCopyWith<$Res> {
  factory _$TaskScanResultsCopyWith(_TaskScanResults value, $Res Function(_TaskScanResults) _then) = __$TaskScanResultsCopyWithImpl;
@override @useResult
$Res call({
 int? added, int? updated, int? missing, int? elapsed, String? text
});




}
/// @nodoc
class __$TaskScanResultsCopyWithImpl<$Res>
    implements _$TaskScanResultsCopyWith<$Res> {
  __$TaskScanResultsCopyWithImpl(this._self, this._then);

  final _TaskScanResults _self;
  final $Res Function(_TaskScanResults) _then;

/// Create a copy of TaskScanResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = freezed,Object? updated = freezed,Object? missing = freezed,Object? elapsed = freezed,Object? text = freezed,}) {
  return _then(_TaskScanResults(
added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as int?,missing: freezed == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as int?,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
