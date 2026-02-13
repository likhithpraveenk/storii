import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/ui/cover_image.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemDetailScreen extends ConsumerWidget {
  final String id;
  const ItemDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;

    final itemAsync = ref.watch(itemDetailProvider(id));

    return Scaffold(
      backgroundColor: scheme.surface,
      body: itemAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, s) => ErrorRetryWidget(
          '$e',
          onRetry: () => ref.invalidate(itemDetailProvider(id)),
        ),
        data: (item) => CustomScrollView(
          slivers: [
            CoverImage(item),
            SliverToBoxAdapter(
              child: Padding(
                padding: const .all(16),
                child: Column(
                  children: [
                    Text(
                      item.title ?? l.noTitle,
                      style: textTheme.titleLarge,
                      textAlign: .center,
                    ),
                    const SizedBox(height: 4),
                    _AuthorsSeriesChips(item),
                    if (item.progress > 0) ...[
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: item.progress,
                        borderRadius: kBorderRadius,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          item.isFinished ? appGreenColor : appRedColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l.percentCompleted(
                          (item.progress * 100).toStringAsFixed(1),
                        ),
                        style: textTheme.labelSmall,
                      ),
                      const SizedBox(height: 4),
                    ],
                    AppFilledButton(
                      onPressed: () {
                        ref
                            .read(userSettingsProvider.notifier)
                            .setCurrentItemId(id);
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      text: item.progress > 0
                          ? item.progress == 1.0
                                ? l.replay
                                : l.resume
                          : l.play,
                    ),
                    Wrap(
                      spacing: 8,
                      alignment: .center,
                      children: item.genres.map((g) {
                        return ActionChip(
                          avatar: const Icon(Icons.category_outlined),
                          label: Text(g, style: textTheme.labelSmall),
                          onPressed: () {
                            ref
                                .read(libraryFiltersProvider(.library).notifier)
                                .setFilter(GenreFilter(g));
                            context.go(AppRoute.library.path);
                          },
                          visualDensity: .compact,
                          side: .none,
                        );
                      }).toList(),
                    ),
                    ExpandableHtml(data: item.description ?? l.noDescription),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthorsSeriesChips extends StatelessWidget {
  const _AuthorsSeriesChips(this.item);

  final ItemDomain item;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final textStyle = Theme.of(context).textTheme.labelLarge;
    final List<Widget> children = [];

    switch (item) {
      case final Audiobook a:
        children.addAll(
          a.authors.map(
            (author) => ActionChip(
              avatar: const Icon(Icons.person_2_outlined),
              label: Text(author.name, style: textStyle),
              onPressed: () =>
                  context.push(AppRoute.authorDetail.withId(author.id)),
              visualDensity: .compact,
              side: .none,
            ),
          ),
        );
        children.addAll(
          a.series.map(
            (series) => ActionChip(
              avatar: const Icon(Icons.stacked_bar_chart_outlined),
              label: Text(series.name, style: textStyle),
              onPressed: () =>
                  context.push(AppRoute.seriesDetail.withId(series.id)),
              visualDensity: .compact,
              side: .none,
            ),
          ),
        );
      case Podcast _:
        children.add(
          Chip(
            avatar: const Icon(Icons.person_2_outlined),
            label: Text(item.authorName ?? l.noAuthor, style: textStyle),
            visualDensity: .compact,
            side: .none,
          ),
        );
    }

    return Wrap(spacing: 8, alignment: .center, children: children);
  }
}
