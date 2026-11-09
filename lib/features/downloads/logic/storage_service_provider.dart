import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/internal_storage_service.dart';
import 'package:storii/features/downloads/logic/saf_storage_service.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'storage_service_provider.g.dart';

@riverpod
StorageService storageService(Ref ref, StorageLocation location) {
  if (location.isInternal) {
    return InternalStorageService(location);
  }
  return SafStorageService(location);
}

@riverpod
StorageService? storageServiceForItem(Ref ref, DownloadItem? item) {
  final locations = ref.watch(storageLocationsProvider);
  final location = locations.firstWhereOrNull((l) => l.uri == item?.folderPath);
  if (location == null) return null;
  return ref.watch(storageServiceProvider(location));
}
