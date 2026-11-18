import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';

class StreakStat extends StatelessWidget {
  const new(this.days, {super.key});

  final Map<DateTime, Duration> days;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final result = findStreaks(days);

    return StatRow([
      StatCard(
        icon: Icons.local_fire_department_outlined,
        iconColor: result.current > 0 ? scheme.primary : null,
        label: l10n.currentStreak,
        child: _StreakValue(result.current),
      ),
      StatCard(
        icon: Icons.emoji_events_outlined,
        label: l10n.longestStreak,
        child: _StreakValue(result.longest),
      ),
    ]);
  }
}

({int current, int longest}) findStreaks(Map<DateTime, Duration> daysMap) {
  if (daysMap.isEmpty) return (current: 0, longest: 0);

  final normalDays =
      daysMap.keys.map((d) => DateTime(d.year, d.month, d.day)).toSet().toList()
        ..sort();

  int longest = 1;
  int currentRun = 1;

  for (int i = 1; i < normalDays.length; i++) {
    final curr = normalDays[i];
    final prev = normalDays[i - 1];
    final diff = curr.difference(prev).inDays;
    currentRun = diff == 1 ? currentRun + 1 : 1;
    if (currentRun > longest) longest = currentRun;
  }

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final daySet = normalDays.toSet();

  DateTime prevDay;
  if (daySet.contains(today)) {
    prevDay = today;
  } else if (daySet.contains(DateTime(now.year, now.month, now.day - 1))) {
    prevDay = today.subtract(const Duration(days: 1));
  } else {
    return (current: 0, longest: longest);
  }

  int current = 0;
  while (daySet.contains(prevDay)) {
    current++;
    prevDay = prevDay.subtract(const Duration(days: 1));
  }

  return (current: current, longest: longest);
}

class _StreakValue extends StatelessWidget {
  const new(this.days);

  final int days;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: .baseline,
      textBaseline: .alphabetic,
      children: [
        CountUp(
          days,
          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: .w400),
        ),
        const SizedBox(width: 4),
        Text(
          l10n.days,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
