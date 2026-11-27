import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/app_tips.dart';
import 'package:storii/storage/local/tips_store.dart';

part 'tips_provider.g.dart';

@Riverpod(keepAlive: true)
class TipsNotifier extends _$TipsNotifier {
  TipsStore get _store => ref.read(tipsStoreProvider);

  @override
  AppTips build() => _store.getTips();

  Future<void> setDismissed(AppTip tip) async {
    final next = state.dismiss(tip);
    state = next;
    unawaited(_store.updateTips(next));
  }

  Future<void> reset() async {
    if (state.dismissed.isEmpty) return;
    state = const AppTips();
    await _store.reset();
  }
}
