import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'progress_notifier.g.dart';

@riverpod
class MediaProgressNotifier extends _$MediaProgressNotifier {
  StreamSubscription? _sub;

  @override
  Future<MediaProgress?> build(String itemId, [String? episodeId]) async {
    ref.onDispose(() => _sub?.cancel());
    await _sub?.cancel();
    final user = await ref.watch(authenticatedUserProvider.future);
    try {
      final progress = await ref.logApiCall(
        () => ref
            .read(meApiProvider(user))
            .getMediaProgress(libraryItemId: itemId, episodeId: episodeId),
        source: 'mediaProgress',
        debug: true,
      );

      final socket = await ref.watch(socketApiProvider(user).future);
      _sub = socket.user.onProgressUpdate.listen((event) {
        if (ref.mounted &&
            event.data.libraryItemId == itemId &&
            event.data.episodeId == episodeId) {
          state = AsyncData(event.data);
        }
      });

      return progress;
    } on AppError catch (e) {
      if (e.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<bool> markComplete() async {
    state = const AsyncLoading();
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.upsertMediaProgress(
          libraryItemId: itemId,
          episodeId: episodeId,
          params: const UpsertProgressRequestParams(isFinished: true),
        ),
        source: 'MediaProgressNotifier',
      );
      ref.invalidateSelf();
      return true;
    } on AppError catch (e) {
      state = AsyncError(e, e.stackTrace);
      return false;
    }
  }

  Future<bool> remove(String progressId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    state = const AsyncLoading();
    try {
      await ref.logApiCall(
        () => api.removeMediaProgress(mediaProgressId: progressId),
        source: 'MediaProgressNotifier',
      );
      ref.invalidateSelf();
      return true;
    } on AppError catch (e) {
      state = AsyncError(e, e.stackTrace);
      return false;
    }
  }
}
