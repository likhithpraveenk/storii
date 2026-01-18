import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';

part 'filter_data_provider.g.dart';

@riverpod
class FilterData extends _$FilterData {
  @override
  LibraryFilterData build() => const LibraryFilterData(
    authors: [],
    genres: [],
    languages: [],
    narrators: [],
    series: [],
    tags: [],
  );

  void set(LibraryFilterData data) => state = data;
}
