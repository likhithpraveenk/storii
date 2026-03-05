import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/series/logic/series_list_provider.dart';
import 'package:storii/features/series/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/display_button.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/filters_button.dart';
import 'package:storii/shared/widgets/sort_button.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SeriesListScreen extends ConsumerStatefulWidget {
  const SeriesListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeriesListScreenState();
}

class _SeriesListScreenState extends ConsumerState<SeriesListScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seriesAsync = ref.watch(seriesListProvider);
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(l.series, style: Theme.of(context).textTheme.titleLarge),
        actions: const [
          FiltersButton(.series),
          SortButton(.series),
          DisplayButton(.series),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return ref.refresh(seriesListProvider.future);
        },
        child: seriesAsync.when(
          data: (series) {
            if (series.isEmpty) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: .center,
                  child: Text(l.empty),
                ),
              );
            }
            final height = ref.watch(seriesGridHeightProvider);

            final filterState = ref.watch(libraryFiltersProvider(.series));

            return AppScrollbar(
              controller: _scrollController,
              child: filterState.isGridView
                  ? GridView.builder(
                      key: const ValueKey('series_grid_view'),
                      controller: _scrollController,
                      padding: const .symmetric(horizontal: 16),
                      itemCount: series.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: maxSeriesCardWidthInGrid,
                        mainAxisExtent: height,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return SeriesCard(
                          key: ValueKey(series[index].id),
                          series[index],
                        );
                      },
                    )
                  : ListView.builder(
                      key: const ValueKey('series_list_view'),
                      controller: _scrollController,
                      itemCount: series.length,
                      itemBuilder: (context, index) {
                        return SeriesCardListView(
                          key: ValueKey(series[index].id),
                          series[index],
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
    );
  }
}
