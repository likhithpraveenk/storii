import 'dart:io';

import 'package:abs_api/abs_api.dart';

enum AudioMimeType {
  // Progressive formats
  mp3,
  aac,
  mp4Audio,
  m4a,
  flac,
  wav,
  ogg,
  opus,
  aiff,
  wma,

  // Adaptive streaming
  hls,
  dash,

  unknown;

  bool get isAdaptiveStream => this == hls || this == dash;
  bool get isProgressive => !isAdaptiveStream && this != unknown;
}

enum PlaybackCapability { directPlay, adaptiveStream, unsupported }

class AudioMimeHelper {
  const AudioMimeHelper._();

  static AudioMimeType fromMimeString(String? mime) {
    if (mime == null || mime.isEmpty) return .unknown;

    final m = mime.toLowerCase().trim();

    if (m.contains('mpegurl') ||
        m.contains('x-mpegurl') ||
        m.endsWith('.m3u8')) {
      return .hls;
    }
    if (m.contains('dash+xml') || m.endsWith('.mpd')) {
      return .dash;
    }

    if (m == 'audio/mpeg' || m == 'audio/mp3') return .mp3;
    if (m == 'audio/aac') return .aac;
    if (m == 'audio/mp4') return .mp4Audio;
    if (m == 'audio/x-m4a' || m == 'audio/m4a') return .m4a;
    if (m == 'audio/flac' || m == 'audio/x-flac') return .flac;
    if (m == 'audio/wav' || m == 'audio/x-wav') return .wav;
    if (m == 'audio/ogg') return .ogg;
    if (m == 'audio/opus') return .opus;
    if (m == 'audio/aiff' || m == 'audio/x-aiff') return .aiff;
    if (m == 'audio/x-ms-wma' || m == 'audio/wma') return .wma;

    return .unknown;
  }

  static AudioMimeType fromUrl(String url) {
    final path = Uri.parse(url).path.toLowerCase();
    if (path.endsWith('.m3u8')) return .hls;
    if (path.endsWith('.mpd')) return .dash;
    if (path.endsWith('.mp3')) return .mp3;
    if (path.endsWith('.aac')) return .aac;
    if (path.endsWith('.mp4')) return .mp4Audio;
    if (path.endsWith('.m4a')) return .m4a;
    if (path.endsWith('.flac')) return .flac;
    if (path.endsWith('.wav')) return .wav;
    if (path.endsWith('.ogg')) return .ogg;
    if (path.endsWith('.opus')) return .opus;
    if (path.endsWith('.aiff') || path.endsWith('.aif')) return .aiff;
    if (path.endsWith('.wma')) return .wma;
    return .unknown;
  }

  static AudioMimeType resolve(String? mime, String url) {
    final fromMime = fromMimeString(mime);
    if (fromMime != .unknown) return fromMime;
    return fromUrl(url);
  }

  static const _androidSupported = <AudioMimeType>{
    .mp3,
    .aac,
    .mp4Audio,
    .m4a,
    .flac,
    .wav,
    .ogg,
    .opus,
    .hls,
    .dash,
  };

  static const _iosSupported = <AudioMimeType>{
    .mp3,
    .aac,
    .mp4Audio,
    .m4a,
    .flac,
    .wav,
    .aiff,
    .hls,
  };

  static bool canPlatformPlay(AudioMimeType type) {
    if (Platform.isAndroid) return _androidSupported.contains(type);
    if (Platform.isIOS) return _iosSupported.contains(type);
    return false;
  }

  static PlaybackCapability getPlaybackCapability({
    required AudioMimeType mimeType,
    required PlayMethod playMethod,
  }) {
    if (mimeType.isAdaptiveStream && canPlatformPlay(mimeType)) {
      return .adaptiveStream;
    }

    if ((playMethod == .directPlay || playMethod == .directStream) &&
        canPlatformPlay(mimeType)) {
      return .directPlay;
    }

    return .unsupported;
  }

  static List<String> get platformSupportedMimeTypes {
    if (Platform.isAndroid) {
      return [
        'audio/mpeg',
        'audio/aac',
        'audio/mp4',
        'audio/flac',
        'audio/x-flac',
        'audio/ogg',
        'audio/opus',
        'audio/wav',
        'audio/x-wav',
        'application/x-mpegURL',
        'application/dash+xml',
      ];
    }
    if (Platform.isIOS) {
      return [
        'audio/mpeg',
        'audio/aac',
        'audio/mp4',
        'audio/x-m4a',
        'audio/flac',
        'audio/x-flac',
        'audio/wav',
        'audio/x-wav',
        'audio/aiff',
        'application/x-mpegURL',
      ];
    }
    return [];
  }
}
