import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/stats/logic/stats_provider.dart';
import 'package:storii/features/stats/ui/finished_stats.dart';
import 'package:storii/features/stats/ui/recent_sessions.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';
import 'package:storii/features/stats/ui/streak_stat.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(statsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.stats)),
      body: statsAsync.when(
        data: (stats) {
          final result = calculateDurations(stats.days);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                TotalListeningTimeWidget(stats.totalTime),
                const SizedBox(height: 16),
                Padding(
                  padding: const .symmetric(horizontal: 24),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        _DurationStat(
                          label: l10n.today,
                          value: stats.today.toReadableDuration(),
                        ),
                        const StatVerticalDivider(),
                        _DurationStat(
                          label: l10n.thisMonth,
                          value: result.month.toReadableDuration(),
                        ),
                        const StatVerticalDivider(),
                        _DurationStat(
                          label: l10n.thisYear,
                          value: result.year.toReadableDuration(),
                        ),
                      ],
                    ),
                  ),
                ),
                const _Divider(),
                const FinishedStats(),
                const _Divider(),
                StreakStat(stats.days),
                const _Divider(),
                RecentSessions(stats.recentSessions),
                const SizedBox(height: 48),
              ],
            ),
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (error, stackTrace) => ErrorRetryWidget(
          '$error',
          onRetry: () {
            ref.invalidate(statsProvider);
          },
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: .fromLTRB(24, 16, 24, 16),
      child: Divider(thickness: 0.5, height: 0),
    );
  }
}

class _DurationStat extends StatelessWidget {
  const _DurationStat({required this.label, required this.value});
  final String label, value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: .w500,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

({Duration month, Duration year}) calculateDurations(
  Map<DateTime, Duration> data,
) {
  final now = DateTime.now();

  Duration monthTotal = Duration.zero;
  Duration yearTotal = Duration.zero;

  for (final entry in data.entries) {
    final d = entry.key;
    final duration = entry.value;

    if (d.year == now.year) {
      yearTotal += duration;

      if (d.month == now.month) {
        monthTotal += duration;
      }
    }
  }

  return (month: monthTotal, year: yearTotal);
}
