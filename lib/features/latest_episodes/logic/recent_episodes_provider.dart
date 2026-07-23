import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'recent_episodes_provider.g.dart';

@riverpod
Future<List<PodcastEpisode>> recentEpisodes(Ref ref) async {
  ref.watchConnection();
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;

  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  final response = await ref.logApiCall(
    () => api.getRecentEpisodes(libraryId),
    logMessage: 'Error fetching recent episodes',
    source: 'recentEpisodes',
  );
  return response.episodes;
}
