import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'item_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LibraryItem> itemDetail(Ref ref, String id) async {
  final downloads = await ref.read(downloadsProvider.future);
  final download = downloads[id];

  if (download != null && download.isComplete) {
    final box = Hive.box<String>(itemsBox);
    final localJson = box.get(id);
    final localItem = localJson != null
        ? LibraryItem.fromJson(jsonDecode(localJson) as Map<String, dynamic>)
        : null;
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

      await box.put(id, jsonEncode(remoteItem));
      return remoteItem;
    } catch (e) {
      LogService.log(
        'Failed to refresh ${localItem?.title}, using local: $e',
        source: 'itemDetail',
        level: .warning,
      );
    }
    if (localItem != null) {
      return localItem;
    }
  }

  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id, includeProgress: true);
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
