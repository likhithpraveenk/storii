import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/items_cache.dart';
import 'package:storii/storage/local/session_store.dart';

part 'shelves_provider.g.dart';

@riverpod
Future<List<Shelf>> shelves(Ref ref) async {
  final rawShelves = await ref.watch(rawShelvesProvider.future);
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

  return rawShelves
      .map(
        (shelf) => switch (shelf) {
          LibraryItemsShelf() => shelf.copyWith(
            entities: shelf.entities
                .map(
                  (item) =>
                      item.copyWith(userMediaProgress: progressMap[item.id]),
                )
                .toList(),
          ),
          SeriesShelf() => shelf.copyWith(
            entities: shelf.entities
                .map(
                  (s) => s.copyWith(
                    books: s.books
                        .map(
                          (i) =>
                              i.copyWith(userMediaProgress: progressMap[i.id]),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          _ => shelf,
        },
      )
      .toList();
}

@riverpod
Future<List<Shelf>> sortedShelves(Ref ref) async {
  // TODO: add setting to filter and sort shelves
  final shelves = await ref.watch(shelvesProvider.future);
  final sessions = ref.watch(sessionStoreProvider).value ?? [];

  final latestSessionByItem = <String, PlaybackSession>{};
  for (final session in sessions) {
    final current = latestSessionByItem[session.libraryItemId];
    if (current == null || session.updatedAt.isAfter(current.updatedAt)) {
      latestSessionByItem[session.libraryItemId] = session;
    }
  }

  DateTime lastListenedAt(LibraryItem item) {
    final session = latestSessionByItem[item.id];
    if (session != null) return session.updatedAt;
    return item.userMediaProgress?.lastUpdate ?? DateTime(0);
  }

  return shelves.map((shelf) {
    return switch (shelf) {
      LibraryItemsShelf() =>
        shelf.id == 'offline_downloads'
            ? shelf.copyWith(
                entities: [...shelf.entities]
                  ..sort(
                    (a, b) => lastListenedAt(b).compareTo(lastListenedAt(a)),
                  ),
              )
            : shelf,
      _ => shelf,
    };
  }).toList();
}

@riverpod
Future<List<Shelf>> rawShelves(Ref ref) async {
  ref.invalidateOnReconnect();
  final isConnected = ref.readConnection();
  if (!isConnected) {
    final downloads = await ref.read(downloadsProvider.future);
    final cache = ref.read(itemsCacheProvider.notifier);

    final dAudiobooks = <LibraryItem>[];
    final dPodcasts = <LibraryItem>[];

    for (final d in downloads.values.where((d) => d.isComplete)) {
      final item = cache.get(d.libraryItemId);
      if (item != null) {
        switch (item.mediaType) {
          case .book:
            dAudiobooks.add(item);
          case .podcast:
            dPodcasts.add(item);
        }
      }
    }

    final audiobooks = dAudiobooks.take(10).toList();
    final podcasts = dPodcasts.take(10).toList();

    final downloadShelves = [
      if (audiobooks.isNotEmpty)
        Shelf.libraryItems(
          id: 'offline_downloads',
          label: l10n.audiobooks,
          labelStringKey: 'downloads',
          type: .book,
          entities: audiobooks,
          total: audiobooks.length,
        ),
      if (podcasts.isNotEmpty)
        Shelf.libraryItems(
          id: 'offline_downloads',
          label: l10n.podcasts,
          labelStringKey: 'downloads',
          type: .podcast,
          entities: podcasts,
          total: podcasts.length,
        ),
    ];
    if (downloadShelves.isNotEmpty) return downloadShelves;
  }

  final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
      .library
      .id;

  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.watch(libraryApiProvider(user));

  return ref.logApiCall(
    () => api.getPersonalized(libraryId),
    source: 'rawShelves',
    logMessage: 'Error getting personalized home',
  );
}
