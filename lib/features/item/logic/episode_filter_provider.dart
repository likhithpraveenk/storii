import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'episode_filter_provider.g.dart';

enum EpisodeFilter {
  all,
  incomplete,
  inProgress,
  completed;

  String get label => switch (this) {
    .all => l10n.all,
    .incomplete => l10n.inComplete,
    .inProgress => l10n.inProgress,
    .completed => l10n.completed,
  };
}

enum EpisodeSort {
  published,
  title,
  seasonEpisode,
  duration;

  String get label => switch (this) {
    .published => l10n.publishedDate,
    .title => l10n.title,
    .seasonEpisode => 'Season / Episode',
    .duration => l10n.duration,
  };
}

class EpisodeFilterState {
  const EpisodeFilterState({
    this.filter = .all,
    this.sort = .published,
    this.ascending = false,
  });

  final EpisodeFilter filter;
  final EpisodeSort sort;
  final bool ascending;

  EpisodeFilterState copyWith({
    EpisodeFilter? filter,
    EpisodeSort? sort,
    bool? ascending,
  }) {
    return EpisodeFilterState(
      filter: filter ?? this.filter,
      sort: sort ?? this.sort,
      ascending: ascending ?? this.ascending,
    );
  }
}

@riverpod
class EpisodeFilterNotifier extends _$EpisodeFilterNotifier {
  @override
  EpisodeFilterState build() => const EpisodeFilterState();

  void setFilter(EpisodeFilter filter) {
    state = state.copyWith(filter: filter);
  }

  void setSort(EpisodeSort sort) {
    state = state.copyWith(sort: sort);
  }

  void toggleAscending() {
    state = state.copyWith(ascending: !state.ascending);
  }
}

@riverpod
List<PodcastEpisode> filteredEpisodes(
  Ref ref, {
  required List<PodcastEpisode> episodes,
  required String itemId,
}) {
  final filterState = ref.watch(episodeFilterProvider);
  final progressMap = ref.watch(mediaProgressMapProvider).value ?? {};

  var list = List<PodcastEpisode>.from(episodes);

  list = list.where((ep) {
    final key = mediaItemIdKey(itemId, ep.id);
    final progress = progressMap[key];
    return switch (filterState.filter) {
      .all => true,
      .incomplete => progress == null || progress.isFinished == false,
      .inProgress =>
        progress != null &&
            progress.progress != null &&
            progress.progress! > 0 &&
            !(progress.isFinished ?? false),
      .completed => progress?.isFinished ?? false,
    };
  }).toList();

  list.sort((a, b) {
    final cmp = switch (filterState.sort) {
      .published => (a.publishedAt ?? DateTime.now()).compareTo(
        b.publishedAt ?? DateTime.now(),
      ),
      .title => (a.title ?? '').compareTo(b.title ?? ''),
      .seasonEpisode => _seasonEpisodeCompare(a, b),
      .duration => (a.duration ?? Duration.zero).compareTo(
        b.duration ?? Duration.zero,
      ),
    };
    return filterState.ascending ? cmp : -cmp;
  });

  return list;
}

int _seasonEpisodeCompare(PodcastEpisode a, PodcastEpisode b) {
  final sA = int.tryParse(a.season ?? '') ?? 0;
  final sB = int.tryParse(b.season ?? '') ?? 0;
  if (sA != sB) return sA.compareTo(sB);
  return (int.tryParse(a.episode ?? '0') ?? 0).compareTo(
    int.tryParse(b.episode ?? '0') ?? 0,
  );
}
