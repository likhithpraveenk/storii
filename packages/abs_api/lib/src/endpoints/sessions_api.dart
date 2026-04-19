import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/json_helpers.dart';
import 'package:abs_api/src/models/playback_session.dart';
import 'package:abs_api/src/models/sessions_response.dart';
import 'package:abs_api/src/models/sync_local_session_response.dart';
import 'package:abs_api/src/models/sync_session_request_params.dart';

class SessionsApi {
  const SessionsApi(this.api);

  final ApiClient api;

  Future<SessionsResponse?> getAllSessions({
    String? userId,
    int itemsPerPage = 10,
    int page = 10,
  }) async {
    final response = await api.request(
      ApiRoutes.sessions,
      method: .get,
      query: {'user': ?userId, 'itemsPerPage': itemsPerPage, 'page': page},
    );
    return fromJson(response.data, SessionsResponse.fromJson);
  }

  Future<void> deleteSession({required String sessionId}) async {
    await api.request(ApiRoutes.sessionById(sessionId), method: .delete);
  }

  Future<void> syncLocal({required PlaybackSession localSession}) async {
    await api.request(
      ApiRoutes.sessionLocal,
      method: .post,
      body: localSession.toJson(),
    );
  }

  Future<List<SyncLocalSessionResponse>> syncLocalSessions({
    required List<PlaybackSession> localSessions,
  }) async {
    final response = await api.request(
      ApiRoutes.sessionLocalAll,
      method: .post,
      body: {'sessions': localSessions.map((s) => s.toJson()).toList()},
    );
    return listFromJsonKey(
      response.data,
      'results',
      SyncLocalSessionResponse.fromJson,
    );
  }

  Future<PlaybackSession> getSession({required String sessionId}) async {
    final response = await api.request(
      ApiRoutes.sessionById(sessionId),
      method: .get,
    );
    return fromJson(response.data, PlaybackSession.fromJson);
  }

  Future<void> syncSession({
    required String sessionId,
    required SyncSessionRequestParams params,
  }) async {
    await api.request(
      ApiRoutes.sessionSync(sessionId),
      method: .post,
      body: params.toJson(),
    );
  }

  Future<void> closeSession({
    required String sessionId,
    SyncSessionRequestParams? params,
  }) async {
    await api.request(
      ApiRoutes.sessionClose(sessionId),
      method: .post,
      body: params?.toJson(),
    );
  }
}
