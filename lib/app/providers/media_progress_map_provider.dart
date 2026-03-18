import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';

part 'media_progress_map_provider.g.dart';

@riverpod
class MediaProgressMap extends _$MediaProgressMap {
  @override
  Future<Map<String, MediaProgress>> build() async {
    final user = await ref.watch(authenticatedUserProvider.future);

    final updatedUser = await ref.read(meApiProvider(user)).getUser();
    final map = {for (var p in updatedUser.mediaProgress) p.libraryItemId: p};

    final socket = await ref.watch(socketApiProvider(user).future);
    socket.user.onProgressUpdate.listen((event) {
      final current = state.value ?? {};
      state = AsyncData({...current, event.data.libraryItemId: event.data});
    });

    return map;
  }
}
