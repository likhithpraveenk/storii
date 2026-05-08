import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/library/logic/library_items_provider.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/library/ui/library_item_list_tile.dart';
import 'package:storii/features/search/ui/search_button.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/library_switcher.dart';
import 'package:storii/shared/widgets/screen_options.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const LibrarySwitcher(),
        actions: const [
          SearchButton(),
          ScreenOptionsButton(.library),
          ActiveDownloadsButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(rawLibraryItemsProvider);
        },
        child: itemsAsync.when(
          data: (items) {
            if (items.isEmpty) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  alignment: .center,
                  child: Text(l10n.empty),
                ),
              );
            }

            final displayMode = ref.watch(libraryDisplayModeProvider);
            final isListView = displayMode == .listView;

            return AppScrollbar(
              controller: _scrollController,
              child: !isListView
                  ? ItemsGridView(
                      items,
                      scrollController: _scrollController,
                      key: const ValueKey('items_grid_view'),
                    )
                  : ListView.builder(
                      key: const ValueKey('items_list_view'),
                      controller: _scrollController,
                      padding: const .symmetric(vertical: 16),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return LibraryItemListTile(
                          key: ValueKey(items[index].id),
                          items[index],
                        );
                      },
                    ),
            );
          },
          loading: () => const Center(child: RandomWaveform()),
          error: (error, _) => ErrorRetryWidget(
            '$error',
            onRetry: () => ref.invalidate(libraryItemsProvider),
          ),
        ),
      ),
    );
  }
}
