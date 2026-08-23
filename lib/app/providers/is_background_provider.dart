import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_background_provider.g.dart';

@riverpod
class IsBackground extends _$IsBackground with WidgetsBindingObserver {
  @override
  bool build() {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(this));
    return false;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    state = appState == .paused || appState == .hidden;
  }
}
