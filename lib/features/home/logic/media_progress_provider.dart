import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'media_progress_provider.g.dart';

@riverpod
class MediaProgressNotifier extends _$MediaProgressNotifier {
  @override
  void build() {}

  Future<Map<String, MediaProgress>> getMediaProgress() async {
    final user = await ref.read(authenticatedUserProvider.future);
    try {
      final updatedUser = await ref.read(meApiProvider(user)).getUser();
      final map = {for (var p in updatedUser.mediaProgress) p.libraryItemId: p};
      return map;
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'Failed to get media progress: $error',
        level: .warning,
        source: 'MediaProgressNotifier',
        stackTrace: st,
      );
      return {};
    }
  }
}
