import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/bookmarks_provider.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/waveform.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
    required this.itemId,
    required this.isPodcast,
    this.inOverflow = false,
  });

  final String itemId;
  final bool isPodcast;
  final bool inOverflow;

  void _openSheet(BuildContext context) => showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _BookmarkSheetBody(itemId: itemId),
  );

  @override
  Widget build(BuildContext context) {
    if (inOverflow) {
      return ListTile(
        title: Text(l10n.bookmarks),
        leading: const Icon(Icons.bookmark_outline),
        onTap: isPodcast
            ? null
            : () {
                Navigator.of(context).pop();
                _openSheet(context);
              },
      );
    }

    return IconButton(
      tooltip: l10n.bookmarks,
      icon: const Icon(Icons.bookmark_outline),
      onPressed: isPodcast ? null : () => _openSheet(context),
    );
  }
}

class _BookmarkSheetBody extends ConsumerWidget {
  const _BookmarkSheetBody({required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(bookmarksProvider(itemId));
    final isCurrentItem = ref.watch(
      sessionProvider.select((s) => s?.libraryItemId == itemId),
    );
    final position = ref.watch(globalPositionProvider).value ?? Duration.zero;

    return SafeArea(
      child: DecoratedBox(
        decoration: bottomSheetDecoration(context),
        child: Column(
          mainAxisSize: .min,
          children: [
            Padding(
              padding: const .fromLTRB(24, 16, 24, 16),
              child: Stack(
                alignment: .center,
                children: [
                  Align(
                    alignment: .centerLeft,
                    child: IconButton(
                      onPressed: () {
                        ref.invalidate(serverUserProvider);
                      },
                      tooltip: l10n.refresh,
                      icon: const Icon(Icons.refresh),
                    ),
                  ),
                  Align(
                    alignment: .center,
                    child: Text(
                      l10n.bookmarks,
                      style: bottomSheetTitleTextStyle(context),
                    ),
                  ),
                  Align(
                    alignment: .centerRight,
                    child: IconButton(
                      onPressed: () => showBookmarkDialog(
                        context,
                        ref,
                        itemId: itemId,
                        position: position,
                      ),
                      tooltip: l10n.addBookmark,
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: bookmarksAsync.when(
                loading: () => const Center(child: RandomWaveform()),
                error: (e, _) => EmptyState(subtitle: l10n.errorUnknown),
                data: (bookmarks) {
                  if (bookmarks.isEmpty) return const EmptyState();

                  return ListView.builder(
                    padding: const .only(bottom: 48),
                    shrinkWrap: true,
                    itemCount: bookmarks.length,
                    itemBuilder: (context, index) {
                      final bookmark = bookmarks[index];
                      return ListTile(
                        leading: const Icon(Icons.bookmark_outline),
                        title: Text(bookmark.title, softWrap: true),
                        subtitle: Text(bookmark.time.toTime(padHours: true)),
                        contentPadding: const .only(left: 16, right: 8),
                        onTap: () {
                          if (isCurrentItem) {
                            audioHandler.seekFromGlobalPosition(bookmark.time);
                          } else {
                            ref
                                .read(audioPlayerProvider.notifier)
                                .play(
                                  itemId: itemId,
                                  initialPosition: bookmark.time,
                                );
                          }
                          Navigator.pop(context);
                        },
                        trailing: Row(
                          mainAxisSize: .min,
                          children: [
                            IconButton(
                              tooltip: l10n.editBookmark,
                              onPressed: () => showBookmarkDialog(
                                context,
                                ref,
                                itemId: itemId,
                                bookmark: bookmark,
                              ),
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              tooltip: l10n.remove,
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => ref
                                  .read(
                                    bookmarksControllerProvider(
                                      itemId,
                                    ).notifier,
                                  )
                                  .remove(time: bookmark.time),
                            ),
                          ],
                        ),
                      );
                    },
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

Future<void> showBookmarkDialog(
  BuildContext context,
  WidgetRef ref, {
  required String itemId,
  Duration? position,
  Bookmark? bookmark,
}) {
  final isEditing = bookmark != null;
  final titleController = TextEditingController(text: bookmark?.title ?? '');
  final timeController = TextEditingController(
    text: (bookmark?.time ?? position ?? Duration.zero).toTime(padHours: true),
  );
  return AppDialog.show(
    context,
    title: isEditing ? l10n.editBookmark : l10n.addBookmark,
    actionLabel: l10n.save,
    actionIcon: Icons.save_outlined,
    body: Column(
      children: [
        TextField(
          controller: titleController,
          autofocus: true,
          decoration: InputDecoration(hintText: l10n.title),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: timeController,
          maxLength: 8,
          decoration: const InputDecoration(hintText: '00:00:00'),
        ),
      ],
    ),
    onTap: () async {
      final title = titleController.text.trim();
      final time = parseTime(timeController.text);
      if (title.isEmpty || time == null) return;

      final notifier = ref.read(bookmarksControllerProvider(itemId).notifier);

      final ok = isEditing
          ? await notifier.modify(time: time, title: title)
          : await notifier.create(time: time, title: title);

      if (!context.mounted) return;

      if (!ok) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.bookmarkFailed)));
      }
    },
  );
}
