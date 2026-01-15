import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/library/ui/author_card.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/library/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_refresh_indicator.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelvesAsync = ref.watch(shelvesProvider);
    final l = AppLocalizations.of(context)!;
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          AppRefreshIndicator(
            onRefresh: () => ref.read(shelvesProvider.notifier).manualSync(),
          ),
          shelvesAsync.when(
            data: (shelves) {
              if (shelves.isEmpty) {
                return SliverFillRemaining(child: Center(child: Text(l.empty)));
              }
              final displayList =
                  shelves.where((s) => s.identity != null).toList()..sort(
                    (a, b) => a.identity!.index.compareTo(b.identity!.index),
                  );

              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final shelf = displayList[index];
                  final screenWidth = MediaQuery.of(context).size.width;
                  final cardWidth = (screenWidth * 0.4).clamp(120.0, 180.0);
                  final totalHeight = cardWidth + 60.0;

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
                            return Container(
                              width: cardWidth,
                              margin: const .only(right: 12),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: switch (shelf) {
                                  LibraryItemsShelf() => LibraryItemCard(
                                    shelf.items[i],
                                  ),
                                  SeriesShelf() => SeriesCard(shelf.series[i]),
                                  AuthorShelf() => AuthorCard(shelf.authors[i]),
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }, childCount: displayList.length),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(child: RandomWaveform()),
            ),
            error: (error, _) => SliverErrorRetryWidget(
              '$error',
              onRetry: () => ref.invalidate(shelvesProvider),
            ),
          ),
        ],
      ),
    );
  }
}
