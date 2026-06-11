import 'dart:async';
import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/play_request_params.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/session_store.dart';

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

    final session = await ref.logApiCall(
      () => ref
          .read(itemApiProvider(user))
          .createSession(
            libraryItemId: itemId,
            params: params,
            episodeId: episodeId,
          ),
      source: 'SessionNotifier',
      logMessage: 'Failed to create playback session',
    );

    await ref.read(sessionStoreProvider.notifier).save(session);

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

    await ref.read(sessionStoreProvider.notifier).save(session);

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

    await ref.read(sessionStoreProvider.notifier).save(updated);
    state = updated;

    final user = await ref.read(authenticatedUserProvider.future);
    if (isLocal) {
      await ref.logApiCall(
        () => ref
            .read(sessionsApiProvider(user))
            .syncLocal(localSession: updated),
        source: 'SessionNotifier',
      );
    } else {
      await ref.logApiCall(
        () => ref
            .read(sessionsApiProvider(user))
            .syncSession(
              sessionId: session.id,
              params: SyncSessionRequestParams(
                currentTime: position,
                timeListened: totalListened,
              ),
            ),
        source: 'SessionNotifier',
      );
    }
    log(
      '${position.toTime()}: sync success '
      'listened: ${totalListened.toReadableDuration(showSeconds: true)}',
    );
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
        await ref.logApiCall(
          () => ref
              .read(sessionsApiProvider(user))
              .closeSession(sessionId: session.id),
          source: 'SessionNotifier',
          logMessage: 'session close failed',
        );
      }
      await ref.read(sessionStoreProvider.notifier).delete(session.id);
      log('session closed: ${session.id}');
    } on AppError catch (_) {
    } finally {
      state = null;
    }
  }
}
