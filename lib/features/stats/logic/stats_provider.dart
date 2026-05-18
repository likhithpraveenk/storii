import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'stats_provider.g.dart';

@riverpod
Future<UserStatsResponse> stats(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(meApiProvider(user));
  try {
    final response = await api.getStats();
    return response;
  } catch (e) {
    final error = AppError.resolve(e);
    LogService.log(
      'fetching stats failed: $error',
      originalError: e,
      level: .error,
    );
    throw error;
  }
}
