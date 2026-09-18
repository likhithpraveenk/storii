import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/series/logic/series_list_provider.dart';
import 'package:storii/features/series/ui/series_card.dart';
import 'package:storii/features/series/ui/series_list_card.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/common_app_bar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/screen_options.dart';
import 'package:storii/shared/widgets/scrollable_widget.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SeriesListScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeriesListScreenState();
}

class _SeriesListScreenState extends ConsumerState<SeriesListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 300) {
      ref.read(seriesListProvider.notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final seriesAsync = ref.watch(seriesListProvider);

    return Scaffold(
      appBar: CommonAppBar(
        title: Text(l10n.series, style: Theme.of(context).textTheme.titleLarge),
        actions: const [ScreenOptionsButton(.series)],
        showLoading: seriesAsync.isLoading,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(seriesListProvider);
        },
        child: seriesAsync.when(
          skipLoadingOnReload: true,
          data: (paginated) {
            final series = paginated.items;
            if (series.isEmpty) {
              return const ScrollableWidget(child: Center(child: EmptyState()));
            }

            final isListView =
                ref.watch(seriesDisplayModeProvider) == .listView;

            return SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: isListView
                    ? SeriesListView(
                        scrollController: _scrollController,
                        series: series,
                        hasMore: paginated.hasMore,
                      )
                    : SeriesGridView(
                        scrollController: _scrollController,
                        series: series,
                        hasMore: paginated.hasMore,
                      ),
              ),
            );
          },
          loading: () =>
              const ScrollableWidget(child: Center(child: RandomWaveform())),
          error: (e, _) => ScrollableWidget(
            child: ErrorRetryWidget(
              e.toString(),
              onRetry: () => ref.invalidate(seriesListProvider),
            ),
          ),
        ),
      ),
    );
  }
}

class SeriesListView extends StatelessWidget {
  const new({
    super.key,
    this.scrollController,
    required this.series,
    this.hasMore = false,
  });

  final ScrollController? scrollController;
  final List<Series> series;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const ValueKey('series_list_view'),
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      // +1 for loading indicator slot.
      itemCount: series.length + (hasMore ? 1 : 0),
      padding: const .symmetric(vertical: 16),
      itemBuilder: (context, index) {
        if (index == series.length) {
          return const Padding(
            padding: .symmetric(vertical: 16),
            child: SizedBox(
              height: 200,
              child: Center(child: RandomWaveform()),
            ),
          );
        }
        return SeriesCardListView(
          key: ValueKey(series[index].id),
          series[index],
        );
      },
    );
  }
}

class SeriesGridView extends ConsumerWidget {
  const new({
    super.key,
    this.scrollController,
    required this.series,
    this.hasMore = false,
  });

  final ScrollController? scrollController;
  final List<Series> series;
  final bool hasMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(seriesGridHeightProvider);

    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const .symmetric(horizontal: 16, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxSeriesCardWidthInGrid,
              mainAxisExtent: height,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  SeriesCard(key: ValueKey(series[index].id), series[index]),
              childCount: series.length,
            ),
          ),
        ),
        if (hasMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: .symmetric(vertical: 16),
              child: SizedBox(
                height: 200,
                child: Center(child: RandomWaveform()),
              ),
            ),
          ),
      ],
    );
  }
}
