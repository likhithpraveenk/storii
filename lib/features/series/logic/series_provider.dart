import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'series_provider.g.dart';

@riverpod
Future<SeriesDomain> series(Ref ref, String seriesId) async {
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

    final items = (results[0] as LibraryItemsResponse).results
        .map((i) => i.toDomain())
        .cast<Audiobook>();
    final series = (results[1] as Series).toDomain(libraryId);

    return series.copyWith(
      books: items
          .map(
            (i) => i.copyWith(
              seriesSequence: i.series
                  .firstWhereOrNull((s) => s.id == seriesId)
                  ?.sequence,
              progress: series.libraryItemIdsFinished?.contains(i.id) == true
                  ? 1
                  : 0,
              isFinished: series.libraryItemIdsFinished?.contains(i.id) == true,
            ),
          )
          .toList(),
    );
  } catch (e, s) {
    final error = AppError.resolve(e);
    ref
        .read(logsProvider.notifier)
        .log(
          'Error fetching series: $error',
          source: 'seriesProvider',
          level: .error,
          stackTrace: s,
        );
    throw error;
  }
}
