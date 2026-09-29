import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'widget_controller.g.dart';

@riverpod
class WidgetController extends _$WidgetController {
  @override
  int? build() => null;

  bool get isActive => state != null;

  void setWidgetId(int id) => state = id;

  Future<bool> bindActiveWidget({
    required String itemId,
    String? episodeId,
  }) async {
    final widgetId = state;
    if (widgetId == null) return false;

    try {
      final coverPath = await _coverPathForWidget(itemId);

      await widgetChannel.invokeMethod('bindWidget', {
        'widgetId': widgetId,
        'itemId': itemId,
        'episodeId': episodeId,
        'coverPath': coverPath,
      });

      return true;
    } catch (e, st) {
      LogService.log(
        'Failed to bind widget',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
      return false;
    }
  }

  Future<String?> _coverPathForWidget(String libraryItemId) async {
    final tempDir = await getTemporaryDirectory();
    final path = p.join(tempDir.path, 'widget_${libraryItemId}_cover.jpg');

    if (await File(path).exists()) return path;

    final user = ref.read(currentUserProvider);
    if (user == null) return null;

    try {
      final cancelToken = CancelToken();
      final bytes = await ref.logApiCall(
        () => ref
            .read(itemApiProvider(user))
            .getCover(libraryItemId: libraryItemId, cancelToken: cancelToken),
        source: 'WidgetController',
        logMessage: 'Failed to download cover for widget',
      );
      if (bytes == null) return null;

      await File(path).writeAsBytes(bytes);
      return path;
    } catch (e, st) {
      LogService.log(
        'Failed to get widget cover',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
      return null;
    }
  }
}
