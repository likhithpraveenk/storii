import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'media_progress_provider.g.dart';

@riverpod
Future<Map<String, MediaProgress>> mediaProgress(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  try {
    final updatedUser = await ref.read(meApiProvider(user)).getUser();
    final map = {for (var p in updatedUser.mediaProgress) p.libraryItemId: p};
    return map;
  } catch (e) {
    final error = AppError.resolve(e);
    LogService.log(
      'Failed to get media progress: $error',
      level: .warning,
      source: 'mediaProgress',
    );
    return {};
  }
}

@riverpod
Future<MediaProgress?> mediaProgressById(
  Ref ref,
  String itemId, [
  String? episodeId,
]) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  try {
    final progress = await ref
        .read(meApiProvider(user))
        .getMediaProgress(libraryItemId: itemId, episodeId: episodeId);
    return progress;
  } catch (e) {
    final error = AppError.resolve(e);
    if (error.toString().contains('404')) return null;
    LogService.log(
      'Failed to get media progress: $error',
      level: .warning,
      source: 'mediaProgressById',
    );
    throw error;
  }
}
