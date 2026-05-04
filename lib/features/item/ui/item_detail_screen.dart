import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/item/ui/chapter_list.dart';
import 'package:storii/features/item/ui/cover_image_title.dart';
import 'package:storii/features/item/ui/description_with_chips.dart';
import 'package:storii/features/item/ui/metadata_wrap.dart';
import 'package:storii/features/item/ui/play_progress_widget.dart';
import 'package:storii/features/item/ui/series_chips_list.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemDetailScreen extends ConsumerWidget {
  final String id;
  final bool isDownloaded;

  const ItemDetailScreen({
    super.key,
    required this.id,
    required this.isDownloaded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final itemAsync = ref.watch(
      itemDetailProvider(id, isDownloaded: isDownloaded),
    );

    return Scaffold(
      body: itemAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, s) => ErrorRetryWidget(
          '$e',
          onRetry: () => ref.invalidate(
            itemDetailProvider(id, isDownloaded: isDownloaded),
          ),
        ),
        data: (item) {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(mediaProgressProvider(id));
                  return await ref.refresh(
                    itemDetailProvider(id, isDownloaded: isDownloaded).future,
                  );
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Padding(
                        padding: const .fromLTRB(16, 16, 16, 0),
                        child: Column(
                          children: [
                            CoverImageTitle(item),
                            const SizedBox(height: 8),
                            PlayProgressWidget(item),
                          ],
                        ),
                      ),
                      SeriesChipsList(item.series),
                      const SizedBox(height: 8),
                      ExpandableDescriptionWithChips(
                        data: item.description ?? l10n.noDescription,
                        collapsedHeight: 60,
                        genres: item.genres,
                        tags: item.tags,
                      ),
                      const SizedBox(height: 8),
                      MetadataWrap(item),
                      const SizedBox(height: 16),
                      const Divider(height: 0),
                      ListTile(
                        leading: const Icon(Icons.list_rounded),
                        title: Text(l10n.chapters),
                        trailing: Text(
                          '${item.chapters.length}',
                          style: textTheme.titleSmall?.copyWith(
                            fontStyle: .italic,
                          ),
                        ),
                        onTap: () {
                          showChapterListSheet(
                            context,
                            chapters: item.chapters,
                            itemId: item.id,
                            itemTitle: item.title ?? l10n.noTitle,
                          );
                        },
                      ),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.paddingOf(context).top,
                left: 4,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
