import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/ui/download_sort_sheet.dart';
import 'package:storii/features/downloads/ui/download_tile.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/empty_state.dart';

enum DownloadsScreenTab { active, completed }

class DownloadsScreen extends ConsumerStatefulWidget {
  const new({super.key, required this.tab});

  final DownloadsScreenTab tab;

  @override
  ConsumerState<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends ConsumerState<DownloadsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  bool _searching = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.tab.index,
    );
  }

  @override
  void didUpdateWidget(covariant DownloadsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tab != widget.tab) {
      _tabController.index = widget.tab.index;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
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
    final activeCount = ref.watch(
      activeDownloadsProvider.select((list) => list.value?.length ?? 0),
    );
    final completedCount = ref.watch(
      completedDownloadsProvider.select((list) => list.value?.length ?? 0),
    );

    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? Material(
                type: .transparency,
                child: TextField(
                  autofocus: true,
                  controller: _searchController,
                  onChanged: ref.read(downloadSearchQueryProvider.notifier).set,
                  decoration: InputDecoration(
                    hint: Text(l10n.search, style: theme.textTheme.titleSmall),
                    border: .none,
                  ),
                ),
              )
            : Text(l10n.downloads, style: theme.textTheme.titleLarge),
        titleSpacing: _searching ? 0 : theme.appBarTheme.titleSpacing,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: activeCount == 0
                  ? l10n.active
                  : '${l10n.active} ($activeCount)',
            ),
            Tab(
              text: completedCount == 0
                  ? l10n.completed
                  : '${l10n.completed} ($completedCount)',
            ),
          ],
        ),
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
      body: TabBarView(
        controller: _tabController,
        children: const [ActiveDownloadsTab(), CompletedDownloadsTab()],
      ),
    );
  }
}

class ActiveDownloadsTab extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(sortedActiveDownloadsProvider);

    if (items.isEmpty) {
      return const EmptyState();
    }

    return ListView.builder(
      padding: const .only(bottom: 16, top: 4),
      itemCount: items.length,
      itemBuilder: (context, index) => DownloadTile(item: items[index]),
    );
  }
}

class CompletedDownloadsTab extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(downloadedItemsProvider);
    return ItemsGridView(items);
  }
}
