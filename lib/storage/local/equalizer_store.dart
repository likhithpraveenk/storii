import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/equalizer/models/equalizer.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'equalizer_store.g.dart';

EqualizerPreset? _decode(String? value) {
  if (value == null) return null;
  try {
    return EqualizerPreset.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode equalizer preset: $value',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'EqualizerStore',
    );
    return null;
  }
}

class EqualizerStore {
  const new();

  Box<String> get _box => Hive.box(equalizerBoxName);

  List<EqualizerPreset> getAll() {
    return _box.values.map(_decode).nonNulls.toList();
  }

  Stream<List<EqualizerPreset>> watch() {
    return _box.watch().map((_) => getAll()).startWith(getAll());
  }

  Future<void> save(String presetId, EqualizerPreset preset) async {
    await _box.put(presetId, jsonEncode(preset));
  }

  Future<void> delete(String presetId) async {
    await _box.delete(presetId);
  }
}

@riverpod
EqualizerStore equalizerStore(Ref ref) => const EqualizerStore();

@riverpod
Stream<List<EqualizerPreset>> storedEqualizerPresets(Ref ref) =>
    ref.watch(equalizerStoreProvider).watch();
