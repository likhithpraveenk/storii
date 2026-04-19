import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/search/logic/search_provider.dart';
import 'package:storii/features/search/ui/search_sections.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class SearchResultsView extends ConsumerWidget {
  final SearchResponse response;
  final void Function(SearchFilter filter)? onViewAll;

  const SearchResultsView(this.response, {super.key, this.onViewAll});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final filter = ref.watch(searchFilterProvider);

    Widget buildBooks({bool isSeparate = false}) => ItemsSection(
      title: l.audiobooks,
      isSeparate: isSeparate,
      items: response.book,
      onViewAll: () {
        ref.read(searchFilterProvider.notifier).set(.books);
      },
    );

    Widget buildSeries({bool isSeparate = false}) => SeriesSection(
      series: response.series,
      isSeparate: isSeparate,
      onViewAll: () {
        ref.read(searchFilterProvider.notifier).set(.series);
      },
    );

    Widget buildAuthors({bool isSeparate = false}) => AuthorsSection(
      authors: response.authors,
      isSeparate: isSeparate,
      onViewAll: () {
        ref.read(searchFilterProvider.notifier).set(.authors);
      },
    );

    Widget buildPodcasts({bool isSeparate = false}) => ItemsSection(
      title: l.podcasts,
      isSeparate: isSeparate,
      items: response.podcast,
      onViewAll: () {
        ref.read(searchFilterProvider.notifier).set(.podcasts);
      },
    );

    Widget buildEpisodes({bool isSeparate = false}) => ItemsSection(
      title: l.episodes,
      isSeparate: isSeparate,
      items: response.episodes,
      onViewAll: () {
        ref.read(searchFilterProvider.notifier).set(.episodes);
      },
    );

    Widget buildNarrators({bool isSeparate = false}) => SearchChipsSection(
      title: l.narrators,
      isSeparate: isSeparate,
      items: response.narrators,
      icon: Icons.mic,
      labelOf: (n) => n.name,
      countOf: (n) => n.numBooks,
      onTap: (n) {
        ref
            .read(libraryFiltersProvider(.library).notifier)
            .setFilter(NarratorFilter(n.name));
        context.go(AppRoute.library.path);
      },
    );

    Widget buildTags({bool isSeparate = false}) => SearchChipsSection(
      title: l.tags,
      isSeparate: isSeparate,
      items: response.tags,
      icon: Icons.tag,
      labelOf: (t) => t.name,
      countOf: (t) => t.numBooks,
      onTap: (t) {
        ref
            .read(libraryFiltersProvider(.library).notifier)
            .setFilter(TagFilter(t.name));
        context.go(AppRoute.library.path);
      },
    );

    Widget buildGenres({bool isSeparate = false}) => SearchChipsSection(
      title: l.genres,
      items: response.genres,
      isSeparate: isSeparate,
      icon: Icons.category,
      labelOf: (g) => g.name,
      countOf: (g) => g.numBooks,
      onTap: (g) {
        ref
            .read(libraryFiltersProvider(.library).notifier)
            .setFilter(GenreFilter(g.name));
        context.go(AppRoute.library.path);
      },
    );

    final sections = <SearchFilter, Widget Function({bool isSeparate})>{
      .books: buildBooks,
      .series: buildSeries,
      .authors: buildAuthors,
      .podcasts: buildPodcasts,
      .episodes: buildEpisodes,
      .narrators: buildNarrators,
      .genres: buildGenres,
      .tags: buildTags,
    };

    final allSections = [
      if (response.book.isNotEmpty) buildBooks(),
      if (response.series.isNotEmpty) buildSeries(),
      if (response.authors.isNotEmpty) buildAuthors(),
      if (response.podcast.isNotEmpty) buildPodcasts(),
      if (response.episodes.isNotEmpty) buildEpisodes(),
      if (response.narrators.isNotEmpty) buildNarrators(),
      if (response.tags.isNotEmpty) buildTags(),
      if (response.genres.isNotEmpty) buildGenres(),
    ];

    if (allSections.isEmpty) {
      allSections.add(const EmptyState());
    }

    return filter == .all
        ? ListView(
            padding: const .symmetric(vertical: 8),
            children: allSections,
          )
        : sections[filter]!(isSeparate: true);
  }
}
