import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'collections_provider.g.dart';

@riverpod
Future<List<Collection>> collections(Ref ref) async {
  ref.watchConnection();
  final activeLibrary = await ref.watch(activeLibraryDetailsProvider.future);
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  return ref.logApiCall(
    () => api.getCollections(libraryId: activeLibrary.library.id),
    source: 'collections',
    logMessage:
        'Error getting collections for library: ${activeLibrary.library.name}',
  );
}

@riverpod
Future<Collection> collection(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(collectionsApiProvider(user));
  return ref.logApiCall(
    () => api.get(collectionId: id),
    source: 'collection',
    logMessage: 'Error getting collection $id',
  );
}
