import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/progress_store.dart';

part 'media_progress_map_provider.g.dart';

@Riverpod(keepAlive: true)
class MediaProgressSyncController extends _$MediaProgressSyncController {
  StreamSubscription? _progressSub;

  @override
  void build() async {
    ref.onDispose(() {
      _progressSub?.cancel();
    });
    await _progressSub?.cancel();

    try {
      final user = await ref.watch(authenticatedUserProvider.future);
      final store = ref.watch(progressStoreProvider(user.id).notifier);

      final serverUser = await ref.watch(serverUserProvider.future);
      store.putAll(serverUser.mediaProgress);

      final socket = await ref.read(socketApiProvider(user).future);
      _progressSub = socket.user.onProgressUpdate.listen((event) {
        store.put(event.data);
      });
    } catch (_) {}
  }
}

@riverpod
Future<Map<String, MediaProgress>> mediaProgressMap(Ref ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    return Future.value({});
  }
  return ref.watch(progressStoreProvider(user.id).future);
}

@riverpod
Future<int> totalFinishedBooks(Ref ref) async {
  final progressMap = await ref.watch(mediaProgressMapProvider.future);
  return progressMap.values
      .where((p) => p.isFinished == true && p.episodeId == null)
      .length;
}

@riverpod
Future<int> totalFinishedEpisodes(Ref ref) async {
  final progressMap = await ref.watch(mediaProgressMapProvider.future);
  return progressMap.values
      .where((p) => p.isFinished == true && p.episodeId != null)
      .length;
}

@riverpod
Future<MediaProgress?> mediaProgressFromMap(
  Ref ref,
  String libraryItemId, [
  String? episodeId,
]) async {
  final map = await ref.watch(mediaProgressMapProvider.future);
  return map[mediaItemIdKey(libraryItemId, episodeId)];
}
