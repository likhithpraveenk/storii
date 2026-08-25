import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'collection_providers.g.dart';

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
Future<Collection> collectionDetail(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(collectionsApiProvider(user));
  return ref.logApiCall(
    () => api.get(collectionId: id),
    source: 'collection',
    logMessage: 'Error getting collection $id',
  );
}

// @Riverpod(keepAlive: true)
// class CollectionMutations extends _$CollectionMutations {
//   @override
//   Future<void> build() async {}

//   Future<Collection> create({
//     required String name,
//     required String libraryItemId,
//   }) async {
//     throw UnimplementedError();
//   }

//   Future<Collection> updateMetadata(
//     String id, {
//     String? name,
//     String? description,
//   }) async {
//     throw UnimplementedError();
//   }

//   Future<void> delete(String id) async {
//     throw UnimplementedError();
//   }

//   Future<void> addItem(String collectionId, String libraryItemId) async {
//     throw UnimplementedError();
//   }

//   Future<void> removeItem(String collectionId, String libraryItemId) async {
//     throw UnimplementedError();
//   }

//   Future<void> reorderItems(String collectionId, List<String> newOrder) async {
//     throw UnimplementedError();
//   }

//   Future<void> playCollection(String collectionId) async {
//     throw UnimplementedError();
//   }
// }
