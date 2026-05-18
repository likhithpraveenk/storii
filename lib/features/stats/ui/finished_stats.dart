import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';

class FinishedStats extends ConsumerWidget {
  const FinishedStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksCount = ref.watch(totalFinishedBooksProvider).value ?? 0;
    final episodesCount = ref.watch(totalFinishedEpisodesProvider).value ?? 0;

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _FinishedStat(
              icon: Icons.menu_book_outlined,
              label: l10n.booksFinished,
              count: booksCount,
            ),
            episodesCount == 0
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      const StatVerticalDivider(),
                      _FinishedStat(
                        icon: Icons.podcasts_outlined,
                        label: l10n.episodesFinished,
                        count: episodesCount,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class _FinishedStat extends StatelessWidget {
  const _FinishedStat({
    required this.icon,
    required this.label,
    required this.count,
  });
  final IconData icon;
  final String label;
  final int count;

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
          Text(
            '$count',
            style: theme.textTheme.headlineMedium?.copyWith(fontWeight: .w400),
          ),
        ],
      ),
    );
  }
}
