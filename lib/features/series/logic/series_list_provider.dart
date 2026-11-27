import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'series_list_provider.freezed.dart';
part 'series_list_provider.g.dart';

@freezed
abstract class PaginatedSeriesItems with _$PaginatedSeriesItems {
  const factory({
    required List<Series> items,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _PaginatedSeriesItems;
}

@riverpod
class SeriesListNotifier extends _$SeriesListNotifier {
  int _page = 0;

  int get pageSize => ref.read(seriesPageSizeProvider);

  @override
  Future<PaginatedSeriesItems> build() async {
    ref.invalidateOnReconnect();
    ref.listen(mediaProgressMapProvider, (previous, next) {
      final progressMap = next.value;
      final current = state.value;
      if (progressMap == null || current == null) return;
      final items = _applyProgress(current.items, progressMap);
      if (listEquals(items, current.items)) return;
      state = AsyncData(current.copyWith(items: items));
    });
    _page = 0;
    return _fetchPage(0);
  }

  Future<PaginatedSeriesItems> _fetchPage(int page) async {
    final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
        .library
        .id;
    final baseParams = ref.watch(
      libraryFiltersProvider(.series).select((s) => s.toSeriesParams()),
    );
    final params = baseParams.copyWith(page: page, limit: pageSize);
    final user = await ref.read(authenticatedUserProvider.future);
    final repo = ref.read(libraryRepositoryProvider(user));

    final response = await repo.getSeries(libraryId, params);

    final progressMap = await ref.read(mediaProgressMapProvider.future);
    final processed = _applyProgress(response.results, progressMap);
    final hasMore = response.total > (page + 1) * pageSize;

    return PaginatedSeriesItems(items: processed, hasMore: hasMore);
  }

  Future<void> fetchNextPage() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    try {
      final next = await _fetchPage(_page + 1);
      _page++;
      state = AsyncData(
        PaginatedSeriesItems(
          items: [...current.items, ...next.items],
          hasMore: next.hasMore,
        ),
      );
    } catch (e, st) {
      LogService.log(
        'Error fetching next series page: $e',
        level: .error,
        source: 'seriesList',
        originalError: e,
        stackTrace: st,
      );
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }

  List<Series> _applyProgress(
    List<Series> series,
    Map<String, MediaProgress> progressMap,
  ) {
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
}
