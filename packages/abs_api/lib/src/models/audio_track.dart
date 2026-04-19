import 'package:abs_api/src/models/audio_meta_tags.dart';
import 'package:abs_api/src/models/book_chapter.dart';
import 'package:abs_api/src/models/file_metadata.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_track.freezed.dart';
part 'audio_track.g.dart';

@freezed
sealed class AudioTrack with _$AudioTrack {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory AudioTrack({
    required int index,
    required Duration startOffset,
    required String title,
    required String contentUrl,
    required String mimeType,
    required FileMetadata metadata,
    required String ino,
    required DateTime addedAt,
    required DateTime updatedAt,
    int? trackNumFromMeta,
    int? discNumFromMeta,
    int? trackNumFromFilename,
    int? discNumFromFilename,
    required bool manuallyVerified,
    required bool exclude,
    String? error,
    String? format,
    required Duration duration,
    required int bitRate,
    String? language,
    required String codec,
    required String timeBase,
    required int channels,
    required String channelLayout,
    required List<BookChapter> chapters,
    String? embeddedCoverArt,
    required AudioMetaTags metaTags,
  }) = _AudioTrack;

  factory AudioTrack.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackFromJson(json);
}
