import 'dart:async';
import 'dart:math';

import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/models/app_audio_player.dart';
import 'package:storii/features/player/models/app_audio_source.dart';
import 'package:storii/features/player/models/app_playback_error.dart';
import 'package:storii/features/player/models/app_playback_state.dart';

part 'just_audio_player.g.dart';

@Riverpod(keepAlive: true)
AppAudioPlayer justAudioPlayer(Ref ref) {
  final minBuffer = ref.read(minBufferDurationProvider);

  final player = JustAudioPlayer(
    AudioPlayer(
      audioLoadConfiguration: AudioLoadConfiguration(
        androidLoadControl: AndroidLoadControl(
          minBufferDuration: minBuffer,
          maxBufferDuration: minBuffer * 2,
          bufferForPlaybackDuration: Duration(
            milliseconds: max(minBuffer.inMilliseconds * 0.05, 2000).round(),
          ),
          bufferForPlaybackAfterRebufferDuration: Duration(
            milliseconds: max(minBuffer.inMilliseconds * 0.10, 5000).round(),
          ),
          prioritizeTimeOverSizeThresholds: true,
        ),
        darwinLoadControl: DarwinLoadControl(
          preferredForwardBufferDuration: minBuffer,
        ),
      ),
    ),
  );
  ref.onDispose(player.dispose);
  return player;
}

const _source = 'JustAudioPlayer';

class JustAudioPlayer implements AppAudioPlayer {
  JustAudioPlayer(this._player);

  late final AudioPlayer _player;
  final _errorController = StreamController<AppPlaybackError>.broadcast();

  @override
  int? get index => _player.currentIndex;

  @override
  Duration get position => _player.position;

  @override
  bool get isPlaying => _player.playing;

  @override
  AppPlaybackState get state => .new(
    status: _mapState(_player.processingState),
    index: _player.currentIndex,
    position: _player.position,
    bufferedPosition: _player.bufferedPosition,
    isPlaying: _player.playing,
    speed: _player.speed,
    volume: _player.volume,
  );

  @override
  Stream<AppPlaybackState> get stateStream => Rx.merge([
    _player.playbackEventStream.map(
      (event) => AppPlaybackState(
        status: _mapState(event.processingState),
        index: event.currentIndex,
        position: event.updatePosition,
        bufferedPosition: event.bufferedPosition,
        error: null,
        isPlaying: _player.playing,
        speed: _player.speed,
        volume: _player.volume,
      ),
    ),
    _errorController.stream.map((msg) => state.copyWith(error: msg)),
  ]);

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Stream<double> get volumeStream => _player.volumeStream;

  @override
  Future<void> setSpeed(double speed) => _player.setSpeed(speed);

  @override
  Future<void> setVolume(double volume) => _player.setVolume(volume);

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position, {int? index}) =>
      _player.seek(position, index: index);

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> setAudioSources(
    List<AppAudioSource> sources, {
    required int initialIndex,
    required Duration initialPosition,
  }) async {
    final justAudioSources = sources.map((s) {
      switch (s.type) {
        case .hls:
          return HlsAudioSource(
            s.uri,
            headers: s.headers,
            tag: s.tag,
            duration: s.duration,
          );
        case .dash:
          return DashAudioSource(
            s.uri,
            headers: s.headers,
            tag: s.tag,
            duration: s.duration,
          );
        default:
          return ProgressiveAudioSource(
            s.uri,
            headers: s.headers,
            tag: s.tag,
            duration: s.duration,
          );
      }
    }).toList();

    try {
      await _player.setAudioSources(
        justAudioSources,
        initialIndex: initialIndex,
        initialPosition: initialPosition,
      );
    } on PlayerException catch (e) {
      LogService.log(
        'Error code: ${e.code}; message: ${e.message}',
        level: .error,
        source: _source,
      );
      _errorController.add(_classifyMessage(e.message));
    } on PlayerInterruptedException catch (e) {
      LogService.log(
        'Connection interrupted: ${e.message}',
        level: .error,
        source: _source,
      );
      _errorController.add(.network);
    } catch (e) {
      LogService.log(
        'An unknown error occurred',
        originalError: e,
        level: .error,
        source: _source,
      );
      _errorController.add(_classifyMessage(e.toString()));
    }
  }

  AppPlaybackError _classifyMessage(String? message) {
    final lower = message?.toLowerCase() ?? '';
    if (lower.contains('network') ||
        lower.contains('socket') ||
        lower.contains('host lookup') ||
        lower.contains('connection') ||
        lower.contains('timeout') ||
        lower.contains('timed out')) {
      return .network;
    }
    if (lower.contains('source') ||
        lower.contains('404') ||
        lower.contains('403') ||
        lower.contains('not found') ||
        lower.contains('forbidden')) {
      return .source;
    }
    if (lower.contains('decode') ||
        lower.contains('format') ||
        lower.contains('codec') ||
        lower.contains('unsupported')) {
      return .decoder;
    }
    return .unknown;
  }

  AppPlaybackStatus _mapState(ProcessingState state) {
    return switch (state) {
      .idle => .idle,
      .loading => .buffering,
      .buffering => .buffering,
      .ready => .ready,
      .completed => .completed,
    };
  }

  @override
  Future<void> dispose() async {
    await _errorController.close();
    await _player.dispose();
  }
}
