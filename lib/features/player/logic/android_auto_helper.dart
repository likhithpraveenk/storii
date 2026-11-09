import 'package:audio_service/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/repositories/item_repository.dart';
import 'package:storii/app/repositories/library_repository.dart';
import 'package:storii/features/downloads/logic/cover_helper.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/player/logic/android_auto_extensions.dart';
import 'package:storii/features/player/logic/android_auto_paging.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/models/android_auto_media_id.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'android_auto_helper.g.dart';

@riverpod
Future<List<AndroidAutoNode>> androidAutoTopLevelNodes(Ref ref) async {
  final currentLibrary = await ref.read(activeLibraryDetailsProvider.future);
  return [
    AndroidAutoNode(title: l10n.continueWord, kind: .resume),
    AndroidAutoNode(title: currentLibrary.library.name, kind: .library),
    AndroidAutoNode(title: l10n.downloads, kind: .downloads),
  ];
}

class AndroidAutoHelper {
  new(this._container);

  final ProviderContainer _container;

  Future<ItemRepository> _itemRepository() async {
    final user = await _container.read(authenticatedUserProvider.future);
    return _container.read(itemRepositoryProvider(user));
  }

  Future<LibraryRepository> _libraryRepository() async {
    final user = await _container.read(authenticatedUserProvider.future);
    return _container.read(libraryRepositoryProvider(user));
  }

  CoverHelper get _helper => _container.read(coverHelperProvider);

  ItemsCache get _itemsCache => _container.read(itemsCacheProvider);

  Future<List<MediaItem>> loadChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async {
    final nodes = await _container.read(
      androidAutoTopLevelNodesProvider.future,
    );

    if (parentMediaId == 'root') {
      final items = nodes
          .map(
            (n) => MediaItem(
              id: n.kind.name,
              title: n.title,
              playable: n.playable,
            ),
          )
          .toList();
      return applyAndroidAutoPaging(
        items,
        androidAutoPagingFromOptions(options),
      );
    }

    final node = nodes.firstWhereOrNull((n) => n.kind.name == parentMediaId);
    if (node != null) {
      return _loadNodeChildren(node, options);
    }

    final parsed = AndroidAutoMediaId.parse(parentMediaId);
    return switch (parsed) {
      AndroidAutoMediaItem(:final id, :final fromDownloads) =>
        _loadItemChildren(
          itemId: id,
          fromDownloads: fromDownloads,
          options: options,
        ),
      _ => <MediaItem>[],
    };
  }

  Future<void> playItem({
    required String itemId,
    String? episodeId,
    required bool autoplay,
  }) async {
    try {
      if (autoplay && _isPausedOnSameItem(itemId, episodeId)) {
        await audioHandler.play();
        return;
      }
      await _container
          .read(queueProvider.notifier)
          .play(
            itemId: itemId,
            episodeId: episodeId,
            forAndroidAuto: true,
            autoplay: autoplay,
          );
    } catch (e, st) {
      LogService.log(
        'Android Auto play failed: $e',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
    }
  }

  bool _isPausedOnSameItem(String itemId, String? episodeId) {
    final session = _container.read(sessionProvider);
    final isSameItem =
        session?.libraryItemId == itemId && session?.episodeId == episodeId;
    return isSameItem && !_container.read(isPlayingProvider);
  }

  Future<List<MediaItem>> search(
    String query, [
    Map<String, dynamic>? options,
  ]) async {
    try {
      final libraryId = _container.read(currentLibraryProvider)?.id;
      if (libraryId == null) return [];

      final user = await _container.read(authenticatedUserProvider.future);
      final libraryRepo = _container.read(libraryRepositoryProvider(user));
      final result = await libraryRepo.search(libraryId, query: query);
      final items = <LibraryItem>[
        ...result.book,
        ...result.podcast,
        ...result.episodes,
      ];
      final paged = applyAndroidAutoPaging(
        items,
        androidAutoPagingFromOptions(options),
      );
      final repo = await _itemRepository();
      return await Future.wait(
        paged.map(
          (item) => item.toAndroidAutoMediaItem(repo: repo, helper: _helper),
        ),
      );
    } catch (e, st) {
      LogService.log(
        'Android Auto failed to load search',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
      return const [];
    }
  }

  Future<List<MediaItem>> _loadNodeChildren(
    AndroidAutoNode node,
    Map<String, dynamic>? options,
  ) {
    return switch (node.kind) {
      .resume => _loadContinue(options),
      .downloads => _loadDownloads(options),
      .library => _loadLibraryItems(options),
    };
  }

  Future<List<MediaItem>> _loadContinue(Map<String, dynamic>? options) async {
    try {
      final shelves = await _container.read(rawShelvesProvider.future);
      final continueShelves = shelves
          .whereType<LibraryItemsShelf>()
          .where(
            (s) =>
                s.identity == .continueListening ||
                s.identity == .continueSeries,
          )
          .toList();

      final seen = <String>{};
      final items = <LibraryItem>[];
      for (final shelf in continueShelves) {
        for (final item in shelf.entities) {
          if (seen.add(item.id)) items.add(item);
        }
      }

      final paged = applyAndroidAutoPaging(
        items,
        androidAutoPagingFromOptions(options),
      );
      final repo = await _itemRepository();
      return await Future.wait(
        paged.map(
          (item) => item.toAndroidAutoMediaItem(repo: repo, helper: _helper),
        ),
      );
    } catch (e, st) {
      LogService.log(
        'Android Auto failed to load continue media',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
      return const [];
    }
  }

  Future<List<MediaItem>> _loadDownloads(Map<String, dynamic>? options) async {
    try {
      final downloads = _container.read(downloadsStoreProvider).getAll();

      final seen = <String>{};
      final items = <LibraryItem>[];
      for (final d in downloads.values) {
        if (!seen.add(d.libraryItemId) || !d.isComplete) continue;
        final libraryItem = _itemsCache.get(d.libraryItemId);
        if (libraryItem == null) continue;
        items.add(libraryItem);
      }

      final paged = applyAndroidAutoPaging(
        items,
        androidAutoPagingFromOptions(options),
      );
      final mediaItems = await Future.wait(
        paged.map(
          (item) => item.toAndroidAutoMediaItem(repo: null, helper: _helper),
        ),
      );
      return mediaItems.map((mediaItem) {
        final itemId = mediaItem.id.replaceAll('item:', '');
        return mediaItem.copyWith(id: 'dlItem:$itemId');
      }).toList();
    } catch (e, st) {
      LogService.log(
        'Android Auto failed to load downloads',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
      return const [];
    }
  }

  Future<List<MediaItem>> _loadLibraryItems(
    Map<String, dynamic>? options,
  ) async {
    try {
      final libraryId = _container.read(currentLibraryProvider)?.id;
      if (libraryId == null) return [];

      final libRepo = await _libraryRepository();
      final params = _container.read(
        libraryFiltersProvider(.library).select((s) => s.toItemParams()),
      );
      final items = await libRepo.getAllItems(libraryId, params);
      final paged = applyAndroidAutoPaging(
        items,
        androidAutoPagingFromOptions(options),
      );
      final repo = await _itemRepository();
      return await Future.wait(
        paged.map(
          (item) => item.toAndroidAutoMediaItem(repo: repo, helper: _helper),
        ),
      );
    } catch (e, st) {
      LogService.log(
        'Android Auto failed to load library items',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
      return [];
    }
  }

  Future<List<MediaItem>> _loadItemChildren({
    required String itemId,
    bool fromDownloads = false,
    Map<String, dynamic>? options,
  }) async {
    try {
      final item = await _container.read(itemDetailProvider(itemId).future);
      if (item.isBook) {
        final repo = await _itemRepository();
        return applyAndroidAutoPaging([
          await item.toAndroidAutoMediaItem(repo: repo, helper: _helper),
        ], androidAutoPagingFromOptions(options));
      }

      var episodes = item.episodes;
      if (fromDownloads) {
        final downloads = _container.read(downloadsStoreProvider).getAll();
        final downloadedIds = <String>{};
        for (final d in downloads.values) {
          if (d.libraryItemId == itemId &&
              d.episodeId != null &&
              d.isComplete) {
            downloadedIds.add(d.episodeId!);
          }
        }
        episodes = episodes.where((e) => downloadedIds.contains(e.id)).toList();
      }

      final paged = applyAndroidAutoPaging(
        episodes,
        androidAutoPagingFromOptions(options),
      );
      final repo = await _itemRepository();
      return await Future.wait(
        paged.map(
          (e) => e.toAndroidAutoMediaItem(
            itemId: itemId,
            podcastTitle: item.title,
            repo: repo,
            helper: _helper,
          ),
        ),
      );
    } catch (e, st) {
      LogService.log(
        'Android Auto item children load failed',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
    }

    return [];
  }
}
