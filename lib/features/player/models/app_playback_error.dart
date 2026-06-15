import 'package:storii/app/init.dart';

enum AppPlaybackError {
  network,
  source,
  decoder,
  unknown;

  String get label => switch (this) {
    .network => l10n.playbackErrorNetwork,
    .source => l10n.playbackErrorSource,
    .decoder => l10n.playbackErrorDecoder,
    .unknown => l10n.playbackErrorUnknown,
  };
}
