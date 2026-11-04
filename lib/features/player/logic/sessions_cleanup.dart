import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/repositories/session_repository.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/progress_store.dart';
import 'package:storii/storage/local/session_store.dart';

part 'sessions_cleanup.g.dart';

const _source = 'SessionsCleanup';

class SessionsCleanup {
  const new({
    required this.userId,
    required this.repo,
    required this.store,
    required this.progressStore,
  });

  final String userId;
  final SessionRepository repo;
  final SessionStore store;
  final ProgressStore progressStore;

  Future<void> cleanup() async {
    final sessions = store.getAll();
    if (sessions.isEmpty) return;
    await syncLocalSessions(sessions);
    LogService.log('session cleanup complete', source: _source);
  }

  Future<void> syncLocalSessions(List<PlaybackSession> sessions) async {
    for (final session in sessions) {
      try {
        if (session.userId != userId) {
          //! different user's session
          continue;
        }

        if (session.playMethod == .local) {
          await repo.syncLocal(localSession: session.stripped);
          progressStore.put(session.toMediaProgress());
        } else {
          await repo.syncSession(
            sessionId: session.id,
            params: SyncSessionRequestParams(
              currentTime: session.currentTime,
              timeListened: session.timeListening,
            ),
          );
        }

        await store.delete(session.id);
      } on AppError catch (e) {
        if (e.type == .notFound || e.type == .server) {
          await store.delete(session.id);
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

@riverpod
SessionsCleanup sessionsCleanup(Ref ref, UserDomain user) {
  final repo = ref.watch(sessionRepositoryProvider(user));
  final store = ref.read(sessionStoreProvider);
  final progressStore = ref.read(progressStoreProvider(user.id));
  return SessionsCleanup(
    userId: user.id,
    repo: repo,
    store: store,
    progressStore: progressStore,
  );
}
