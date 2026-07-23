import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'authors_list_provider.g.dart';

@riverpod
Future<List<Author>> authorsList(Ref ref) async {
  ref.watchConnection();
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;
  final params = ref.watch(
    libraryFiltersProvider(.authors).select((s) => s.toAuthorParams()),
  );

  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  return ref.logApiCall(
    () => api.getAuthors(libraryId, params),
    source: 'authorsList',
    logMessage: 'Error getting authors',
  );
}
