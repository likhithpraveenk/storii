import 'package:audio_service/audio_service.dart';
import 'package:storii/shared/helpers/extensions.dart';

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
  label: speed.speedLabel,
  name: 'cycleSpeed',
);

String _iconForSpeed(double speed) {
  if (speed < 1.125) return 'drawable/speed_1x';
  if (speed < 1.375) return 'drawable/speed_1_25x';
  if (speed < 1.625) return 'drawable/speed_1_5x';
  if (speed < 1.875) return 'drawable/speed_1_75x';
  return 'drawable/speed_2x';
}

final stopMediaControl = MediaControl(
  androidIcon: 'drawable/stop',
  label: MediaControl.stop.label,
  action: .stop,
);
