import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/logic/to_media_items.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'audio_providers.g.dart';

late final AppAudioHandler audioHandler;

@riverpod
Stream<PlaybackState> playbackState(Ref ref) {
  return audioHandler.playbackState;
}

@riverpod
AudioProcessingState processingState(Ref ref) {
  return ref.watch(
    playbackStateProvider.select(
      (state) => state.value?.processingState ?? AudioProcessingState.idle,
    ),
  );
}

@riverpod
bool isPlaying(Ref ref) {
  return ref.watch(
    playbackStateProvider.select((state) => state.value?.playing == true),
  );
}

@riverpod
Stream<MediaItem?> currentMediaItem(Ref ref) {
  return audioHandler.mediaItem;
}

@riverpod
Stream<Duration> globalPosition(Ref ref) {
  return audioHandler.positionStream;
}

@riverpod
Duration totalDuration(Ref ref) {
  final items = audioHandler.queue.value;
  if (items.isEmpty) return Duration.zero;
  final durationInSec = items.first.extras?['totalDuration'] as double? ?? 0.0;
  return durationInSec.toDuration;
}

@Riverpod(keepAlive: true)
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  @override
  FutureOr<void> build() => null;

  Future<void> play(String id) async {
    state = const AsyncLoading();

    state =
        await AsyncValue.guard(() async {
          final user = await ref.read(authenticatedUserProvider.future);
          final token = await ref.read(tokenProvider).getAccessToken(user.id);
          final item = await ref.read(itemDetailProvider(id).future);

          final (index, offset) = item.getIndexAndOffset();
          final mediaItems = item.toMediaItems(user.serverUrl);

          final sources = mediaItems.map((mediaItem) {
            return AudioSource.uri(
              user.serverUrl.resolve(mediaItem.id),
              headers: {'Authorization': 'Bearer $token'},
              tag: mediaItem,
            );
          }).toList();
          await audioHandler.setSources(
            sources,
            initialIndex: index,
            initialPosition: offset,
          );

          await audioHandler.play();
        }).onError((e, st) {
          LogService.log(
            'error playing item: $e',
            level: .error,
            source: 'AudioPlayerNotifier',
          );
          return AsyncValue.error('$e', st);
        });
  }
}

// @riverpod
// class SaveProgress extends _$SaveProgress {
//   int _lastSavedSecond = -1;
//   String? _lastTrackId;

//   @override
//   FutureOr<void> build() async {
//     final handler = ref.watch(audioHandlerProvider);
//     final globalPos =
//         ref.watch(lowResPositionProvider).value ?? Duration.zero;
//     final currentItem = handler.mediaItem.value;
//     final isPlaying = handler.playbackState.value.playing;
//     final processingState = handler.playbackState.value.processingState;

//     final currentSecond = globalPos.inSeconds;
//     final bookId = currentItem?.extras?['itemId'];
//     final trackId = currentItem?.id;

//     if (bookId == null) return;

//     final isHeartbeat =
//         currentSecond % 5 == 0 && currentSecond != _lastSavedSecond;
//     final isTrackChanged = _lastTrackId != null && _lastTrackId != trackId;
//     final isFinished = processingState == .completed;

//     if (isPlaying && (isHeartbeat || isTrackChanged || isFinished)) {
//       _lastSavedSecond = currentSecond;
//       _lastTrackId = trackId;
//       unawaited(_saveProgress(bookId, globalPos));
//     }
//   }

//   Future<void> _saveProgress(String id, Duration pos) async {
//     // final db =
//     ref.read(databaseProvider);
//     // await db.updateProgress(currentBookId, pos);
//     LogService.log(
//       'Saving progress for $id at ${pos.inSeconds}s',
//       source: 'SaveProgress',
//       level: .debug,
//     );
//   }
// }

@riverpod
class AudioOrchestrator extends _$AudioOrchestrator {
  @override
  void build() {
    ref.listen(activeItemIdProvider, (prev, next) {
      if (next != null) {
        ref.read(audioPlayerProvider.notifier).play(next);
      }
    });

    ref.listen(processingStateProvider, (prev, next) async {
      if (next == .loading) {
        ref.read(playerModeProvider.notifier).toMini();
        final activeItemId = ref.read(activeItemIdProvider);
        if (activeItemId == null) {
          final mediaItem = ref.read(currentMediaItemProvider).value;
          final id = mediaItem?.extras?['itemId'] as String?;
          await ref.read(userSettingsProvider.notifier).setActiveItemId(id);
        }
      } else if (next == .idle) {
        ref.read(playerHeightProvider.notifier).snapTo(.hidden);
      }
    });
  }
}
