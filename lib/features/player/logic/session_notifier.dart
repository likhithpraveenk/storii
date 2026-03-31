import 'dart:async';
import 'dart:developer';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/local_position_provider.dart';
import 'package:storii/features/player/logic/play_request_params.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_notifier.g.dart';

@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  @override
  PlaybackSession? build() {
    ref.listen(globalPositionProvider, (_, next) {
      final position = next.value;
      final session = state;
      if (position == null || session == null) return;
      ref.read(localPositionProvider(session.id).notifier).save(position);
    });
    return null;
  }

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

    await Hive.box<String>(sessionIdBox).put(session.id, session.id);
    state = session;
    log('session created for ${session.displayTitle}');
    return session;
  }

  Future<void> sync(Duration totalListened, Duration position) async {
    final session = state;
    if (session == null) {
      // log('no session to sync');
      return;
    }

    final user = await ref.read(authenticatedUserProvider.future);
    await ref
        .read(sessionsApiProvider(user))
        .syncSession(
          sessionId: session.id,
          params: SyncSessionRequestParams(
            currentTime: position,
            timeListened: totalListened,
          ),
        );
    log('sync at ${position.toTime()} listen ${totalListened.inSeconds}s');
  }

  Future<void> close() async {
    final session = state;
    if (session == null) {
      // log('no session to close');
      return;
    }

    final user = await ref.read(authenticatedUserProvider.future);
    try {
      await ref
          .read(sessionsApiProvider(user))
          .closeSession(sessionId: session.id);

      await Hive.box<String>(sessionIdBox).delete(session.id);
      await ref.read(localPositionProvider(session.id).notifier).clear();
    } catch (_) {
      log('session close failed will be cleaned up on app start');
    } finally {
      log('session closed');
      state = null;
    }
  }
}
