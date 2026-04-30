import 'dart:typed_data';

import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/json_helpers.dart';
import 'package:abs_api/src/models/library_item.dart';
import 'package:abs_api/src/models/play_item_request_params.dart';
import 'package:abs_api/src/models/playback_session.dart';
import 'package:dio/dio.dart';

class ItemApi {
  final ApiClient api;
  const ItemApi(this.api);

  Future<LibraryItem> get(
    String libraryItemId, {
    bool isExpanded = true,
    bool includeProgress = false,
  }) async {
    final response = await api.request(
      ApiRoutes.itemById(libraryItemId),
      method: .get,
      query: {
        if (isExpanded) 'expanded': 1,
        if (includeProgress) 'include': 'progress',
      },
    );
    return fromJson(response.data, LibraryItem.fromJson);
  }

  Future<PlaybackSession> createSession({
    required String libraryItemId,
    required PlayItemRequestParams params,
    String? episodeId,
  }) async {
    final response = await api.request(
      episodeId != null
          ? ApiRoutes.itemPlayEpisode(libraryItemId, episodeId)
          : ApiRoutes.itemPlay(libraryItemId),
      method: .post,
      body: params.toJson(),
    );
    return fromJson(response.data, PlaybackSession.fromJson);
  }

  Future<Uint8List?> getCover({
    required String libraryItemId,
    required CancelToken cancelToken,
  }) async {
    final response = await api.request<Uint8List>(
      ApiRoutes.itemCover(libraryItemId),
      method: .get,
      query: {'raw': '1'},
      requestCancelToken: cancelToken,
    );
    return response.data;
  }

  Future<ResponseBody?> itemAudioFileDownload({
    required String libraryItemId,
    required String ino,
    required CancelToken cancelToken,
    required int existingBytes,
  }) async {
    final response = await api.request<ResponseBody>(
      ApiRoutes.itemAudioFileDownload(libraryItemId, ino),
      method: .get,
      headers: {if (existingBytes > 0) 'Range': 'bytes=$existingBytes-'},
      responseType: .stream,
      requestCancelToken: cancelToken,
    );
    return response.data;
  }
}
