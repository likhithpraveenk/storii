import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/features/library/ui/library_item_list_tile.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemsListView extends ConsumerWidget {
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
    if (items.isEmpty) {
      return const EmptyState();
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      padding: const .symmetric(vertical: 16),
      itemCount: items.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return const Padding(
            padding: .symmetric(vertical: 16),
            child: SizedBox(
              height: 200,
              child: Center(child: RandomWaveform()),
            ),
          );
        }
        return LibraryItemListTile(
          key: ValueKey(items[index].id),
          items[index],
        );
      },
    );
  }
}
