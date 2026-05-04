// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadTrack _$DownloadTrackFromJson(Map<String, dynamic> json) =>
    _DownloadTrack(
      audioTrack: AudioTrack.fromJson(
        json['audioTrack'] as Map<String, dynamic>,
      ),
      localPath: json['localPath'] as String,
      ino: json['ino'] as String?,
      bytesReceived: (json['bytesReceived'] as num?)?.toInt() ?? 0,
      bytesTotal: (json['bytesTotal'] as num?)?.toInt() ?? 0,
      status:
          $enumDecodeNullable(_$DownloadStatusEnumMap, json['status']) ??
          DownloadStatus.queued,
    );

Map<String, dynamic> _$DownloadTrackToJson(_DownloadTrack instance) =>
    <String, dynamic>{
      'audioTrack': instance.audioTrack.toJson(),
      'localPath': instance.localPath,
      'ino': ?instance.ino,
      'bytesReceived': instance.bytesReceived,
      'bytesTotal': instance.bytesTotal,
      'status': _$DownloadStatusEnumMap[instance.status]!,
    };

const _$DownloadStatusEnumMap = {
  DownloadStatus.queued: 'queued',
  DownloadStatus.downloading: 'downloading',
  DownloadStatus.completed: 'completed',
  DownloadStatus.failed: 'failed',
  DownloadStatus.paused: 'paused',
  DownloadStatus.cancelled: 'cancelled',
};

_DownloadItem _$DownloadItemFromJson(Map<String, dynamic> json) =>
    _DownloadItem(
      serverUrl: Uri.parse(json['serverUrl'] as String),
      libraryItemId: json['libraryItemId'] as String,
      userId: json['userId'] as String,
      libraryItem: LibraryItem.fromJson(
        json['libraryItem'] as Map<String, dynamic>,
      ),
      title: json['title'] as String,
      author: json['author'] as String,
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => DownloadTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          $enumDecodeNullable(_$DownloadStatusEnumMap, json['status']) ??
          DownloadStatus.queued,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
    );

Map<String, dynamic> _$DownloadItemToJson(_DownloadItem instance) =>
    <String, dynamic>{
      'serverUrl': instance.serverUrl.toString(),
      'libraryItemId': instance.libraryItemId,
      'userId': instance.userId,
      'libraryItem': instance.libraryItem.toJson(),
      'title': instance.title,
      'author': instance.author,
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'status': _$DownloadStatusEnumMap[instance.status]!,
      'startedAt': ?instance.startedAt?.toIso8601String(),
    };
