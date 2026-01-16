import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/ui/library_filter_bar.dart';
import 'package:storii/features/series/logic/series_list_provider.dart';
import 'package:storii/features/series/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SeriesScreen extends ConsumerStatefulWidget {
  const SeriesScreen({super.key, this.fromMore = false});

  final bool fromMore;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends ConsumerState<SeriesScreen> {
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
    final seriesStateAsync = ref.watch(seriesListProvider);
    final filterState = ref.watch(libraryFiltersProvider(.series));
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: widget.fromMore
          ? AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(AppLocalizations.of(context)!.series),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () => ref.read(seriesListProvider.notifier).manualSync(),
        child: Column(
          children: [
            const LibraryFilterBar(.series),
            Expanded(
              child: seriesStateAsync.when(
                data: (seriesState) {
                  if (seriesState.series.isEmpty) {
                    return Center(child: Text(l.empty));
                  }
                  final width = MediaQuery.of(context).size.width;
                  final crossAxisSpacing = 16.0;
                  final columnWidth =
                      (width -
                          (crossAxisSpacing * (filterState.gridCount - 1))) /
                      filterState.gridCount;
                  final dynamicRatio = columnWidth / (columnWidth + 60);

                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is! ScrollUpdateNotification) {
                        return false;
                      }
                      if (notification.metrics.extentAfter <
                          (notification.metrics.viewportDimension * 1.5)) {
                        ref.read(seriesListProvider.notifier).fetchMore();
                      }
                      return false;
                    },
                    child: filterState.gridCount > 1
                        ? Padding(
                            padding: const .fromLTRB(16, 0, 16, 0),
                            child: GridView.builder(
                              controller: _scrollController,
                              itemCount: seriesState.series.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: filterState.gridCount,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: dynamicRatio,
                                  ),
                              itemBuilder: (context, index) {
                                return SeriesCard(
                                  key: ValueKey(seriesState.series[index].id),
                                  seriesState.series[index],
                                );
                              },
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            itemCount: seriesState.series.length,
                            itemBuilder: (context, index) {
                              return SeriesCard(
                                key: ValueKey(seriesState.series[index].id),
                                seriesState.series[index],
                              );
                            },
                          ),
                  );
                },
                loading: () => const Center(child: RandomWaveform()),
                error: (error, _) => ErrorRetryWidget(
                  '$error',
                  onRetry: () => ref.invalidate(seriesListProvider),
                ),
              ),
            ),
            if (seriesStateAsync.value?.isLoadingMore == true)
              const Center(child: RandomWaveform()),
            if (seriesStateAsync.value?.error != null)
              ErrorRetryWidget(
                '${seriesStateAsync.value?.error}',
                onRetry: () => ref.invalidate(seriesListProvider),
              ),
          ],
        ),
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
