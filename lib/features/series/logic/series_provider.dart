import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'series_provider.g.dart';

@riverpod
Future<Series> series(Ref ref, String seriesId) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;
  final api = ref.read(libraryApiProvider(user));
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

  try {
    final results = await Future.wait([
      api.getItems(
        libraryId,
        LibraryItemsRequestParams(filter: SeriesFilter(seriesId)),
      ),
      api.getSeriesById(libraryId, seriesId),
    ]);

    final items = (results[0] as LibraryItemsResponse).results;
    final series = results[1] as Series;

    return series.copyWith(
      books: items
          .map(
            (i) => i.copyWith(
              seriesSequence: i.series
                  .firstWhereOrNull((s) => s.id == seriesId)
                  ?.sequence,
              userMediaProgress: progressMap[i.id],
            ),
          )
          .toList(),
    );
  } catch (e, st) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching series: $error',
      source: 'series',
      level: .error,
      stackTrace: st,
    );
    throw error;
  }
}
