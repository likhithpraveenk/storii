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

part 'library_items_provider.g.dart';

@riverpod
Future<List<LibraryItem>> libraryItems(Ref ref) async {
  final items = await ref.watch(rawLibraryItemsProvider.future);
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

  return items.map((item) {
    if (item.collapsedSeries != null) {
      final series = item.collapsedSeries!;
      final bookIds = series.libraryItemIds ?? [];
      final finishedIds = bookIds
          .where((id) => progressMap[id]?.isFinished == true)
          .toList();
      final updatedSeries = series.copyWith(
        progress: SeriesProgress(
          libraryItemIds: bookIds,
          libraryItemIdsFinished: finishedIds,
          isFinished:
              finishedIds.length == bookIds.length && bookIds.isNotEmpty,
        ),
      );
      return item.copyWith(collapsedSeries: updatedSeries);
    }
    return item.copyWith(userMediaProgress: progressMap[item.id]);
  }).toList();
}

@riverpod
Future<List<LibraryItem>> rawLibraryItems(Ref ref) async {
  ref.watchConnection();
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;
  final params = ref.watch(
    libraryFiltersProvider(.library).select((s) => s.toItemParams()),
  );
  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  final data = await ref.logApiCall(
    () => api.getItemsRaw(libraryId, params),
    logMessage: 'Error fetching items',
    source: 'libraryItems',
  );
  final response = await compute(LibraryItemsResponse.fromJson, data);
  return response.results;
}
