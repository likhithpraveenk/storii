// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerSettings {

 String? get id; bool? get scannerFindCovers; bool? get scannerParseSubtitle; bool? get scannerPreferMatchedMetadata; bool? get scannerDisableWatcher; bool? get storeCoverWithItem; bool? get storeMetadataWithItem; String? get metadataFileFormat; int? get rateLimitLoginRequests;@DurationMsConverter() Duration? get rateLimitLoginWindow; int? get backupsToKeep; int? get maxBackupSize; int? get loggerDailyLogsToKeep; int? get loggerScannerLogsToKeep;@BoolBinaryConverter() bool? get homeBookshelfView;@BoolBinaryConverter() bool? get bookshelfView; bool? get sortingIgnorePrefix; List<String>? get sortingPrefixes; bool? get chromecastEnabled; String? get dateFormat; String? get language; LogLevel? get logLevel; String? get version;
/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSettingsCopyWith<ServerSettings> get copyWith => _$ServerSettingsCopyWithImpl<ServerSettings>(this as ServerSettings, _$identity);

  /// Serializes this ServerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.scannerFindCovers, scannerFindCovers) || other.scannerFindCovers == scannerFindCovers)&&(identical(other.scannerParseSubtitle, scannerParseSubtitle) || other.scannerParseSubtitle == scannerParseSubtitle)&&(identical(other.scannerPreferMatchedMetadata, scannerPreferMatchedMetadata) || other.scannerPreferMatchedMetadata == scannerPreferMatchedMetadata)&&(identical(other.scannerDisableWatcher, scannerDisableWatcher) || other.scannerDisableWatcher == scannerDisableWatcher)&&(identical(other.storeCoverWithItem, storeCoverWithItem) || other.storeCoverWithItem == storeCoverWithItem)&&(identical(other.storeMetadataWithItem, storeMetadataWithItem) || other.storeMetadataWithItem == storeMetadataWithItem)&&(identical(other.metadataFileFormat, metadataFileFormat) || other.metadataFileFormat == metadataFileFormat)&&(identical(other.rateLimitLoginRequests, rateLimitLoginRequests) || other.rateLimitLoginRequests == rateLimitLoginRequests)&&(identical(other.rateLimitLoginWindow, rateLimitLoginWindow) || other.rateLimitLoginWindow == rateLimitLoginWindow)&&(identical(other.backupsToKeep, backupsToKeep) || other.backupsToKeep == backupsToKeep)&&(identical(other.maxBackupSize, maxBackupSize) || other.maxBackupSize == maxBackupSize)&&(identical(other.loggerDailyLogsToKeep, loggerDailyLogsToKeep) || other.loggerDailyLogsToKeep == loggerDailyLogsToKeep)&&(identical(other.loggerScannerLogsToKeep, loggerScannerLogsToKeep) || other.loggerScannerLogsToKeep == loggerScannerLogsToKeep)&&(identical(other.homeBookshelfView, homeBookshelfView) || other.homeBookshelfView == homeBookshelfView)&&(identical(other.bookshelfView, bookshelfView) || other.bookshelfView == bookshelfView)&&(identical(other.sortingIgnorePrefix, sortingIgnorePrefix) || other.sortingIgnorePrefix == sortingIgnorePrefix)&&const DeepCollectionEquality().equals(other.sortingPrefixes, sortingPrefixes)&&(identical(other.chromecastEnabled, chromecastEnabled) || other.chromecastEnabled == chromecastEnabled)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.language, language) || other.language == language)&&(identical(other.logLevel, logLevel) || other.logLevel == logLevel)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,scannerFindCovers,scannerParseSubtitle,scannerPreferMatchedMetadata,scannerDisableWatcher,storeCoverWithItem,storeMetadataWithItem,metadataFileFormat,rateLimitLoginRequests,rateLimitLoginWindow,backupsToKeep,maxBackupSize,loggerDailyLogsToKeep,loggerScannerLogsToKeep,homeBookshelfView,bookshelfView,sortingIgnorePrefix,const DeepCollectionEquality().hash(sortingPrefixes),chromecastEnabled,dateFormat,language,logLevel,version]);

@override
String toString() {
  return 'ServerSettings(id: $id, scannerFindCovers: $scannerFindCovers, scannerParseSubtitle: $scannerParseSubtitle, scannerPreferMatchedMetadata: $scannerPreferMatchedMetadata, scannerDisableWatcher: $scannerDisableWatcher, storeCoverWithItem: $storeCoverWithItem, storeMetadataWithItem: $storeMetadataWithItem, metadataFileFormat: $metadataFileFormat, rateLimitLoginRequests: $rateLimitLoginRequests, rateLimitLoginWindow: $rateLimitLoginWindow, backupsToKeep: $backupsToKeep, maxBackupSize: $maxBackupSize, loggerDailyLogsToKeep: $loggerDailyLogsToKeep, loggerScannerLogsToKeep: $loggerScannerLogsToKeep, homeBookshelfView: $homeBookshelfView, bookshelfView: $bookshelfView, sortingIgnorePrefix: $sortingIgnorePrefix, sortingPrefixes: $sortingPrefixes, chromecastEnabled: $chromecastEnabled, dateFormat: $dateFormat, language: $language, logLevel: $logLevel, version: $version)';
}


}

/// @nodoc
abstract mixin class $ServerSettingsCopyWith<$Res>  {
  factory $ServerSettingsCopyWith(ServerSettings value, $Res Function(ServerSettings) _then) = _$ServerSettingsCopyWithImpl;
@useResult
$Res call({
 String? id, bool? scannerFindCovers, bool? scannerParseSubtitle, bool? scannerPreferMatchedMetadata, bool? scannerDisableWatcher, bool? storeCoverWithItem, bool? storeMetadataWithItem, String? metadataFileFormat, int? rateLimitLoginRequests,@DurationMsConverter() Duration? rateLimitLoginWindow, int? backupsToKeep, int? maxBackupSize, int? loggerDailyLogsToKeep, int? loggerScannerLogsToKeep,@BoolBinaryConverter() bool? homeBookshelfView,@BoolBinaryConverter() bool? bookshelfView, bool? sortingIgnorePrefix, List<String>? sortingPrefixes, bool? chromecastEnabled, String? dateFormat, String? language, LogLevel? logLevel, String? version
});




}
/// @nodoc
class _$ServerSettingsCopyWithImpl<$Res>
    implements $ServerSettingsCopyWith<$Res> {
  _$ServerSettingsCopyWithImpl(this._self, this._then);

  final ServerSettings _self;
  final $Res Function(ServerSettings) _then;

/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? scannerFindCovers = freezed,Object? scannerParseSubtitle = freezed,Object? scannerPreferMatchedMetadata = freezed,Object? scannerDisableWatcher = freezed,Object? storeCoverWithItem = freezed,Object? storeMetadataWithItem = freezed,Object? metadataFileFormat = freezed,Object? rateLimitLoginRequests = freezed,Object? rateLimitLoginWindow = freezed,Object? backupsToKeep = freezed,Object? maxBackupSize = freezed,Object? loggerDailyLogsToKeep = freezed,Object? loggerScannerLogsToKeep = freezed,Object? homeBookshelfView = freezed,Object? bookshelfView = freezed,Object? sortingIgnorePrefix = freezed,Object? sortingPrefixes = freezed,Object? chromecastEnabled = freezed,Object? dateFormat = freezed,Object? language = freezed,Object? logLevel = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,scannerFindCovers: freezed == scannerFindCovers ? _self.scannerFindCovers : scannerFindCovers // ignore: cast_nullable_to_non_nullable
as bool?,scannerParseSubtitle: freezed == scannerParseSubtitle ? _self.scannerParseSubtitle : scannerParseSubtitle // ignore: cast_nullable_to_non_nullable
as bool?,scannerPreferMatchedMetadata: freezed == scannerPreferMatchedMetadata ? _self.scannerPreferMatchedMetadata : scannerPreferMatchedMetadata // ignore: cast_nullable_to_non_nullable
as bool?,scannerDisableWatcher: freezed == scannerDisableWatcher ? _self.scannerDisableWatcher : scannerDisableWatcher // ignore: cast_nullable_to_non_nullable
as bool?,storeCoverWithItem: freezed == storeCoverWithItem ? _self.storeCoverWithItem : storeCoverWithItem // ignore: cast_nullable_to_non_nullable
as bool?,storeMetadataWithItem: freezed == storeMetadataWithItem ? _self.storeMetadataWithItem : storeMetadataWithItem // ignore: cast_nullable_to_non_nullable
as bool?,metadataFileFormat: freezed == metadataFileFormat ? _self.metadataFileFormat : metadataFileFormat // ignore: cast_nullable_to_non_nullable
as String?,rateLimitLoginRequests: freezed == rateLimitLoginRequests ? _self.rateLimitLoginRequests : rateLimitLoginRequests // ignore: cast_nullable_to_non_nullable
as int?,rateLimitLoginWindow: freezed == rateLimitLoginWindow ? _self.rateLimitLoginWindow : rateLimitLoginWindow // ignore: cast_nullable_to_non_nullable
as Duration?,backupsToKeep: freezed == backupsToKeep ? _self.backupsToKeep : backupsToKeep // ignore: cast_nullable_to_non_nullable
as int?,maxBackupSize: freezed == maxBackupSize ? _self.maxBackupSize : maxBackupSize // ignore: cast_nullable_to_non_nullable
as int?,loggerDailyLogsToKeep: freezed == loggerDailyLogsToKeep ? _self.loggerDailyLogsToKeep : loggerDailyLogsToKeep // ignore: cast_nullable_to_non_nullable
as int?,loggerScannerLogsToKeep: freezed == loggerScannerLogsToKeep ? _self.loggerScannerLogsToKeep : loggerScannerLogsToKeep // ignore: cast_nullable_to_non_nullable
as int?,homeBookshelfView: freezed == homeBookshelfView ? _self.homeBookshelfView : homeBookshelfView // ignore: cast_nullable_to_non_nullable
as bool?,bookshelfView: freezed == bookshelfView ? _self.bookshelfView : bookshelfView // ignore: cast_nullable_to_non_nullable
as bool?,sortingIgnorePrefix: freezed == sortingIgnorePrefix ? _self.sortingIgnorePrefix : sortingIgnorePrefix // ignore: cast_nullable_to_non_nullable
as bool?,sortingPrefixes: freezed == sortingPrefixes ? _self.sortingPrefixes : sortingPrefixes // ignore: cast_nullable_to_non_nullable
as List<String>?,chromecastEnabled: freezed == chromecastEnabled ? _self.chromecastEnabled : chromecastEnabled // ignore: cast_nullable_to_non_nullable
as bool?,dateFormat: freezed == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,logLevel: freezed == logLevel ? _self.logLevel : logLevel // ignore: cast_nullable_to_non_nullable
as LogLevel?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerSettings].
extension ServerSettingsPatterns on ServerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerSettings value)  $default,){
final _that = this;
switch (_that) {
case _ServerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  bool? scannerFindCovers,  bool? scannerParseSubtitle,  bool? scannerPreferMatchedMetadata,  bool? scannerDisableWatcher,  bool? storeCoverWithItem,  bool? storeMetadataWithItem,  String? metadataFileFormat,  int? rateLimitLoginRequests, @DurationMsConverter()  Duration? rateLimitLoginWindow,  int? backupsToKeep,  int? maxBackupSize,  int? loggerDailyLogsToKeep,  int? loggerScannerLogsToKeep, @BoolBinaryConverter()  bool? homeBookshelfView, @BoolBinaryConverter()  bool? bookshelfView,  bool? sortingIgnorePrefix,  List<String>? sortingPrefixes,  bool? chromecastEnabled,  String? dateFormat,  String? language,  LogLevel? logLevel,  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
return $default(_that.id,_that.scannerFindCovers,_that.scannerParseSubtitle,_that.scannerPreferMatchedMetadata,_that.scannerDisableWatcher,_that.storeCoverWithItem,_that.storeMetadataWithItem,_that.metadataFileFormat,_that.rateLimitLoginRequests,_that.rateLimitLoginWindow,_that.backupsToKeep,_that.maxBackupSize,_that.loggerDailyLogsToKeep,_that.loggerScannerLogsToKeep,_that.homeBookshelfView,_that.bookshelfView,_that.sortingIgnorePrefix,_that.sortingPrefixes,_that.chromecastEnabled,_that.dateFormat,_that.language,_that.logLevel,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  bool? scannerFindCovers,  bool? scannerParseSubtitle,  bool? scannerPreferMatchedMetadata,  bool? scannerDisableWatcher,  bool? storeCoverWithItem,  bool? storeMetadataWithItem,  String? metadataFileFormat,  int? rateLimitLoginRequests, @DurationMsConverter()  Duration? rateLimitLoginWindow,  int? backupsToKeep,  int? maxBackupSize,  int? loggerDailyLogsToKeep,  int? loggerScannerLogsToKeep, @BoolBinaryConverter()  bool? homeBookshelfView, @BoolBinaryConverter()  bool? bookshelfView,  bool? sortingIgnorePrefix,  List<String>? sortingPrefixes,  bool? chromecastEnabled,  String? dateFormat,  String? language,  LogLevel? logLevel,  String? version)  $default,) {final _that = this;
switch (_that) {
case _ServerSettings():
return $default(_that.id,_that.scannerFindCovers,_that.scannerParseSubtitle,_that.scannerPreferMatchedMetadata,_that.scannerDisableWatcher,_that.storeCoverWithItem,_that.storeMetadataWithItem,_that.metadataFileFormat,_that.rateLimitLoginRequests,_that.rateLimitLoginWindow,_that.backupsToKeep,_that.maxBackupSize,_that.loggerDailyLogsToKeep,_that.loggerScannerLogsToKeep,_that.homeBookshelfView,_that.bookshelfView,_that.sortingIgnorePrefix,_that.sortingPrefixes,_that.chromecastEnabled,_that.dateFormat,_that.language,_that.logLevel,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  bool? scannerFindCovers,  bool? scannerParseSubtitle,  bool? scannerPreferMatchedMetadata,  bool? scannerDisableWatcher,  bool? storeCoverWithItem,  bool? storeMetadataWithItem,  String? metadataFileFormat,  int? rateLimitLoginRequests, @DurationMsConverter()  Duration? rateLimitLoginWindow,  int? backupsToKeep,  int? maxBackupSize,  int? loggerDailyLogsToKeep,  int? loggerScannerLogsToKeep, @BoolBinaryConverter()  bool? homeBookshelfView, @BoolBinaryConverter()  bool? bookshelfView,  bool? sortingIgnorePrefix,  List<String>? sortingPrefixes,  bool? chromecastEnabled,  String? dateFormat,  String? language,  LogLevel? logLevel,  String? version)?  $default,) {final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
return $default(_that.id,_that.scannerFindCovers,_that.scannerParseSubtitle,_that.scannerPreferMatchedMetadata,_that.scannerDisableWatcher,_that.storeCoverWithItem,_that.storeMetadataWithItem,_that.metadataFileFormat,_that.rateLimitLoginRequests,_that.rateLimitLoginWindow,_that.backupsToKeep,_that.maxBackupSize,_that.loggerDailyLogsToKeep,_that.loggerScannerLogsToKeep,_that.homeBookshelfView,_that.bookshelfView,_that.sortingIgnorePrefix,_that.sortingPrefixes,_that.chromecastEnabled,_that.dateFormat,_that.language,_that.logLevel,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerSettings implements ServerSettings {
  const _ServerSettings({this.id, this.scannerFindCovers, this.scannerParseSubtitle, this.scannerPreferMatchedMetadata, this.scannerDisableWatcher, this.storeCoverWithItem, this.storeMetadataWithItem, this.metadataFileFormat, this.rateLimitLoginRequests, @DurationMsConverter() this.rateLimitLoginWindow, this.backupsToKeep, this.maxBackupSize, this.loggerDailyLogsToKeep, this.loggerScannerLogsToKeep, @BoolBinaryConverter() this.homeBookshelfView, @BoolBinaryConverter() this.bookshelfView, this.sortingIgnorePrefix, final  List<String>? sortingPrefixes, this.chromecastEnabled, this.dateFormat, this.language, this.logLevel, this.version}): _sortingPrefixes = sortingPrefixes;
  factory _ServerSettings.fromJson(Map<String, dynamic> json) => _$ServerSettingsFromJson(json);

@override final  String? id;
@override final  bool? scannerFindCovers;
@override final  bool? scannerParseSubtitle;
@override final  bool? scannerPreferMatchedMetadata;
@override final  bool? scannerDisableWatcher;
@override final  bool? storeCoverWithItem;
@override final  bool? storeMetadataWithItem;
@override final  String? metadataFileFormat;
@override final  int? rateLimitLoginRequests;
@override@DurationMsConverter() final  Duration? rateLimitLoginWindow;
@override final  int? backupsToKeep;
@override final  int? maxBackupSize;
@override final  int? loggerDailyLogsToKeep;
@override final  int? loggerScannerLogsToKeep;
@override@BoolBinaryConverter() final  bool? homeBookshelfView;
@override@BoolBinaryConverter() final  bool? bookshelfView;
@override final  bool? sortingIgnorePrefix;
 final  List<String>? _sortingPrefixes;
@override List<String>? get sortingPrefixes {
  final value = _sortingPrefixes;
  if (value == null) return null;
  if (_sortingPrefixes is EqualUnmodifiableListView) return _sortingPrefixes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? chromecastEnabled;
@override final  String? dateFormat;
@override final  String? language;
@override final  LogLevel? logLevel;
@override final  String? version;

/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerSettingsCopyWith<_ServerSettings> get copyWith => __$ServerSettingsCopyWithImpl<_ServerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.scannerFindCovers, scannerFindCovers) || other.scannerFindCovers == scannerFindCovers)&&(identical(other.scannerParseSubtitle, scannerParseSubtitle) || other.scannerParseSubtitle == scannerParseSubtitle)&&(identical(other.scannerPreferMatchedMetadata, scannerPreferMatchedMetadata) || other.scannerPreferMatchedMetadata == scannerPreferMatchedMetadata)&&(identical(other.scannerDisableWatcher, scannerDisableWatcher) || other.scannerDisableWatcher == scannerDisableWatcher)&&(identical(other.storeCoverWithItem, storeCoverWithItem) || other.storeCoverWithItem == storeCoverWithItem)&&(identical(other.storeMetadataWithItem, storeMetadataWithItem) || other.storeMetadataWithItem == storeMetadataWithItem)&&(identical(other.metadataFileFormat, metadataFileFormat) || other.metadataFileFormat == metadataFileFormat)&&(identical(other.rateLimitLoginRequests, rateLimitLoginRequests) || other.rateLimitLoginRequests == rateLimitLoginRequests)&&(identical(other.rateLimitLoginWindow, rateLimitLoginWindow) || other.rateLimitLoginWindow == rateLimitLoginWindow)&&(identical(other.backupsToKeep, backupsToKeep) || other.backupsToKeep == backupsToKeep)&&(identical(other.maxBackupSize, maxBackupSize) || other.maxBackupSize == maxBackupSize)&&(identical(other.loggerDailyLogsToKeep, loggerDailyLogsToKeep) || other.loggerDailyLogsToKeep == loggerDailyLogsToKeep)&&(identical(other.loggerScannerLogsToKeep, loggerScannerLogsToKeep) || other.loggerScannerLogsToKeep == loggerScannerLogsToKeep)&&(identical(other.homeBookshelfView, homeBookshelfView) || other.homeBookshelfView == homeBookshelfView)&&(identical(other.bookshelfView, bookshelfView) || other.bookshelfView == bookshelfView)&&(identical(other.sortingIgnorePrefix, sortingIgnorePrefix) || other.sortingIgnorePrefix == sortingIgnorePrefix)&&const DeepCollectionEquality().equals(other._sortingPrefixes, _sortingPrefixes)&&(identical(other.chromecastEnabled, chromecastEnabled) || other.chromecastEnabled == chromecastEnabled)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.language, language) || other.language == language)&&(identical(other.logLevel, logLevel) || other.logLevel == logLevel)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,scannerFindCovers,scannerParseSubtitle,scannerPreferMatchedMetadata,scannerDisableWatcher,storeCoverWithItem,storeMetadataWithItem,metadataFileFormat,rateLimitLoginRequests,rateLimitLoginWindow,backupsToKeep,maxBackupSize,loggerDailyLogsToKeep,loggerScannerLogsToKeep,homeBookshelfView,bookshelfView,sortingIgnorePrefix,const DeepCollectionEquality().hash(_sortingPrefixes),chromecastEnabled,dateFormat,language,logLevel,version]);

@override
String toString() {
  return 'ServerSettings(id: $id, scannerFindCovers: $scannerFindCovers, scannerParseSubtitle: $scannerParseSubtitle, scannerPreferMatchedMetadata: $scannerPreferMatchedMetadata, scannerDisableWatcher: $scannerDisableWatcher, storeCoverWithItem: $storeCoverWithItem, storeMetadataWithItem: $storeMetadataWithItem, metadataFileFormat: $metadataFileFormat, rateLimitLoginRequests: $rateLimitLoginRequests, rateLimitLoginWindow: $rateLimitLoginWindow, backupsToKeep: $backupsToKeep, maxBackupSize: $maxBackupSize, loggerDailyLogsToKeep: $loggerDailyLogsToKeep, loggerScannerLogsToKeep: $loggerScannerLogsToKeep, homeBookshelfView: $homeBookshelfView, bookshelfView: $bookshelfView, sortingIgnorePrefix: $sortingIgnorePrefix, sortingPrefixes: $sortingPrefixes, chromecastEnabled: $chromecastEnabled, dateFormat: $dateFormat, language: $language, logLevel: $logLevel, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ServerSettingsCopyWith<$Res> implements $ServerSettingsCopyWith<$Res> {
  factory _$ServerSettingsCopyWith(_ServerSettings value, $Res Function(_ServerSettings) _then) = __$ServerSettingsCopyWithImpl;
@override @useResult
$Res call({
 String? id, bool? scannerFindCovers, bool? scannerParseSubtitle, bool? scannerPreferMatchedMetadata, bool? scannerDisableWatcher, bool? storeCoverWithItem, bool? storeMetadataWithItem, String? metadataFileFormat, int? rateLimitLoginRequests,@DurationMsConverter() Duration? rateLimitLoginWindow, int? backupsToKeep, int? maxBackupSize, int? loggerDailyLogsToKeep, int? loggerScannerLogsToKeep,@BoolBinaryConverter() bool? homeBookshelfView,@BoolBinaryConverter() bool? bookshelfView, bool? sortingIgnorePrefix, List<String>? sortingPrefixes, bool? chromecastEnabled, String? dateFormat, String? language, LogLevel? logLevel, String? version
});




}
/// @nodoc
class __$ServerSettingsCopyWithImpl<$Res>
    implements _$ServerSettingsCopyWith<$Res> {
  __$ServerSettingsCopyWithImpl(this._self, this._then);

  final _ServerSettings _self;
  final $Res Function(_ServerSettings) _then;

/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? scannerFindCovers = freezed,Object? scannerParseSubtitle = freezed,Object? scannerPreferMatchedMetadata = freezed,Object? scannerDisableWatcher = freezed,Object? storeCoverWithItem = freezed,Object? storeMetadataWithItem = freezed,Object? metadataFileFormat = freezed,Object? rateLimitLoginRequests = freezed,Object? rateLimitLoginWindow = freezed,Object? backupsToKeep = freezed,Object? maxBackupSize = freezed,Object? loggerDailyLogsToKeep = freezed,Object? loggerScannerLogsToKeep = freezed,Object? homeBookshelfView = freezed,Object? bookshelfView = freezed,Object? sortingIgnorePrefix = freezed,Object? sortingPrefixes = freezed,Object? chromecastEnabled = freezed,Object? dateFormat = freezed,Object? language = freezed,Object? logLevel = freezed,Object? version = freezed,}) {
  return _then(_ServerSettings(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,scannerFindCovers: freezed == scannerFindCovers ? _self.scannerFindCovers : scannerFindCovers // ignore: cast_nullable_to_non_nullable
as bool?,scannerParseSubtitle: freezed == scannerParseSubtitle ? _self.scannerParseSubtitle : scannerParseSubtitle // ignore: cast_nullable_to_non_nullable
as bool?,scannerPreferMatchedMetadata: freezed == scannerPreferMatchedMetadata ? _self.scannerPreferMatchedMetadata : scannerPreferMatchedMetadata // ignore: cast_nullable_to_non_nullable
as bool?,scannerDisableWatcher: freezed == scannerDisableWatcher ? _self.scannerDisableWatcher : scannerDisableWatcher // ignore: cast_nullable_to_non_nullable
as bool?,storeCoverWithItem: freezed == storeCoverWithItem ? _self.storeCoverWithItem : storeCoverWithItem // ignore: cast_nullable_to_non_nullable
as bool?,storeMetadataWithItem: freezed == storeMetadataWithItem ? _self.storeMetadataWithItem : storeMetadataWithItem // ignore: cast_nullable_to_non_nullable
as bool?,metadataFileFormat: freezed == metadataFileFormat ? _self.metadataFileFormat : metadataFileFormat // ignore: cast_nullable_to_non_nullable
as String?,rateLimitLoginRequests: freezed == rateLimitLoginRequests ? _self.rateLimitLoginRequests : rateLimitLoginRequests // ignore: cast_nullable_to_non_nullable
as int?,rateLimitLoginWindow: freezed == rateLimitLoginWindow ? _self.rateLimitLoginWindow : rateLimitLoginWindow // ignore: cast_nullable_to_non_nullable
as Duration?,backupsToKeep: freezed == backupsToKeep ? _self.backupsToKeep : backupsToKeep // ignore: cast_nullable_to_non_nullable
as int?,maxBackupSize: freezed == maxBackupSize ? _self.maxBackupSize : maxBackupSize // ignore: cast_nullable_to_non_nullable
as int?,loggerDailyLogsToKeep: freezed == loggerDailyLogsToKeep ? _self.loggerDailyLogsToKeep : loggerDailyLogsToKeep // ignore: cast_nullable_to_non_nullable
as int?,loggerScannerLogsToKeep: freezed == loggerScannerLogsToKeep ? _self.loggerScannerLogsToKeep : loggerScannerLogsToKeep // ignore: cast_nullable_to_non_nullable
as int?,homeBookshelfView: freezed == homeBookshelfView ? _self.homeBookshelfView : homeBookshelfView // ignore: cast_nullable_to_non_nullable
as bool?,bookshelfView: freezed == bookshelfView ? _self.bookshelfView : bookshelfView // ignore: cast_nullable_to_non_nullable
as bool?,sortingIgnorePrefix: freezed == sortingIgnorePrefix ? _self.sortingIgnorePrefix : sortingIgnorePrefix // ignore: cast_nullable_to_non_nullable
as bool?,sortingPrefixes: freezed == sortingPrefixes ? _self._sortingPrefixes : sortingPrefixes // ignore: cast_nullable_to_non_nullable
as List<String>?,chromecastEnabled: freezed == chromecastEnabled ? _self.chromecastEnabled : chromecastEnabled // ignore: cast_nullable_to_non_nullable
as bool?,dateFormat: freezed == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,logLevel: freezed == logLevel ? _self.logLevel : logLevel // ignore: cast_nullable_to_non_nullable
as LogLevel?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
