import 'dart:async';
import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/equalizer/models/equalizer.dart';

part 'equalizer_service.g.dart';

const _source = 'Equalizer';
const _parameterTimeout = Duration(seconds: 5);

class EqualizerService {
  new _({this._equalizer, this.pipeline});

  factory create({bool? isAndroid}) {
    if (!(isAndroid ?? Platform.isAndroid)) return EqualizerService._();
    final equalizer = AndroidEqualizer();
    return EqualizerService._(
      equalizer: equalizer,
      pipeline: AudioPipeline(androidAudioEffects: [equalizer]),
    );
  }

  final AudioPipeline? pipeline;
  final AndroidEqualizer? _equalizer;

  EqualizerParameters? _parameters;
  List<AndroidEqualizerBand>? _deviceBands;
  Future<EqualizerParameters?>? _loading;
  bool _disposed = false;

  bool get supported => _equalizer != null;

  EqualizerParameters? get parameters => _parameters;

  Future<EqualizerParameters?> loadParameters() {
    final cached = _parameters;
    if (cached != null) return Future.value(cached);
    return _loading ??= _fetchParameters();
  }

  Future<void> apply({
    required bool enabled,
    required Map<EqualizerFrequency, double> bands,
  }) async {
    final equalizer = _equalizer;
    if (equalizer == null || _disposed) return;

    if (!enabled) {
      return _toggle(equalizer, enabled: false);
    }

    final params = await loadParameters();
    final deviceBands = _deviceBands;
    if (params == null || deviceBands == null) return;

    for (final band in deviceBands) {
      final gain = _nearestGain(
        bands,
        band.centerFrequency,
      ).clamp(params.minDecibels, params.maxDecibels);
      await band.setGain(gain);
    }

    if (_disposed) return;
    await _toggle(equalizer, enabled: true);
  }

  Future<void> dispose() async {
    _disposed = true;
    final equalizer = _equalizer;
    if (equalizer != null) {
      await _toggle(equalizer, enabled: false);
    }
  }

  double _nearestGain(Map<EqualizerFrequency, double> gains, double frequency) {
    final hertz = frequency.round();
    for (final entry in gains.entries) {
      if (entry.key.hertz == hertz) return entry.value;
    }

    double bestGain = 0;
    double bestDistance = double.infinity;
    for (final entry in gains.entries) {
      final distance = (entry.key.hertz - frequency).abs();
      if (distance < bestDistance) {
        bestDistance = distance;
        bestGain = entry.value;
      }
    }
    return bestGain;
  }

  Future<EqualizerParameters?> _fetchParameters() async {
    final equalizer = _equalizer;
    if (equalizer == null) return null;
    try {
      final params = await equalizer.parameters.timeout(_parameterTimeout);
      _parameters = EqualizerParameters(
        minDecibels: params.minDecibels,
        maxDecibels: params.maxDecibels,
        centerFrequencies: [
          for (final band in params.bands) band.centerFrequency,
        ],
      );
      _deviceBands = params.bands;
      return _parameters;
    } catch (e, st) {
      LogService.log(
        'equalizer parameters unavailable: $e',
        level: .warning,
        source: _source,
        stackTrace: st,
      );
      return null;
    } finally {
      _loading = null;
    }
  }

  Future<void> _toggle(
    AndroidEqualizer equalizer, {
    required bool enabled,
  }) async {
    try {
      await equalizer.setEnabled(enabled);
    } catch (e, st) {
      LogService.log(
        'failed to ${enabled ? 'enable' : 'disable'} equalizer: $e',
        source: _source,
        stackTrace: st,
      );
    }
  }
}

@Riverpod(keepAlive: true)
EqualizerService equalizerService(Ref ref) {
  final instance = EqualizerService.create();
  ref.onDispose(instance.dispose);
  return instance;
}

@riverpod
Future<EqualizerParameters?> equalizerParameters(Ref ref) =>
    ref.read(equalizerServiceProvider).loadParameters();
