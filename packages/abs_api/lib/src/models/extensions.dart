extension PreciseDuration on Duration {
  double get inPreciseSeconds =>
      inMicroseconds / Duration.microsecondsPerSecond;

  static Duration fromPreciseSeconds(double preciseSeconds) {
    final microseconds = preciseSeconds * Duration.microsecondsPerSecond;
    return Duration(microseconds: microseconds.truncate());
  }
}
