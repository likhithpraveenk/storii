import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
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
    final box = Hive.box<String>(sessionIdBox);
    final openSessions = box.values.toList();
    if (openSessions.isEmpty) return;

    await Future.wait(
      openSessions.map((id) async {
        try {
          final user = ref.read(authenticatedUserProvider).value;
          if (user != null) {
            final position = ref.read(localPositionProvider(id));
            await ref
                .read(sessionsApiProvider(user))
                .closeSession(
                  sessionId: id,
                  params: position != null
                      ? SyncSessionRequestParams(
                          currentTime: position,
                          timeListened: Duration.zero,
                        )
                      : null,
                );
          }

          await box.delete(id);
          await ref.read(localPositionProvider(id).notifier).clear();
          LogService.log('session $id closed');
        } catch (e) {
          LogService.log(
            'session close failed for $id: $e; try again next startup',
            level: .warning,
          );
        }
      }),
    );
    LogService.log('session cleanup complete');
  }
}
