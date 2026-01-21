import 'package:audio_service/audio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/database_provider.dart';

part 'audio_handler_provider.g.dart';

@Riverpod(keepAlive: true)
AudioHandler audioHandler(Ref ref) {
  throw UnimplementedError();
}

@riverpod
Stream<PlaybackState> playbackStateStream(Ref ref) async* {
  final handler = ref.watch(audioHandlerProvider);
  yield* handler.playbackState;
}

@riverpod
class SaveProgress extends _$SaveProgress {
  @override
  FutureOr<void> build() async {
    ref.watch(audioHandlerProvider);

    ref.listen(playbackStateStreamProvider, (prev, next) {
      final position = next.value?.updatePosition;
      if (position != null && position.inSeconds % 5 == 0) {
        _saveProgressToDrift(position);
      }
    });
  }

  Future<void> _saveProgressToDrift(Duration pos) async {
    // final db =
    ref.read(databaseProvider);
    // await db.updateProgress(currentBookId, pos);
  }
}
