import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/filters_button.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/series/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/library_switcher.dart';
import 'package:storii/shared/widgets/waveform.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelvesAsync = ref.watch(shelvesProvider);
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const LibrarySwitcher(),
        actions: const [FiltersButton(.library)],
      ),
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
                      final ShelfType type = switch (shelf) {
                        SeriesShelfDomain() => .series,
                        AuthorShelfDomain() => .authors,
                        ItemShelfDomain() => .book,
                      };

                      final height = ref.watch(shelfHeightProvider(type));

                      return Column(
                        mainAxisSize: .min,
                        crossAxisAlignment: .start,
                        children: [
                          Padding(
                            padding: const .symmetric(horizontal: 16),
                            child: Text(
                              shelf.label,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: height,
                            child: ListView.builder(
                              scrollDirection: .horizontal,
                              padding: const .symmetric(horizontal: 16),
                              itemCount: shelf.map(
                                libraryItems: (s) => s.items.length,
                                series: (s) => s.series.length,
                                authors: (s) => s.authors.length,
                              ),
                              itemBuilder: (context, i) {
                                final (
                                  double width,
                                  Widget card,
                                ) = switch (shelf) {
                                  ItemShelfDomain s => (
                                    maxCardWidthInGrid,
                                    LibraryItemCard(s.items[i]),
                                  ),
                                  AuthorShelfDomain s => (
                                    maxCardWidthInGrid,
                                    AuthorCard(s.authors[i]),
                                  ),
                                  SeriesShelfDomain s => (
                                    maxSeriesCardWidthInGrid,
                                    SeriesCard(s.series[i]),
                                  ),
                                };

                                return SizedBox(
                                  width: width,
                                  child: Padding(
                                    padding: const .only(right: 12),
                                    child: card,
                                  ),
                                );
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
    );
  }
}
