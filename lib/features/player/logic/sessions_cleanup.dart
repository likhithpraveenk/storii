import 'dart:async';
import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/player/logic/local_position_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'sessions_cleanup.g.dart';

@Riverpod(keepAlive: true)
class SessionsCleanup extends _$SessionsCleanup {
  @override
  void build() {}

  Future<void> cleanup() async {
    final box = Hive.box<String>(localSessionsBox);
    final ids = box.keys.cast<String>().toList();
    if (ids.isEmpty) return;

    final user = await ref.read(authenticatedUserProvider.future);
    await syncLocalSessions(user, box);
    LogService.log('session cleanup complete');
  }

  Future<void> syncLocalSessions(UserDomain user, Box<String> box) async {
    final sessionsApi = ref.read(sessionsApiProvider(user));
    final ids = box.keys.cast<String>().toList();

    for (final id in ids) {
      try {
        final sessionJson = box.get(id);
        if (sessionJson == null) continue;
        final session = PlaybackSession.fromJson(jsonDecode(sessionJson));
        if (session.userId != user.id) {
          await box.delete(id);
          await ref.read(localPositionProvider(id).notifier).clear();
          LogService.log('local session from another user removed');
          continue;
        }

        try {
          if (session.playMethod == .local) {
            await sessionsApi.syncLocal(localSession: session);
          } else {
            await sessionsApi.closeSession(
              sessionId: session.id,
              params: SyncSessionRequestParams(
                currentTime: session.currentTime,
                timeListened: session.timeListening,
              ),
            );
          }
        } catch (e) {
          LogService.log(
            'failed to sync/close session $id: $e',
            level: .warning,
          );
          continue;
        }

        await box.delete(id);
        await ref.read(localPositionProvider(id).notifier).clear();
        LogService.log('synced local session $id');
      } catch (e) {
        LogService.log(
          'session sync failed for $id: $e; retry next time',
          level: .warning,
        );
      }
    }
  }
}
