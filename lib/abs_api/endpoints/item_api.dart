import 'package:storii/abs_api/client/api_client.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/json_helpers.dart';
import 'package:storii/abs_api/models/library_item.dart';
import 'package:storii/abs_api/models/play_item_request_params.dart';
import 'package:storii/abs_api/models/playback_session.dart';

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
}
