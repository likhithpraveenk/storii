import 'package:audio_service/audio_service.dart';
import 'package:storii/shared/helpers/audio_mime_helper.dart';

class AppAudioSource {
  const AppAudioSource({
    required this.uri,
    required this.tag,
    required this.type,
    this.headers = const {},
    this.duration,
  });

  final Uri uri;
  final MediaItem tag;
  final AudioMimeType type;
  final Map<String, String> headers;
  final Duration? duration;
}
