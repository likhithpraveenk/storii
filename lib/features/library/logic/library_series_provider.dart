import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/models/requests/series_request_params.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'library_series_provider.g.dart';

@Riverpod(keepAlive: true)
class LibrarySeriesNotifier extends _$LibrarySeriesNotifier {
  final _limit = 50;

  @override
  Stream<List<Series>> build() async* {
    yield* _fetchSeries();
  }

  Stream<List<Series>> _fetchSeries() async* {
    final library = await ref.watch(activeLibraryProvider.future);
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    try {
      final firstResponse = await api.getSeries(
        library.id,
        SeriesRequestParams(limit: _limit, page: 0),
      );

      final items = firstResponse.results.map((i) => i.toDomain()).toList();
      yield items;

      if (firstResponse.total > items.length) {
        final remainingToFetch = firstResponse.total - items.length;
        final remainingPages = (remainingToFetch / _limit).ceil();

        for (int i = 1; i <= remainingPages; i++) {
          final response = await api.getSeries(
            library.id,
            SeriesRequestParams(page: i, limit: _limit),
          );
          items.addAll(response.results.map((i) => i.toDomain()));

          yield List.from(items);
        }
      }
    } catch (e, st) {
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'LibrarySeriesNotifier: $error',
            level: .error,
            stackTrace: st.toLimitedString(),
          );
      throw error;
    }
  }

  Future<void> manualSync() async {
    ref.invalidateSelf();
    await future;
  }
}
