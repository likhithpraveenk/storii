import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/playlists/logic/playlist_events_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'playlist_providers.g.dart';

@riverpod
class Playlists extends _$Playlists {
  @override
  Future<List<Playlist>> build() async {
    ref.invalidateOnReconnect();
    final activeLibrary = await ref.watch(activeLibraryDetailsProvider.future);
    final libraryId = activeLibrary.library.id;

    ref.listen(playlistAddedProvider, (_, next) {
      final added = next.value;
      if (added == null || !state.hasValue) return;
      if (added.libraryId != libraryId) return;
      if (state.value!.any((p) => p.id == added.id)) return;
      state = AsyncData([...state.value!, added]);
    });

    ref.listen(playlistUpdatedProvider, (_, next) {
      final updated = next.value;
      if (updated == null || !state.hasValue) return;
      state = AsyncData([
        for (final p in state.value!)
          if (p.id == updated.id) updated else p,
      ]);
    });

    ref.listen(playlistRemovedProvider, (_, next) {
      final removed = next.value;
      if (removed == null || !state.hasValue) return;
      state = AsyncData(state.value!.where((p) => p.id != removed.id).toList());
    });

    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    return ref.logApiCall(
      () => api.getUserPlaylists(libraryId: libraryId),
      source: 'playlists',
      logMessage:
          'Error getting playlists for library: ${activeLibrary.library.name}',
    );
  }
}

@riverpod
class PlaylistDetail extends _$PlaylistDetail {
  @override
  Future<Playlist> build(String id) async {
    ref.listen(playlistUpdatedProvider, (_, next) {
      final updated = next.value;
      if (updated == null || updated.id != id || !state.hasValue) return;
      state = AsyncData(updated);
    });

    ref.listen(playlistRemovedProvider, (_, next) {
      final removed = next.value;
      if (removed == null || removed.id != id) return;
      state = AsyncError(Exception(l10n.errorNotFound), StackTrace.current);
    });

    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(playlistsApiProvider(user));
    return ref.logApiCall(
      () => api.get(playlistId: id),
      source: 'playlist',
      logMessage: 'Error getting playlist $id',
    );
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    if (!state.hasValue) return;
    final current = state.value!;
    final items = List<PlaylistItem>.from(current.items);
    final moved = items.removeAt(oldIndex);
    items.insert(newIndex, moved);
    state = AsyncData(current.copyWith(items: items));
    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final api = ref.read(playlistsApiProvider(user));
      await ref.logApiCall(
        () => api.reorder(playlistId: current.id, items: items),
        source: 'PlaylistDetail',
        logMessage: 'Error reordering items in playlist ${current.name}',
      );
    } catch (_) {
      ref.invalidateSelf();
    }
  }

  Future<void> playPlaylist() async {
    final progressMap = await ref.watch(mediaProgressMapProvider.future);
    final items = (state.value?.items ?? []).where((item) {
      final progress =
          progressMap[mediaItemIdKey(item.libraryItemId, item.episodeId)];
      return progress?.isFinished != true && progress?.progress != 1;
    }).toList();
    await ref.read(queueProvider.notifier).playMany(items.toQueueItems());
  }

  Future<Playlist> create({
    required String name,
    required String libraryItemId,
    String? episodeId,
  }) async {
    final activeLibrary = await ref.watch(activeLibraryDetailsProvider.future);
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(playlistsApiProvider(user));
    return ref.logApiCall(
      () => api.create(
        params: CreatePlaylistRequestParams(
          libraryId: activeLibrary.library.id,
          name: name,
          items: [
            PlaylistItem(libraryItemId: libraryItemId, episodeId: episodeId),
          ],
        ),
      ),
      source: 'PlaylistDetail',
      logMessage: 'Error creating playlist',
    );
  }

  Future<Playlist> updateMetadata({
    required String playlistId,
    required String name,
    String? description,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(playlistsApiProvider(user));
    return ref.logApiCall(
      () => api.updateMetadata(
        playlistId: playlistId,
        name: name,
        description: description,
      ),
      source: 'PlaylistDetail',
      logMessage: 'Error updating playlist $name',
    );
  }

  Future<void> delete(String playlistId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(playlistsApiProvider(user));
    return ref.logApiCall(
      () => api.delete(playlistId: playlistId),
      source: 'PlaylistDetail',
      logMessage: 'Error deleting playlist $playlistId',
    );
  }

  Future<void> addItem({
    required String playlistId,
    required String libraryItemId,
    String? episodeId,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(playlistsApiProvider(user));
    return ref.logApiCall(
      () => api.batchAdd(
        playlistId: playlistId,
        items: [
          PlaylistItem(libraryItemId: libraryItemId, episodeId: episodeId),
        ],
      ),
      source: 'PlaylistDetail',
      logMessage: 'Error adding item to playlist $playlistId',
    );
  }

  Future<void> removeItem({
    required String playlistId,
    required PlaylistItem item,
  }) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(playlistsApiProvider(user));
    return ref.logApiCall(
      () => api.batchRemove(playlistId: playlistId, items: [item]),
      source: 'PlaylistDetail',
      logMessage: 'Error removing item from playlist $playlistId',
    );
  }
}
