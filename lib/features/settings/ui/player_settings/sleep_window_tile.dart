import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class SleepWindowTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(isSleepWindowOnProvider);
    final (start, end) = ref.watch(sleepWindowProvider);

    return Column(
      children: [
        SwitchListTile(
          secondary: const Icon(Icons.timelapse),
          title: Text(l10n.sleepWindowTitle),
          subtitle: Text(
            enabled
                ? l10n.sleepWindowRange(
                    _fmt(context, start),
                    _fmt(context, end),
                  )
                : l10n.sleepWindowOffSubtitle,
            maxLines: 3,
          ),
          value: enabled,
          onChanged: ref.read(userSettingsProvider.notifier).setIsSleepWindowOn,
        ),
        if (enabled) ...[const _Window(), const _SleepDuration()],
      ],
    );
  }
}

const _noon = 720;
const _day = 1440;
int _toSlider(int m) => (m - _noon + _day) % _day;
int _fromSlider(double v) => (v.round() + _noon) % _day;

String _fmt(BuildContext context, int minutes) {
  final m = minutes % _day;
  return MaterialLocalizations.of(context).formatTimeOfDay(
    TimeOfDay(hour: m ~/ 60, minute: m % 60),
    alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
  );
}

class _Window extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (startMinutes, endMinutes) = ref.watch(sleepWindowProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    final start = _toSlider(startMinutes);
    var end = _toSlider(endMinutes);
    if (end == 0) end = _day;

    return SliderTheme(
      data: SliderTheme.of(context)
          .copyWith(year2023: false, showValueIndicator: .onDrag),
      child: RangeSlider(
        max: _day.toDouble(),
        divisions: 96,
        values: RangeValues(start.toDouble(), end.toDouble()),
        labels: RangeLabels(
          _fmt(context, _fromSlider(start.toDouble())),
          _fmt(context, _fromSlider(end.toDouble())),
        ),
        onChanged: (v) =>
            notifier.setSleepWindow((_fromSlider(v.start), _fromSlider(v.end))),
      ),
    );
  }
}

class _SleepDuration extends ConsumerWidget {
  const new();

  static const _min = 10.0;
  static const _max = 120.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(sleepTimerWindowDurationProvider);
    final notifier = ref.read(userSettingsProvider.notifier);

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.hourglass_bottom),
          title: Text(l10n.sleepDurationTitle),
          trailing: Text(l10n.timeMinutes(duration.inMinutes)),
        ),
        SliderTheme(
          data: SliderTheme.of(context)
              .copyWith(year2023: false, showValueIndicator: .onDrag),
          child: Slider(
            min: _min,
            max: _max,
            divisions: ((_max - _min) / 5).round(),
            value: duration.inMinutes.clamp(_min, _max).toDouble(),
            label: l10n.timeMinutes(duration.inMinutes),
            onChanged: (v) => notifier.setSleepTimerWindowDuration(
              Duration(minutes: v.round()),
            ),
          ),
        ),
      ],
    );
  }
}
