import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/downloads/models/download_item.dart';
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
