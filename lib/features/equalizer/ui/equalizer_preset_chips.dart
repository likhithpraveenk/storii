import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/equalizer/logic/equalizer_controller.dart';
import 'package:storii/features/equalizer/logic/equalizer_presets.dart';
import 'package:storii/shared/widgets/chip_editor.dart';

class EqualizerPresetChips extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EqualizerPresetChips> createState() =>
      _EqualizerPresetChipsState();
}

class _EqualizerPresetChipsState extends ConsumerState<EqualizerPresetChips> {
  String? _editingId;

  @override
  Widget build(BuildContext context) {
    final presetId = ref.watch(equalizerPresetIdProvider);
    final controller = ref.watch(equalizerControllerProvider.notifier);
    final presets = ref.watch(equalizerPresetsProvider);

    return Container(
      width: double.infinity,
      padding: const .symmetric(horizontal: 24),
      child: Wrap(
        spacing: 8,
        children: [
          for (final preset in presets)
            if (_editingId == preset.id)
              Container(
                padding: const .only(top: 4),
                width: 160,
                child: ChipEditor(
                  key: ValueKey('rename-${preset.id}'),
                  initialText: preset.name,
                  onCommit: (name) async {
                    await controller.renamePreset(preset.id, name);
                    if (mounted) setState(() => _editingId = null);
                  },
                  suggestionsFor: (_) => [],
                ),
              )
            else
              GestureDetector(
                behavior: .translucent,
                onLongPress: preset.builtIn
                    ? null
                    : () => setState(() => _editingId = preset.id),
                onDoubleTap: preset.builtIn
                    ? null
                    : () => setState(() => _editingId = preset.id),
                child: InputChip(
                  label: Text(preset.name),
                  selected: preset.id == presetId,
                  onPressed: () => ref
                      .read(userSettingsProvider.notifier)
                      .setEqualizerPresetId(preset.id),
                  onDeleted: preset.builtIn
                      ? null
                      : () async {
                          await controller.deletePreset(preset.id);
                          if (mounted && _editingId == preset.id) {
                            setState(() => _editingId = null);
                          }
                        },
                ),
              ),
        ],
      ),
    );
  }
}
