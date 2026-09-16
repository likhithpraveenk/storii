import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saf_util/saf_util.dart';
import 'package:storii/app/models/storage_location.dart';

part 'folder_permission.g.dart';

@riverpod
Future<bool> checkFolderPermission(Ref ref, StorageLocation location) async {
  if (location.isInternal) return true;
  return SafUtil().hasPersistedPermission(location.uri, checkWrite: true);
}
