import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';

class FinishedStats extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksCount = ref.watch(totalFinishedBooksProvider).value ?? 0;
    final episodesCount = ref.watch(totalFinishedEpisodesProvider).value ?? 0;
    final numberStyle = Theme.of(context).textTheme.headlineMedium
        ?.copyWith(fontWeight: .w400);

    return StatRow([
      if (booksCount > 0)
        StatCard(
          icon: Icons.menu_book_outlined,
          label: l10n.booksFinished,
          child: CountUp(booksCount, style: numberStyle),
        ),
      if (episodesCount > 0)
        StatCard(
          icon: Icons.podcasts_outlined,
          label: l10n.episodesFinished,
          child: CountUp(episodesCount, style: numberStyle),
        ),
    ]);
  }
}
