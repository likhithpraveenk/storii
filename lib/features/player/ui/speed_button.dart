import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SpeedButton extends ConsumerWidget {
  const SpeedButton({super.key, required this.inOverflow});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speed = ref.watch(localSpeedProvider);
    const speedPresets = [0.8, 1.0, 1.5, 2.0];
    Future<void> openSheet() => AppBottomSheet.show(
      context,
      title: l10n.playbackSpeed,
      body: WheelPicker.fromDoubleRange(
        initialValue: speed,
        min: 0.5,
        max: 4.0,
        step: 0.1,
        labelBuilder: (v) => '${v}x',
        onChangedEnd: (v) {
          ref.read(localSpeedProvider.notifier).setSpeed(v);
        },
        presets: speedPresets,
      ),
    );
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.playbackSpeed),
        leading: const Icon(Icons.speed_rounded),
        trailing: Text('${speed}x'),
        onTap: () {
          Navigator.of(context).pop();
          openSheet();
        },
      );
    }

    return IconButton(
      onPressed: openSheet,
      tooltip: l10n.playbackSpeed,
      icon: Column(
        mainAxisSize: .min,
        children: [
          if (speed == 1.0)
            const Icon(Icons.speed_rounded)
          else
            Text('${speed}x', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
