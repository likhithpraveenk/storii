import 'dart:async';
import 'dart:developer';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/play_request_params.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_notifier.g.dart';

@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  @override
  PlaybackSession? build() => null;

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
    return session;
  }

  Future<void> sync(Duration totalListened) async {
    final session = state;
    if (session == null) return;

    final position = ref.read(globalPositionProvider).value;
    if (position == null) return;

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
    log(
      'sync pos ${position.toTimestamp()}'
      ' listened ${totalListened.inSeconds}s',
    );
  }

  Future<void> close() async {
    final session = state;
    if (session == null) {
      log('no session to close');
      return;
    }

    final user = await ref.read(authenticatedUserProvider.future);

    try {
      await ref
          .read(sessionsApiProvider(user))
          .closeSession(sessionId: session.id);
      await Hive.box<String>(sessionIdBox).delete(session.id);
    } finally {
      log('session closed');
      state = null;
    }
  }
}
