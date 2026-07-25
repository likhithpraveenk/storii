import 'package:audio_service/audio_service.dart';

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
