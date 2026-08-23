import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/marquee_text.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class MarqueeSpeedTile extends ConsumerWidget {
  const MarqueeSpeedTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speed = ref.watch(marqueeSpeedProvider);

    return ListTile(
      title: Text(l10n.marqueeSpeed),
      subtitle: Text('${speed.round()} px/s'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AppBottomSheet.show(
          context,
          title: l10n.marqueeSpeed,
          body: const _MarqueeSpeedSheet(),
        );
      },
    );
  }
}

class _MarqueeSpeedSheet extends ConsumerStatefulWidget {
  const _MarqueeSpeedSheet();

  @override
  ConsumerState<_MarqueeSpeedSheet> createState() => _MarqueeSpeedSheetState();
}

class _MarqueeSpeedSheetState extends ConsumerState<_MarqueeSpeedSheet> {
  late double _selected;
  static const _presets = [10.0, 20.0, 40.0, 50.0];

  @override
  void initState() {
    super.initState();
    _selected = ref.read(marqueeSpeedProvider);
  }

  String _display(double v) => '${v.round()} px/s';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .center,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              border: .all(color: theme.colorScheme.primary),
              borderRadius: .circular(4),
            ),
            child: MarqueeText(l10n.sampleText, speed: _selected),
          ),
          WheelPicker.fromDoubleRange(
            initialValue: _selected,
            min: 10,
            max: 80,
            step: 5,
            onChangedEnd: (v) => setState(() => _selected = v),
            labelBuilder: _display,
            presets: _presets,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AppFilledButton(
              onPressed: () {
                notifier.setMarqueeSpeed(_selected);
                Navigator.of(context).pop();
              },
              text: l10n.save,
            ),
          ),
        ],
      ),
    );
  }
}
