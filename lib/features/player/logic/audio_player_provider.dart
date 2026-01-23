import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/background/audio_handler.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/to_media_items.dart';

part 'audio_player_provider.g.dart';

@Riverpod(keepAlive: true)
class AudioPlayer extends _$AudioPlayer {
  late MyAudioHandler _handler;
  // Timer? _syncTimer;

  @override
  Stream<PlaybackState> build() {
    _handler = ref.watch(audioHandlerProvider);

    // _syncTimer = Timer.periodic(
    //   const Duration(seconds: 10),
    //   (_) => _syncToABS(),
    // );
    // ref.onDispose(() => _syncTimer?.cancel());

    return _handler.playbackState;
  }

  Future<void> play(ItemDomain item) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final token = await ref.read(tokenProvider).getAccessToken(user.id);

    await _handler.loadBook(
      items: item.toMediaItems(user.serverUrl),
      initialIndex: calculateStartIndex(item as Audiobook),
      initialPosition: item.currentOffset,
      serverUrl: user.serverUrl,
      token: token,
    );
    await _handler.play();
  }

  // Future<void> _syncToABS() async {
  //   final state = _handler.playbackState.value;

  //   if (!state.playing || state.processingState != .ready) {
  //     return;
  //   }

  // final trackIndex = state.queueIndex ?? 0;
  // final positionSeconds = state.position.inSeconds;

  // final user = await ref.read(authenticatedUserProvider.future);
  // await ref
  //     .read(sessionsApiProvider(user))
  //     .syncLocal(
  //       localSession: const PlaybackSession(
  //         id: '',
  //         userId: '',
  //         libraryId: '',
  //         libraryItemId: '',
  //         mediaType: .book,
  //         mediaMetadata: null,
  //         chapters: [],
  //         displayTitle: '',
  //         displayAuthor: '',
  //         duration: null,
  //         playMethod: null,
  //         mediaPlayer: '',
  //         date: '',
  //         dayOfWeek: '',
  //         timeListening: null,
  //         startTime: null,
  //         currentTime: null,
  //         startedAt: null,
  //         updatedAt: null,
  //       ),
  //     );
  // }

  Future<void> togglePlay() async {
    final playing = _handler.playbackState.value.playing;
    playing ? await _handler.pause() : await _handler.play();
  }

  Future<void> seek(int seconds) async {
    final current = _handler.playbackState.value.position;
    await _handler.seek(current + Duration(seconds: seconds));
  }

  Future<void> rewind() async {
    await _handler.rewind();
  }

  Future<void> fastForward() async {
    await _handler.fastForward();
  }

  Future<void> skipToStartOfChapter() async {
    await _handler.skipToPrevious();
  }

  Future<void> skipToNextChapter() async {
    await _handler.skipToNext();
  }
}

int calculateStartIndex(Audiobook item) {
  Duration accumulatedDuration = Duration.zero;

  for (int i = 0; i < item.tracks.length; i++) {
    final trackDuration = item.tracks[i].duration;

    if (item.currentOffset < accumulatedDuration + trackDuration) {
      return i;
    }

    accumulatedDuration += trackDuration;
  }

  return item.tracks.isNotEmpty ? item.tracks.length - 1 : 0;
}
