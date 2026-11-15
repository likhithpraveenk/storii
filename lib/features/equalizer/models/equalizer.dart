import 'package:freezed_annotation/freezed_annotation.dart';

part 'equalizer.freezed.dart';
part 'equalizer.g.dart';

enum EqualizerFrequency {
  hz32,
  hz64,
  hz125,
  hz250,
  hz500,
  hz1k,
  hz2k,
  hz4k,
  hz8k,
  hz16k;

  int get hertz => switch (this) {
    .hz32 => 32,
    .hz64 => 64,
    .hz125 => 125,
    .hz250 => 250,
    .hz500 => 500,
    .hz1k => 1000,
    .hz2k => 2000,
    .hz4k => 4000,
    .hz8k => 8000,
    .hz16k => 16000,
  };
}

@freezed
sealed class EqualizerPreset with _$EqualizerPreset {
  const factory({
    required String id,
    required String name,
    @Default(<EqualizerFrequency, double>{})
    Map<EqualizerFrequency, double> bands,
    @Default(false) bool builtIn,
  }) = _EqualizerPreset;

  factory fromJson(Map<String, dynamic> json) =>
      _$EqualizerPresetFromJson(json);
}

extension EqualizerPresetX on EqualizerPreset {
  double gainAt(EqualizerFrequency frequency) => bands[frequency] ?? 0;
}

class EqualizerParameters {
  const new({
    required this.minDecibels,
    required this.maxDecibels,
    required this.centerFrequencies,
  });

  final double minDecibels;
  final double maxDecibels;

  final List<double> centerFrequencies;
}

@freezed
sealed class EqualizerDraft with _$EqualizerDraft {
  const new _();

  const factory({
    required String presetId,
    required EqualizerPreset? preset,
    @Default(<EqualizerFrequency, double>{})
    Map<EqualizerFrequency, double> bands,
  }) = _EqualizerDraft;

  bool get isDirty {
    final preset = this.preset;
    if (preset == null) return false;
    return EqualizerFrequency.values.any(
      (f) => (bands[f] ?? 0) != preset.gainAt(f),
    );
  }

  EqualizerDraft withBand(EqualizerFrequency frequency, double gain) {
    final bands = {...this.bands};
    if (gain == 0) {
      bands.remove(frequency);
    } else {
      bands[frequency] = gain;
    }
    return copyWith(bands: bands);
  }
}
