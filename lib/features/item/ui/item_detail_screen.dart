import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/item/ui/action_buttons.dart';
import 'package:storii/features/item/ui/audio_tracks_sheet.dart';
import 'package:storii/features/item/ui/chapter_list.dart';
import 'package:storii/features/item/ui/cover_image_title.dart';
import 'package:storii/features/item/ui/description_with_chips.dart';
import 'package:storii/features/item/ui/episode_list.dart';
import 'package:storii/features/item/ui/metadata_wrap.dart';
import 'package:storii/features/item/ui/play_button.dart';
import 'package:storii/features/item/ui/progress_bar.dart';
import 'package:storii/features/item/ui/series_chips_list.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ItemDetailScreen extends ConsumerWidget {
  final String id;

  const ItemDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final itemAsync = ref.watch(itemDetailProvider(id));

    return Scaffold(
      body: Stack(
        children: [
          itemAsync.when(
            loading: () => const Center(child: RandomWaveform()),
            error: (e, s) => ErrorRetryWidget(
              e.toString(),
              onRetry: () => ref.invalidate(itemDetailProvider(id)),
            ),
            data: (item) => RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(mediaProgressProvider(id));
                return await ref.refresh(itemDetailProvider(id).future);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Padding(
                      padding: const .fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          CoverImageTitle(item),
                          const SizedBox(height: 8),
                          PlayButton(item),
                          ProgressBar(itemId: item.id),
                          ActionButtons(item: item),
                        ],
                      ),
                    ),
                    if (item.isBook) SeriesChipsList(item.series),
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
                    if (item.isBook)
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
                    if (item.isBook)
                      ListTile(
                        leading: const Icon(Icons.audio_file_rounded),
                        title: Text(l10n.tracks),
                        trailing: Text(
                          '${item.tracks.length}',
                          style: textTheme.titleSmall?.copyWith(
                            fontStyle: .italic,
                          ),
                        ),
                        onTap: () {
                          showAudioTracksSheet(
                            context,
                            tracks: item.tracks,
                            audioFiles: item.audioFiles,
                            useBinaryBytes: ref.read(useBinaryBytesProvider),
                          );
                        },
                      ),
                    if (item.isPodcast)
                      EpisodeList(itemId: item.id, episodes: item.episodes),
                    const SizedBox(height: 200),
                  ],
                ),
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
      ),
    );
  }
}
