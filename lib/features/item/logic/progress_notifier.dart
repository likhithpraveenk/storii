import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'progress_notifier.g.dart';

@riverpod
class MediaProgressNotifier extends _$MediaProgressNotifier {
  @override
  Future<MediaProgress?> build(String itemId, [String? episodeId]) async {
    final user = await ref.watch(authenticatedUserProvider.future);
    try {
      final progress = await ref
          .read(meApiProvider(user))
          .getMediaProgress(libraryItemId: itemId, episodeId: episodeId);

      final socket = await ref.watch(socketApiProvider(user).future);
      socket.user.onProgressUpdate.listen((event) {
        if (ref.mounted &&
            event.data.libraryItemId == itemId &&
            event.data.episodeId == episodeId) {
          state = AsyncData(event.data);
        }
      });

      return progress;
    } on ApiException catch (e) {
      if (e.statusCode == 404) {
        return null;
      }
      LogService.log(
        'Failed to get media progress: $e',
        level: .warning,
        source: 'MediaProgressNotifier',
      );
      rethrow;
    }
  }

  Future<bool> markComplete() async {
    state = const AsyncLoading();
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await api.upsertMediaProgress(
        libraryItemId: itemId,
        episodeId: episodeId,
        params: const UpsertProgressRequestParams(isFinished: true),
      );
      ref.invalidateSelf();
      return true;
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'mark complete failed: $error',
        level: .warning,
        source: 'MediaProgressNotifier',
      );
      state = AsyncError(error, st);
      return false;
    }
  }

  Future<bool> remove(String progressId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    state = const AsyncLoading();
    try {
      await api.removeMediaProgress(mediaProgressId: progressId);
      ref.invalidateSelf();
      return true;
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'remove progress failed: $error',
        level: .warning,
        source: 'MediaProgressNotifier',
      );
      state = AsyncError(error, st);
      return false;
    }
  }
}
