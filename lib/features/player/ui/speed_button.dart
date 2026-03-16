import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SpeedButton extends ConsumerWidget {
  const SpeedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speed = ref.watch(speedProvider);
    return IconButton(
      onPressed: () {
        AppBottomSheet.show(
          context,
          title: AppLocalizations.of(context)!.playbackSpeed,
          showButtons: false,
          body: WheelPicker.fromDoubleRange(
            initialValue: speed,
            min: 0.5,
            max: 4.0,
            step: 0.1,
            labelBuilder: (v) => '${v}x',
            onChangedEnd: (v) {
              ref.read(appSettingsProvider.notifier).setSpeed(v);
            },
            // TODO: speed presets setting
            presets: [0.8, 1.0, 1.5, 2.0],
          ),
        );
      },
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
