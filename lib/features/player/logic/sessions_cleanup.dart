import 'dart:async';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'sessions_cleanup.g.dart';

@Riverpod(keepAlive: true)
class SessionsCleanup extends _$SessionsCleanup {
  @override
  void build() {}

  void cleanup() {
    unawaited(_cleanup());
  }

  Future<void> _cleanup() async {
    final box = Hive.box<String>(sessionIdBox);
    final openSessions = box.values.toList();
    if (openSessions.isEmpty) return;

    await Future.wait(
      openSessions.map((id) async {
        try {
          final user = ref.read(authenticatedUserProvider).value;

          if (user != null) {
            await ref
                .read(sessionsApiProvider(user))
                .closeSession(sessionId: id);
          }

          await box.delete(id);
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
