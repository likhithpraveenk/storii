import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_series_provider.dart';
import 'package:storii/features/library/ui/library_filter_bar.dart';
import 'package:storii/features/library/ui/series.card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_refresh_indicator.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibrarySeriesTab extends ConsumerWidget {
  const LibrarySeriesTab({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesAsync = ref.watch(librarySeriesProvider);
    final filterState = ref.watch(libraryFiltersProvider(.series));
    final l = AppLocalizations.of(context)!;

    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const LibraryFilterBar(.series),
        AppRefreshIndicator(
          onRefresh: () =>
              ref.read(librarySeriesProvider.notifier).manualSync(),
        ),
        seriesAsync.when(
          data: (series) {
            if (series.isEmpty) {
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
                itemCount: series.length,
                itemBuilder: (context, index) {
                  return SeriesCard(
                    key: ValueKey(series[index].id),
                    series[index],
                  );
                },
              );
            }

            return SliverPadding(
              padding: const .fromLTRB(16, 0, 16, 24),
              sliver: SliverGrid.builder(
                itemCount: series.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: filterState.gridCount,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16,
                  childAspectRatio: dynamicRatio,
                ),
                itemBuilder: (context, index) {
                  return SeriesCard(
                    key: ValueKey(series[index].id),
                    series[index],
                  );
                },
              ),
            );
          },
          loading: () =>
              const SliverFillRemaining(child: Center(child: RandomWaveform())),
          error: (error, _) => SliverErrorRetryWidget(
            '$error',
            onRetry: () => ref.invalidate(librarySeriesProvider),
          ),
        ),
      ],
    );
  }
}
