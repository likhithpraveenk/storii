import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/progress_store.dart';
import 'package:storii/storage/local/session_store.dart';

part 'sessions_cleanup.g.dart';

const _source = 'SessionsCleanup';

@Riverpod(keepAlive: true)
class SessionsCleanup extends _$SessionsCleanup {
  @override
  void build() {}

  Future<void> cleanup() async {
    final sessions = ref.read(sessionStoreProvider).getAll();
    if (sessions.isEmpty) return;

    final user = await ref.read(authenticatedUserProvider.future);
    await syncLocalSessions(user, sessions);
    LogService.log('session cleanup complete', source: _source);
  }

  Future<void> syncLocalSessions(
    UserDomain user,
    List<PlaybackSession> sessions,
  ) async {
    final repo = ref.read(sessionRepositoryProvider(user));
    for (final session in sessions) {
      try {
        if (session.userId != user.id) {
          await ref.read(sessionStoreProvider).delete(session.id);
          LogService.log(
            'local session from another user removed',
            level: .info,
            source: _source,
          );
          continue;
        }

        if (session.playMethod == .local) {
          await repo.syncLocal(localSession: session.stripped);
          ref
              .read(progressStoreProvider(user.id))
              .put(session.toMediaProgress());
        } else {
          await repo.syncSession(
            sessionId: session.id,
            params: SyncSessionRequestParams(
              currentTime: session.currentTime,
              timeListened: session.timeListening,
            ),
          );
        }

        await ref.read(sessionStoreProvider).delete(session.id);
      } on AppError catch (e) {
        if (e.type == .notFound || e.type == .server) {
          LogService.log(
            'error syncing session for ${session.displayTitle}: ${e.type}',
            level: .warning,
            source: _source,
            originalError: e.originalError,
            stackTrace: e.stackTrace,
          );
          await ref.read(sessionStoreProvider).delete(session.id);
        } else {
          LogService.log(
            'failed to sync session ${session.displayTitle}: ${e.type}: ${e.message}',
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
