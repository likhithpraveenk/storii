import 'dart:async';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/hive_adapters.dart';
import 'package:storii/storage/hive/hive_registrar.g.dart';

const appSettingsBox = 'app_settings_box';
const userSettingsBox = 'user_settings_box';
const usersBox = 'users_box';
const serversBox = 'servers_box';
// const itemsBox = 'items_box';
const localSessionsBox = 'local_sessions_box';
const localPositionBox = 'local_position_box';
const playbackHistoryBox = 'playback_history_box';
const downloadsBox = 'downloads_box';

const networkCacheDir = 'dio_cache';
late final HiveCacheStore networkCacheStore;

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  Hive.registerAdapter(UriAdapter());
  await Future.wait([
    Hive.openBox<String>(appSettingsBox),
    Hive.openBox<String>(userSettingsBox),
    Hive.openBox<UserDomain>(usersBox),
    Hive.openBox<Server>(serversBox),
    Hive.openBox<String>(localSessionsBox),
    Hive.openBox<Duration>(localPositionBox),
    Hive.openBox<List<dynamic>>(playbackHistoryBox),
    Hive.openBox<String>(downloadsBox),
  ]);

  // dio cache
  final dir = await getApplicationDocumentsDirectory();
  networkCacheStore = HiveCacheStore(p.join(dir.path, networkCacheDir));
}
