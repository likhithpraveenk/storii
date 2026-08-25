import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/collections/logic/collection_providers.dart';
import 'package:storii/features/collections/ui/reorderable_item_card.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/marquee_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class CollectionDetailScreen extends ConsumerStatefulWidget {
  const new({required this.id, super.key});
  final String id;

  @override
  ConsumerState<CollectionDetailScreen> createState() =>
      _CollectionDetailScreenState();
}

class _CollectionDetailScreenState
    extends ConsumerState<CollectionDetailScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final collectionAsync = ref.watch(collectionDetailProvider(widget.id));
    final title = collectionAsync.value != null
        ? '${collectionAsync.value?.name} (${collectionAsync.value?.books.length})'
        : '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: MarqueeText(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            tooltip: l10n.more,
            icon: const Icon(Icons.more_horiz),
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.more,
              // TODO: edit collection name & description
              body: const SizedBox(),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(collectionDetailProvider(widget.id));
          await ref.read(collectionDetailProvider(widget.id).future);
        },
        child: collectionAsync.when(
          data: (collection) {
            return SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    if (collection.description != null)
                      SliverPadding(
                        padding: const .all(16),
                        sliver: SliverToBoxAdapter(
                          child: ExpandableHtml(data: collection.description!),
                        ),
                      ),
                    SliverReorderableList(
                      itemCount: collection.books.length,
                      onReorderItem: (oldIndex, newIndex) {
                        // TODO: reorder collection
                      },
                      proxyDecorator: (child, index, animation) => Material(
                        color: scheme.surfaceContainerLowest,
                        borderRadius: .circular(kRadius),
                        child: child,
                      ),
                      itemBuilder: (context, index) {
                        final book = collection.books[index];
                        return ReorderableItemCard(
                          key: ValueKey(index),
                          itemId: book.id,
                          index: index,
                          title: book.title ?? l10n.noTitle,
                          subtitle: book.authorName ?? l10n.noAuthor,
                          onRemove: () async {
                            return await ref
                                .read(collectionMutationsProvider.notifier)
                                .removeItem(
                                  collectionId: collection.id,
                                  libraryItemId: book.id,
                                );
                          },
                        );
                      },
                      prototypeItem: const ReorderableItemCard(
                        itemId: '',
                        index: 0,
                        title: '',
                        subtitle: '',
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 200)),
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: RandomWaveform()),
          error: (e, s) => ErrorRetryWidget(
            e.toString(),
            onRetry: () {
              ref.invalidate(collectionDetailProvider(widget.id));
            },
          ),
        ),
      ),
    );
  }
}
