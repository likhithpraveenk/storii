import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'authors_list_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Author>> authorsList(Ref ref) async {
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;
  final params = ref.watch(
    libraryFiltersProvider(.authors).select((s) => s.toAuthorParams()),
  );

  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  try {
    final response = await api.getAuthors(libraryId, params);
    return response;
  } catch (e) {
    final err = AppError.resolve(e);
    LogService.log(
      'error getting authors: $err',
      level: .error,
      source: 'authorsList',
    );
    throw err;
  }
}
