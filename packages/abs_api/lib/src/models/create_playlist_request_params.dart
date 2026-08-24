import 'package:abs_api/src/models/playlist_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_playlist_request_params.freezed.dart';
part 'create_playlist_request_params.g.dart';

@freezed
sealed class CreatePlaylistRequestParams with _$CreatePlaylistRequestParams {
  const factory CreatePlaylistRequestParams({
    required String libraryId,
    required String name,
    required List<PlaylistItem> items,
  }) = _CreatePlaylistRequestParams;

  factory CreatePlaylistRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CreatePlaylistRequestParamsFromJson(json);
}
