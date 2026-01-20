// import 'dart:async';

// import 'package:audio_service/audio_service.dart' hide AudioHandler;
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:storii/app/background/audio_handler.dart';

// part 'global_player_provider.g.dart';

// final audioHandlerProvider = Provider<AudioHandler>((ref) {
//   throw UnimplementedError('Initialize in main.dart');
// });

// @Riverpod(keepAlive: true)
// class GlobalPlayer extends _$GlobalPlayer {
//   late AudioHandler _handler;
//   Timer? _syncTimer;

//   @override
//   Stream<PlaybackState> build() {
//     _handler = ref.watch(audioHandlerProvider);

//     _syncTimer = Timer.periodic(
//       const Duration(seconds: 10),
//       (_) => _syncToABS(),
//     );
//     ref.onDispose(() => _syncTimer?.cancel());

//     return _handler.playbackState;
//   }

//   Future<void> play(
//     List<MediaItem> tracks,
//     int startTrackIndex,
//     int startOffsetSeconds,
//   ) async {
//     await _handler.loadBook(
//       tracks,
//       startTrackIndex,
//       Duration(seconds: startOffsetSeconds),
//     );
//     await _handler.play();
//   }

//   Future<void> _syncToABS() async {
//     final state = _handler.playbackState.value;

//     if (!state.playing || state.processingState != .ready) {
//       return;
//     }

//     // final trackIndex = state.queueIndex ?? 0;
//     // final positionSeconds = state.position.inSeconds;

//     // final user = await ref.read(authenticatedUserProvider.future);
//     // await ref
//     //     .read(sessionsApiProvider(user))
//     //     .syncLocal(
//     //       localSession: const PlaybackSession(
//     //         id: '',
//     //         userId: '',
//     //         libraryId: '',
//     //         libraryItemId: '',
//     //         mediaType: .book,
//     //         mediaMetadata: null,
//     //         chapters: [],
//     //         displayTitle: '',
//     //         displayAuthor: '',
//     //         duration: null,
//     //         playMethod: null,
//     //         mediaPlayer: '',
//     //         date: '',
//     //         dayOfWeek: '',
//     //         timeListening: null,
//     //         startTime: null,
//     //         currentTime: null,
//     //         startedAt: null,
//     //         updatedAt: null,
//     //       ),
//     //     );
//   }

//   Future<void> togglePlay() async {
//     final playing = _handler.playbackState.value.playing;
//     playing ? await _handler.pause() : await _handler.play();
//   }

//   Future<void> seekRelative(int seconds) async {
//     final current = _handler.playbackState.value.position;
//     await _handler.seek(current + Duration(seconds: seconds));
//   }
// }
