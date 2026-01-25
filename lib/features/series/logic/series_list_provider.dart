import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'series_list_provider.g.dart';
part 'series_list_provider.freezed.dart';

@freezed
abstract class SeriesListState with _$SeriesListState {
  const factory SeriesListState({
    @Default([]) List<SeriesDomain> series,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    Object? error,
  }) = _SeriesListState;
}

@Riverpod(keepAlive: true)
class SeriesListNotifier extends _$SeriesListNotifier {
  @override
  Future<SeriesListState> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    final params = ref.watch(
      libraryFiltersProvider(.series).select((s) => s.toSeriesParams()),
    );

    final result = await _fetchPage(0, params: params, libId: library.id);

    return SeriesListState(
      series: result.series,
      hasMore: result.hasMore,
      error: result.error,
    );
  }

  Future<({List<SeriesDomain> series, bool hasMore, Object? error})> _fetchPage(
    int page, {
    required SeriesRequestParams params,
    required String libId,
  }) async {
    try {
      final limit = ref.read(defaultSeriesLimitProvider);
      final user = await ref.read(authenticatedUserProvider.future);
      final api = ref.read(libraryApiProvider(user));

      final response = await api.getSeries(
        libId,
        params.copyWith(limit: limit, page: page),
      );

      return (
        series: response.results.map((i) => i.toDomain(libId)).toList(),
        hasMore: ((page * limit) + response.results.length) < response.total,
        error: null,
      );
    } catch (e, st) {
      _logError('fetchPage(page: $page)', e, st);
      return (
        series: <SeriesDomain>[],
        hasMore: false,
        error: AppError.resolve(e),
      );
    }
  }

  Future<void> fetchMore() async {
    final currentState = state.value;
    if (currentState == null ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    state = AsyncData(currentState.copyWith(isLoadingMore: true, error: null));

    final libraryId = (await ref.read(activeLibraryProvider.future)).id;
    final params = ref.watch(
      libraryFiltersProvider(.series).select((s) => s.toSeriesParams()),
    );
    final limit = ref.read(defaultSeriesLimitProvider);
    final nextPage = (currentState.series.length / limit).ceil();

    final result = await _fetchPage(nextPage, params: params, libId: libraryId);

    state = AsyncData(
      currentState.copyWith(
        series: [...currentState.series, ...result.series],
        isLoadingMore: false,
        hasMore: result.hasMore,
      ),
    );
  }

  void _logError(String action, Object e, StackTrace st) {
    LogService.log(
      'Error during $action: ${AppError.resolve(e)}',
      level: .error,
      source: 'SeriesListNotifier',
      stackTrace: st,
    );
  }

  Future<void> manualSync() async {
    ref.invalidateSelf();
    await future;
  }
}
