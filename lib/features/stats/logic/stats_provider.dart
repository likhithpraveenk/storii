import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'stats_provider.g.dart';

@riverpod
Future<UserStatsResponse> stats(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(meApiProvider(user));
  return ref.logApiCall(
    api.getStats,
    source: 'stats',
    logMessage: 'fetching stats failed',
  );
}
