import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/widget_config.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/tips_provider.dart';
import 'package:storii/features/downloads/logic/cover_helper.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/widget/logic/widget_bridge.dart';
import 'package:storii/features/widget/ui/widget_binding_tip.dart';

part 'widget_controller.g.dart';

const _widgetPrefix = 'widget_';
final _coverFilePattern = RegExp(r'widget_(.+)_cover\.jpg');

Future<WidgetConfig?> _decodeWidgetConfig(
  WidgetBridge bridge,
  int id,
  String? json,
) async {
  if (json == null) return null;
  try {
    return WidgetConfig.fromJson(jsonDecode(json));
  } catch (e, st) {
    LogService.log(
      'Corrupt widget config for widget $id: json string: $json\nremoving',
      originalError: e,
      stackTrace: st,
      source: 'WidgetController',
    );
    await bridge.saveData('$_widgetPrefix$id', null);
    return null;
  }
}

@riverpod
Future<Map<int, WidgetConfig?>> availableWidgetConfigs(Ref ref) async {
  final map = <int, WidgetConfig?>{};
  final bridge = ref.read(widgetBridgeProvider);
  for (final id in await bridge.installedWidgetIds()) {
    final json = await bridge.readData('$_widgetPrefix$id');
    map[id] = await _decodeWidgetConfig(bridge, id, json);
  }
  return map;
}

@Riverpod(keepAlive: true)
class WidgetController extends _$WidgetController {
  int? _widgetId;
  bool _syncing = false;

  @override
  void build() {
    ref.listen(sessionProvider, (_, _) => _syncWidgets());
    ref.listen(isPlayingProvider, (_, _) => _syncWidgets());
    ref.listen(audioPlayerProvider, (_, _) => _syncWidgets());

    Future.microtask(_startupSync);
  }

  bool get isActive => _widgetId != null;

  Future<void> prepareWidgetForBinding(int id) async {
    _widgetId = id;
    await _saveUnboundWidget(id);
    final dismissed = ref.read(tipsProvider).isDismissed(.widgetBinding);
    if (!dismissed) {
      final context = shellScaffoldKey.currentContext;
      if (context != null && context.mounted) {
        await showWidgetBindingTipDialog(
          context,
          onSetDismissed: ref.read(tipsProvider.notifier).setDismissed,
        );
      }
    }
  }

  Future<void> _saveUnboundWidget(int id) async {
    try {
      await ref.read(widgetBridgeProvider).saveData('$_widgetPrefix$id', null);
      await _updateWidgetsUI();
    } catch (e, st) {
      LogService.log(
        'Failed to save widget config',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
    }
  }

  Future<bool> bindActiveWidget({
    required String itemId,
    String? episodeId,
  }) async {
    try {
      if (!isActive) return false;
      final coverPath = await _coverPathForWidget(itemId, episodeId != null);
      final progress = await _fetchProgress(itemId, episodeId);

      final config = WidgetConfig(
        widgetId: _widgetId!,
        itemId: itemId,
        episodeId: episodeId,
        coverPath: coverPath,
        updatedAt: DateTime.now(),
        progress: progress,
      );

      await _saveAndUpdateWidget(config);
      _widgetId = null;
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

  Future<List<WidgetConfig>> _installedConfigs() async {
    final bridge = ref.read(widgetBridgeProvider);
    final configs = <WidgetConfig>[];
    for (final id in await bridge.installedWidgetIds()) {
      final json = await bridge.readData('$_widgetPrefix$id');
      final config = await _decodeWidgetConfig(bridge, id, json);
      if (config != null) configs.add(config);
    }
    return configs;
  }

  Future<void> _startupSync() async {
    try {
      final configs = await _installedConfigs();
      for (final config in configs) {
        await _refreshWidget(config);
      }
      await _deleteOrphanedCovers(configs);
    } catch (e, st) {
      LogService.log(
        'Failed to initialize widgets',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
    }
  }

  Future<void> _deleteOrphanedCovers(List<WidgetConfig> configs) async {
    final referenced = configs.map((c) => c.itemId).toSet();
    final docsDir = await getApplicationDocumentsDirectory();
    final coversDir = Directory(p.join(docsDir.path, 'widget_covers'));
    if (!await coversDir.exists()) return;

    await for (final entity in coversDir.list()) {
      final itemId = _coverFilePattern
          .firstMatch(p.basename(entity.path))
          ?.group(1);
      if (itemId != null && referenced.contains(itemId)) continue;
      await entity.delete();
    }
  }

  Future<void> _saveAndUpdateWidget(WidgetConfig config) async {
    try {
      await ref
          .read(widgetBridgeProvider)
          .saveData('$_widgetPrefix${config.widgetId}', jsonEncode(config));
      await _updateWidgetsUI();
    } catch (e, st) {
      LogService.log(
        'Failed to save widget config',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
    }
  }

  Future<void> _refreshWidget(WidgetConfig config) async {
    if (config.itemId.isEmpty) return;
    final coverPath = await _coverPathForWidget(
      config.itemId,
      config.episodeId != null,
    );
    final progress = await _fetchProgress(config.itemId, config.episodeId);
    final updatedConfig = config.copyWith(
      coverPath: coverPath ?? config.coverPath,
      updatedAt: DateTime.now(),
      progress: progress ?? config.progress,
    );

    await _saveAndUpdateWidget(updatedConfig);
  }

  Future<void> bindWidgetToNowPlaying(int widgetId) async {
    final session = ref.read(sessionProvider);
    final itemId = session?.libraryItemId;
    var config = WidgetConfig(
      widgetId: widgetId,
      itemId: itemId ?? '', //* initial no session handling
      episodeId: session?.episodeId,
      updatedAt: DateTime.now(),
      source: .nowPlaying,
    );

    if (itemId != null) {
      final coverPath = await _coverPathForWidget(
        config.itemId,
        config.episodeId != null,
      );
      config = config.copyWith(coverPath: coverPath);
    }

    await _saveAndUpdateWidget(config);
  }

  Future<WidgetConfig> _resolveNowPlayingConfig(WidgetConfig config) async {
    if (config.source != .nowPlaying) return config;

    final session = ref.read(sessionProvider);
    if (session != null) {
      final newConfig = config.copyWith(
        itemId: session.libraryItemId,
        episodeId: session.episodeId,
      );
      if (newConfig.itemId != config.itemId) {
        final coverPath = await _coverPathForWidget(
          newConfig.itemId,
          newConfig.episodeId != null,
        );
        return newConfig.copyWith(
          coverPath: coverPath ?? newConfig.coverPath,
          updatedAt: DateTime.now(),
        );
      }
    }
    return config;
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

  Future<void> _syncWidgets() async {
    if (_syncing) return;
    _syncing = true;
    try {
      await _syncOnce();
    } catch (e, st) {
      LogService.log(
        'Failed to sync widget configs',
        originalError: e,
        stackTrace: st,
        source: 'WidgetController',
      );
    } finally {
      _syncing = false;
    }
  }

  Future<void> _syncOnce() async {
    var changed = false;
    final configs = await _installedConfigs();
    for (final originalConfig in configs) {
      var config = originalConfig;
      if (config.source == .nowPlaying) {
        config = await _resolveNowPlayingConfig(config);
      }

      if (config.itemId.isEmpty) continue;

      final progress = await _fetchProgress(config.itemId, config.episodeId);
      final state = _playbackStateFor(config);
      final updated = config.copyWith(progress: progress, state: state);

      final encoded = jsonEncode(updated);
      final key = '$_widgetPrefix${updated.widgetId}';
      final stored = await ref.read(widgetBridgeProvider).readData(key);
      if (stored == encoded) continue;
      await ref.read(widgetBridgeProvider).saveData(key, encoded);
      changed = true;
    }
    if (changed) await _updateWidgetsUI();
  }

  WidgetPlaybackState _playbackStateFor(WidgetConfig config) {
    final isLoading = ref.read(
      audioPlayerProvider.select(
        (s) =>
            s.loadingItemId == config.itemId &&
            s.loadingEpisodeId == config.episodeId,
      ),
    );
    if (isLoading) return .loading;

    final isCurrent = ref.read(
      sessionProvider.select(
        (s) =>
            s?.libraryItemId == config.itemId &&
            s?.episodeId == config.episodeId,
      ),
    );
    if (!isCurrent) return .none;

    return ref.read(isPlayingProvider) ? .playing : .paused;
  }

  Future<void> _updateWidgetsUI() =>
      ref.read(widgetBridgeProvider).updateWidgetsUI();

  Future<String?> _coverPathForWidget(
    String libraryItemId,
    bool isPodcast,
  ) async {
    if (libraryItemId.isEmpty) return null;

    final coverPath = await ref
        .read(coverHelperProvider)
        .coverPathIfExists(libraryItemId, isPodcast: isPodcast);
    if (coverPath != null) return coverPath;

    final docsDir = await getApplicationDocumentsDirectory();
    final path = p.join(
      docsDir.path,
      'widget_covers',
      'widget_${libraryItemId}_cover.jpg',
    );

    if (await File(path).exists()) return path;

    try {
      final cancelToken = CancelToken();
      final user = await ref.read(authenticatedUserProvider.future);
      final repo = ref.read(itemRepositoryProvider(user));
      final bytes = await repo.getCover(
        libraryItemId,
        cancelToken: cancelToken,
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
