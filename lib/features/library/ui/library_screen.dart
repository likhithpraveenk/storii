import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/filters_button.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_scroll_thumb.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/library_switcher.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemsAsync = ref.watch(libraryItemsProvider);
    final filterState = ref.watch(libraryFiltersProvider(.library));
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const LibrarySwitcher(),
        actions: const [FiltersButton(.library)],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(libraryItemsProvider.notifier).manualSync(),
        child: itemsAsync.when(
          data: (items) {
            if (items.isEmpty) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  alignment: .center,
                  child: Text(l.empty),
                ),
              );
            }
            final height = ref.watch(gridHeightProvider);
            final isSquare = height == maxCardWidthInGrid;

            return AppScrollThumb(
              controller: _scrollController,
              child: filterState.isGridView
                  ? GridView.builder(
                      controller: _scrollController,
                      padding: const .symmetric(horizontal: 16),
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: maxCardWidthInGrid,
                        mainAxisExtent: isSquare ? null : height,
                        mainAxisSpacing: isSquare ? 16 : 4,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return LibraryItemCard(
                          key: ValueKey(items[index].id),
                          items[index],
                        );
                      },
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return LibraryItemCardListView(
                          key: ValueKey(items[index].id),
                          items[index],
                        );
                      },
                    ),
            );
          },
          loading: () => const Center(child: RandomWaveform()),
          error: (error, _) => ErrorRetryWidget(
            '$error',
            onRetry: () => ref.invalidate(libraryItemsProvider),
          ),
        ),
      ),
    );
  }
}
