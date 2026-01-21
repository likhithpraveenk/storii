import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/filters_button.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
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
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        setState(() {
          _showBackToTopButton = _scrollController.offset >= 400;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemsStateAsync = ref.watch(libraryItemsProvider);
    final filterState = ref.watch(libraryFiltersProvider(.library));
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const LibrarySwitcher(),
        actions: [const FiltersButton(.library)],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(libraryItemsProvider.notifier).manualSync(),
        child: Column(
          children: [
            Expanded(
              child: itemsStateAsync.when(
                data: (itemsState) {
                  if (itemsState.items.isEmpty) {
                    return Center(child: Text(l.empty));
                  }
                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is! ScrollUpdateNotification) {
                        return false;
                      }
                      if (notification.metrics.extentAfter <
                          (notification.metrics.viewportDimension * 1.5)) {
                        ref.read(libraryItemsProvider.notifier).fetchMore();
                      }
                      return false;
                    },
                    child: filterState.isGridView
                        ? ItemsGridView(
                            scrollController: _scrollController,
                            itemsState.items,
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            itemCount: itemsState.items.length,
                            itemBuilder: (context, index) {
                              return LibraryItemCardListView(
                                key: ValueKey(itemsState.items[index].id),
                                itemsState.items[index],
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
            if (itemsStateAsync.value?.error != null)
              ErrorRetryWidget(
                '${itemsStateAsync.value?.error}',
                onRetry: () => ref.invalidate(libraryItemsProvider),
              ),
          ],
        ),
      ),
      floatingActionButton: AnimatedScale(
        scale: _showBackToTopButton ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton(
          heroTag: 'library_screen',
          onPressed: _scrollToTop,
          mini: true,
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}
