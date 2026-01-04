import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/navigation/top_search/top_search_bar.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/library_filter_bar.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
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
      setState(() {
        _showBackToTopButton = _scrollController.offset >= 400;
      });
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
    final itemsAsync = ref.watch(libraryItemsProvider);
    final filterState = ref.watch(libraryFiltersProvider);
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          const TopSearchBar(),
          const LibraryFilterBar(),
          CupertinoSliverRefreshControl(
            refreshTriggerPullDistance: 160,
            refreshIndicatorExtent: 60,
            onRefresh: () =>
                ref.read(libraryItemsProvider.notifier).manualSync(),
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
          itemsAsync.when(
            data: (items) {
              if (items.isEmpty) {
                return SliverFillRemaining(child: Center(child: Text(l.empty)));
              }
              final width = MediaQuery.of(context).size.width;
              final crossAxisSpacing = 16.0;
              final columnWidth =
                  (width - (crossAxisSpacing * (filterState.gridCount - 1))) /
                  filterState.gridCount;
              final dynamicRatio = columnWidth / (columnWidth + 60);

              if (filterState.gridCount == 1) {
                return SliverList.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return LibraryItemCardListView(
                      key: ValueKey(items[index].id),
                      items[index],
                    );
                  },
                );
              }

              return SliverPadding(
                padding: const .fromLTRB(16, 0, 16, 24),
                sliver: SliverGrid.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: filterState.gridCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 16,
                    childAspectRatio: dynamicRatio,
                  ),
                  itemBuilder: (context, index) {
                    return LibraryItemCard(
                      key: ValueKey(items[index].id),
                      items[index],
                    );
                  },
                ),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(child: RandomWaveform()),
            ),
            error: (error, _) => SliverErrorRetryWidget(
              '$error',
              onRetry: () => ref.invalidate(activeLibraryProvider),
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedScale(
        scale: _showBackToTopButton ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          mini: true,
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}
