import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';
import 'package:storii/storage/local/session_store.dart';

part 'downloads_provider.g.dart';

typedef DownloadSortState = ({DownloadSort sort, bool ascending});

@Riverpod(keepAlive: true)
class DownloadSortNotifier extends _$DownloadSortNotifier {
  @override
  DownloadSortState build() {
    final remember = ref.watch(rememberSortProvider);
    return (
      sort: remember ? ref.read(downloadSortValueProvider) : .added,
      ascending: remember && ref.read(downloadSortAscendingProvider),
    );
  }

  void setSort(DownloadSort value) {
    state = (sort: value, ascending: state.ascending);
    _persist();
  }

  void toggleAscending() {
    state = (sort: state.sort, ascending: !state.ascending);
    _persist();
  }

  void _persist() {
    if (!ref.read(rememberSortProvider)) return;
    ref.read(userSettingsProvider.notifier)
      ..setDownloadSortValue(state.sort)
      ..setDownloadSortAscending(state.ascending);
  }
}

@riverpod
class DownloadSearchQuery extends _$DownloadSearchQuery {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@riverpod
DownloadItem? downloadItem(Ref ref, String libraryItemId, [String? episodeId]) {
  final key = mediaItemIdKey(libraryItemId, episodeId);
  return ref.watch(downloadsProvider.select((m) => m.value?[key]));
}

@riverpod
List<DownloadItem> activeDownloads(Ref ref) {
  final downloads =
      ref.watch(downloadsProvider).value ?? const <String, DownloadItem>{};
  final list = downloads.values.where((item) => !item.isComplete).toList()
    ..sort(
      (a, b) =>
          (a.startedAt ?? _zeroEpoch).compareTo(b.startedAt ?? _zeroEpoch),
    );
  return list;
}

@riverpod
List<DownloadItem> completedDownloads(Ref ref) {
  final downloads =
      ref.watch(downloadsProvider).value ?? const <String, DownloadItem>{};
  return downloads.values.where((item) => item.isComplete).toList();
}

@riverpod
int? downloadQueuePosition(Ref ref, String libraryItemId, [String? episodeId]) {
  final key = mediaItemIdKey(libraryItemId, episodeId);
  final queuedItems = ref
      .watch(activeDownloadsProvider)
      .where((item) => item.status == .queued)
      .toList();
  final index = queuedItems.indexWhere((item) => item.key == key);
  return index != -1 ? index + 1 : null;
}

final _zeroEpoch = DateTime.fromMillisecondsSinceEpoch(0);

@riverpod
Future<List<DownloadItem>> sortedCompletedDownloads(Ref ref) async {
  final items = ref.watch(completedDownloadsProvider);
  final query = ref.watch(downloadSearchQueryProvider).trim().toLowerCase();
  final filtered = query.isEmpty
      ? items
      : await _filterDownloads(ref, items, query);
  final sortState = ref.watch(downloadSortProvider);
  return _sortDownloads(ref, filtered, sortState.sort, sortState.ascending);
}

@riverpod
Future<List<DownloadItem>> sortedActiveDownloads(Ref ref) async {
  final items = ref.watch(activeDownloadsProvider);
  final query = ref.watch(downloadSearchQueryProvider).trim().toLowerCase();
  return query.isEmpty ? items : await _filterDownloads(ref, items, query);
}

Future<List<DownloadItem>> _filterDownloads(
  Ref ref,
  List<DownloadItem> items,
  String query,
) async {
  final cache = ref.read(itemsCacheProvider);
  final result = <DownloadItem>[];
  for (final item in items) {
    final cached = await cache.get(item.libraryItemId);
    final title = cached?.title ?? item.title;
    final author = cached?.authorName ?? item.author;
    if (title.toLowerCase().contains(query) ||
        author.toLowerCase().contains(query)) {
      result.add(item);
    }
  }
  return result;
}

Future<List<DownloadItem>> _sortDownloads(
  Ref ref,
  List<DownloadItem> items,
  DownloadSort sort,
  bool ascending,
) async {
  final cache = ref.read(itemsCacheProvider);
  final settings = ref.watch(currentServerSettingsProvider);
  final prefixes = settings?.sortingIgnorePrefix == true
      ? settings?.sortingPrefixes ?? <String>[]
      : <String>[];
  final titles = <String, String>{};
  final authors = <String, String>{};
  final listenedAt = <String, DateTime>{};

  for (final item in items) {
    if (!titles.containsKey(item.libraryItemId)) {
      final cached = await cache.get(item.libraryItemId);
      titles[item.libraryItemId] = cached?.title ?? item.title;
      authors[item.libraryItemId] = cached?.authorName ?? item.author;
    }
    listenedAt[item.key] ??= _lastListenedTime(ref, item);
  }

  String title(DownloadItem item) => titles[item.libraryItemId] ?? item.title;

  String author(DownloadItem item) =>
      authors[item.libraryItemId] ?? item.author;

  DateTime lastListened(DownloadItem item) =>
      listenedAt[item.key] ?? _zeroEpoch;

  final list = List<DownloadItem>.from(items);
  final dir = ascending ? 1 : -1;
  list.sort(
    (a, b) => switch (sort) {
      .title =>
        dir *
            _sortKey(
              title(a),
              prefixes,
            ).compareTo(_sortKey(title(b), prefixes)),
      .author =>
        dir *
            _sortKey(
              author(a),
              prefixes,
            ).compareTo(_sortKey(author(b), prefixes)),
      .size => dir * a.totalBytes.compareTo(b.totalBytes),
      .added =>
        dir * (a.startedAt ?? _zeroEpoch).compareTo(b.startedAt ?? _zeroEpoch),
      .lastListened => dir * lastListened(a).compareTo(lastListened(b)),
    },
  );
  return list;
}

String _sortKey(String value, List<String> prefixes) {
  String result = value;
  for (final prefix in prefixes) {
    result = result.replaceFirst(
      RegExp('^${RegExp.escape(prefix)}\\s+', caseSensitive: false),
      '',
    );
  }
  return result.toLowerCase();
}

DateTime _lastListenedTime(Ref ref, DownloadItem item) {
  final session = ref
      .read(sessionStoreProvider)
      .getSession(item.libraryItemId, item.episodeId);
  if (session?.updatedAt != null) return session!.updatedAt;
  final progress = ref
      .watch(mediaProgressFromMapProvider(item.libraryItemId, item.episodeId))
      .value;
  if (progress?.lastUpdate != null) return progress!.lastUpdate!;

  return _zeroEpoch;
}

@riverpod
Future<List<LibraryItem>> downloadedItems(Ref ref) async {
  final items = await ref.watch(sortedCompletedDownloadsProvider.future);
  final cache = ref.watch(itemsCacheProvider);

  final libraryItems = <LibraryItem>[];
  final seen = <String>{};
  for (final item in items) {
    if (!seen.add(item.libraryItemId)) continue;
    final libraryItem = await cache.get(item.libraryItemId);
    if (libraryItem == null) continue;
    libraryItems.add(libraryItem);
  }

  return libraryItems;
}
