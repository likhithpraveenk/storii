import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/series/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelvesAsync = ref.watch(shelvesProvider);
    final l = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => ref.read(shelvesProvider.notifier).manualSync(),
          child: Column(
            children: [
              Expanded(
                child: shelvesAsync.when(
                  data: (shelves) {
                    if (shelves.isEmpty) {
                      return Center(child: Text(l.empty));
                    }
                    final displayList =
                        shelves.where((s) => s.identity != null).toList()..sort(
                          (a, b) =>
                              a.identity!.index.compareTo(b.identity!.index),
                        );

                    return ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        final shelf = displayList[index];
                        final stackTitle = ref.watch(stackTitleOnImageProvider);
                        final showTitle = ref.watch(showTitleForItemProvider);
                        final showAuthor = ref.watch(showAuthorForItemProvider);
                        final cardWidth = calculateCarouselCardWidth(context);
                        final totalHeight = switch (shelf) {
                          SeriesShelfDomain() =>
                            (AppStyles.maxSeriesCardWidth * 0.5) +
                                calculateMetadataHeight(
                                  context,
                                  stackTitle: stackTitle,
                                  showTitle: showTitle,
                                  showAuthor: false,
                                ),
                          _ =>
                            calculateCarouselCardWidth(context) +
                                calculateMetadataHeight(
                                  context,
                                  stackTitle: stackTitle,
                                  showTitle: showTitle,
                                  showAuthor: showAuthor,
                                ),
                        };

                        return Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .start,
                          children: [
                            ListTile(
                              title: Text(
                                shelf.label,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              trailing: Text(
                                shelf.maybeMap(
                                  libraryItems: (s) => '${s.items.length}',
                                  orElse: () => '',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: totalHeight,
                              child: ListView.builder(
                                scrollDirection: .horizontal,
                                padding: const .symmetric(horizontal: 16),
                                itemCount: shelf.map(
                                  libraryItems: (s) => s.items.length,
                                  series: (s) => s.series.length,
                                  authors: (s) => s.authors.length,
                                ),
                                itemBuilder: (context, i) {
                                  return switch (shelf) {
                                    ItemShelfDomain() => Container(
                                      width: cardWidth,
                                      margin: const .only(right: 12),
                                      child: LibraryItemCard(shelf.items[i]),
                                    ),
                                    AuthorShelfDomain() => Container(
                                      width: cardWidth,
                                      margin: const .only(right: 12),
                                      child: AuthorCard(shelf.authors[i]),
                                    ),
                                    SeriesShelfDomain() => Container(
                                      width: AppStyles.maxSeriesCardWidth,
                                      margin: const .only(right: 12),
                                      child: SeriesCard(shelf.series[i]),
                                    ),
                                  };
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: RandomWaveform()),
                  error: (error, _) => ErrorRetryWidget(
                    '$error',
                    onRetry: () => ref.invalidate(shelvesProvider),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
