import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/session_store.dart';

part 'sessions_cleanup.g.dart';

@Riverpod(keepAlive: true)
class SessionsCleanup extends _$SessionsCleanup {
  @override
  void build() {}

  Future<void> cleanup() async {
    final store = ref.read(sessionStoreProvider.notifier);
    final sessions = store.getAll();
    if (sessions.isEmpty) return;

    final user = await ref.read(authenticatedUserProvider.future);
    await syncLocalSessions(user, sessions);
    LogService.log('session cleanup complete');
  }

  Future<void> syncLocalSessions(
    UserDomain user,
    List<PlaybackSession> sessions,
  ) async {
    final sessionsApi = ref.read(sessionsApiProvider(user));

    for (final session in sessions) {
      try {
        if (session.userId != user.id) {
          await ref.read(sessionStoreProvider.notifier).delete(session.id);
          LogService.log('local session from another user removed');
          continue;
        }

        try {
          if (session.playMethod == .local) {
            await sessionsApi.syncLocal(localSession: session);
          } else {
            await sessionsApi.syncSession(
              sessionId: session.id,
              params: SyncSessionRequestParams(
                currentTime: session.currentTime,
                timeListened: session.timeListening,
              ),
            );
          }
        } catch (e, st) {
          if (e is ApiException && e.type == .notFound) {
            LogService.log('session not found: ${session.id}', level: .warning);
          } else {
            LogService.log(
              'failed to sync session ${session.id}: $e',
              level: .warning,
              originalError: e,
              stackTrace: st,
            );
            continue;
          }
        }

        await ref.read(sessionStoreProvider.notifier).delete(session.id);
        LogService.log('synced local session ${session.id}');
      } catch (e, st) {
        final error = AppError.from(e, st);
        LogService.log(
          'session sync failed for ${session.displayTitle}: ${error.message}',
          level: .warning,
          originalError: error.originalError,
          stackTrace: error.stackTrace,
        );
      }
    }
  }
}
