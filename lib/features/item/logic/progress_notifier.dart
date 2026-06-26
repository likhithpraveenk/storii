import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'progress_notifier.g.dart';

@Riverpod(keepAlive: true)
class MediaProgressNotifier extends _$MediaProgressNotifier {
  @override
  void build(String itemId, [String? episodeId]) {}

  Future<bool> markComplete() async {
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
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> remove(String progressId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.removeMediaProgress(mediaProgressId: progressId),
        source: 'MediaProgressNotifier',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeEpisodeProgress() async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.upsertMediaProgress(
          libraryItemId: itemId,
          episodeId: episodeId,
          params: const UpsertProgressRequestParams(isFinished: false),
        ),
        source: 'MediaProgressNotifier',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}
