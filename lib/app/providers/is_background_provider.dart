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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state == .paused || state == .hidden;
  }
}
