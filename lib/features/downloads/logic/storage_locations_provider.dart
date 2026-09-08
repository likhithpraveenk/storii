import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'storage_locations_provider.g.dart';

@riverpod
List<StorageLocation> storageLocationsByType(Ref ref, MediaType mediaType) {
  final locations = ref.watch(storageLocationsProvider);
  return locations.where((l) => l.mediaType == mediaType).toList();
}
