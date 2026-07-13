import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/sleep_timer_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SleepButton extends ConsumerWidget {
  const SleepButton({super.key, required this.inOverflow});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepMinutes = ref.watch(
      sleepTimerProvider.select((t) => t?.inMinutes),
    );
    Future<void> openSheet() => AppBottomSheet.show(
      context,
      title: l10n.sleepTimer,
      body: const SleepTimerSheet(),
    );
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.sleepTimer),
        leading: const Icon(Icons.bedtime_outlined),
        trailing: sleepMinutes != null
            ? Text(Duration(minutes: sleepMinutes).toReadableDuration())
            : null,
        onTap: () {
          Navigator.of(context).pop();
          openSheet();
        },
      );
    }

    return IconButton(
      onPressed: openSheet,
      tooltip: l10n.sleepTimer,
      icon: sleepMinutes == null
          ? const Icon(Icons.bedtime_outlined)
          : Text(
              Duration(minutes: sleepMinutes).toReadableDuration(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
    );
  }
}

class SleepTimerSheet extends ConsumerStatefulWidget {
  const SleepTimerSheet({super.key});
  @override
  ConsumerState<SleepTimerSheet> createState() => _SleepTimerSheetState();
}

class _SleepTimerSheetState extends ConsumerState<SleepTimerSheet> {
  int _selectedMinutes = 30;

  @override
  Widget build(BuildContext context) {
    final sleep = ref.watch(sleepTimerProvider);
    final notifier = ref.read(sleepTimerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          if (sleep != null) ...[
            Center(
              child: Text(
                sleep.toReadableDuration(showSeconds: true),
                style: textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .center,
              children: [
                TextButton(
                  onPressed: () => notifier.add(const Duration(minutes: -5)),
                  child: Text('-${l10n.timeMinutes(5)}'),
                ),
                for (final delta in [5, 15])
                  TextButton(
                    onPressed: () => notifier.add(Duration(minutes: delta)),
                    child: Text('+${l10n.timeMinutes(delta)}'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            AppOutlinedButton(
              isDestructive: true,
              onPressed: notifier.cancel,
              text: l10n.cancelTimer,
            ),
          ] else ...[
            WheelPicker.fromIntRange(
              initialValue: _selectedMinutes,
              min: 5,
              max: 150,
              step: 5,
              labelBuilder: l10n.timeMinutes,
              onChangedEnd: (min) => _selectedMinutes = min,
              presets: [15, 30, 45, 60, 90],
            ),
            // TODO: add end of chapter
            const SizedBox(height: 24),
            AppFilledButton(
              onPressed: () {
                notifier.set(Duration(minutes: _selectedMinutes));
              },
              text: l10n.confirm,
            ),
          ],
        ],
      ),
    );
  }
}
