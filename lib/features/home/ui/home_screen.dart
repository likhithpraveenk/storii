import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/series/ui/series_card.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/common_app_bar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelvesAsync = ref.watch(shelvesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CommonAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(rawShelvesProvider);
          await ref.read(shelvesProvider.future);
        },
        child: shelvesAsync.when(
          skipLoadingOnReload: true,
          data: (shelves) {
            if (shelves.isEmpty) {
              final library = ref.watch(currentLibraryProvider)?.name;
              return EmptyState(
                subtitle: library == null ? null : l10n.libraryIsEmpty(library),
                action: AppFilledButton(
                  text: l10n.refresh,
                  onPressed: () {
                    ref.invalidate(rawShelvesProvider);
                  },
                ),
              );
            }
            final displayList =
                shelves
                    .where(
                      (s) => s.identity != null || s.id == 'offline_downloads',
                    )
                    .toList()
                  ..sort(
                    (a, b) => (a.identity?.index ?? -1).compareTo(
                      b.identity?.index ?? -1,
                    ),
                  );

            return ListView.builder(
              padding: const .symmetric(vertical: 16),
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final shelf = displayList[index];
                final height = ref.watch(shelfHeightProvider(shelf.type));
                final showPlay =
                    shelf.identity == .continueListening ||
                    shelf.identity == .listenAgain ||
                    shelf.identity == .continueSeries;

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
                              LibraryItemCard(
                                shelf.entities[i],
                                showPlay: showPlay,
                              ),
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
          error: (e, _) => ErrorRetryWidget(
            e.toString(),
            onRetry: () => ref.invalidate(rawShelvesProvider),
          ),
        ),
      ),
    );
  }
}
