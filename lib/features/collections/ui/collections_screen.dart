import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/nav_providers.dart';
import 'package:storii/features/collections/logic/collection_providers.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/common_app_bar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/scrollable_widget.dart';
import 'package:storii/shared/widgets/stacked_images_card.dart';
import 'package:storii/shared/widgets/waveform.dart';

class CollectionsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends ConsumerState<CollectionsScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collectionsAsync = ref.watch(collectionsProvider);
    final inBottomNav = ref
        .watch(effectiveNavTargetsProvider)
        .contains(NavTarget.collections);

    return Scaffold(
      appBar: CommonAppBar(
        title: inBottomNav
            ? null
            : Text(
                l10n.collections,
                style: Theme.of(context).textTheme.titleLarge,
              ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(collectionsProvider);
          await ref.read(collectionsProvider.future);
        },
        child: collectionsAsync.when(
          skipLoadingOnReload: true,
          data: (collections) {
            if (collections.isEmpty) {
              return const ScrollableWidget(child: Center(child: EmptyState()));
            }

            final height = ref.watch(collectionsGridHeightProvider);

            return SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: GridView.builder(
                  key: const ValueKey('collections_grid_view'),
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: collections.length,
                  padding: const .symmetric(horizontal: 16, vertical: 16),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: maxSeriesCardWidthInGrid,
                    mainAxisExtent: height,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final collection = collections[index];
                    final itemIds = collection.books.map((i) => i.id).toList();
                    return StackedImagesCard(
                      key: ValueKey(collection.id),
                      itemIds: itemIds,
                      title: collection.name,
                      onTap: () => context.push(
                        AppRoute.collectionDetail.path,
                        extra: collection.id,
                      ),
                    );
                  },
                ),
              ),
            );
          },
          loading: () =>
              const ScrollableWidget(child: Center(child: RandomWaveform())),
          error: (e, _) => ScrollableWidget(
            child: ErrorRetryWidget(
              e.toString(),
              onRetry: () => ref.invalidate(collectionsProvider),
            ),
          ),
        ),
      ),
    );
  }
}
