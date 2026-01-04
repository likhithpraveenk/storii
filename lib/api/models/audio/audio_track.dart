import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/files/file_metadata.dart';
import 'package:storii/api/models/utils/json_converters.dart';

part 'audio_track.freezed.dart';
part 'audio_track.g.dart';

@freezed
sealed class AudioTrack with _$AudioTrack {
  @DurationPreciseSecondsConverter()
  const factory AudioTrack({
    required int index,
    required Duration startOffset,
    required Duration duration,
    required String title,
    required String contentUrl,
    required String mimeType,
    FileMetadata? metadata,
  }) = _AudioTrack;

  factory AudioTrack.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackFromJson(json);
}
