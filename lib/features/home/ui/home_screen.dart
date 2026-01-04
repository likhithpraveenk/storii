import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/app/navigation/top_search/top_search_bar.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelvesAsync = ref.watch(shelvesProvider);
    final l = AppLocalizations.of(context)!;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const TopSearchBar(),
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 160,
          refreshIndicatorExtent: 60,
          onRefresh: () => ref.read(shelvesProvider.notifier).manualSync(),
          builder: (_, _, pulledExtent, _, refreshIndicatorExtent) {
            final opacity = Curves.easeIn.transform(
              (pulledExtent / refreshIndicatorExtent).clamp(0.0, 1.0),
            );
            return Opacity(
              opacity: opacity,
              child: const Center(child: RandomWaveform()),
            );
          },
        ),
        shelvesAsync.when(
          skipLoadingOnRefresh: false,
          data: (shelves) {
            if (shelves.isEmpty) {
              return SliverFillRemaining(
                child: Center(child: Text(l.empty)),
              );
            }
            final displayList =
                shelves.where((s) => s.identity != null).toList()..sort(
                  (a, b) => a.identity!.index.compareTo(b.identity!.index),
                );

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final shelf = displayList[index];
                final double screenWidth = MediaQuery.of(context).size.width;
                final double cardWidth = (screenWidth * 0.4).clamp(
                  120.0,
                  180.0,
                );
                final double totalHeight = cardWidth + 60.0;

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
                          // TODO: Fix cover url for all.
                          return Container(
                            width: cardWidth,
                            margin: const .only(right: 12),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: switch (shelf) {
                                LibraryItemsShelf() => LibraryItemCard(
                                  shelf.items[i],
                                ),
                                SeriesShelf() => PlaceholderCard(
                                  label: shelf.series[i],
                                ),
                                AuthorShelf() => PlaceholderCard(
                                  label: shelf.authors[i],
                                ),
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
          loading: () =>
              const SliverFillRemaining(child: Center(child: RandomWaveform())),
          error: (error, _) => SliverErrorRetryWidget(
            '$error',
            onRetry: () => ref.invalidate(shelvesProvider),
          ),
        ),
      ],
    );
  }
}

class PlaceholderCard extends StatelessWidget {
  final String label;

  const PlaceholderCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const .all(12),
      child: Card(
        elevation: 0,
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        child: Center(
          child: Text(
            label,
            textAlign: .center,
            maxLines: 3,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
