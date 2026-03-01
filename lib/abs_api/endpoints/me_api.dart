import 'package:storii/abs_api/client/api_client.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/audio_bookmark.dart';
import 'package:storii/abs_api/models/json_helpers.dart';
import 'package:storii/abs_api/models/library_item.dart';
import 'package:storii/abs_api/models/media_progress.dart';
import 'package:storii/abs_api/models/upsert_progress_request_params.dart';
import 'package:storii/abs_api/models/user.dart';
import 'package:storii/abs_api/models/user_sessions_response.dart';
import 'package:storii/abs_api/models/user_stats_response.dart';

class MeApi {
  final ApiClient api;
  const MeApi(this.api);

  Future<User> getUser() async {
    final response = await api.request(ApiRoutes.me, method: .get);
    return fromJson(response.data, User.fromJson);
  }

  Future<UserSessionsResponse> getSessions({
    int itemsPerPage = 10,
    int page = 0,
  }) async {
    final response = await api.request(
      ApiRoutes.meListeningSessions,
      method: .get,

      query: {'itemsPerPage': itemsPerPage, 'page': page},
    );
    return fromJson(response.data, UserSessionsResponse.fromJson);
  }

  Future<UserStatsResponse> getStats() async {
    final response = await api.request(
      ApiRoutes.meListeningStats,
      method: .get,
    );
    return fromJson(response.data, UserStatsResponse.fromJson);
  }

  Future<User> removeFromContinueListening({
    required String mediaProgressId,
  }) async {
    final response = await api.request(
      ApiRoutes.meProgressRemove(mediaProgressId),
      method: .get,
    );
    return fromJson(response.data, User.fromJson);
  }

  Future<MediaProgress> getMediaProgress({
    required String libraryItemId,
    String? episodeId,
  }) async {
    final response = await api.request(
      ApiRoutes.meProgressById(libraryItemId, episodeId),
      method: .get,
    );
    return fromJson(response.data, MediaProgress.fromJson);
  }

  Future<void> upsertMediaProgress({
    required String libraryItemId,
    String? episodeId,
    UpsertProgressRequestParams? parameters,
  }) async {
    await api.request(
      ApiRoutes.meProgressById(libraryItemId, episodeId),
      method: .patch,
      body: parameters?.toJson(),
    );
  }

  Future<void> removeMediaProgress({required String mediaProgressId}) async {
    await api.request(
      ApiRoutes.meProgressById(mediaProgressId),
      method: .delete,
    );
  }

  Future<AudioBookmark> createBookmark({
    required String libraryItemId,
    required Duration time,
    required String title,
  }) async {
    final response = await api.request(
      ApiRoutes.meItemBookmark(libraryItemId),
      method: .post,
      body: {'time': time.inSeconds, 'title': title},
    );
    return fromJson(response.data, AudioBookmark.fromJson);
  }

  Future<AudioBookmark> updateBookmark({
    required String libraryItemId,
    required Duration time,
    required String title,
  }) async {
    final response = await api.request(
      ApiRoutes.meItemBookmark(libraryItemId),
      method: .patch,
      body: {'time': time.inSeconds, 'title': title},
    );
    return fromJson(response.data, AudioBookmark.fromJson);
  }

  Future<void> removeBookmark({
    required String libraryItemId,
    required Duration time,
  }) async {
    await api.request(
      ApiRoutes.meItemBookmarkTime(libraryItemId, time.inSeconds.toString()),
      method: .delete,
    );
  }

  Future<List<LibraryItem>> getItemsInProgress({int limit = 25}) async {
    final response = await api.request(
      ApiRoutes.meItemsInProgress,
      method: .get,
      query: {'limit': limit},
    );
    return listFromJsonKey(response.data, 'libraryItems', LibraryItem.fromJson);
  }

  Future<User> removeSeriesFromContinueListening({
    required String seriesId,
  }) async {
    final response = await api.request(
      method: .get,
      ApiRoutes.meSeriesRemove(seriesId),
    );
    return fromJson(response.data, User.fromJson);
  }
}
