import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';

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
