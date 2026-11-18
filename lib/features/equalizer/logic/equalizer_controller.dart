import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/equalizer/logic/equalizer_presets.dart';
import 'package:storii/features/equalizer/logic/equalizer_service.dart';
import 'package:storii/features/equalizer/models/equalizer.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/equalizer_store.dart';

part 'equalizer_controller.g.dart';

@riverpod
class EqualizerController extends _$EqualizerController {
  bool get _isEnabled => ref.read(isEqualizerEnabledProvider);

  EqualizerStore get _store => ref.read(equalizerStoreProvider);

  UserSettingsNotifier get _settings => ref.read(userSettingsProvider.notifier);

  @override
  EqualizerDraft build() {
    final preset = ref.watch(currentEqualizerPresetProvider);
    Future.microtask(() {
      if (ref.read(sessionProvider) != null) {
        _apply(enabled: _isEnabled, bands: preset.bands);
        _applyLoudness();
      }
    });
    ref.listen(isEqualizerEnabledProvider, (_, enabled) {
      _apply(enabled: enabled, bands: state.bands);
    });
    ref.listen(loudnessGainDbProvider, (_, _) => _applyLoudness());
    ref.listen(playbackStatusProvider, (_, next) {
      if (next.value == .ready) {
        _apply(enabled: _isEnabled, bands: preset.bands);
        _applyLoudness();
      }
    });

    return EqualizerDraft(
      presetId: preset.id,
      preset: preset,
      bands: {...preset.bands},
    );
  }

  void previewBand(EqualizerFrequency frequency, double gain) {
    state = state.withBand(frequency, gain);
  }

  Future<void> commit({String? name}) async {
    final draft = state;
    if (!draft.isDirty) return;
    final current = draft.preset;
    final trimmed = name?.trim();
    final hasName = trimmed != null && trimmed.isNotEmpty;

    final EqualizerPreset saved;
    if (current == null || current.builtIn) {
      saved = EqualizerPreset(
        id: _newPresetId(),
        name: hasName ? trimmed : _nextForkName(),
        bands: state.bands,
      );
    } else {
      saved = current.copyWith(bands: state.bands);
    }

    await _store.save(saved.id, saved);
    await _settings.setEqualizerPresetId(saved.id);
  }

  Future<void> renamePreset(String id, String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;

    final preset = _store.getAll().firstWhereOrNull((p) => p.id == id);
    if (preset == null || preset.builtIn || preset.name == trimmed) return;

    final renamed = preset.copyWith(name: trimmed);
    await _store.save(id, renamed);
  }

  Future<void> deletePreset(String id) async {
    await _store.delete(id);
    if (state.presetId != id) return;
    await _settings.setEqualizerPresetId(DefaultUserSettings.equalizerPresetId);
  }

  void _apply({
    required bool enabled,
    required Map<EqualizerFrequency, double> bands,
  }) {
    final service = ref.read(equalizerServiceProvider);
    if (!service.supported) return;
    service.apply(enabled: enabled, bands: bands);
  }

  void _applyLoudness() {
    final service = ref.read(equalizerServiceProvider);
    if (!service.supported) return;
    final db = ref.read(loudnessGainDbProvider);
    service.setLoudness(db);
  }

  String _nextForkName() => '${l10n.custom} (${_store.getAll().length + 1})';

  String _newPresetId() => 'custom_${DateTime.now().microsecondsSinceEpoch}';
}
