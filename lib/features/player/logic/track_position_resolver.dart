import 'package:audio_service/audio_service.dart';

class TrackPositionResolver {
  final List<Duration> _offsets;

  const TrackPositionResolver(this._offsets);

  static TrackPositionResolver from(List<MediaItem> items) {
    return TrackPositionResolver(
      List<Duration>.unmodifiable(
        items.map(
          (item) => Duration(microseconds: item.extras!['startOffset'] as int),
        ),
      ),
    );
  }

  static const empty = TrackPositionResolver([]);

  Duration globalPosition(int? index, Duration localPosition) {
    if (index == null || index >= _offsets.length) return Duration.zero;
    return _offsets[index] + localPosition;
  }

  int trackIndexFor(Duration target) {
    var low = 0;
    var high = _offsets.length - 1;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      if (_offsets[mid] <= target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return high;
  }

  Duration localSeconds(int trackIndex, Duration targetSeconds) =>
      targetSeconds - _offsets[trackIndex];
}
