import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'series_list_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Series>> seriesList(Ref ref) async {
  final library = await ref.watch(activeLibraryProvider.future);
  final params = ref.watch(
    libraryFiltersProvider(.series).select((s) => s.toSeriesParams()),
  );
  try {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));
    final response = await api.getSeries(library.id, params);

    return response.results;
  } catch (e, st) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching series list: $error',
      level: .error,
      source: 'seriesList',
      stackTrace: st,
    );
    throw error;
  }
}
