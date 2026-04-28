import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/series/logic/series_list_provider.dart';
import 'package:storii/features/series/ui/series_card.dart';
import 'package:storii/features/series/ui/series_list_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/screen_options.dart';
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
        actions: const [ScreenOptionsButton(.series), ActiveDownloadsButton()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(rawSeriesListProvider);
        },
        child: seriesAsync.when(
          data: (series) {
            if (series.isEmpty) {
              return const EmptyState();
            }

            final isListView =
                ref.watch(seriesDisplayModeProvider) == .listView;

            return AppScrollbar(
              controller: _scrollController,
              child: isListView
                  ? SeriesListView(
                      scrollController: _scrollController,
                      series: series,
                    )
                  : SeriesGridView(
                      scrollController: _scrollController,
                      series: series,
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

class SeriesListView extends StatelessWidget {
  const SeriesListView({
    super.key,
    this.scrollController,
    required this.series,
  });

  final ScrollController? scrollController;
  final List<Series> series;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const ValueKey('series_list_view'),
      controller: scrollController,
      itemCount: series.length,
      padding: const .symmetric(vertical: 16),
      itemBuilder: (context, index) {
        return SeriesCardListView(
          key: ValueKey(series[index].id),
          series[index],
        );
      },
    );
  }
}

class SeriesGridView extends ConsumerWidget {
  const SeriesGridView({
    super.key,
    this.scrollController,
    required this.series,
  });

  final ScrollController? scrollController;
  final List<Series> series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(seriesGridHeightProvider);

    return GridView.builder(
      key: const ValueKey('series_grid_view'),
      controller: scrollController,
      padding: const .symmetric(horizontal: 16, vertical: 16),
      itemCount: series.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxSeriesCardWidthInGrid,
        mainAxisExtent: height,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return SeriesCard(key: ValueKey(series[index].id), series[index]);
      },
    );
  }
}
