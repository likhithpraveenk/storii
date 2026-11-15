import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/progress_store.dart';

part 'media_progress_map_provider.g.dart';

@riverpod
Future<void> mediaProgressSyncController(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final store = ref.read(progressStoreProvider(user.id));
  final serverUser = await ref.watch(serverUserProvider.future);
  unawaited(store.putAll(serverUser.mediaProgress));
  ref.listen(_progressUpdateProvider, (_, next) {
    final progress = next.value;
    if (progress != null) {
      store.put(progress);
    }
  });
}

@riverpod
Stream<MediaProgress> _progressUpdate(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) return;
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.user.onProgressUpdate.map((e) => e.data);
}

@riverpod
Future<Map<String, MediaProgress>> mediaProgressMap(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return {};
  final map = await ref.watch(progressMapProvider(user.id).future);
  return map;
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
  final key = mediaItemIdKey(libraryItemId, episodeId);
  final progress = await ref.watch(
    mediaProgressMapProvider.selectAsync((s) => s[key]),
  );
  return progress;
}
