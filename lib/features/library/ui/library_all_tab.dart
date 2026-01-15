import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/library_filter_bar.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_refresh_indicator.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibraryAllTab extends ConsumerWidget {
  const LibraryAllTab({super.key, this.controller});

  final ScrollController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(libraryItemsProvider);
    final filterState = ref.watch(libraryFiltersProvider(.all));
    final l = AppLocalizations.of(context)!;

    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const LibraryFilterBar(.all),
        AppRefreshIndicator(
          onRefresh: () => ref.read(libraryItemsProvider.notifier).manualSync(),
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
          loading: () =>
              const SliverFillRemaining(child: Center(child: RandomWaveform())),
          error: (error, _) => SliverErrorRetryWidget(
            '$error',
            onRetry: () => ref.invalidate(libraryItemsProvider),
          ),
        ),
      ],
    );
  }
}
