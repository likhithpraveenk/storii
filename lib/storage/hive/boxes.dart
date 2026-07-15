import 'dart:async';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/hive_adapters.dart';
import 'package:storii/storage/hive/hive_registrar.g.dart';

const appSettingsBoxName = 'app_settings_box';
const userSettingsBoxName = 'user_settings_box';
const usersBoxName = 'users_box';
const serversBoxName = 'servers_box';
const itemsBoxName = 'items_box';
const localSessionsBoxName = 'local_sessions_box';
const playbackHistoryBoxName = 'playback_history_box';
const downloadsBoxName = 'downloads_box';
const speedsBoxName = 'speeds_box';

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

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  Hive.registerAdapter(UriAdapter());

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

  appSettingsBox = appSettings;
  userSettingsBox = userSettings;
  usersBox = users;
  serversBox = servers;
  itemsBox = items;
  localSessionsBox = localSessions;
  playbackHistoryBox = playbackHistory;
  downloadsBox = downloads;
  speedsBox = speeds;

  // dio cache
  final dir = await getApplicationDocumentsDirectory();
  networkCacheStore = HiveCacheStore(p.join(dir.path, networkCacheDir));
}
