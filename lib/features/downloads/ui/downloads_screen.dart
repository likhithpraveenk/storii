import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/downloads/ui/download_widgets.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/shared/widgets/empty_state.dart';

enum DownloadsScreenTab { active, completed }

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({super.key, required this.tab});

  final DownloadsScreenTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeDownloads = ref.watch(activeDownloadsProvider).value ?? [];
    final completedDownloads =
        ref.watch(completedDownloadsProvider).value ?? [];

    return DefaultTabController(
      length: 2,
      initialIndex: tab.index,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.downloads,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: activeDownloads.isEmpty
                    ? l10n.active
                    : '${l10n.active} (${activeDownloads.length})',
              ),
              Tab(
                text: completedDownloads.isEmpty
                    ? l10n.completed
                    : '${l10n.completed} (${completedDownloads.length})',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            if (activeDownloads.isEmpty)
              const EmptyState()
            else
              ListView.builder(
                key: const ValueKey('active_downloads'),
                padding: const .only(bottom: 16, top: 4),
                itemCount: activeDownloads.length,
                itemBuilder: (context, index) {
                  final item = activeDownloads.elementAt(index);
                  return DownloadTile(item: item);
                },
              ),
            ItemsGridView(
              key: const ValueKey('completed_downloads'),
              completedDownloads.map((d) => d.libraryItem).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadTile extends StatefulWidget {
  const DownloadTile({super.key, required this.item});

  final DownloadItem item;

  @override
  State<DownloadTile> createState() => _DownloadTileState();
}

class _DownloadTileState extends State<DownloadTile> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: .min,
      children: [
        ListTile(
          contentPadding: const .fromLTRB(16, 8, 16, 4),
          onTap: widget.item.isComplete
              ? () => context.push(
                  AppRoute.itemDetail.path,
                  extra: {
                    'id': widget.item.libraryItemId,
                    'isDownloaded': true,
                  },
                )
              : null,
          leading: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: .circular(8),
              child: ImageWidget(id: widget.item.libraryItemId, type: .item),
            ),
          ),
          title: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                widget.item.title,
                maxLines: 2,
                overflow: .ellipsis,
                style: theme.textTheme.titleSmall,
              ),
              if (widget.item.author.isNotEmpty)
                Text(
                  widget.item.author,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 4),
              DownloadStatusRow(item: widget.item),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Consumer(
                builder: (context, ref, _) {
                  return IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => showDownloadsDeleteDialog(
                      context,
                      item: widget.item,
                      ref: ref,
                    ),
                  );
                },
              ),
              DownloadTileTrailingActions(item: widget.item),
              IconButton(
                icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () => setState(() {
                  isExpanded = !isExpanded;
                }),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: isExpanded
              ? DownloadTrackProgress(item: widget.item)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
