import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:home_widget/home_widget.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/widget_config.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/widget_store.dart';

part 'widget_controller.g.dart';

const _widgetName = 'MediaWidgetProvider';

@riverpod
class WidgetController extends _$WidgetController {
  int? _widgetId;

  @override
  void build() {
    final configs = ref.read(widgetStoreProvider.notifier).getAllConfigs();
    if (configs.isNotEmpty) {
      configs.forEach(_refreshWidget);
    }
    unawaited(_syncWithInstalledWidgets(configs));
  }

  bool get isActive => _widgetId != null;

  void setWidgetId(int id) => _widgetId = id;

  Future<bool> bindActiveWidget({
    required String itemId,
    String? episodeId,
  }) async {
    try {
      final coverPath = await _coverPathForWidget(itemId);
      final progress = await _fetchProgress(itemId, episodeId);
      if (_widgetId == null) return false;

      final config = WidgetConfig(
        widgetId: _widgetId!,
        itemId: itemId,
        episodeId: episodeId,
        coverPath: coverPath,
        updatedAt: DateTime.now(),
        progress: progress,
      );

      await _saveAndUpdateWidget(config);
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

  Future<void> _syncWithInstalledWidgets(List<WidgetConfig> configs) async {
    try {
      final installed = await HomeWidget.getInstalledWidgets();
      final installedIds = installed
          .where((w) => w.androidClassName == _widgetName)
          .map((w) => w.androidWidgetId)
          .whereType<int>()
          .toSet();

      for (final config in configs) {
        if (!installedIds.contains(config.widgetId)) {
          await ref
              .read(widgetStoreProvider.notifier)
              .clearConfig(config.widgetId);
        }
      }
    } catch (e, st) {
      LogService.log(
        'Failed to sync with existing widgets',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
    }
  }

  Future<void> _saveAndUpdateWidget(WidgetConfig config) async {
    await ref.read(widgetStoreProvider.notifier).saveConfig(config);
    await HomeWidget.saveWidgetData<String>(
      'widget_${config.widgetId}',
      jsonEncode(config),
    );

    await HomeWidget.updateWidget(
      name: _widgetName,
      qualifiedAndroidName: 'com.likhithpraveenk.storii.$_widgetName',
    );
  }

  Future<void> _refreshWidget(WidgetConfig config) async {
    final coverPath = await _coverPathForWidget(config.itemId);
    final progress = await _fetchProgress(config.itemId, config.episodeId);
    final updatedConfig = config.copyWith(
      coverPath: coverPath,
      updatedAt: DateTime.now(),
      progress: progress,
    );

    await _saveAndUpdateWidget(updatedConfig);
  }

  Future<double?> _fetchProgress(String itemId, String? episodeId) async {
    try {
      final progress = await ref.read(
        mediaProgressFromMapProvider(itemId, episodeId).future,
      );
      return progress?.progress;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _coverPathForWidget(String libraryItemId) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final path = p.join(
      docsDir.path,
      'widget_covers',
      'widget_${libraryItemId}_cover.jpg',
    );

    if (await File(path).exists()) return path;

    final user = ref.read(currentUserProvider);
    if (user == null) return null;

    try {
      final cancelToken = CancelToken();
      final bytes = await ref.logApiCall(
        () async => (await ref.read(itemApiProvider(user).future))
            .getCover(libraryItemId: libraryItemId, cancelToken: cancelToken),
        source: 'WidgetController',
        logMessage: 'Failed to download cover for widget',
      );
      if (bytes == null) return null;

      final file = File(path);
      await file.parent.create(recursive: true);
      await file.writeAsBytes(bytes);
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
