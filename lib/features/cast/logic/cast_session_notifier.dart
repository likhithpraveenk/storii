import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/features/cast/models/cast_session.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/cast_session_store.dart';

part 'cast_session_notifier.g.dart';

@riverpod
class CastSessionNotifier extends _$CastSessionNotifier {
  @override
  Stream<CastSession?> build(String itemId, [String? episodeId]) async* {
    final store = ref.watch(castSessionStoreProvider.notifier);
    final key = mediaItemIdKey(itemId, episodeId);
    yield* store.watchSession(key);
  }

  Future<void> sync(Duration timeListened) async {
    final session = state.value;
    if (session == null ||
        session.id == null ||
        session.target?.sessionId == null) {
      return;
    }

    final isConnected = await ref.read(socketStatusProvider.future);
    if (!isConnected) {
      LogService.log(
        l10n.connectionServerDisconnected,
        source: 'SessionNotifier',
      );
      throw l10n.connectionServerDisconnected;
    }

    try {
      final user = await ref.read(authenticatedUserProvider.future);
      await ref.logApiCall(
        () => ref
            .read(sessionsApiProvider(user))
            .syncSession(
              sessionId: session.target!.sessionId,
              params: SyncSessionRequestParams(
                currentTime: session.currentGlobalPosition,
                timeListened: timeListened,
              ),
            ),
        source: 'SessionNotifier',
      );
      await ref.read(castSessionStoreProvider.notifier).delete(session.id!);
    } on AppError catch (e) {
      LogService.log(
        'cast session sync failed: ${e.localizedMessage}',
        source: 'CastSessionNotifier',
        level: .error,
        originalError: e.originalError,
        stackTrace: e.stackTrace,
      );
      throw e.localizedMessage;
    }
  }
}
