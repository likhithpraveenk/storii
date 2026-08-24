import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/downloads/ui/download_widgets.dart';
import 'package:storii/features/library/ui/image_widget.dart';

class DownloadTile extends StatefulWidget {
  const new({super.key, required this.item});

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
                icon: const Icon(Icons.more_horiz),
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
