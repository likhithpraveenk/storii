import 'dart:convert';
import 'dart:developer';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/app_tips.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'tips_store.g.dart';

const _tipsKey = 'app_tips_key';

class TipsStore {
  const new();

  Box<String> get _box => Hive.box(appSettingsBoxName);

  AppTips getTips() {
    final json = _box.get(_tipsKey);
    if (json == null) return const AppTips();
    try {
      return AppTips.fromJson(jsonDecode(json));
    } catch (e, st) {
      log('$e', stackTrace: st, level: 1000, name: 'TipsStore');
      return const AppTips();
    }
  }

  Future<void> updateTips(AppTips tips) async {
    await _box.put(_tipsKey, jsonEncode(tips));
  }

  Future<void> reset() => _box.delete(_tipsKey);
}

@riverpod
TipsStore tipsStore(Ref ref) => const TipsStore();
