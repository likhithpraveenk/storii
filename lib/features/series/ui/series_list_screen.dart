import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/ui/filters_button.dart';
import 'package:storii/features/series/logic/series_list_provider.dart';
import 'package:storii/features/series/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SeriesListScreen extends ConsumerStatefulWidget {
  const SeriesListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeriesListScreenState();
}

class _SeriesListScreenState extends ConsumerState<SeriesListScreen> {
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
      appBar: AppBar(
        title: Text(l.series, style: Theme.of(context).textTheme.titleLarge),
        actions: [const FiltersButton(.series)],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(seriesListProvider.notifier).manualSync(),
        child: Column(
          children: [
            Expanded(
              child: seriesStateAsync.when(
                data: (seriesState) {
                  if (seriesState.series.isEmpty) {
                    return Center(child: Text(l.empty));
                  }

                  final height = ref.watch(seriesGridHeightProvider);

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
                    child: filterState.isGridView
                        ? GridView.builder(
                            controller: _scrollController,
                            padding: const .symmetric(horizontal: 16),
                            itemCount: seriesState.series.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      AppStyles.maxSeriesCardWidthInGrid,
                                  mainAxisExtent: height,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                            itemBuilder: (context, index) {
                              return SeriesCard(
                                key: ValueKey(seriesState.series[index].id),
                                seriesState.series[index],
                              );
                            },
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            itemCount: seriesState.series.length,
                            itemBuilder: (context, index) {
                              return SeriesCardListView(
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
