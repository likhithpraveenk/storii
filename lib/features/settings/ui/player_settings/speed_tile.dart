import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SpeedTile extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<SpeedTile> createState() => _SpeedTileState();
}

class _SpeedTileState extends ConsumerState<SpeedTile> {
  late double _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(speedProvider);
  }

  @override
  Widget build(BuildContext context) {
    final speed = ref.watch(speedProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.speed_rounded),
      title: Text(l10n.playbackSpeed),
      subtitle: Text('$speed$kMultiple'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.playbackSpeed,
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const .symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    WheelPicker.fromDoubleRange(
                      initialValue: _selected,
                      min: 0.5,
                      max: 4,
                      step: 0.1,
                      onChangedEnd: (v) => _selected = v,
                      labelBuilder: (v) => '$v$kMultiple',
                      presets: speedPresets,
                    ),
                    const SizedBox(height: 24),
                    AppFilledButton(
                      onPressed: () {
                        notifier.setSpeed(_selected);
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
