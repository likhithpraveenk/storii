import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_track.freezed.dart';
part 'audio_track.g.dart';

@freezed
sealed class AudioTrackDomain with _$AudioTrackDomain {
  const factory AudioTrackDomain({
    required int index,
    required Duration startOffset,
    required Duration duration,
    required String title,
    required String contentUrl,
    required String mimeType,
  }) = _AudioTrackDomain;

  factory AudioTrackDomain.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackDomainFromJson(json);
}
