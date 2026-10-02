import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/setting_slider.dart';

class StackedImagesVisibleTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(stackedImagesVisibleProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return SettingSlider(
      title: l10n.stackedImagesVisible,
      trailing: '$count',
      value: count.toDouble(),
      min: 2,
      max: 8,
      divisions: 6,
      labelBuilder: (v) => '${v.round()}',
      onChangeEnd: (value) => notifier.setStackedImagesVisible(value.round()),
    );
  }
}
