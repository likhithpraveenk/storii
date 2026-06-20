import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'media_progress_map_provider.g.dart';

@riverpod
class MediaProgressMap extends _$MediaProgressMap {
  @override
  Future<Map<String, MediaProgress>> build() async {
    final user = await ref.watch(authenticatedUserProvider.future);

    final updatedUser = await ref.read(meApiProvider(user)).getUser();
    final map = {
      for (var p in updatedUser.mediaProgress)
        mediaItemIdKey(p.libraryItemId, p.episodeId): p,
    };

    final socket = await ref.watch(socketApiProvider(user).future);
    socket.user.onProgressUpdate.listen((event) {
      final current = state.value ?? {};
      state = AsyncData({
        ...current,
        mediaItemIdKey(event.data.libraryItemId, event.data.episodeId):
            event.data,
      });
    });

    return map;
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
