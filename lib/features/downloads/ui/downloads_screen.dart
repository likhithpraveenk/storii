import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/ui/download_sort_sheet.dart';
import 'package:storii/features/downloads/ui/download_tile.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/library/ui/items_list_view.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class DownloadsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends ConsumerState<DownloadsScreen> {
  final _searchController = TextEditingController();
  bool _searching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _searching = !_searching;
      if (!_searching) {
        _searchController.clear();
        ref.read(downloadSearchQueryProvider.notifier).set('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = ref.watch(downloadedItemsProvider).value ?? [];
    final isListView = ref.watch(
      libraryDisplayModeProvider.select((s) => s == .listView),
    );
    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? Material(
                type: .transparency,
                child: Padding(
                  padding: const .only(left: 16, right: 4),
                  child: TextField(
                    autofocus: true,
                    controller: _searchController,
                    onChanged: ref
                        .read(downloadSearchQueryProvider.notifier)
                        .set,
                    decoration: InputDecoration(
                      hint: Text(
                        l10n.search,
                        style: theme.textTheme.titleSmall,
                      ),
                      border: .none,
                    ),
                  ),
                ),
              )
            : Text(l10n.downloads, style: theme.textTheme.titleLarge),
        titleSpacing: _searching ? 0 : theme.appBarTheme.titleSpacing,
        actions: [
          IconButton(
            icon: Icon(_searching ? Icons.close : Icons.search),
            tooltip: l10n.search,
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            tooltip: l10n.sort,
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.sort,
              body: const DownloadSortSheet(),
            ),
          ),
        ],
      ),
      body: isListView
          ? ItemsListView(items, showPlay: true)
          : ItemsGridView(items, showPlay: true),
    );
  }
}

class ActiveDownloadsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final items = ref.watch(activeDownloadsProvider).value ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.downloads, style: theme.textTheme.titleLarge),
      ),
      body: items.isEmpty
          ? const EmptyState()
          : ListView.builder(
              padding: const .only(bottom: 16, top: 4),
              itemCount: items.length,
              itemBuilder: (context, index) => DownloadTile(item: items[index]),
            ),
    );
  }
}
