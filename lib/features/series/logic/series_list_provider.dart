import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
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
  SeriesRequestParams _currentParams = SeriesRequestParams(
    sort: SeriesSort.name.value,
    desc: false,
  );
  int _currentPage = 0;

  @override
  Future<SeriesListState> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    _currentPage = 0;

    final result = await _fetchPage(
      0,
      params: _currentParams,
      libId: library.id,
    );

    return SeriesListState(series: result.series, hasMore: result.hasMore);
  }

  Future<({List<SeriesDomain> series, bool hasMore})> _fetchPage(
    int page, {
    required SeriesRequestParams params,
    required String libId,
  }) async {
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
    );
  }

  Future<void> fetchMore() async {
    final currentState = state.value;
    if (currentState == null ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    state = AsyncData(currentState.copyWith(isLoadingMore: true, error: null));

    try {
      final libraryId = (await ref.read(activeLibraryProvider.future)).id;
      _currentPage++;

      final result = await _fetchPage(
        _currentPage,
        params: _currentParams,
        libId: libraryId,
      );

      state = AsyncData(
        currentState.copyWith(
          series: [...currentState.series, ...result.series],
          isLoadingMore: false,
          hasMore: result.hasMore,
        ),
      );
    } catch (e, st) {
      _currentPage--;
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'error getting series list: $error',
            level: .error,
            source: 'SeriesListNotifier',
            stackTrace: st,
          );

      state = AsyncData(
        currentState.copyWith(isLoadingMore: false, error: error),
      );
    }
  }

  Future<void> filterSeries(SeriesRequestParams params) async {
    _currentParams = params;
    ref.invalidateSelf();
    await future;
  }

  Future<void> manualSync() async {
    _currentParams = SeriesRequestParams(
      sort: SeriesSort.name.value,
      desc: false,
    );
    ref.invalidateSelf();
    await future;
  }
}
