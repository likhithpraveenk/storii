import 'package:abs_api/abs_api.dart';
import 'package:audio_service/audio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/home/logic/shelves_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/player/logic/android_auto_extensions.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/models/android_auto_media_id.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'android_auto_helper.g.dart';

@riverpod
Future<List<AndroidAutoNode>> androidAutoTopLevelNodes(Ref ref) async {
  final shelves = await ref.watch(rawShelvesProvider.future);
  final itemsShelves = shelves
      .whereType<LibraryItemsShelf>()
      .where(
        (s) =>
            s.identity != .continueListening && s.identity != .continueSeries,
      )
      .toList();

  return [
    AndroidAutoNode(id: 'continue', title: l10n.continueWord, kind: .resume),
    for (final shelf in itemsShelves)
      AndroidAutoNode(
        id: 'shelf:${shelf.id}',
        title: shelf.label,
        kind: .shelf,
        shelfId: shelf.id,
      ),
    AndroidAutoNode(id: 'downloads', title: l10n.downloads, kind: .downloads),
  ];
}

class AndroidAutoHelper {
  new(this._container);

  final ProviderContainer _container;

  Uri? get _serverUrl =>
      _container.read(authenticatedUserProvider).value?.serverUrl;

  DownloadsFilesystemHelper get _fsHelper =>
      _container.read(downloadsFsHelperProvider);

  Future<Map<String, MediaProgress>> get _progressMap =>
      _container.read(mediaProgressMapProvider.future);

  ItemsCache get _itemsCache => _container.read(itemsCacheProvider.notifier);

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
              id: n.id,
              title: n.title,
              playable: n.playable,
              extras: {
                AndroidContentStyle.browsableHintKey:
                    AndroidContentStyle.listItemHintValue,
              },
            ),
          )
          .toList();
      return items;
    }

    final node = nodes.firstWhereOrNull((n) => n.id == parentMediaId);
    if (node != null) return _loadNodeChildren(node);

    final parsed = AndroidAutoMediaId.parse(parentMediaId);
    return switch (parsed) {
      AndroidAutoMediaItem(:final id, :final fromDownloads) =>
        _loadItemChildren(itemId: id, fromDownloads: fromDownloads),
      _ => <MediaItem>[],
    };
  }

  Future<void> playItem({required String itemId, String? episodeId}) async {
    try {
      await _container
          .read(queueProvider.notifier)
          .play(itemId: itemId, episodeId: episodeId, forAndroidAuto: true);
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

  Future<List<MediaItem>> _loadNodeChildren(AndroidAutoNode node) {
    return switch (node.kind) {
      .resume => _loadContinue(),
      .shelf => _loadShelf(node.shelfId ?? ''),
      .downloads => _loadDownloads(),
    };
  }

  Future<List<MediaItem>> _loadContinue() async {
    final shelves = await _container.read(rawShelvesProvider.future);
    final progressMap = await _progressMap;

    final continueShelves = shelves
        .whereType<LibraryItemsShelf>()
        .where(
          (s) =>
              s.identity == .continueListening || s.identity == .continueSeries,
        )
        .toList();

    final seen = <String>{};
    final items = <LibraryItem>[];
    for (final shelf in continueShelves) {
      for (final item in shelf.entities) {
        if (seen.add(item.id)) items.add(item);
      }
    }

    return Future.wait(
      items.map(
        (item) => item.toAndroidAutoMediaItem(
          serverUrl: _serverUrl,
          fsHelper: _fsHelper,
          progress: progressMap[mediaItemIdKey(item.id)],
        ),
      ),
    );
  }

  Future<List<MediaItem>> _loadShelf(String shelfId) async {
    final shelves = await _container.read(rawShelvesProvider.future);
    final progressMap = await _progressMap;

    final shelf = shelves.whereType<LibraryItemsShelf>().firstWhereOrNull(
      (s) => s.id == shelfId,
    );
    if (shelf == null) return const [];

    return Future.wait(
      shelf.entities.map(
        (item) => item.toAndroidAutoMediaItem(
          serverUrl: _serverUrl,
          fsHelper: _fsHelper,
          progress: progressMap[mediaItemIdKey(item.id)],
        ),
      ),
    );
  }

  Future<List<MediaItem>> _loadDownloads() async {
    try {
      final downloads = await _container.read(downloadsProvider.future);
      final progressMap = await _progressMap;

      final seen = <String>{};
      final items = <LibraryItem>[];
      for (final d in downloads.values) {
        if (!seen.add(d.libraryItemId) || !d.isComplete) continue;
        final libraryItem = _itemsCache.get(d.libraryItemId);
        if (libraryItem == null) continue;
        items.add(libraryItem);
      }

      final mediaItems = await Future.wait(
        items.map(
          (item) => item.toAndroidAutoMediaItem(
            serverUrl: null,
            fsHelper: _fsHelper,
            progress: progressMap[mediaItemIdKey(item.id)],
          ),
        ),
      );
      return mediaItems.map((mediaItem) {
        final itemId = mediaItem.id.replaceAll('item:', '');
        return mediaItem.copyWith(id: 'dlItem:$itemId');
      }).toList();
    } catch (e, st) {
      LogService.log(
        'Android Auto downloads load failed',
        level: .error,
        source: 'AndroidAutoHelper',
        originalError: e,
        stackTrace: st,
      );
      return const [];
    }
  }

  Future<List<MediaItem>> _loadItemChildren({
    required String itemId,
    bool fromDownloads = false,
  }) async {
    try {
      final item = await _container.read(itemDetailProvider(itemId).future);
      final progressMap = await _progressMap;

      if (item.isBook) {
        return [
          await item.toAndroidAutoMediaItem(
            serverUrl: _serverUrl,
            fsHelper: _fsHelper,
            progress: progressMap[mediaItemIdKey(item.id)],
          ),
        ];
      }

      var episodes = item.episodes;
      if (fromDownloads) {
        final downloads = await _container.read(downloadsProvider.future);
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

      return await Future.wait(
        episodes.map(
          (e) => e.toAndroidAutoMediaItem(
            itemId: itemId,
            podcastTitle: item.title,
            serverUrl: _serverUrl,
            helper: _fsHelper,
            progress: progressMap[mediaItemIdKey(itemId, e.id)],
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
