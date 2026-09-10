import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/downloads/models/download_item.dart';

part 'storage_location.freezed.dart';
part 'storage_location.g.dart';

@freezed
sealed class StorageLocation with _$StorageLocation {
  const new _();

  /// for SAF [uri] is content uri
  ///
  /// for Internal Storage [uri] is subdir path
  const factory({
    required String name,
    required String uri,
    required DownloadMediaType mediaType,
    @Default(false) bool isInternal,
  }) = _StorageLocation;

  bool get isPodcasts => mediaType == .podcast;

  factory fromJson(Map<String, dynamic> json) =>
      _$StorageLocationFromJson(json);
}

const defaultInternalAudiobooks = StorageLocation(
  name: audiobooksSubDir,
  uri: '$downloadsDir/$audiobooksSubDir',
  mediaType: .audiobook,
  isInternal: true,
);

const defaultInternalPodcasts = StorageLocation(
  name: podcastsSubDir,
  uri: '$downloadsDir/$podcastsSubDir',
  mediaType: .podcast,
  isInternal: true,
);
