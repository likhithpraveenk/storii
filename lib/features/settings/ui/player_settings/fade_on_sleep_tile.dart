import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class FadeOnSleepTile extends ConsumerWidget {
  const FadeOnSleepTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(fadeOnSleepProvider);

    return Column(
      children: [
        SwitchListTile(
          secondary: const Icon(Icons.gradient),
          title: Text(l10n.fadeOnSleep),
          subtitle: Text(l10n.fadeOnSleepSubtitle),
          value: enabled,
          onChanged: (value) =>
              ref.read(userSettingsProvider.notifier).setFadeOnSleep(value),
        ),
        if (enabled) ...[
          const FadeOnSleepDurationTile(),
          const FadeOnSleepMinVolumeTile(),
        ],
      ],
    );
  }
}

class FadeOnSleepDurationTile extends ConsumerStatefulWidget {
  const FadeOnSleepDurationTile({super.key});

  @override
  ConsumerState<FadeOnSleepDurationTile> createState() =>
      _FadeOnSleepDurationTileState();
}

class _FadeOnSleepDurationTileState
    extends ConsumerState<FadeOnSleepDurationTile> {
  late int _durationSec;

  static const _presets = [30, 60, 90];

  @override
  void initState() {
    super.initState();
    _durationSec = ref.read(fadeOnSleepDurationProvider).inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(fadeOnSleepDurationProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.timelapse),
      title: Text(l10n.fadeOnSleepDuration),
      subtitle: Text('${duration.inSeconds}s'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.fadeOnSleepDuration,
          subtitle: l10n.fadeOnSleepDurationDescription,
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    WheelPicker.fromIntRange(
                      initialValue: _durationSec,
                      min: 20,
                      max: 120,
                      step: 5,
                      onChangedEnd: (sec) => _durationSec = sec,
                      labelBuilder: (v) => '${v}s',
                      presets: _presets,
                    ),
                    const SizedBox(height: 24),
                    AppFilledButton(
                      onPressed: () {
                        notifier.setFadeOnSleepDuration(
                          Duration(seconds: _durationSec),
                        );
                        Navigator.of(context).pop();
                      },
                      text: l10n.save,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FadeOnSleepMinVolumeTile extends ConsumerStatefulWidget {
  const FadeOnSleepMinVolumeTile({super.key});

  @override
  ConsumerState<FadeOnSleepMinVolumeTile> createState() =>
      _FadeOnSleepMinVolumeTileState();
}

class _FadeOnSleepMinVolumeTileState
    extends ConsumerState<FadeOnSleepMinVolumeTile> {
  late double _volume;

  static const _presets = [0.0, 0.1, 0.2, 0.5];

  @override
  void initState() {
    super.initState();
    _volume = ref.read(fadeOnSleepMinVolumeProvider);
  }

  @override
  Widget build(BuildContext context) {
    final volume = ref.watch(fadeOnSleepMinVolumeProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.volume_down),
      title: Text(l10n.fadeOnSleepMinVolume),
      subtitle: Text('${(volume * 100).round()}%'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.fadeOnSleepMinVolume,
          subtitle: l10n.fadeOnSleepMinVolumeDescription,
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    WheelPicker.fromDoubleRange(
                      initialValue: _volume,
                      min: 0.0,
                      max: 1.0,
                      step: 0.05,
                      onChangedEnd: (v) => _volume = v,
                      labelBuilder: (v) => '${(v * 100).round()}%',
                      presets: _presets,
                    ),
                    const SizedBox(height: 24),
                    AppFilledButton(
                      onPressed: () {
                        notifier.setFadeOnSleepMinVolume(_volume);
                        Navigator.of(context).pop();
                      },
                      text: l10n.save,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
