import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/search/ui/search_button.dart';
import 'package:storii/features/series/ui/series_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/library_switcher.dart';
import 'package:storii/shared/widgets/waveform.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelvesAsync = ref.watch(shelvesProvider);
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const LibrarySwitcher(),
        actions: const [SearchButton()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(rawShelvesProvider);
        },
        child: shelvesAsync.when(
          data: (shelves) {
            if (shelves.isEmpty) {
              return Center(child: Text(l.empty));
            }
            final displayList =
                shelves.where((s) => s.identity != null).toList()..sort(
                  (a, b) => a.identity!.index.compareTo(b.identity!.index),
                );

            return ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final shelf = displayList[index];
                final height = ref.watch(shelfHeightProvider(shelf.type));

                return Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const .symmetric(horizontal: 16),
                      child: Text(
                        shelf.label,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: height,
                      child: ListView.builder(
                        scrollDirection: .horizontal,
                        padding: const .symmetric(horizontal: 16),
                        itemCount: shelf.entities.length,
                        itemBuilder: (context, i) {
                          final (double width, Widget card) = switch (shelf) {
                            LibraryItemsShelf() => (
                              maxCardWidthInGrid,
                              LibraryItemCard(shelf.entities[i]),
                            ),
                            AuthorShelf() => (
                              maxCardWidthInGrid,
                              AuthorCard(shelf.entities[i]),
                            ),
                            SeriesShelf() => (
                              maxSeriesCardWidthInGrid,
                              SeriesCard(shelf.entities[i]),
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
    );
  }
}
