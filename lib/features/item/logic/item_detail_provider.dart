import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'item_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LibraryItem> itemDetail(
  Ref ref,
  String id, {
  bool includeProgress = false,
  bool isDownloaded = false,
}) async {
  final isOnline = ref.watch(socketStatusProvider).value ?? false;
  if (!isOnline && isDownloaded) {
    final item = ref.watch(downloadsProvider).value?[id];
    if (item == null) {
      throw StateError('use isDownloaded for downloaded item only');
    }
    return item.libraryItem;
  }

  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id, includeProgress: includeProgress);
    if (isDownloaded) {
      unawaited(ref.read(downloadsProvider.notifier).updateItem(item));
    }
    return item;
  } catch (e) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching library item details: $error',
      source: 'itemDetail',
      level: .error,
    );
    throw error;
  }
}
