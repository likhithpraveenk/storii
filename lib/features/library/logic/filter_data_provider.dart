import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_data_provider.g.dart';

@Riverpod(keepAlive: true)
class FilterData extends _$FilterData {
  @override
  LibraryFilterData build() => const LibraryFilterData(
    authors: [],
    genres: [],
    languages: [],
    narrators: [],
    series: [],
    tags: [],
    publishers: [],
    publishedDecades: [],
  );

  void set(LibraryFilterData data) => state = data;

  void updateFiltersWithItem(LibraryItem item) {
    final metadata = item.media.metadata;
    final tags = item.media.tags;
    final current = state;

    final newAuthors = [...current.authors];
    final authorIds = {for (final a in current.authors) a.id};

    final newSeries = [...current.series];
    final seriesIds = {for (final s in current.series) s.id};

    final genresSet = current.genres.toSet();
    final tagsSet = current.tags.toSet();
    final narratorsSet = current.narrators.toSet();

    switch (metadata) {
      case BookMetadata():
        genresSet.addAll(metadata.genres);
        narratorsSet.addAll(metadata.narrators ?? []);

        for (final author in (metadata.authors ?? const <Author>[])) {
          if (authorIds.add(author.id)) newAuthors.add(author);
        }
        for (final s in (metadata.series ?? const <Series>[])) {
          if (seriesIds.add(s.id)) newSeries.add(s);
        }
      case PodcastMetadata():
        genresSet.addAll(metadata.genres);
    }

    tagsSet.addAll(tags);

    state = current.copyWith(
      authors: newAuthors,
      genres: genresSet.toList(),
      tags: tagsSet.toList(),
      series: newSeries,
      narrators: narratorsSet.toList(),
    );
  }
}

extension FilterDataX on LibraryFilterData {
  bool hasValuesForGroup(FilterGroup group) {
    return switch (group) {
      .genres => genres.isNotEmpty,
      .tags => tags.isNotEmpty,
      .series => series.isNotEmpty,
      .authors => authors.isNotEmpty,
      .publishers => publishers.isNotEmpty,
      .publishedDecade => publishedDecades.isNotEmpty,
      .narrators => narrators.isNotEmpty,
      .languages => languages.isNotEmpty,
      _ => true,
    };
  }
}
