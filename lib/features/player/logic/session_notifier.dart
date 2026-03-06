import 'dart:async';
import 'dart:developer';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/globals.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_notifier.g.dart';

@riverpod
PlayItemRequestParams playRequestParams(Ref ref) {
  return PlayItemRequestParams(
    deviceInfo: ClientDeviceInfo(
      clientName: 'storii',
      clientVersion: packageInfo.version,
      deviceId: androidDeviceInfo.id,
      deviceName: '${androidDeviceInfo.brand} ${androidDeviceInfo.name}',
      manufacturer: androidDeviceInfo.manufacturer,
      model: androidDeviceInfo.model,
      sdkVersion: androidDeviceInfo.version.sdkInt.toString(),
    ),
  );
}

@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  @override
  PlaybackSession? build() => null;

  Future<PlaybackSession> open({
    required String itemId,
    String? episodeId,
  }) async {
    await _closeCurrentIfNeeded();

    final user = await ref.read(authenticatedUserProvider.future);
    final params = ref.read(playRequestParamsProvider);

    final session = await ref
        .read(itemApiProvider(user))
        .play(libraryItemId: itemId, params: params, episodeId: episodeId);

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
      'session sync: ${position.toTimestamp()}'
      '\nlistened for ${totalListened.inSeconds}s',
    );
  }

  Future<void> close(Duration totalListened) async {
    final session = state;
    if (session == null) return;

    final position = ref.read(globalPositionProvider).value ?? Duration.zero;
    final user = await ref.read(authenticatedUserProvider.future);

    try {
      await ref
          .read(sessionsApiProvider(user))
          .closeSession(
            sessionId: session.id,
            params: SyncSessionRequestParams(
              currentTime: position,
              timeListened: totalListened,
            ),
          );
      await Hive.box<String>(sessionIdBox).delete(session.id);
    } finally {
      log('session closed');
      state = null;
    }
  }

  Future<void> _closeCurrentIfNeeded() async {
    if (state == null) return;
    state = null;
  }
}
