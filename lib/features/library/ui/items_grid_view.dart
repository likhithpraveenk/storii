import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemsGridView extends ConsumerWidget {
  const new(
    this.items, {
    super.key,
    this.scrollController,
    this.hasMore = false,
  });

  final List<LibraryItem> items;
  final ScrollController? scrollController;
  final bool hasMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(gridHeightProvider);
    final isSquare = height == maxCardWidthInGrid;

    if (items.isEmpty) {
      return const EmptyState();
    }

    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const .symmetric(horizontal: 16, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCardWidthInGrid,
              mainAxisExtent: isSquare ? null : height,
              mainAxisSpacing: isSquare ? 16 : 4,
              crossAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  LibraryItemCard(key: ValueKey(items[index].id), items[index]),
              childCount: items.length,
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
