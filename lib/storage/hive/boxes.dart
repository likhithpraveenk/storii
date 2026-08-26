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
const userMediaProgressBoxName = 'user_media_progress_box';
const playbackHistoryBoxName = 'playback_history_box';
const downloadsBoxName = 'downloads_box';
const speedsBoxName = 'speeds_box';
const serverSettingsBoxName = 'server_settings_box';
const playbackQueueBoxName = 'playback_queue_box';

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
];

const networkCacheDir = 'dio_cache';
late final HiveCacheStore networkCacheStore;

late final Box<String> appSettingsBox;
late final Box<String> userSettingsBox;
late final Box<UserDomain> usersBox;
late final Box<Server> serversBox;
late final Box<String> itemsBox;
late final Box<String> localSessionsBox;
late final Box<List<dynamic>> playbackHistoryBox;
late final Box<String> downloadsBox;
late final Box<double> speedsBox;
late final Box<String> userMediaProgressBox;
late final Box<String> serverSettingsBox;
late final Box<String> playbackQueueBox;

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ServerAdapter())
    ..registerAdapter(UserDomainAdapter())
    ..registerAdapter(UriAdapter());

  final (
    appSettings,
    userSettings,
    users,
    servers,
    items,
    localSessions,
    playbackHistory,
    downloads,
    speeds,
  ) = await (
    Hive.openBox<String>(appSettingsBoxName),
    Hive.openBox<String>(userSettingsBoxName),
    Hive.openBox<UserDomain>(usersBoxName),
    Hive.openBox<Server>(serversBoxName),
    Hive.openBox<String>(itemsBoxName),
    Hive.openBox<String>(localSessionsBoxName),
    Hive.openBox<List<dynamic>>(playbackHistoryBoxName),
    Hive.openBox<String>(downloadsBoxName),
    Hive.openBox<double>(speedsBoxName),
  ).wait;

  final (userMediaProgress, serverSettings, playbackQueue) = await (
    Hive.openBox<String>(userMediaProgressBoxName),
    Hive.openBox<String>(serverSettingsBoxName),
    Hive.openBox<String>(playbackQueueBoxName),
  ).wait;

  appSettingsBox = appSettings;
  userSettingsBox = userSettings;
  usersBox = users;
  serversBox = servers;
  itemsBox = items;
  localSessionsBox = localSessions;
  playbackHistoryBox = playbackHistory;
  downloadsBox = downloads;
  speedsBox = speeds;
  userMediaProgressBox = userMediaProgress;
  serverSettingsBox = serverSettings;
  playbackQueueBox = playbackQueue;

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
