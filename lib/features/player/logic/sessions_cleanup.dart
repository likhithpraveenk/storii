import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/session_store.dart';

part 'sessions_cleanup.g.dart';

const _source = 'SessionsCleanup';

@Riverpod(keepAlive: true)
class SessionsCleanup extends _$SessionsCleanup {
  @override
  void build() {}

  Future<void> cleanup() async {
    final store = ref.read(sessionStoreProvider.notifier);
    final sessions = store.getAll();
    if (sessions.isEmpty) return;

    final isConnected = await ref.read(socketStatusProvider.future);
    if (!isConnected) {
      LogService.log(
        'server not connected, skipping session cleanup',
        level: .info,
        source: _source,
      );
      return;
    }

    final user = await ref.read(authenticatedUserProvider.future);
    await syncLocalSessions(user, sessions);
    LogService.log('session cleanup complete', level: .info, source: _source);
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
          LogService.log(
            'local session from another user removed',
            level: .info,
            source: _source,
          );
          continue;
        }

        if (session.playMethod == .local) {
          await ref.logApiCall(
            () => sessionsApi.syncLocal(localSession: session),
            source: _source,
            debug: true,
          );
        } else {
          await ref.logApiCall(
            () => sessionsApi.syncSession(
              sessionId: session.id,
              params: SyncSessionRequestParams(
                currentTime: session.currentTime,
                timeListened: session.timeListening,
              ),
            ),
            source: _source,
            debug: true,
          );
        }

        await ref.read(sessionStoreProvider.notifier).delete(session.id);
      } on AppError catch (e) {
        if (e.type == .notFound) {
          LogService.log(
            'session not found for ${session.displayTitle}',
            level: .warning,
            source: _source,
          );
          await ref.read(sessionStoreProvider.notifier).delete(session.id);
        } else {
          LogService.log(
            'failed to sync session ${session.displayTitle}: ${e.message}',
            level: .warning,
            source: _source,
            originalError: e.originalError,
            stackTrace: e.stackTrace,
          );
        }
      } catch (e, st) {
        final error = AppError.from(e, st);
        LogService.log(
          'session sync failed for ${session.displayTitle}: ${error.message}',
          level: .warning,
          source: _source,
          originalError: error.originalError,
          stackTrace: error.stackTrace,
        );
      }
    }
  }
}
