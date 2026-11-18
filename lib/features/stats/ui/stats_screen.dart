import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/stats/logic/stats_provider.dart';
import 'package:storii/features/stats/ui/finished_stats.dart';
import 'package:storii/features/stats/ui/recent_sessions.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';
import 'package:storii/features/stats/ui/streak_stat.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class StatsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(statsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.stats)),
      body: statsAsync.when(
        data: (stats) {
          final result = calculateDurations(stats.days);
          final valueStyle = Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: .w500);

          return RefreshIndicator(
            key: const ValueKey('data'),
            onRefresh: () async {
              ref.invalidate(statsProvider);
              await ref.read(statsProvider.future);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const .only(bottom: 48),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  TotalListeningTimeWidget(stats.totalTime),
                  StatRow([
                    _DurationStat(
                      label: l10n.today,
                      value: stats.today,
                      style: valueStyle,
                    ),
                    _DurationStat(
                      label: l10n.thisMonth,
                      value: result.month,
                      style: valueStyle,
                    ),
                    _DurationStat(
                      label: l10n.thisYear,
                      value: result.year,
                      style: valueStyle,
                    ),
                  ]),
                  const FinishedStats(),
                  StreakStat(stats.days),
                  RecentSessions(stats.recentSessions),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (e, _) => ErrorRetryWidget(
          e.toString(),
          onRetry: () {
            ref.invalidate(statsProvider);
          },
        ),
      ),
    );
  }
}

class _DurationStat extends StatelessWidget {
  const new({required this.label, required this.value, required this.style});

  final String label;
  final Duration value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return StatCard(
      label: label,
      child: FittedBox(
        fit: .scaleDown,
        alignment: .centerLeft,
        child: DurationCountUp(value, style: style),
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
