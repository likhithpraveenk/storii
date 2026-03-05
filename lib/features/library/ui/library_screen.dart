import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/display_button.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/filters_button.dart';
import 'package:storii/shared/widgets/library_switcher.dart';
import 'package:storii/shared/widgets/sort_button.dart';
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
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const LibrarySwitcher(),
        actions: const [
          FiltersButton(.library),
          SortButton(.library),
          DisplayButton(.library),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(libraryItemsProvider.future),
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

            final filterState = ref.watch(libraryFiltersProvider(.library));

            return AppScrollbar(
              controller: _scrollController,
              child: filterState.isGridView
                  ? ItemsGridView(
                      items,
                      scrollController: _scrollController,
                      key: const ValueKey('items_grid_view'),
                    )
                  : ListView.builder(
                      key: const ValueKey('items_list_view'),
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
