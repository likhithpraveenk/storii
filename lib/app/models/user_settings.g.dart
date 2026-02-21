// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      userId: json['userId'] as String,
      currentLibraryId: json['currentLibraryId'] as String?,
      isFullySynced: json['isFullySynced'] as bool? ?? false,
      isItemsGridView: json['isItemsGridView'] as bool? ?? true,
      isSeriesGridView: json['isSeriesGridView'] as bool? ?? true,
      isAuthorsGridView: json['isAuthorsGridView'] as bool? ?? true,
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentLibraryId': ?instance.currentLibraryId,
      'isFullySynced': instance.isFullySynced,
      'isItemsGridView': instance.isItemsGridView,
      'isSeriesGridView': instance.isSeriesGridView,
      'isAuthorsGridView': instance.isAuthorsGridView,
    };
