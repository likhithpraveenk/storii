import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'item_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LibraryItem> itemDetail(Ref ref, String id) async {
  final cache = ref.read(itemsCacheProvider.notifier);

  final isConnected = await ref.watch(socketStatusProvider.future);
  if (!isConnected) {
    final localItem = cache.get(id);
    if (localItem != null) return localItem;
    throw StateError('No internet and item not in cache');
  }

  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));

  try {
    final remoteItem = await ref.logApiCall(
      () => api.get(id, includeProgress: true),
      source: 'itemDetail',
      logMessage: 'Error fetching library item details',
    );
    unawaited(cache.put(remoteItem));
    return remoteItem;
  } on AppError catch (error) {
    if (error.type == .network || error.type == .timeout) {
      final localItem = cache.get(id);
      if (localItem != null) return localItem;
    }
    rethrow;
  }
}
