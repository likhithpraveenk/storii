import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';

class ItemsGridView extends ConsumerWidget {
  const ItemsGridView(this.items, {super.key, this.scrollController});

  final List<LibraryItem> items;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(gridHeightProvider);
    final isSquare = height == maxCardWidthInGrid;

    return GridView.builder(
      controller: scrollController,
      padding: const .symmetric(horizontal: 16),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCardWidthInGrid,
        mainAxisExtent: isSquare ? null : height,
        mainAxisSpacing: isSquare ? 16 : 4,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return LibraryItemCard(key: ValueKey(items[index].id), items[index]);
      },
    );
  }
}
