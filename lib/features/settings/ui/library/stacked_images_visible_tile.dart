import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class StackedImagesVisibleTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(stackedImagesVisibleProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.stackedImagesVisible,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          WheelPicker.fromIntRange(
            initialValue: count,
            min: 2,
            max: 8,
            step: 1,
            visibleItems: 2,
            onChangedEnd: notifier.setStackedImagesVisible,
            labelBuilder: (v) => '$v',
            wheelWidth: 80,
          ),
        ],
      ),
    );
  }
}
