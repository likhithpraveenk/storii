import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/ui/queue_tile.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class QueueButton extends ConsumerWidget {
  const new({super.key, this.inOverflow = false});

  final bool inOverflow;

  void _openSheet(BuildContext context) => showQueueSheet(context);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(queueCountProvider);

    if (inOverflow) {
      return ListTile(
        title: Text(l10n.queue),
        leading: Badge.count(
          count: count,
          child: const Icon(Icons.queue_music),
        ),
        onTap: () => _openSheet(context),
      );
    }

    return Badge.count(
      count: count,
      child: IconButton(
        tooltip: l10n.queue,
        icon: const Icon(Icons.queue_music),
        onPressed: () => _openSheet(context),
      ),
    );
  }
}

void showQueueSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(24)),
    ),
    builder: (_) => const _QueueSheetBody(),
  );
}

class _QueueSheetBody extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queue = ref.watch(queueProvider);
    final items = queue.items;
    final currentIndex = queue.currentIndex;

    return SafeArea(
      child: DecoratedBox(
        decoration: bottomSheetDecoration(context),
        child: Column(
          mainAxisSize: .min,
          children: [
            Padding(
              padding: const .fromLTRB(16, 24, 16, 12),
              child: Stack(
                alignment: .center,
                children: [
                  Align(
                    child: Text(
                      l10n.queue,
                      style: bottomSheetTitleTextStyle(context),
                    ),
                  ),
                  Align(
                    alignment: .centerRight,
                    child: _ClearQueue(
                      () => ref
                          .read(queueProvider.notifier)
                          .clear(removeCurrentPlaying: false),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ReorderableListView.builder(
                shrinkWrap: true,
                padding: const .only(bottom: 48),
                itemCount: items.length,
                buildDefaultDragHandles: false,
                proxyDecorator: (child, index, animation) =>
                    Material(color: Colors.transparent, child: child),
                onReorderItem: (oldIndex, newIndex) => ref
                    .read(queueProvider.notifier)
                    .reorder(oldIndex, newIndex),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return QueueTile(
                    key: ValueKey(mediaItemIdKey(item.itemId, item.episodeId)),
                    item: item,
                    index: index,
                    isCurrent: currentIndex == index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClearQueue extends StatefulWidget {
  const new(this.onConfirm);

  final VoidCallback onConfirm;

  @override
  State<_ClearQueue> createState() => _ClearQueueState();
}

class _ClearQueueState extends State<_ClearQueue> {
  bool _confirming = false;

  void _handleTap() {
    if (_confirming) {
      setState(() => _confirming = false);
      widget.onConfirm();
    } else {
      setState(() => _confirming = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: .min,
      children: [
        IconButton.filled(
          visualDensity: .compact,
          iconSize: 20,
          style: IconButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: _confirming ? scheme.error : scheme.onSurface,
            ),
            backgroundColor: _confirming
                ? scheme.error
                : scheme.surfaceContainer,
            foregroundColor: scheme.onError,
          ),
          onPressed: _handleTap,
          icon: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            child: Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  Icons.clear_all,
                  color: _confirming ? scheme.onError : scheme.onSurface,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 100),
                  child: _confirming
                      ? Padding(
                          padding: const .only(left: 2),
                          child: Text(
                            l10n.clearQueue,
                            style: textTheme.labelLarge?.copyWith(
                              color: scheme.onError,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
        if (_confirming) ...[
          const SizedBox(width: 4),
          InkWell(
            onTap: () {
              setState(() => _confirming = false);
            },
            child: const Icon(Icons.cancel),
          ),
        ] else
          const SizedBox(width: 8),
      ],
    );
  }
}
