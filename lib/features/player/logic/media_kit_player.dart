// import 'dart:async';

// import 'package:media_kit/media_kit.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:storii/app/logs/log_service.dart';
// import 'package:storii/features/player/logic/session_extensions.dart';
// import 'package:storii/features/player/models/app_audio_player.dart';
// import 'package:storii/features/player/models/app_audio_source.dart';
// import 'package:storii/features/player/models/app_playback_state.dart';

// part 'media_kit_player.g.dart';

// @Riverpod(keepAlive: true)
// AppAudioPlayer mediaKitPlayer(Ref ref) {
//   final player = MediaKitPlayer(
//     Player(configuration: const PlayerConfiguration()),
//   );
//   ref.onDispose(player.dispose);
//   return player;
// }

// class MediaKitPlayer implements AppAudioPlayer {
//   MediaKitPlayer(this._player) {
//     (_player.platform as NativePlayer?)?.setProperty('--gapless-audio', 'yes');
//     _stateController = StreamController<AppPlaybackState>.broadcast();
//     _initStreams();
//   }

//   final Player _player;
//   late final StreamController<AppPlaybackState> _stateController;
//   final List<StreamSubscription> _subs = [];

//   AppPlaybackState _currentState = const AppPlaybackState();

//   void _initStreams() {
//     final streams = [
//       _player.stream.playlist,
//       _player.stream.playing,
//       _player.stream.completed,
//       _player.stream.buffering,
//       _player.stream.rate,
//       _player.stream.volume,
//     ];
//     for (final s in streams) {
//       _subs.add(s.listen((_) => _emitState()));
//     }
//     _subs.add(
//       _player.stream.error.listen((error) {
//         LogService.log(
//           'MediaKit error: $error',
//           level: .error,
//           source: 'MediaKitPlayer',
//         );
//         _emitState(error: error);
//       }),
//     );
//     _subs.add(
//       _player.stream.position.listen((pos) {
//         _currentState = _currentState.copyWith(position: pos);
//       }),
//     );
//   }

//   void _emitState({String? error}) {
//     final s = _player.state;

//     final isLastTrack =
//         s.playlist.medias.isNotEmpty &&
//         s.playlist.index == s.playlist.medias.length - 1;

//     final AppPlaybackStatus status = switch (s) {
//       _ when s.playlist.medias.isEmpty => .idle,
//       _ when s.completed && isLastTrack => .completed,
//       _ when s.buffering => .buffering,
//       _ => .ready,
//     };

//     _currentState = AppPlaybackState(
//       status: status,
//       isPlaying: s.playing && status != .completed,
//       index: s.playlist.medias.isEmpty ? null : s.playlist.index,
//       position: s.position,
//       bufferedPosition: s.buffer,
//       speed: s.rate,
//       volume: s.volume,
//       error: error,
//     );

//     _stateController.add(_currentState);
//   }

//   @override
//   int? get index => _player.state.playlist.medias.isEmpty
//       ? null
//       : _player.state.playlist.index;

//   @override
//   Duration get position => _player.state.position;

//   @override
//   AppPlaybackState get state => _currentState;

//   @override
//   bool get isPlaying => _player.state.playing;

//   @override
//   Stream<AppPlaybackState> get stateStream => _stateController.stream;

//   @override
//   Stream<Duration> get positionStream => _player.stream.position;

//   @override
//   Stream<double> get volumeStream => _player.stream.volume;

//   @override
//   Future<void> setAudioSources(
//     List<AppAudioSource> sources, {
//     required int initialIndex,
//     required Duration initialPosition,
//   }) async {
//     final medias = sources
//         .map(
//           (s) =>
//               Media(s.uri, httpHeaders: s.headers, extras: s.mediaItem.toMap()),
//         )
//         .toList();
//     final playlist = Playlist(medias, index: initialIndex);

//     try {
//       await _player.open(playlist, play: false);
//       if (initialPosition != Duration.zero) {
//         await _player.stream.buffering
//             .firstWhere((b) => !b)
//             .timeout(const Duration(seconds: 15), onTimeout: () => false);

//         await _player.seek(initialPosition);
//       }
//     } catch (e) {
//       _emitState(error: e.toString());
//     }
//   }

//   @override
//   Future<void> play() => _player.play();

//   @override
//   Future<void> pause() => _player.pause();

//   @override
//   Future<void> stop() async {
//     await _player.stop();
//     _currentState = _currentState.copyWith(
//       status: .idle,
//       isPlaying: false,
//       position: Duration.zero,
//       index: null,
//       error: null,
//     );
//   }

//   @override
//   Future<void> seek(Duration position, {int? index}) async {
//     if (index != null && index != _currentState.index) {
//       await _player.jump(index);
//     }
//     await _player.seek(position);
//   }

//   @override
//   Future<void> setSpeed(double speed) => _player.setRate(speed);

//   @override
//   Future<void> setVolume(double volume) => _player.setVolume(volume);

//   @override
//   Future<void> dispose() async {
//     for (final sub in _subs) {
//       await sub.cancel();
//     }
//     await _stateController.close();
//     await _player.dispose();
//   }
// }
