import 'dart:convert';
import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloads_provider.g.dart';

@Riverpod(keepAlive: true)
class DownloadsNotifier extends _$DownloadsNotifier {
  final Box<String> _box = Hive.box<String>(downloadsBox);

  @override
  Stream<Map<String, DownloadItem>> build() {
    return _box
        .watch()
        .map((_) => _decode(_box.values))
        .startWith(_decode(_box.values));
  }

  Map<String, DownloadItem> _decode(Iterable<String> values) {
    return Map.fromEntries(
      values.map((v) {
        try {
          final item = DownloadItem.fromJson(jsonDecode(v));
          return MapEntry(item.libraryItemId, item);
        } catch (e) {
          log('Failed to decode download item: $e');
          return null;
        }
      }).nonNulls,
    );
  }

  Future<void> save(DownloadItem item) async {
    try {
      await _box.put(item.libraryItemId, jsonEncode(item));
    } catch (e) {
      log('Failed to save download item [${item.title}]: $e');
    }
  }

  Future<void> updateItem(LibraryItem item) async {
    final download = state.value?[item.id];
    if (download == null) return;
    await save(download.copyWith(libraryItem: item));
  }

  Future<void> remove(String id) async {
    await _box.delete(id);
  }
}

@riverpod
DownloadItem? downloadItem(Ref ref, String libraryItemId) {
  return ref.watch(downloadsProvider).value?[libraryItemId];
}

@riverpod
Stream<List<DownloadItem>> activeDownloads(Ref ref) async* {
  final downloads = await ref.watch(downloadsProvider.future);
  yield downloads.values.where((item) => !item.isComplete).toList();
}

@riverpod
Stream<List<DownloadItem>> completedDownloads(Ref ref) async* {
  final downloads = await ref.watch(downloadsProvider.future);
  yield downloads.values.where((item) => item.isComplete).toList();
}
