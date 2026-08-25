import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'playlist_providers.g.dart';

@riverpod
Future<List<Playlist>> playlists(Ref ref) async {
  ref.watchConnection();
  final activeLibrary = await ref.watch(activeLibraryDetailsProvider.future);
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  return ref.logApiCall(
    () => api.getUserPlaylists(libraryId: activeLibrary.library.id),
    source: 'playlists',
    logMessage:
        'Error getting playlists for library: ${activeLibrary.library.name}',
  );
}

@riverpod
Future<Playlist> playlistDetail(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(playlistsApiProvider(user));
  return ref.logApiCall(
    () => api.get(playlistId: id),
    source: 'playlist',
    logMessage: 'Error getting playlist $id',
  );
}
