import 'package:audio_service/audio_service.dart';
import 'package:storii/app/config/constants.dart';

final skipToNextMediaControl = MediaControl(
  androidIcon: 'drawable/skip_to_next',
  label: MediaControl.skipToNext.label,
  action: .skipToNext,
);
final skipToPreviousMediaControl = MediaControl(
  androidIcon: 'drawable/skip_to_previous',
  label: MediaControl.skipToPrevious.label,
  action: .skipToPrevious,
);
final fastForwardMediaControl = MediaControl(
  androidIcon: 'drawable/fast_forward',
  label: MediaControl.fastForward.label,
  action: .fastForward,
);
final rewindMediaControl = MediaControl(
  androidIcon: 'drawable/rewind',
  label: MediaControl.rewind.label,
  action: .rewind,
);
MediaControl speedMediaControl(double speed) => MediaControl.custom(
  androidIcon: _iconForSpeed(speed),
  label: '$speed$kMultiple',
  name: 'cycleSpeed',
);
String _iconForSpeed(double speed) {
  if (speed <= 1.1) return 'drawable/speed_1_0x';
  if (speed <= 1.35) return 'drawable/speed_1_2x';
  if (speed <= 1.65) return 'drawable/speed_1_5x';
  if (speed <= 1.9) return 'drawable/speed_1_8x';
  return 'drawable/speed_2_0x';
}

final stopMediaControl = MediaControl(
  androidIcon: 'drawable/stop',
  label: MediaControl.stop.label,
  action: .stop,
);
