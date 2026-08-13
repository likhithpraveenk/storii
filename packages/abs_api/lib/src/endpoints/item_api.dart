import 'dart:typed_data';

import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/file_upload.dart';
import 'package:abs_api/src/models/json_helpers.dart';
import 'package:abs_api/src/models/library_item.dart';
import 'package:abs_api/src/models/match_item_request_params.dart';
import 'package:abs_api/src/models/match_item_response.dart';
import 'package:abs_api/src/models/play_item_request_params.dart';
import 'package:abs_api/src/models/playback_session.dart';
import 'package:abs_api/src/models/update_cover_response.dart';
import 'package:abs_api/src/models/update_item_media_req_params.dart';
import 'package:abs_api/src/utils/data_builder.dart';
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
      responseType: .bytes,
    );
    return response.data;
  }

  Future<UpdateCoverResponse> uploadCover({
    required String libraryItemId,
    FileUpload? coverFile,
    String? url,
  }) async {
    assert(
      (coverFile != null) ^ (url != null),
      'Provide coverFile OR url, not both or neither.',
    );
    final data = dataBuilder(
      json: url != null ? {'url': url} : null,
      files: coverFile != null ? {'cover': coverFile} : null,
    );

    final response = await api.request(
      ApiRoutes.itemCover(libraryItemId),
      method: .post,
      body: data,
    );
    return fromJson(response.data, UpdateCoverResponse.fromJson);
  }

  Future<UpdateCoverResponse> updateCover({
    required String libraryItemId,
    required String coverPath,
  }) async {
    final response = await api.request(
      ApiRoutes.itemCover(libraryItemId),
      method: .patch,
      body: {'cover': coverPath},
    );
    return fromJson(response.data, UpdateCoverResponse.fromJson);
  }

  Future<void> removeCover({required String libraryItemId}) async {
    await api.request(ApiRoutes.itemCover(libraryItemId), method: .delete);
  }

  Future<ScanItemResult?> scan({required String libraryItemId}) async {
    final response = await api.request(
      ApiRoutes.itemScan(libraryItemId),
      method: .post,
    );
    final result = fromJsonKey<String?>(response.data, 'result');
    return ScanItemResult.byName[result];
  }

  Future<MatchItemResponse> match({
    required String libraryItemId,
    MatchItemRequestParams? parameters,
  }) async {
    final response = await api.request(
      ApiRoutes.itemMatch(libraryItemId),
      method: .post,
      body: parameters?.toJson(),
    );
    return fromJson(response.data, MatchItemResponse.fromJson);
  }

  Future<LibraryItem> updateMedia({
    required String libraryItemId,
    UpdateItemMediaReqParams? parameters,
  }) async {
    final response = await api.request(
      ApiRoutes.itemMedia(libraryItemId),
      method: .patch,
      body: parameters?.toJson(),
    );
    return fromJson(response.data, LibraryItem.fromJson);
  }
}
