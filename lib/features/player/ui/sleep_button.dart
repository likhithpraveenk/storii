import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/sleep_timer_provider.dart';
import 'package:storii/features/player/models/sleep_timer_state.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/wheel_picker.dart';

class SleepButton extends ConsumerWidget {
  const new({super.key, required this.inOverflow});

  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleep = ref.watch(sleepTimerProvider);
    Future<void> openSheet() => AppBottomSheet.show(
      context,
      title: l10n.sleepTimer,
      body: const SleepTimerSheet(),
    );
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.sleepTimer),
        leading: const Icon(Icons.bedtime_outlined),
        trailing: sleep != null ? Text(_displayLabel(sleep)) : null,
        onTap: openSheet,
      );
    }

    return IconButton(
      onPressed: openSheet,
      tooltip: l10n.sleepTimer,
      icon: sleep == null
          ? const Icon(Icons.bedtime_outlined)
          : Text(
              _displayLabel(sleep),
              style: Theme.of(context).textTheme.labelLarge,
            ),
    );
  }

  String _displayLabel(SleepTimerState sleep) =>
      sleep.remaining.toReadableDuration();
}

class SleepTimerSheet extends ConsumerStatefulWidget {
  const new({super.key});
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

    final currentChapter = ref.watch(currentChapterProvider).value?.index ?? 0;
    final targetChapter = sleep?.targetChapterIndex ?? 0;
    final chaptersRemaining = targetChapter - currentChapter + 1;

    final endChStr = chaptersRemaining == 1
        ? l10n.endOfChapter
        : l10n.endOfNChapters(chaptersRemaining);

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          if (sleep != null) ...[
            if (sleep.isPaused)
              const Padding(
                padding: .only(bottom: 4),
                child: Icon(Icons.pause_circle_outline),
              ),
            Center(
              child: Column(
                mainAxisSize: .min,
                children: [
                  if (sleep.mode == .endOfChapter)
                    Text(
                      endChStr,
                      style: textTheme.bodyLarge,
                      textAlign: .center,
                    ),
                  Text(
                    sleep.remaining.toReadableDuration(showSeconds: true),
                    style: textTheme.displaySmall,
                    textAlign: .center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (sleep.mode == .duration) ...[
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
            ],
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
            const SizedBox(height: 16),
            AppFilledButton(
              onPressed: () {
                notifier.set(Duration(minutes: _selectedMinutes));
              },
              text: l10n.confirm,
            ),
            const SizedBox(height: 16),
            const _ChapterOptions(),
          ],
        ],
      ),
    );
  }
}

class _ChapterOptions extends ConsumerStatefulWidget {
  const new();

  @override
  ConsumerState<_ChapterOptions> createState() => _ChapterOptionsState();
}

class _ChapterOptionsState extends ConsumerState<_ChapterOptions> {
  int _selectedCount = 1;

  @override
  Widget build(BuildContext context) {
    final chapters = ref.watch(chapterListProvider);
    if (chapters.isEmpty) return const SizedBox.shrink();

    final maxChapters = chapters.length;
    final label = _selectedCount == 1
        ? l10n.endOfChapter
        : l10n.endOfNChapters(_selectedCount);

    return Row(
      mainAxisAlignment: .center,
      children: [
        IconButton(
          onPressed: _selectedCount > 1
              ? () => setState(() => _selectedCount--)
              : null,
          icon: const Icon(Icons.remove_circle_outline),
          visualDensity: .compact,
          tooltip: l10n.decrease,
        ),
        Expanded(
          child: AppOutlinedButton(
            text: label,
            onPressed: () {
              ref
                  .read(sleepTimerProvider.notifier)
                  .setEndAtChapter(_selectedCount);
            },
          ),
        ),
        IconButton(
          onPressed: _selectedCount < maxChapters
              ? () => setState(() => _selectedCount++)
              : null,
          icon: const Icon(Icons.add_circle_outline),
          visualDensity: .compact,
          tooltip: l10n.increase,
        ),
      ],
    );
  }
}
