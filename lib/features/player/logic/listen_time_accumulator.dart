class ListenTimeAccumulator {
  DateTime? _playStartedAt;
  Duration _unsynced = Duration.zero;

  void start() {
    _playStartedAt ??= DateTime.now();
  }

  void pause() {
    if (_playStartedAt == null) return;
    _unsynced += DateTime.now().difference(_playStartedAt!);
    _playStartedAt = null;
  }

  Duration snapshotAndReset({required bool keepRunning}) {
    final now = DateTime.now();
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

  void rollback(Duration unsynced) => _unsynced = unsynced;
}
