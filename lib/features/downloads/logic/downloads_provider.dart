import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/downloads_store.dart';

part 'downloads_provider.g.dart';

@Riverpod(keepAlive: true)
class DownloadsNotifier extends _$DownloadsNotifier {
  @override
  Stream<Map<String, DownloadItem>> build() async* {
    final items = await ref.watch(downloadsStoreProvider.future);
    yield items;
  }

  Future<void> save(DownloadItem item) async {
    await ref.read(downloadsStoreProvider.notifier).save(item);
  }

  Future<void> remove(String id) async {
    await ref.read(downloadsStoreProvider.notifier).remove(id);
  }
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
