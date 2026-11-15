import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/equalizer/models/equalizer.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/equalizer_store.dart';

part 'equalizer_presets.g.dart';

final builtInEqualizerPresets = <EqualizerPreset>[
  EqualizerPreset(id: 'flat', builtIn: true, name: l10n.equalizerPresetFlat),
  EqualizerPreset(
    id: 'vocal',
    builtIn: true,
    name: l10n.equalizerPresetVocal,
    bands: {
      .hz32: -2,
      .hz64: -2,
      .hz125: -1,
      .hz500: 1,
      .hz1k: 3,
      .hz2k: 3,
      .hz4k: 2,
    },
  ),
  EqualizerPreset(
    id: 'rumble_cut',
    builtIn: true,
    name: l10n.equalizerPresetRumbleCut,
    bands: {.hz32: -6, .hz64: -5, .hz125: -3, .hz250: -1},
  ),
  EqualizerPreset(
    id: 'night',
    builtIn: true,
    name: l10n.equalizerPresetNight,
    bands: {
      .hz32: 2,
      .hz64: 2,
      .hz125: 1,
      .hz2k: 1,
      .hz4k: 2,
      .hz8k: 2,
      .hz16k: 1,
    },
  ),
];

List<EqualizerPreset> allEqualizerPresets(List<EqualizerPreset> stored) => [
  ...builtInEqualizerPresets,
  ...stored,
];

@riverpod
List<EqualizerPreset> equalizerPresets(Ref ref) {
  final stored = ref.watch(storedEqualizerPresetsProvider).value;
  return [...builtInEqualizerPresets, ...?stored];
}

@riverpod
EqualizerPreset currentEqualizerPreset(Ref ref) {
  final presets = ref.watch(equalizerPresetsProvider);
  final presetId = ref.watch(equalizerPresetIdProvider);
  return presets.firstWhereOrNull((p) => p.id == presetId) ??
      builtInEqualizerPresets.first;
}
