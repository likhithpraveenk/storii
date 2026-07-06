import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/item/logic/episode_filter_provider.dart';
import 'package:storii/features/item/ui/episode_list_header.dart';
import 'package:storii/features/item/ui/episode_tile.dart';
import 'package:storii/shared/helpers/dummy_models.dart';

class EpisodeList extends ConsumerStatefulWidget {
  const EpisodeList({super.key, required this.episodes, required this.itemId});
  final List<PodcastEpisode> episodes;
  final String itemId;

  @override
  ConsumerState<EpisodeList> createState() => _EpisodeListState();
}

class _EpisodeListState extends ConsumerState<EpisodeList> {
  late final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = ref.watch(
      filteredEpisodesProvider(
        episodes: widget.episodes,
        itemId: widget.itemId,
      ),
    );

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: EpisodeListHeader(
            episodeCount: filtered.length,
            totalCount: widget.episodes.length,
          ),
        ),
        const SliverToBoxAdapter(child: Divider(height: 0)),
        SliverPadding(
          padding: const .only(bottom: 200),
          sliver: SliverPrototypeExtentList(
            prototypeItem: EpisodeTile(episode: dummyEpisode),
            delegate: SliverChildBuilderDelegate(
              (context, index) => EpisodeTile(episode: filtered[index]),
              childCount: filtered.length,
            ),
          ),
        ),
      ],
    );
  }
}
