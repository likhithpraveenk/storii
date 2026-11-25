import 'dart:async';
import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/boxes.dart';

class HiveBoxStats {
  const new({required this.entries, required this.bytes});

  final int entries;
  final int bytes;

  static const empty = HiveBoxStats(entries: 0, bytes: 0);

  @override
  String toString() => 'HiveBoxStats(entries: $entries, bytes: $bytes)';
}

class HiveStorageService {
  const new();

  static const _criticalBoxes = {
    usersBoxName,
    serversBoxName,
    appSettingsBoxName,
    userSettingsBoxName,
    downloadsBoxName,
    downloadedItemsBoxName,
  };

  BoxBase? _box(String name) {
    if (!Hive.isBoxOpen(name)) return null;
    return _getters[name]?.call();
  }

  static final Map<String, BoxBase? Function()> _getters = {
    appSettingsBoxName: () => Hive.box<String>(appSettingsBoxName),
    userSettingsBoxName: () => Hive.box<String>(userSettingsBoxName),
    usersBoxName: () => Hive.box<UserDomain>(usersBoxName),
    serversBoxName: () => Hive.box<Server>(serversBoxName),
    localSessionsBoxName: () => Hive.box<String>(localSessionsBoxName),
    userMediaProgressBoxName: () =>
        Hive.lazyBox<String>(userMediaProgressBoxName),
    playbackHistoryBoxName: () =>
        Hive.lazyBox<List<dynamic>>(playbackHistoryBoxName),
    downloadsBoxName: () => Hive.lazyBox<String>(downloadsBoxName),
    downloadedItemsBoxName: () => Hive.lazyBox<String>(downloadedItemsBoxName),
    speedsBoxName: () => Hive.box<double>(speedsBoxName),
    serverSettingsBoxName: () => Hive.box<String>(serverSettingsBoxName),
    playbackQueueBoxName: () => Hive.box<String>(playbackQueueBoxName),
    logsBoxName: () => Hive.lazyBox<String>(logsBoxName),
    autoDeleteExclusionBoxName: () =>
        Hive.box<bool>(autoDeleteExclusionBoxName),
    equalizerBoxName: () => Hive.box<String>(equalizerBoxName),
  };

  HiveBoxStats stats(String name) {
    final box = _box(name);
    final entries = box?.length ?? 0;

    var bytes = 0;
    for (final file in _files(name)) {
      bytes += file.lengthSync();
    }

    return HiveBoxStats(entries: entries, bytes: bytes);
  }

  Future<int> compact(String name) async {
    final box = _box(name);
    if (box == null || !box.isOpen) return stats(name).bytes;
    await box.compact();
    await Future.microtask(() {});
    return stats(name).bytes;
  }

  Future<int> clear(String name) async {
    if (_criticalBoxes.contains(name)) {
      throw StateError('Cannot clear critical box: $name');
    }
    final box = _box(name);
    if (box == null || !box.isOpen) return stats(name).bytes;
    await box.clear();
    await Future.microtask(() {});
    return stats(name).bytes;
  }

  List<File> _files(String name) {
    final box = _box(name);
    final path = box?.path;
    if (path == null) return const [];

    final file = File(path);
    final lock = File('$path.lock');
    return [if (file.existsSync()) file, if (lock.existsSync()) lock];
  }
}
