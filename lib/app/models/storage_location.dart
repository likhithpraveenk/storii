import 'package:abs_api/abs_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/config/constants.dart';

part 'storage_location.freezed.dart';
part 'storage_location.g.dart';

@freezed
sealed class StorageLocation with _$StorageLocation {
  /// for SAF [uri] is content uri
  ///
  /// for Internal Storage [uri] is subdir path
  const factory({
    required String id,
    required String name,
    required String uri,
    required MediaType mediaType,
    @Default(false) bool isInternal,
  }) = _StorageLocation;

  factory fromJson(Map<String, dynamic> json) =>
      _$StorageLocationFromJson(json);
}

const defaultInternalAudiobooks = StorageLocation(
  id: audiobooksSubDir,
  name: audiobooksSubDir,
  uri: '$downloadsDir/$audiobooksSubDir',
  mediaType: .book,
  isInternal: true,
);

const defaultInternalPodcasts = StorageLocation(
  id: podcastsSubDir,
  name: podcastsSubDir,
  uri: '$downloadsDir/$podcastsSubDir',
  mediaType: .podcast,
  isInternal: true,
);
