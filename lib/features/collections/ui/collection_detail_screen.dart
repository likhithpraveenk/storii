import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/collections/logic/collection_providers.dart';
import 'package:storii/features/collections/ui/edit_name_description_form.dart';
import 'package:storii/features/collections/ui/reorderable_item_card.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/marquee_text.dart';
import 'package:storii/shared/widgets/scrollable_widget.dart';
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
    final collection = collectionAsync.value;
    final title = collection != null
        ? '${collection.name} (${collection.books.length})'
        : '';
    final canUserUpdate = ref.watch(canUserUpdateProvider).value ?? false;
    final canUserDelete = ref.watch(canUserDeleteProvider).value ?? false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: MarqueeText(title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(collectionDetailProvider(widget.id));
          await ref.read(collectionDetailProvider(widget.id).future);
        },
        child: collectionAsync.when(
          data: (collection) {
            if (collection.books.isEmpty) {
              return const ScrollableWidget(child: EmptyState());
            }
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
                      onReorderItem: (oldIndex, newIndex) => ref
                          .read(collectionDetailProvider(widget.id).notifier)
                          .reorder(oldIndex, newIndex),
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
      floatingActionButtonLocation: .centerFloat,
      floatingActionButtonAnimator: .noAnimation,
      floatingActionButton: collection == null
          ? null
          : Padding(
              padding: const .symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  if (collection.books.isNotEmpty)
                    Expanded(
                      child: AppFilledButton(
                        icon: const Icon(Icons.play_circle_filled_outlined),
                        text: l10n.playAll,
                        onPressed: () {
                          // TODO: add all to queue and play the first unfinished
                        },
                      ),
                    ),
                  const SizedBox(width: 4),
                  if (canUserUpdate)
                    IconButton.filled(
                      tooltip: l10n.edit,
                      icon: const Icon(Icons.edit),
                      onPressed: () => EditNameDescriptionForm.show(
                        context,
                        initialName: collection.name,
                        initialDescription: collection.description,
                        onSave: ({required name, description}) => ref
                            .read(collectionMutationsProvider.notifier)
                            .updateMetadata(
                              collectionId: collection.id,
                              name: name,
                              description: description,
                            ),
                      ),
                    ),
                  if (canUserDelete)
                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: scheme.error,
                        foregroundColor: scheme.onError,
                      ),
                      tooltip: l10n.delete,
                      icon: const Icon(Icons.delete),
                      onPressed: () => AppBottomSheet.show(
                        context,
                        title: l10n.delete,
                        subtitle: l10n.deleteCollectionSubtitle,
                        isDestructive: true,
                        actionLabel: l10n.confirm,
                        actionIcon: Icons.delete,
                        onTap: () {
                          return ref
                              .read(collectionMutationsProvider.notifier)
                              .delete(collection.id);
                        },
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
