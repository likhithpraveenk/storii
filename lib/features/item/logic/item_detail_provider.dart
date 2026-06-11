import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'item_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LibraryItem> itemDetail(Ref ref, String id) async {
  final downloads = await ref.read(downloadsProvider.future);
  final download = downloads[id];

  if (download != null && download.isComplete) {
    final cache = ref.read(itemsCacheProvider.notifier);
    final localItem = cache.get(id);
    final serverUrl = ref.read(serverUrlProvider);
    if (download.serverUrl != serverUrl) {
      if (localItem == null) {
        throw StateError(
          'old download from different server. item details not saved',
        );
      }
      return localItem;
    }

    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final remoteItem = await ref
          .read(itemApiProvider(user))
          .get(id, includeProgress: true);

      await cache.put(remoteItem);
      return remoteItem;
    } on AppError catch (error) {
      LogService.log(
        'Failed to refresh ${localItem?.title}: ${error.message}',
        source: 'itemDetail',
        level: .warning,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
    }
    if (localItem != null) {
      return localItem;
    }
  }

  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  return ref.logApiCall(
    () => api.get(id, includeProgress: true),
    source: 'itemDetail',
    logMessage: 'Error fetching library item details',
  );
}
