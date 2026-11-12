import 'dart:async';
import 'dart:io';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/hive_adapters.dart';

const appSettingsBoxName = 'app_settings_box';
const userSettingsBoxName = 'user_settings_box';
const usersBoxName = 'users_box';
const serversBoxName = 'servers_box';
const itemsBoxName = 'items_box';
const localSessionsBoxName = 'local_sessions_box';
const userMediaProgressBoxName = 'user_media_progress_box_v2';
const playbackHistoryBoxName = 'playback_history_box';
const downloadsBoxName = 'downloads_box';
const speedsBoxName = 'speeds_box';
const serverSettingsBoxName = 'server_settings_box';
const playbackQueueBoxName = 'playback_queue_box_1';
const logsBoxName = 'logs_box_1';
const autoDeleteExclusionBoxName = 'auto_delete_exclusion_box';

//* any new hive box should be added to this list
final _knownNames = [
  appSettingsBoxName,
  userSettingsBoxName,
  usersBoxName,
  serversBoxName,
  itemsBoxName,
  localSessionsBoxName,
  userMediaProgressBoxName,
  playbackHistoryBoxName,
  downloadsBoxName,
  speedsBoxName,
  serverSettingsBoxName,
  playbackQueueBoxName,
  logsBoxName,
  autoDeleteExclusionBoxName,
];

const networkCacheDir = 'dio_cache';
late final HiveCacheStore networkCacheStore;

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ServerAdapter())
    ..registerAdapter(UserDomainAdapter())
    ..registerAdapter(UriAdapter());

  await Hive.openBox<String>(appSettingsBoxName);
  await Hive.openBox<String>(userSettingsBoxName);
  await Hive.openBox<UserDomain>(usersBoxName);
  await Hive.openBox<Server>(serversBoxName);
  await Hive.openLazyBox<String>(itemsBoxName);
  await Hive.openBox<String>(localSessionsBoxName);
  await Hive.openLazyBox<List<dynamic>>(playbackHistoryBoxName);
  await Hive.openBox<String>(downloadsBoxName);
  await Hive.openBox<double>(speedsBoxName);
  await Hive.openBox<String>(userMediaProgressBoxName);
  await Hive.openBox<String>(serverSettingsBoxName);
  await Hive.openBox<String>(playbackQueueBoxName);
  await Hive.openLazyBox<String>(logsBoxName);
  await Hive.openBox<bool>(autoDeleteExclusionBoxName);

  // dio cache
  final dir = await getApplicationDocumentsDirectory();
  networkCacheStore = HiveCacheStore(p.join(dir.path, networkCacheDir));

  unawaited(_cleanupOldBoxes());
}

Future<void> _cleanupOldBoxes() async {
  final dir = await getApplicationDocumentsDirectory();
  if (!await dir.exists()) return;

  await for (final entity in dir.list()) {
    if (entity is! File || !entity.path.endsWith('.hive')) continue;
    final boxName = p.basenameWithoutExtension(entity.path);
    if (!_knownNames.contains(boxName)) {
      try {
        await Hive.deleteBoxFromDisk(boxName);
      } catch (_) {}
    }
  }
}
