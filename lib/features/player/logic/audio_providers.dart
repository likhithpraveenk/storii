import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/background/audio_handler.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/player/logic/to_media_items.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'audio_providers.g.dart';

@Riverpod(keepAlive: true)
MyAudioHandler audioHandler(Ref ref) {
  /// overriden in init.dart
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
class AudioPlayer extends _$AudioPlayer {
  late MyAudioHandler _handler;

  @override
  Stream<PlaybackState> build() {
    _handler = ref.watch(audioHandlerProvider);
    return _handler.playbackState;
  }

  Future<void> play(ItemDomain item) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final token = await ref.read(tokenProvider).getAccessToken(user.id);
    final (index, offset) = (item as Audiobook).getIndexAndOffset();

    await _handler.prepareFromUri(user.serverUrl, {
      'items': item.toMediaItems(user.serverUrl),
      'initialIndex': index,
      'initialPositionMs': offset.inMilliseconds,
      'token': token,
    });
    await _handler.play();
  }

  Future<void> togglePlay() async {
    final playing = _handler.playbackState.value.playing;
    playing ? await _handler.pause() : await _handler.play();
  }

  Future<void> seek(int seconds) async {
    await _handler.seek(Duration(seconds: seconds));
  }

  Future<void> rewind() async {
    await _handler.rewind();
  }

  Future<void> fastForward() async {
    await _handler.fastForward();
  }

  Future<void> skipToStartOfChapter() async {
    await _handler.player.seekToPrevious();
  }

  Future<void> skipToNextChapter() async {
    await _handler.player.seekToNext();
  }
}

@riverpod
class SaveProgress extends _$SaveProgress {
  int _lastSavedSecond = -1;
  String? _lastTrackId;

  @override
  FutureOr<void> build() async {
    final handler = ref.watch(audioHandlerProvider);
    final globalPos = ref.watch(globalPositionProvider).value ?? Duration.zero;
    final currentItem = handler.mediaItem.value;
    final isPlaying = handler.playbackState.value.playing;
    final processingState = handler.playbackState.value.processingState;

    final currentSecond = globalPos.inSeconds;
    final bookId = currentItem?.extras?['bookId'];
    final trackId = currentItem?.id;

    if (bookId == null) return;

    final isHeartbeat =
        currentSecond % 5 == 0 && currentSecond != _lastSavedSecond;
    final isTrackChanged = _lastTrackId != null && _lastTrackId != trackId;
    final isFinished = processingState == .completed;

    if (isPlaying && (isHeartbeat || isTrackChanged || isFinished)) {
      _lastSavedSecond = currentSecond;
      _lastTrackId = trackId;
      _saveProgress(bookId, globalPos);
    }
  }

  Future<void> _saveProgress(String id, Duration pos) async {
    // final db =
    ref.read(databaseProvider);
    // await db.updateProgress(currentBookId, pos);
    // TODO: save progress locally and with abs
    LogService.log(
      'Saving progress for $id at ${pos.inSeconds}s',
      source: 'SaveProgress',
      level: .debug,
    );
  }
}

@riverpod
Duration totalBookDuration(Ref ref) {
  final items = ref.watch(audioHandlerProvider).queue.value;
  return items.fold(
    Duration.zero,
    (total, item) => total + (item.duration ?? Duration.zero),
  );
}

@riverpod
Stream<Duration> globalPosition(Ref ref) {
  final handler = ref.watch(audioHandlerProvider);

  return handler.player.positionStream.map((position) {
    final index = handler.playbackState.value.queueIndex ?? 0;
    final items = handler.queue.value;

    final previousTracksDuration = items
        .take(index)
        .fold(
          Duration.zero,
          (total, item) => total + (item.duration ?? Duration.zero),
        );

    return previousTracksDuration + position;
  });
}
