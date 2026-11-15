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
    id: 'clarity',
    builtIn: true,
    name: l10n.equalizerPresetClarity,
    bands: {
      .hz32: -4,
      .hz64: -3,
      .hz125: -2,
      .hz250: -1,
      .hz2k: 2,
      .hz4k: 4,
      .hz8k: 1,
    },
  ),
  EqualizerPreset(
    id: 'warm',
    builtIn: true,
    name: l10n.equalizerPresetWarm,
    bands: {.hz125: 2, .hz250: 3, .hz500: 1, .hz4k: -1, .hz8k: -2, .hz16k: -2},
  ),
  EqualizerPreset(
    id: 'sibilance_tame',
    builtIn: true,
    name: l10n.equalizerPresetSibilanceTame,
    bands: {.hz2k: -1, .hz4k: -2, .hz8k: -4, .hz16k: -3},
  ),
  EqualizerPreset(
    id: 'whisper',
    builtIn: true,
    name: l10n.equalizerPresetWhisper,
    bands: {
      .hz32: -3,
      .hz64: -2,
      .hz125: -2,
      .hz2k: 2,
      .hz4k: 3,
      .hz8k: 3,
      .hz16k: 2,
    },
  ),
  EqualizerPreset(
    id: 'dialogue_focus',
    builtIn: true,
    name: l10n.equalizerPresetDialogueFocus,
    bands: {
      .hz32: -4,
      .hz64: -3,
      .hz125: -1,
      .hz1k: 2,
      .hz2k: 3,
      .hz4k: 1,
      .hz8k: -2,
      .hz16k: -3,
    },
  ),
  EqualizerPreset(
    id: 'cinematic',
    builtIn: true,
    name: l10n.equalizerPresetCinematic,
    bands: {
      .hz32: 3,
      .hz64: 3,
      .hz125: 1,
      .hz250: -1,
      .hz500: -1,
      .hz2k: 1,
      .hz4k: 2,
      .hz8k: 3,
      .hz16k: 2,
    },
  ),
  EqualizerPreset(
    id: 'old_recording',
    builtIn: true,
    name: l10n.equalizerPresetOldRecording,
    bands: {
      .hz32: -6,
      .hz64: -4,
      .hz125: -1,
      .hz1k: 1,
      .hz2k: 2,
      .hz8k: -4,
      .hz16k: -6,
    },
  ),
  EqualizerPreset(
    id: 'phone_speaker',
    builtIn: true,
    name: l10n.equalizerPresetPhoneSpeaker,
    bands: {
      .hz32: -6,
      .hz64: -6,
      .hz125: -4,
      .hz250: -1,
      .hz1k: 2,
      .hz2k: 3,
      .hz4k: 2,
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
