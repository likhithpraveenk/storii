import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';
import 'package:storii/storage/local/session_store.dart';

part 'downloads_provider.g.dart';

enum DownloadSortType {
  title,
  author,
  size,
  added,
  lastListened;

  String get label => switch (this) {
    .title => l10n.title,
    .author => l10n.author,
    .size => l10n.size,
    .added => l10n.added,
    .lastListened => l10n.lastPlayed,
  };
}

@Riverpod(keepAlive: true)
class DownloadSortTypeNotifier extends _$DownloadSortTypeNotifier {
  @override
  DownloadSortType build() => .added;

  void set(DownloadSortType value) => state = value;
}

@Riverpod(keepAlive: true)
class DownloadSortAscending extends _$DownloadSortAscending {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

@Riverpod(keepAlive: true)
Stream<Map<String, DownloadItem>> downloads(Ref ref) async* {
  final items = await ref.watch(downloadsStoreProvider.future);
  yield items;
}

@riverpod
DownloadItem? downloadItem(Ref ref, String libraryItemId, [String? episodeId]) {
  final key = mediaItemIdKey(libraryItemId, episodeId);
  return ref.watch(downloadsProvider).value?[key];
}

@riverpod
Stream<List<DownloadItem>> activeDownloads(Ref ref) async* {
  final downloads = await ref.watch(downloadsProvider.future);
  final list = downloads.values.where((item) => !item.isComplete).toList()
    ..sort(
      (a, b) => (a.startedAt ?? DateTime.now()).compareTo(
        b.startedAt ?? DateTime.now(),
      ),
    );
  yield list;
}

@riverpod
Stream<List<DownloadItem>> completedDownloads(Ref ref) async* {
  final downloads = await ref.watch(downloadsProvider.future);
  yield downloads.values.where((item) => item.isComplete).toList();
}

@riverpod
Future<int?> downloadQueuePosition(
  Ref ref,
  String libraryItemId, [
  String? episodeId,
]) async {
  final key = mediaItemIdKey(libraryItemId, episodeId);
  final queuedItems = (await ref.watch(
    activeDownloadsProvider.selectAsync(
      (s) => s.where((i) => i.status == .queued),
    ),
  )).toList();
  final index = queuedItems.indexWhere((item) => item.key == key);
  return index != -1 ? index + 1 : null;
}

final _zeroEpoch = DateTime.fromMillisecondsSinceEpoch(0);

@riverpod
List<DownloadItem> sortedCompletedDownloads(Ref ref) {
  final items = ref.watch(completedDownloadsProvider).value ?? [];
  final sort = ref.watch(downloadSortTypeProvider);
  final ascending = ref.watch(downloadSortAscendingProvider);
  return _sortDownloads(ref, items, sort, ascending);
}

List<DownloadItem> _sortDownloads(
  Ref ref,
  List<DownloadItem> items,
  DownloadSortType sort,
  bool ascending,
) {
  final cache = ref.read(itemsCacheProvider.notifier);
  final titles = <String, String>{};
  final authors = <String, String>{};
  final listenedAt = <String, DateTime>{};

  String title(DownloadItem item) => titles[item.libraryItemId] ??=
      cache.get(item.libraryItemId)?.title ?? item.title;
  String author(DownloadItem item) => authors[item.libraryItemId] ??=
      cache.get(item.libraryItemId)?.authorName ?? item.author;
  DateTime lastListened(DownloadItem item) =>
      listenedAt[item.key] ??= _lastListenedTime(ref, item);

  final list = List<DownloadItem>.from(items);
  final dir = ascending ? 1 : -1;
  list.sort(
    (a, b) => switch (sort) {
      .title => dir * title(a).compareTo(title(b)),
      .author => dir * author(a).compareTo(author(b)),
      .size => dir * a.totalBytes.compareTo(b.totalBytes),
      .added =>
        dir * (a.startedAt ?? _zeroEpoch).compareTo(b.startedAt ?? _zeroEpoch),
      .lastListened => dir * lastListened(a).compareTo(lastListened(b)),
    },
  );
  return list;
}

DateTime _lastListenedTime(Ref ref, DownloadItem item) {
  final session = ref
      .watch(sessionStoreProvider.notifier)
      .getSession(item.libraryItemId, item.episodeId);
  if (session?.updatedAt != null) return session!.updatedAt;
  final progress = ref
      .watch(mediaProgressFromMapProvider(item.libraryItemId, item.episodeId))
      .value;
  if (progress?.lastUpdate != null) return progress!.lastUpdate!;

  return _zeroEpoch;
}

@riverpod
List<LibraryItem> downloadedItems(Ref ref) {
  final items = ref.watch(sortedCompletedDownloadsProvider);
  final cache = ref.watch(itemsCacheProvider.notifier);

  final libraryItems = <LibraryItem>[];
  final seen = <String>{};
  for (final item in items) {
    if (!seen.add(item.libraryItemId)) continue;
    final libraryItem = cache.get(item.libraryItemId);
    if (libraryItem == null) continue;
    libraryItems.add(libraryItem);
  }

  return libraryItems;
}
