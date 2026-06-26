import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/item/logic/episode_filter_provider.dart';
import 'package:storii/features/item/ui/episode_list_header.dart';
import 'package:storii/features/item/ui/episode_tile.dart';

class EpisodeList extends ConsumerWidget {
  const EpisodeList({super.key, required this.episodes, required this.itemId});
  final List<PodcastEpisode> episodes;
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtered = ref.watch(
      filteredEpisodesProvider(episodes: episodes, itemId: itemId),
    );

    return Column(
      children: [
        EpisodeListHeader(
          episodeCount: filtered.length,
          totalCount: episodes.length,
        ),
        const Divider(height: 0),
        ...List.generate(
          filtered.length,
          (index) => Column(
            mainAxisSize: .min,
            children: [
              EpisodeTile(episode: filtered[index]),
              const Divider(height: 0),
            ],
          ),
        ),
      ],
    );
  }
}
