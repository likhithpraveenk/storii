import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'series_list_provider.g.dart';

@Riverpod(keepAlive: true)
class SeriesListNotifier extends _$SeriesListNotifier {
  @override
  Future<List<SeriesDomain>> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    final params = ref.watch(
      libraryFiltersProvider(.series).select((s) => s.toSeriesParams()),
    );

    final series = await _fetch(params: params, libId: library.id);
    return series;
  }

  Future<List<SeriesDomain>> _fetch({
    required SeriesRequestParams params,
    required String libId,
  }) async {
    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final api = ref.read(libraryApiProvider(user));
      final response = await api.getSeries(libId, params);

      return response.results.map((i) => i.toDomain(libId)).toList();
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'Error during fetching series: $error}',
        level: .error,
        source: 'SeriesListNotifier',
        stackTrace: st,
      );
      throw error;
    }
  }

  Future<void> manualSync() async {
    ref.invalidateSelf();
    await future;
  }
}
