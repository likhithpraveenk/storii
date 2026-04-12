// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadTrack _$DownloadTrackFromJson(Map<String, dynamic> json) =>
    _DownloadTrack(
      index: (json['index'] as num).toInt(),
      contentUrl: json['contentUrl'] as String,
      localPath: json['localPath'] as String,
      mimeType: json['mimeType'] as String,
      bytesReceived: (json['bytesReceived'] as num?)?.toInt() ?? 0,
      bytesTotal: (json['bytesTotal'] as num?)?.toInt() ?? 0,
      status:
          $enumDecodeNullable(_$DownloadStatusEnumMap, json['status']) ??
          DownloadStatus.queued,
    );

Map<String, dynamic> _$DownloadTrackToJson(_DownloadTrack instance) =>
    <String, dynamic>{
      'index': instance.index,
      'contentUrl': instance.contentUrl,
      'localPath': instance.localPath,
      'mimeType': instance.mimeType,
      'bytesReceived': instance.bytesReceived,
      'bytesTotal': instance.bytesTotal,
      'status': _$DownloadStatusEnumMap[instance.status]!,
    };

const _$DownloadStatusEnumMap = {
  DownloadStatus.queued: 'queued',
  DownloadStatus.downloading: 'downloading',
  DownloadStatus.complete: 'complete',
  DownloadStatus.failed: 'failed',
  DownloadStatus.paused: 'paused',
};

_DownloadItem _$DownloadItemFromJson(Map<String, dynamic> json) =>
    _DownloadItem(
      libraryItemId: json['libraryItemId'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => DownloadTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          $enumDecodeNullable(_$DownloadStatusEnumMap, json['status']) ??
          DownloadStatus.queued,
      totalBytes: (json['totalBytes'] as num?)?.toInt() ?? 0,
      receivedBytes: (json['receivedBytes'] as num?)?.toInt() ?? 0,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$DownloadItemToJson(_DownloadItem instance) =>
    <String, dynamic>{
      'libraryItemId': instance.libraryItemId,
      'title': instance.title,
      'author': instance.author,
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'status': _$DownloadStatusEnumMap[instance.status]!,
      'totalBytes': instance.totalBytes,
      'receivedBytes': instance.receivedBytes,
      'startedAt': ?instance.startedAt?.toIso8601String(),
      'completedAt': ?instance.completedAt?.toIso8601String(),
    };
