import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'series_provider.g.dart';

@riverpod
Future<Series> series(Ref ref, String seriesId) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final libraryId = (await ref.watch(activeLibraryProvider.future)).id;
  final api = ref.read(libraryApiProvider(user));
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
      books: items.map((i) {
        final isFinished =
            series.progress?.libraryItemIdsFinished.contains(i.id) == true;
        return i.copyWith(
          seriesSequence: i.series
              .firstWhereOrNull((s) => s.id == seriesId)
              ?.sequence,
          //! dummy media progess only to show book is completed
          userMediaProgress: MediaProgress(
            id: 'id',
            libraryItemId: i.id,
            duration: i.duration,
            currentTime: Duration.zero,
            isFinished: isFinished,
            hideFromContinueListening: false,
            lastUpdate: i.updatedAt,
            startedAt: i.addedAt,
            progress: isFinished ? 1 : 0,
          ),
        );
      }).toList(),
    );
  } catch (e, s) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching series: $error',
      source: 'seriesProvider',
      level: .error,
      stackTrace: s,
    );
    throw error;
  }
}
