import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/play_request_params.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';
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
    final repo = ref.read(sessionRepositoryProvider(user));
    final params = await ref.read(playRequestParamsProvider.future);

    final session = await repo.createSession(
      itemId: itemId,
      params: params,
      episodeId: episodeId,
    );

    await ref.read(sessionStoreProvider).save(session);

    state = session;
    LogService.log(
      'session created for ${session.displayTitle}',
      source: 'SessionNotifier',
    );
    return session;
  }

  Future<PlaybackSession> createLocal({
    required LibraryItem item,
    String? episodeId,
    required bool isSameUser,
  }) async {
    final existing = ref
        .read(sessionStoreProvider)
        .getSession(item.id, episodeId);
    if (existing != null && existing.playMethod == .local) {
      state = existing;
      LogService.log(
        'local session resumed for ${existing.displayTitle}',
        source: 'SessionNotifier',
      );
      return existing;
    }

    Duration currentOffset = Duration.zero;
    final mediaProgress = await ref.read(
      mediaProgressFromMapProvider(item.id, episodeId).future,
    );
    final progress = _latestProgress(mediaProgress, item.userMediaProgress);
    if (progress?.currentTime != null) {
      currentOffset = progress!.currentTime!;
    }
    final params = await ref.read(playRequestParamsProvider.future);
    final user = ref.read(currentUserProvider);
    var session = item.toPlaybackSession(
      user!.id,
      deviceInfo: params.deviceInfo,
      episodeId: episodeId,
      currentOffset: currentOffset,
    );
    if (!isSameUser) {
      session = session.copyWith(
        currentTime: Duration.zero,
        timeListening: Duration.zero,
      );
    }

    await ref.read(sessionStoreProvider).save(session);
    state = session;
    LogService.log(
      'local session created for ${session.displayTitle}',
      source: 'SessionNotifier',
    );
    return session;
  }

  Future<void> sync(
    Duration totalListened,
    Duration position, {
    bool closing = false,
  }) async {
    final session = state;
    if (session == null) {
      // log('no session to sync');
      return;
    }

    final updated = session.copyWith(
      currentTime: position,
      timeListening: session.timeListening + totalListened,
      updatedAt: DateTime.now(),
    );

    if (isLocal) {
      await ref.read(sessionStoreProvider).save(updated);
      if (!closing) {
        state = updated;
      }

      if (ref.read(isOfflineProvider)) return;

      try {
        final user = await ref.read(authenticatedUserProvider.future);
        final repo = ref.read(sessionRepositoryProvider(user));
        await repo.syncLocal(localSession: updated.stripped);
      } catch (e) {
        LogService.log(
          'Local session saved locally, server sync deferred',
          source: 'SessionNotifier',
          originalError: e,
          level: .error,
        );
        return;
      }
    } else {
      if (ref.read(isOfflineProvider)) {
        await _savePosition(session, position, closing: closing);
        throw 'No Server Connection';
      }

      final user = await ref.read(authenticatedUserProvider.future);
      final repo = ref.read(sessionRepositoryProvider(user));
      try {
        await repo.syncSession(
          sessionId: session.id,
          params: SyncSessionRequestParams(
            currentTime: position,
            timeListened: totalListened,
          ),
        );
      } on AppError catch (error) {
        if (error.type != .network && error.type != .timeout) rethrow;
        await _savePosition(session, position, closing: closing);
        rethrow;
      }
    }

    await ref.read(sessionStoreProvider).delete(updated.id);
    if (!closing) {
      state = updated;
    }

    log(
      '${position.toTime()}: sync success '
      'listened: ${totalListened.toReadableDuration(showSeconds: true)}',
    );
  }

  Future<void> _savePosition(
    PlaybackSession session,
    Duration position, {
    required bool closing,
  }) async {
    final withPosition = session.copyWith(
      currentTime: position,
      updatedAt: DateTime.now(),
    );
    await ref.read(sessionStoreProvider).save(withPosition);
    if (!closing) {
      state = withPosition;
    }
  }

  Future<void> close() async {
    final session = state;
    if (session == null) {
      // log('no session to close');
      return;
    }

    try {
      if (!isLocal) {
        final user = await ref.read(authenticatedUserProvider.future);
        final repo = ref.read(sessionRepositoryProvider(user));
        await repo.closeSession(sessionId: session.id);
        await ref.read(sessionStoreProvider).delete(session.id);
      }
      LogService.log(
        'session closed for ${session.displayTitle}',
        source: 'SessionNotifier',
      );
    } on AppError catch (_) {
    } finally {
      state = null;
    }
  }
}

MediaProgress? _latestProgress(MediaProgress? a, MediaProgress? b) {
  if (a == null) return b;
  if (b == null) return a;
  return a.lastUpdate != null &&
          b.lastUpdate != null &&
          a.lastUpdate!.isAfter(b.lastUpdate!)
      ? a
      : b;
}
