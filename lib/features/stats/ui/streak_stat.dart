import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';

class StreakStat extends StatelessWidget {
  const StreakStat(this.days, {super.key});
  final Map<DateTime, Duration> days;

  @override
  Widget build(BuildContext context) {
    final result = findStreaks(days);
    return IntrinsicHeight(
      child: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Row(
          children: [
            _StreakStat(
              icon: Icons.local_fire_department_outlined,
              label: l10n.currentStreak,
              days: result.current,
            ),
            const StatVerticalDivider(),
            _StreakStat(
              icon: Icons.emoji_events_outlined,
              label: l10n.longestStreak,
              days: result.longest,
            ),
          ],
        ),
      ),
    );
  }
}

({int current, int longest}) findStreaks(Map<DateTime, Duration> daysMap) {
  if (daysMap.isEmpty) return (current: 0, longest: 0);

  final normalDays = daysMap.keys
      .map((d) => DateTime(d.year, d.month, d.day))
      .toSet()
      .toList();

  normalDays.sort();

  int longest = 1;
  int currentRun = 1;

  for (int i = 1; i < normalDays.length; i++) {
    final curr = normalDays[i];
    final prev = normalDays[i - 1];
    final diff = curr.difference(prev).inDays;
    if (diff == 1) {
      currentRun++;
    } else {
      currentRun = 1;
    }

    if (currentRun > longest) {
      longest = currentRun;
    }
  }

  final today = DateTime.now();
  final normalToday = DateTime(today.year, today.month, today.day);

  final daySet = normalDays.toSet();

  if (!daySet.contains(normalToday)) {
    return (current: 0, longest: longest);
  }

  int current = 1;
  DateTime prevDay = normalToday.subtract(const Duration(days: 1));

  while (daySet.contains(prevDay)) {
    current++;
    prevDay = prevDay.subtract(const Duration(days: 1));
  }

  return (current: current, longest: longest);
}

class _StreakStat extends StatelessWidget {
  const _StreakStat({
    required this.icon,
    required this.label,
    required this.days,
  });
  final IconData icon;
  final String label;
  final int days;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$days',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: .w400,
                  ),
                ),
                TextSpan(
                  text: ' ${l10n.days}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
