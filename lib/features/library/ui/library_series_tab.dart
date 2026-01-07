import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_series_provider.dart';
import 'package:storii/features/library/ui/library_filter_bar.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibrarySeriesTab extends ConsumerWidget {
  const LibrarySeriesTab({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesAsync = ref.watch(librarySeriesProvider);
    final filterState = ref.watch(libraryFiltersProvider);
    final l = AppLocalizations.of(context)!;

    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const LibraryFilterBar(),
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 160,
          refreshIndicatorExtent: 60,
          onRefresh: () =>
              ref.read(librarySeriesProvider.notifier).manualSync(),
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
            // TODO: fix grid count to be only 1 here
            if (filterState.gridCount == 1) {
              return SliverList.builder(
                itemCount: series.length,
                itemBuilder: (context, index) {
                  return Center(
                    key: ValueKey(series[index].id),
                    child: Text(series[index].name),
                  );
                },
              );
            }
            // TODO: series item card
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
                  return Center(
                    key: ValueKey(series[index].id),
                    child: Text(series[index].name),
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
