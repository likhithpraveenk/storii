import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/collections/logic/collection_events_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'collection_providers.g.dart';

@riverpod
class Collections extends _$Collections {
  @override
  Future<List<Collection>> build() async {
    ref.invalidateOnReconnect();
    final activeLibrary = await ref.watch(activeLibraryDetailsProvider.future);
    final libraryId = activeLibrary.library.id;

    ref.listen(collectionAddedProvider, (_, next) {
      final added = next.value;
      if (added == null || !state.hasValue) return;
      if (added.libraryId != libraryId) return;
      if (state.value!.any((c) => c.id == added.id)) return;
      state = AsyncData([...state.value!, added]);
    });

    ref.listen(collectionUpdatedProvider, (_, next) {
      final updated = next.value;
      if (updated == null || !state.hasValue) return;
      state = AsyncData([
        for (final c in state.value!)
          if (c.id == updated.id) updated else c,
      ]);
    });

    ref.listen(collectionRemovedProvider, (_, next) {
      final removed = next.value;
      if (removed == null || !state.hasValue) return;
      state = AsyncData(state.value!.where((c) => c.id != removed.id).toList());
    });

    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    return ref.logApiCall(
      () => api.getCollections(libraryId: libraryId),
      source: 'collections',
      logMessage:
          'Error getting collections for library: ${activeLibrary.library.name}',
    );
  }
}

@riverpod
class CollectionDetail extends _$CollectionDetail {
  @override
  Future<Collection> build(String id) async {
    ref.listen(collectionUpdatedProvider, (_, next) {
      final updated = next.value;
      if (updated == null || updated.id != id || !state.hasValue) return;
      state = AsyncData(updated);
    });

    ref.listen(collectionRemovedProvider, (_, next) {
      final removed = next.value;
      if (removed == null || removed.id != id) return;
      state = AsyncError(Exception(l10n.errorNotFound), StackTrace.current);
    });

    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.get(collectionId: id),
      source: 'collection',
      logMessage: 'Error getting collection $id',
    );
  }
}

@Riverpod(keepAlive: true)
class CollectionMutations extends _$CollectionMutations {
  @override
  Future<void> build() async {}

  Future<Collection> create({
    required String name,
    required String libraryItemId,
  }) async {
    final activeLibrary = await ref.watch(activeLibraryDetailsProvider.future);
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.create(
        params: CreateCollectionRequestParams(
          libraryId: activeLibrary.library.id,
          name: name,
          books: [libraryItemId],
        ),
      ),
      source: 'CollectionMutations',
      logMessage: 'Error creating collection',
    );
  }

  Future<Collection> updateMetadata({
    required String collectionId,
    required String name,
    String? description,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.updateMetadata(
        collectionId: collectionId,
        name: name,
        description: description,
      ),
      source: 'CollectionMutations',
      logMessage: 'Error updating collection $name',
    );
  }

  Future<void> delete(String collectionId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.delete(collectionId: collectionId),
      source: 'CollectionMutations',
      logMessage: 'Error deleting collection $collectionId',
    );
  }

  Future<void> addItem({
    required String collectionId,
    required String libraryItemId,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.batchAdd(
        collectionId: collectionId,
        libraryItemIds: [libraryItemId],
      ),
      source: 'CollectionMutations',
      logMessage: 'Error adding book to collection $collectionId',
    );
  }

  Future<void> removeItem({
    required String collectionId,
    required String libraryItemId,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.batchRemove(
        collectionId: collectionId,
        libraryItemIds: [libraryItemId],
      ),
      source: 'CollectionMutations',
      logMessage: 'Error removing book from collection $collectionId',
    );
  }

  Future<void> reorderItems(String collectionId, List<String> newOrder) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(collectionsApiProvider(user));
    return ref.logApiCall(
      () => api.reorder(collectionId: collectionId, books: newOrder),
      source: 'CollectionMutations',
      logMessage: 'Error reordering books in collection $collectionId',
    );
  }

  Future<void> playCollection(String collectionId) async {
    // TODO: add to playback queue
    throw UnimplementedError();
  }
}
