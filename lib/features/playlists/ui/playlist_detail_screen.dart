import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/collections/ui/edit_name_description_form.dart';
import 'package:storii/features/collections/ui/reorderable_item_card.dart';
import 'package:storii/features/playlists/logic/playlist_providers.dart';
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

class PlaylistDetailScreen extends ConsumerStatefulWidget {
  const new({required this.id, super.key});
  final String id;

  @override
  ConsumerState<PlaylistDetailScreen> createState() =>
      _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends ConsumerState<PlaylistDetailScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final notifier = ref.read(playlistDetailProvider(widget.id).notifier);
    final playlistAsync = ref.watch(playlistDetailProvider(widget.id));
    final playlist = playlistAsync.value;
    final title = playlist != null
        ? '${playlist.name} (${playlist.items.length})'
        : '';

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
          ref.invalidate(playlistDetailProvider(widget.id));
          await ref.read(playlistDetailProvider(widget.id).future);
        },
        child: playlistAsync.when(
          data: (playlist) {
            if (playlist.items.isEmpty) {
              // Never happens as playlists are deleted on server if empty
              return const ScrollableWidget(child: EmptyState());
            }
            return SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    if (playlist.description != null)
                      SliverPadding(
                        padding: const .all(16),
                        sliver: SliverToBoxAdapter(
                          child: ExpandableHtml(data: playlist.description!),
                        ),
                      ),
                    SliverReorderableList(
                      itemCount: playlist.items.length,
                      proxyDecorator: (child, index, animation) => Material(
                        color: scheme.surfaceContainerLowest,
                        borderRadius: .circular(kRadius),
                        child: child,
                      ),
                      onReorderItem: (oldIndex, newIndex) => ref
                          .read(playlistDetailProvider(widget.id).notifier)
                          .reorder(oldIndex, newIndex),
                      itemBuilder: (context, index) {
                        final item = playlist.items[index];
                        final String? title, subtitle;
                        if (item.episode != null) {
                          title = item.episode?.title;
                          subtitle = item.episode?.podcast?.metadata.title;
                        } else {
                          title = item.libraryItem?.title;
                          subtitle =
                              item.libraryItem?.authorName ?? l10n.noAuthor;
                        }

                        return ReorderableItemCard(
                          key: ValueKey(index),
                          itemId: item.libraryItemId,
                          episodeId: item.episodeId,
                          index: index,
                          title: title ?? l10n.noTitle,
                          subtitle: subtitle ?? '',
                          inCollection: false,
                          onRemove: () async {
                            return await notifier.removeItem(
                              playlistId: playlist.id,
                              item: item,
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
              ref.invalidate(playlistDetailProvider(widget.id));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: .centerFloat,
      floatingActionButtonAnimator: .noAnimation,
      floatingActionButton: playlist == null
          ? null
          : Padding(
              padding: const .symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  Expanded(
                    child: AppFilledButton(
                      icon: const Icon(Icons.play_circle_filled_outlined),
                      text: l10n.playAll,
                      onPressed: notifier.playPlaylist,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton.filled(
                    tooltip: l10n.edit,
                    icon: const Icon(Icons.edit),
                    onPressed: () => EditNameDescriptionForm.show(
                      context,
                      initialName: playlist.name,
                      initialDescription: playlist.description,
                      onSave: ({required name, description}) =>
                          notifier.updateMetadata(
                            playlistId: playlist.id,
                            name: name,
                            description: description,
                          ),
                    ),
                  ),
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
                      subtitle: l10n.deletePlaylistSubtitle,
                      isDestructive: true,
                      actionLabel: l10n.confirm,
                      actionIcon: Icons.delete,
                      onTap: () {
                        return notifier.delete(playlist.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
