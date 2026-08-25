import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'user_progress_actions.g.dart';

@Riverpod(keepAlive: true)
class UserProgressActionsNotifier extends _$UserProgressActionsNotifier {
  @override
  void build(String itemId, [String? episodeId]) {}

  Future<bool> markComplete({bool isFinished = true}) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.upsertMediaProgress(
          libraryItemId: itemId,
          episodeId: episodeId,
          params: UpsertProgressRequestParams(isFinished: isFinished),
        ),
        source: 'UserProgressActionsNotifier',
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
        source: 'UserProgressActionsNotifier',
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
        source: 'UserProgressActionsNotifier',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeFromContinueListening(String mediaProgressId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.removeFromContinueListening(mediaProgressId: mediaProgressId),
        source: 'UserProgressActionsNotifier',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeSeriesFromContinueListening(String seriesId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.removeSeriesFromContinueListening(seriesId: seriesId),
        source: 'UserProgressActionsNotifier',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> reAddSeriesToContinueListening(String seriesId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.reAddSeriesToContinueListening(seriesId: seriesId),
        source: 'UserProgressActionsNotifier',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}
