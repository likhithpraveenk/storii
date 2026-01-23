import 'package:audio_service/audio_service.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/background/audio_handler.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/features/player/logic/audio_player_provider.dart';

part 'audio_providers.g.dart';

@Riverpod(keepAlive: true)
MyAudioHandler audioHandler(Ref ref) {
  throw UnimplementedError();
}

@riverpod
class SaveProgress extends _$SaveProgress {
  int _lastSavedSecond = -1;

  @override
  FutureOr<void> build() async {
    final handler = ref.watch(audioHandlerProvider);

    ref.listen(audioPlayerProvider, (prev, next) {
      final state = next.value;
      if (state == null) return;

      final currentItem = handler.mediaItem.value;
      final pos = state.updatePosition;
      final currentSecond = pos.inSeconds;

      if (currentSecond % 5 == 0 && currentSecond != _lastSavedSecond) {
        _lastSavedSecond = currentSecond;

        final itemId = currentItem?.extras?['itemId'];
        if (itemId != null) {
          _saveProgress(itemId, pos);
        }
      }
    });
  }

  Future<void> _saveProgress(String id, Duration pos) async {
    // final db =
    ref.read(databaseProvider);
    // await db.updateProgress(currentBookId, pos);
    // TODO: save progress locally and with abs
    debugPrint('Saving progress for $id at ${pos.inSeconds}s');
  }
}

@riverpod
Stream<MediaItem?> currentMediaItem(Ref ref) {
  return ref.watch(audioHandlerProvider).mediaItem;
}

@riverpod
Duration totalDuration(Ref ref) {
  return ref.watch(currentMediaItemProvider).value?.duration ?? Duration.zero;
}
