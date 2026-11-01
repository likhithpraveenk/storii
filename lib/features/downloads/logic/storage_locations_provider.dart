import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

part 'storage_locations_provider.g.dart';

@riverpod
List<StorageLocation> storageLocationsByType(Ref ref, MediaType mediaType) {
  final locations = ref.watch(storageLocationsProvider);
  final DownloadMediaType type = mediaType == .book ? .audiobook : .podcast;
  return locations.where((l) => l.mediaType == type).toList();
}

@riverpod
({int size, int count}) storageSpaceByType(
  Ref ref,
  DownloadMediaType mediaType,
) {
  int size = 0;
  int count = 0;
  final downloads = (ref.watch(downloadsProvider).value ?? const {}).values
      .where((i) => i.mediaType == mediaType)
      .toList();
  for (final d in downloads) {
    size += d.receivedBytes;
    count += 1;
  }
  return (size: size, count: count);
}

@riverpod
int storageBytesByLocation(Ref ref, StorageLocation location) {
  int size = 0;
  final downloads = (ref.watch(downloadsProvider).value ?? const {}).values
      .where((i) => i.folderPath == location.uri)
      .toList();
  for (final d in downloads) {
    size += d.receivedBytes;
  }
  return size;
}
