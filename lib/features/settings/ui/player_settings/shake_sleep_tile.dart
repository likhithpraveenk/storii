import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class ShakeSleepTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final action = ref.watch(shakeDuringSleepTimerProvider);
    final addMinutes = ref.watch(shakeSleepTimerAddMinutesProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.vibration),
          title: Text(l10n.shakeDuringSleepTimer),
          subtitle: Text(action.label),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            AppBottomSheet.show(
              context,
              title: l10n.shakeDuringSleepTimer,
              body: Consumer(
                builder: (context, ref, _) {
                  final current = ref.watch(shakeDuringSleepTimerProvider);
                  return RadioGroup<ShakeDuringSleepTimerAction>(
                    groupValue: current,
                    onChanged: (target) {
                      if (target != null) {
                        notifier.setShakeDuringSleepTimer(target);
                      }
                    },
                    child: Column(
                      children: [
                        ...ShakeDuringSleepTimerAction.values.map((a) {
                          if (current == .addTime && a == .addTime) {
                            return Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    value: a,
                                    title: Text(a.label),
                                  ),
                                ),
                                WheelPicker.fromIntRange(
                                  initialValue: addMinutes,
                                  min: 1,
                                  max: 15,
                                  step: 1,
                                  visibleItems: 2,
                                  onChangedEnd:
                                      notifier.setShakeSleepTimerAddMinutes,
                                  labelBuilder: (v) => l10n.timeMinutes(v),
                                  wheelWidth: 120,
                                ),
                              ],
                            );
                          }
                          return RadioListTile(value: a, title: Text(a.label));
                        }),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class ShakeSensitivityTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensitivity = ref.watch(shakeSensitivityProvider);

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        ListTile(
          leading: const Icon(Icons.touch_app_outlined),
          title: Text(l10n.shakeSensitivity),
        ),
        Padding(
          padding: const .fromLTRB(16, 0, 16, 4),
          child: SegmentedButton<ShakeSensitivity>(
            segments: [
              ButtonSegment(value: .low, label: Text(l10n.low)),
              ButtonSegment(value: .medium, label: Text(l10n.medium)),
              ButtonSegment(value: .high, label: Text(l10n.high)),
            ],
            selected: {sensitivity},
            onSelectionChanged: (selected) {
              if (selected.isNotEmpty) {
                ref
                    .read(userSettingsProvider.notifier)
                    .setShakeSensitivity(selected.first);
              }
            },
          ),
        ),
      ],
    );
  }
}
