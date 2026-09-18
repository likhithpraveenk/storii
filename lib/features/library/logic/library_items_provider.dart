import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'library_items_provider.freezed.dart';
part 'library_items_provider.g.dart';

@freezed
abstract class PaginatedLibraryItems with _$PaginatedLibraryItems {
  const factory({
    required List<LibraryItem> items,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _PaginatedLibraryItems;
}

@Riverpod(keepAlive: true)
class LibraryItemsNotifier extends _$LibraryItemsNotifier {
  int _page = 0;

  int get pageSize => ref.read(libraryPageSizeProvider);

  @override
  Future<PaginatedLibraryItems> build() async {
    ref.invalidateOnReconnect();
    _page = 0;
    return _fetchPage(_page);
  }

  Future<PaginatedLibraryItems> _fetchPage(int page) async {
    final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
        .library
        .id;
    final baseParams = ref.watch(
      libraryFiltersProvider(.library).select((s) => s.toItemParams()),
    );
    final params = baseParams.copyWith(page: page, limit: pageSize);
    final user = await ref.watch(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    final response = await ref.logApiCall(
      () => api.getItems(libraryId, params),
      logMessage: 'Error fetching items',
      source: 'libraryItems',
    );

    final progressMap = await ref.watch(mediaProgressMapProvider.future);
    final processed = _applyProgress(response.results, progressMap);
    final hasMore = response.total > (page + 1) * pageSize;

    return PaginatedLibraryItems(items: processed, hasMore: hasMore);
  }

  Future<void> fetchNextPage() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    try {
      final next = await _fetchPage(_page + 1);
      _page++;
      state = AsyncData(
        PaginatedLibraryItems(
          items: [...current.items, ...next.items],
          hasMore: next.hasMore,
        ),
      );
    } catch (e, st) {
      LogService.log(
        'Error fetching next library items page: $e',
        level: .error,
        source: 'libraryItems',
        originalError: e,
        stackTrace: st,
      );
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }

  List<LibraryItem> _applyProgress(
    List<LibraryItem> items,
    Map<String, MediaProgress> progressMap,
  ) {
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
}

@riverpod
Future<List<LibraryItem>> allLibraryItems(Ref ref) async {
  final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
      .library
      .id;
  final params = ref.watch(
    libraryFiltersProvider(.library).select((s) => s.toItemParams()),
  );
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  final response = await ref.logApiCall(
    () => api.getItems(libraryId, params),
    logMessage: 'Error fetching all items',
    source: 'allLibraryItems',
  );
  return response.results;
}
