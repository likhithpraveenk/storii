import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/player/logic/sleep_timer_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SleepButton extends ConsumerWidget {
  const SleepButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleep = ref.watch(sleepTimerProvider);
    return IconButton(
      onPressed: () {
        _showSleepSheet(context);
      },
      icon: sleep == null
          ? const Icon(Icons.bedtime_outlined)
          : Text(
              sleep.toReadableDuration(context),
              style: Theme.of(context).textTheme.labelLarge,
            ),
    );
  }
}

void _showSleepSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (_) => const SleepTimerSheet(),
  );
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
    final l = AppLocalizations.of(context)!;

    return Padding(
      padding: const .all(24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            l.sleepTimer,
            style: textTheme.titleLarge?.copyWith(fontWeight: .w500),
          ),
          const SizedBox(height: 24),
          if (sleep != null) ...[
            Center(
              child: Text(
                sleep.toReadableDuration(context, showSeconds: true),
                style: textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .center,
              children: [
                for (final delta in [5, 15, 30])
                  TextButton(
                    onPressed: () => notifier.add(Duration(minutes: delta)),
                    child: Text('+${l.timeMinutes(delta)}'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            AppOutlinedButton(
              isDestructive: true,
              onPressed: () {
                notifier.cancel();
                Navigator.of(context).pop();
              },
              text: l.cancelTimer,
            ),
          ] else ...[
            WheelPicker.fromIntRange(
              initialValue: _selectedMinutes,
              min: 0,
              max: 150,
              step: 15,
              labelBuilder: l.timeMinutes,
              onChangedEnd: (min) => _selectedMinutes = min,
              presets: [30, 60, 90, 120],
            ),
            const SizedBox(height: 24),
            AppFilledButton(
              onPressed: () {
                notifier.set(Duration(minutes: _selectedMinutes));
                Navigator.of(context).pop();
              },
              text: l.confirm,
            ),
          ],
        ],
      ),
    );
  }
}
