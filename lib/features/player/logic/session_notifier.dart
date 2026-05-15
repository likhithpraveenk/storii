import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/play_request_params.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_notifier.g.dart';

@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  @override
  PlaybackSession? build() => null;

  bool get isLocal => state?.playMethod == .local;

  Future<PlaybackSession> create({
    required String itemId,
    String? episodeId,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final params = await ref.read(playRequestParamsProvider.future);

    final session = await ref
        .read(itemApiProvider(user))
        .createSession(
          libraryItemId: itemId,
          params: params,
          episodeId: episodeId,
        );

    unawaited(
      Hive.box<String>(localSessionsBox).put(session.id, jsonEncode(session)),
    );

    state = session;
    log('session created for ${session.displayTitle}');
    return session;
  }

  Future<PlaybackSession> createLocal({
    required LibraryItem item,
    String? episodeId,
    required bool isSameUser,
  }) async {
    final params = await ref.read(playRequestParamsProvider.future);
    final user = ref.read(currentUserProvider);
    var session = item.toPlaybackSession(
      user!.id,
      deviceInfo: params.deviceInfo,
      episodeId: episodeId,
    );
    if (!isSameUser) {
      session = session.copyWith(
        currentTime: Duration.zero,
        timeListening: Duration.zero,
      );
    }

    unawaited(
      Hive.box<String>(localSessionsBox).put(session.id, jsonEncode(session)),
    );

    state = session;
    log('local session created for ${session.displayTitle}');
    return session;
  }

  Future<void> sync(Duration totalListened, Duration position) async {
    final session = state;
    if (session == null) {
      // log('no session to sync');
      return;
    }

    final updated = session.copyWith(
      currentTime: position,
      timeListening: totalListened,
      updatedAt: DateTime.now(),
    );

    unawaited(
      Hive.box<String>(localSessionsBox).put(updated.id, jsonEncode(updated)),
    );
    state = updated;

    final user = await ref.read(authenticatedUserProvider.future);
    if (isLocal) {
      await ref
          .read(sessionsApiProvider(user))
          .syncLocal(localSession: updated);
    } else {
      await ref
          .read(sessionsApiProvider(user))
          .syncSession(
            sessionId: session.id,
            params: SyncSessionRequestParams(
              currentTime: position,
              timeListened: totalListened,
            ),
          );
    }
    log('sync success at ${position.toTime()}');
  }

  Future<void> close() async {
    final session = state;
    if (session == null) {
      // log('no session to close');
      return;
    }

    try {
      final user = await ref.read(authenticatedUserProvider.future);
      if (!isLocal) {
        await ref
            .read(sessionsApiProvider(user))
            .closeSession(sessionId: session.id);
      }
      await Hive.box<String>(localSessionsBox).delete(session.id);
      log('session closed: ${session.id}');
    } catch (e, st) {
      LogService.log(
        'session close failed',
        originalError: e,
        source: 'SessionNotifier',
        level: .error,
        stackTrace: st,
      );
    } finally {
      state = null;
    }
  }
}
