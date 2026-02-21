import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/player/logic/active_item_provider.dart';
import 'package:storii/features/player/logic/audio_handler.dart';
import 'package:storii/features/player/logic/player_providers.dart';
import 'package:storii/features/player/logic/to_media_items.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'audio_providers.g.dart';

late final AppAudioHandler audioHandler;

@Riverpod(keepAlive: true)
Stream<PlaybackState> playbackState(Ref ref) {
  return audioHandler.playbackState;
}

@Riverpod(keepAlive: true)
Stream<MediaItem?> currentMediaItem(Ref ref) {
  return audioHandler.mediaItem;
}

@riverpod
Stream<Duration> highResPosition(Ref ref) => AudioService.position;

@riverpod
Stream<Duration> lowResPosition(Ref ref) {
  return AudioService.position
      .map((p) => Duration(seconds: p.inSeconds))
      .distinct();
}

@Riverpod(keepAlive: true)
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  @override
  FutureOr<void> build() => null;

  Future<void> play(ItemDomain item) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final user = await ref.read(authenticatedUserProvider.future);
      final token = await ref.read(tokenProvider).getAccessToken(user.id);

      final audiobook = item as Audiobook;
      final (index, offset) = audiobook.getIndexAndOffset();
      final mediaItems = audiobook.toMediaItems(user.serverUrl);

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
//     final bookId = currentItem?.extras?['bookId'];
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
    ref.listen(activeItemProvider, (prev, next) {
      if (next != null) {
        ref.read(audioPlayerProvider.notifier).play(next);
        ref.read(playerControllerProvider.notifier).toFull();
      }
    });

    ref.listen(playbackStateProvider, (prev, next) {
      final state = next.value;
      if (state == null) return;

      if (state.processingState == .loading) {
        ref.read(playerControllerProvider.notifier).toFull();
      } else if (state.processingState == .idle) {
        ref.read(playerControllerProvider.notifier).toHidden();
      }
    });
  }
}
