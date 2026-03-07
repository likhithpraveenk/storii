import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_provider.dart';

part 'remove_progress_notifier.g.dart';

@riverpod
class RemoveProgressNotifier extends _$RemoveProgressNotifier {
  @override
  bool build() => false;

  Future<void> remove(
    String progressId, {
    required String itemId,
    String? episodeId,
  }) async {
    state = true;
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await api.removeMediaProgress(mediaProgressId: progressId);
    } catch (e) {
      LogService.log(
        'removing progress failed: $e',
        level: .error,
        source: 'RemoveProgressNotifier',
      );
    } finally {
      state = false;
      ref.invalidate(mediaProgressByIdProvider(itemId, episodeId));
    }
  }
}
