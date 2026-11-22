import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/downloaded_items_store.dart';

part 'item_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class ItemDetail extends _$ItemDetail {
  @override
  Future<LibraryItem> build(String id) async {
    final store = ref.read(downloadedItemsStoreProvider);
    ref.listen(libraryItemUpdatedProvider, (_, next) async {
      final updated = next.value;
      if (updated == null || updated.id != id || !state.hasValue) return;
      state = AsyncData(updated);
      final hasDownload = (await store.get(id)) != null;
      if (hasDownload) {
        unawaited(store.put(updated));
      }
    });

    final isOffline = ref.watch(isServerOfflineProvider);
    if (isOffline) {
      final localItem = await store.get(id);
      if (localItem != null) return localItem;
      if (ref.read(currentUserProvider) == null) throw NoUser();
      throw l10n.connectionTypeNone;
    }

    final downloadItem = ref.read(downloadItemProvider(id));
    final serverUrl = ref.read(serverUrlProvider);
    if (downloadItem?.serverUrl != null &&
        downloadItem?.serverUrl != serverUrl) {
      final localItem = await store.get(id);
      if (localItem != null) return localItem;
      throw 'Downloaded media from a different server';
    }

    final user = await ref.watch(authenticatedUserProvider.future);
    final repo = ref.watch(itemRepositoryProvider(user));
    try {
      final remoteItem = await repo.getItem(id, includeProgress: true);
      return remoteItem;
    } on AppError catch (error) {
      if (error.type == .network || error.type == .timeout) {
        final localItem = await store.get(id);
        if (localItem != null) return localItem;
      }
      rethrow;
    }
  }
}

@riverpod
Stream<LibraryItem?> libraryItemUpdated(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) return;
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.itemEvents.onItemUpdated;
}
