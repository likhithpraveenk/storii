class ListenTimeAccumulator {
  final DateTime Function() _now;
  DateTime? _playStartedAt;
  Duration _unsynced = Duration.zero;

  bool get isRunning => _playStartedAt != null;

  new([DateTime Function()? now]) : _now = now ?? DateTime.now;

  void start() {
    _playStartedAt ??= _now();
  }

  void resume() {
    if (_playStartedAt != null) {
      _unsynced += _now().difference(_playStartedAt!);
    }
    _playStartedAt = _now();
  }

  void pause() {
    if (_playStartedAt == null) return;
    _unsynced += _now().difference(_playStartedAt!);
    _playStartedAt = null;
  }

  Duration snapshotAndReset({required bool keepRunning}) {
    final now = _now();
    final live = _playStartedAt != null
        ? now.difference(_playStartedAt!)
        : Duration.zero;

    final total = _unsynced + live;
    _unsynced = Duration.zero;
    _playStartedAt = keepRunning ? now : null;
    return total;
  }

  void reset() {
    _playStartedAt = null;
    _unsynced = Duration.zero;
  }

  void rollback(Duration unsynced) => _unsynced += unsynced;
}
