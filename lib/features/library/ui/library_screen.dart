import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/library/ui/library_item_list_tile.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/common_app_bar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/screen_options.dart';
import 'package:storii/shared/widgets/scrollable_widget.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemsAsync = ref.watch(libraryItemsProvider);

    return Scaffold(
      appBar: const CommonAppBar(actions: [ScreenOptionsButton(.library)]),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(rawLibraryItemsProvider);
          await ref.read(libraryItemsProvider.future);
        },
        child: itemsAsync.when(
          skipLoadingOnReload: true,
          data: (items) {
            if (items.isEmpty) {
              return const ScrollableWidget(child: Center(child: EmptyState()));
            }

            final displayMode = ref.watch(libraryDisplayModeProvider);
            final isListView = displayMode == .listView;

            return SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: isListView
                    ? ListView.builder(
                        key: const ValueKey('items_list_view'),
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _scrollController,
                        padding: const .symmetric(vertical: 16),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return LibraryItemListTile(
                            key: ValueKey(items[index].id),
                            items[index],
                          );
                        },
                      )
                    : ItemsGridView(
                        items,
                        scrollController: _scrollController,
                        key: const ValueKey('items_grid_view'),
                      ),
              ),
            );
          },
          loading: () =>
              const ScrollableWidget(child: Center(child: RandomWaveform())),
          error: (e, _) => ScrollableWidget(
            child: ErrorRetryWidget(
              e.toString(),
              onRetry: () => ref.invalidate(rawLibraryItemsProvider),
            ),
          ),
        ),
      ),
    );
  }
}
