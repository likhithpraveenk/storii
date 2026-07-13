import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/cast/models/cast_device.dart';
import 'package:storii/features/cast/models/cast_session.dart';
import 'package:storii/features/cast/models/cast_target.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/cast_session_store.dart';

part 'cast_controller.g.dart';

@Riverpod(keepAlive: true)
class CastController extends _$CastController {
  StreamSubscription<CastPositionUpdate>? _subscription;
  CastDevice? _device;

  @override
  CastSession build() {
    ref.onDispose(stop);
    return const CastSession();
  }

  Future<void> createCastSession(CastDevice device) async {
    final playbackSession = ref.read(sessionProvider);
    if (playbackSession == null) {
      state = const CastSession(status: .error, error: 'Nothing is playing');
      return;
    }
    if (playbackSession.playMethod == .local) {
      state = const CastSession(
        status: .error,
        error: 'Casting is unavailable for offline downloads',
      );
      return;
    }
    final tracks = playbackSession.audioTracks ?? const [];
    if (tracks.isEmpty) {
      state = const CastSession(status: .error, error: 'No audio to cast');
      return;
    }

    state = CastSession(status: .connecting, device: device.info);

    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final initialPosition = audioHandler.currentPosition;
      final (trackIndex, offset) = playbackSession.getIndexAndOffset(
        initialPosition,
      );

      final target = CastTarget(
        serverUrl: user.serverUrl,
        tracks: tracks,
        sessionId: playbackSession.id,
        title: playbackSession.displayTitle ?? '',
      );

      _device = device;
      await audioHandler.pause();
      await ref.read(sessionProvider.notifier).switchToCast();
      await device.setUrl(target.urlFor(trackIndex), title: target.title);
      await device.play();
      if (offset > Duration.zero) {
        await device.seek(offset);
      }

      device.startPositionTracking();
      _subscription = device.positionUpdates.listen(_onPosition);

      state = CastSession(
        status: .casting,
        device: device.info,
        target: target,
        currentTrackIndex: trackIndex,
        initialPosition: initialPosition,
        currentGlobalPosition: initialPosition,
        id: mediaItemIdKey(
          playbackSession.libraryItemId,
          playbackSession.episodeId,
        ),
        libraryItemId: playbackSession.libraryItemId,
        episodeId: playbackSession.episodeId,
      );
      await save(state);
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'cast failed: ${error.message}',
        source: 'CastController',
        level: .error,
        stackTrace: error.stackTrace,
        originalError: error.originalError,
      );
      state = CastSession(
        status: .error,
        device: device.info,
        error: error.message,
      );
    }
  }

  Future<void> seek(Duration position) async {
    try {
      await _device?.seek(position);
    } catch (e) {
      LogService.log(
        'cast command failed: $e',
        source: 'CastController',
        level: .error,
      );
    }
  }

  Future<void> pause() async {
    try {
      await _device?.pause();
    } catch (e) {
      LogService.log(
        'cast command failed: $e',
        source: 'CastController',
        level: .error,
      );
    }
  }

  Future<void> resume() async {
    try {
      await _device?.play();
    } catch (e) {
      LogService.log(
        'cast command failed: $e',
        source: 'CastController',
        level: .error,
      );
    }
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;

    final device = _device;
    if (device != null) {
      device.stopPositionTracking();
      try {
        await device.stop();
      } catch (_) {}
    }

    _device = null;
    state = const CastSession();
  }

  Future<void> _onPosition(CastPositionUpdate update) async {
    final session = state;
    final target = session.target;
    if (target == null) return;

    final currentTrack = target.tracks[session.currentTrackIndex];
    final currentTrackEndPosition = target.globalPosition(
      session.currentTrackIndex,
      currentTrack.duration,
    );

    final droppedToZeroNearEnd =
        update.position == Duration.zero &&
        session.currentGlobalPosition >=
            currentTrackEndPosition - const Duration(seconds: 5);

    if (droppedToZeroNearEnd && session.hasNextTrack) {
      final nextIndex = session.currentTrackIndex + 1;
      final nextUrl = target.urlFor(nextIndex);

      try {
        await _device?.setUrl(nextUrl, title: target.title);
        await _device?.play();
      } catch (e) {
        LogService.log(
          'failed to advance cast track: $e',
          source: 'CastController',
        );
        return;
      }

      state = session.copyWith(
        currentTrackIndex: nextIndex,
        currentGlobalPosition: target.globalPosition(nextIndex, Duration.zero),
      );
      await save(state);
      return;
    }

    state = session.copyWith(
      currentGlobalPosition: target.globalPosition(
        session.currentTrackIndex,
        update.position,
      ),
    );
    await save(state);
  }

  Future<void> save(CastSession session) async {
    await ref.read(castSessionStoreProvider.notifier).save(session);
  }
}
