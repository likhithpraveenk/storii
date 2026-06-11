import 'package:abs_api/abs_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'series_list_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Series>> seriesList(Ref ref) async {
  final series = await ref.watch(rawSeriesListProvider.future);
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

  return series
      .map(
        (s) => s.copyWith(
          books: s.books
              .map((i) => i.copyWith(userMediaProgress: progressMap[i.id]))
              .toList(),
        ),
      )
      .toList();
}

@Riverpod(keepAlive: true)
Future<List<Series>> rawSeriesList(Ref ref) async {
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;
  final params = ref.watch(
    libraryFiltersProvider(.series).select((s) => s.toSeriesParams()),
  );
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  final data = await ref.logApiCall(
    () => api.getSeriesRaw(libraryId, params),
    logMessage: 'Error fetching series list',
    source: 'seriesList',
  );
  final response = await compute(SeriesResponse.fromJson, data);
  return response.results;
}
