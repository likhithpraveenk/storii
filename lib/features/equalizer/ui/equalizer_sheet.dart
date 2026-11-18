import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/equalizer/logic/equalizer_presets.dart';
import 'package:storii/features/equalizer/logic/equalizer_service.dart';
import 'package:storii/features/equalizer/ui/equalizer_bands.dart';
import 'package:storii/features/equalizer/ui/equalizer_preset_chips.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/empty_state.dart';

Future<void> openEqualizerSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    showDragHandle: false,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(kRadiusXl)),
    ),
    useSafeArea: true,
    builder: (_) => DraggableScrollableSheet(
      minChildSize: 0.4,
      initialChildSize: 0.6,
      expand: false,
      builder: (_, controller) => _EqualizerSheetBody(controller),
    ),
  );
}

class EqualizerButton extends ConsumerWidget {
  const new({super.key, this.inOverflow = false});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSupported = ref.watch(equalizerServiceProvider).supported;

    if (inOverflow) {
      return ListTile(
        title: Text(l10n.equalizer),
        leading: const Icon(Icons.equalizer),
        trailing: const EqualizerSubtitle(),
        enabled: isSupported,
        onTap: () {
          final navigator = Navigator.of(context)..pop();
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => openEqualizerSheet(navigator.context),
          );
        },
      );
    }

    return IconButton(
      tooltip: l10n.equalizer,
      onPressed: isSupported ? () => openEqualizerSheet(context) : null,
      icon: const Icon(Icons.equalizer),
    );
  }
}

class EqualizerSubtitle extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(isEqualizerEnabledProvider)) {
      return Text(l10n.off);
    }

    final preset = ref.watch(currentEqualizerPresetProvider);
    return Text(preset.name);
  }
}

class _EqualizerSheetBody extends ConsumerWidget {
  const new(this.controller);

  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supported = ref.watch(equalizerServiceProvider).supported;
    return DecoratedBox(
      decoration: bottomSheetDecoration(context),
      child: ListView(
        padding: MediaQuery.viewInsetsOf(context).add(const .only(bottom: 48)),
        controller: controller,
        children: [
          Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Padding(
                padding: const .fromLTRB(16, 16, 16, 0),
                child: Stack(
                  alignment: .center,
                  children: [
                    Align(
                      child: Text(
                        l10n.equalizer,
                        style: bottomSheetTitleTextStyle(context),
                        textAlign: .center,
                      ),
                    ),
                    Align(
                      alignment: .centerRight,
                      child: Switch(
                        value: ref.watch(isEqualizerEnabledProvider),
                        onChanged: supported
                            ? (value) => ref
                                  .read(userSettingsProvider.notifier)
                                  .setIsEqualizerEnabled(value)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const .fromLTRB(24, 8, 24, 12),
                child: Text(
                  l10n.equalizerQualityNote,
                  style: bottomSheetSubtitleTextStyle(context),
                  textAlign: .center,
                ),
              ),
            ],
          ),
          if (supported) ...const [
            _LoudnessSlider(),
            EqualizerPresetChips(),
            SizedBox(height: 8),
            EqualizerBands(),
          ] else
            SizedBox(
              height: 200,
              child: Center(child: EmptyState(subtitle: l10n.notSupported)),
            ),
        ],
      ),
    );
  }
}

class _LoudnessSlider extends ConsumerWidget {
  const new();

  String _label(double v) => '${v.round()} dB';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(loudnessGainDbProvider);
    return SettingSlider(
      title: l10n.loudnessBoost,
      value: value,
      trailing: _label(value),
      padding: const .fromLTRB(16, 0, 16, 8),
      labelBuilder: _label,
      min: -15,
      max: 15,
      divisions: 30,
      onChangeEnd: (v) =>
          ref.read(userSettingsProvider.notifier).setLoudnessGainDb(v),
    );
  }
}
