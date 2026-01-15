import 'package:storii/api/client/api_client.dart';
import 'package:storii/api/endpoints/api_routes.dart';
import 'package:storii/api/models/books/playback_session.dart';
import 'package:storii/api/models/requests/sync_session_request_params.dart';
import 'package:storii/api/models/responses/sessions_response.dart';
import 'package:storii/api/models/responses/sync_local_session_response.dart';
import 'package:storii/api/models/utils/json_helpers.dart';

class SessionsApi {
  const SessionsApi(this.api);

  final ApiClient api;

  Future<SessionsResponse?> getAll({
    String? userId,
    int itemsPerPage = 10,
    int page = 10,
  }) async {
    final response = await api.request(
      ApiRoutes.sessions,
      method: .get,
      query: {
        if (userId != null) 'user': userId,
        'itemsPerPage': itemsPerPage,
        'page': page,
      },
    );
    return fromJson(response.data, SessionsResponse.fromJson);
  }

  Future<void> delete({required String sessionId}) async {
    await api.request(ApiRoutes.sessionById(sessionId), method: .delete);
  }

  Future<void> syncLocal({required PlaybackSession localSession}) async {
    await api.request(
      ApiRoutes.sessionLocal,
      method: .post,
      body: localSession,
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

  Future<PlaybackSession> getOpen({required String sessionId}) async {
    final response = await api.request(
      ApiRoutes.sessionById(sessionId),
      method: .get,
    );
    return fromJson(response.data, PlaybackSession.fromJson);
  }

  Future<void> syncOpen({
    required String sessionId,
    required SyncSessionRequestParams parameters,
  }) async {
    await api.request(
      ApiRoutes.sessionSync(sessionId),
      method: .post,
      body: parameters.toJson(),
    );
  }

  Future<void> closeOpen({
    required String sessionId,
    SyncSessionRequestParams? parameters,
  }) async {
    await api.request(
      ApiRoutes.sessionClose(sessionId),
      method: .post,
      body: parameters?.toJson(),
    );
  }
}
