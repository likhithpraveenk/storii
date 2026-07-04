import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'media_progress_map_provider.g.dart';

@Riverpod(keepAlive: true)
class MediaProgressMap extends _$MediaProgressMap {
  StreamSubscription? _progressSub;
  StreamSubscription? _userSub;

  @override
  Future<Map<String, MediaProgress>> build() async {
    ref.onDispose(() {
      _progressSub?.cancel();
      _userSub?.cancel();
    });
    await _progressSub?.cancel();
    await _userSub?.cancel();
    try {
      final user = await ref.watch(authenticatedUserProvider.future);

      final updatedUser = await ref.read(meApiProvider(user)).getUser();
      final map = {
        for (var p in updatedUser.mediaProgress)
          mediaItemIdKey(p.libraryItemId, p.episodeId): p,
      };

      final socket = await ref.watch(socketApiProvider(user).future);

      _progressSub = socket.user.onProgressUpdate.listen((event) {
        final current = state.value ?? {};
        state = AsyncData({
          ...current,
          mediaItemIdKey(event.data.libraryItemId, event.data.episodeId):
              event.data,
        });
      });

      _userSub = socket.user.onUserUpdated.listen((updatedUser) {
        final newMap = {
          for (var p in updatedUser.mediaProgress)
            mediaItemIdKey(p.libraryItemId, p.episodeId): p,
        };
        state = AsyncData(newMap);
      });

      return map;
    } catch (_) {
      return {};
    }
  }
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
  return ref.watch(mediaProgressMapProvider.selectAsync((map) => map[key]));
}
