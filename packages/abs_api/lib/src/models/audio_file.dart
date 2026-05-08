import 'package:abs_api/src/models/audio_meta_tags.dart';
import 'package:abs_api/src/models/book_chapter.dart';
import 'package:abs_api/src/models/file_metadata.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_file.freezed.dart';
part 'audio_file.g.dart';

@freezed
sealed class AudioFile with _$AudioFile {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory AudioFile({
    required int index,
    required String ino,
    required FileMetadata metadata,
    DateTime? addedAt,
    DateTime? updatedAt,
    int? trackNumFromMeta,
    int? discNumFromMeta,
    int? trackNumFromFilename,
    int? discNumFromFilename,
    bool? manuallyVerified,
    bool? exclude,
    String? error,
    String? format,
    Duration? duration,
    int? bitRate,
    String? language,
    String? codec,
    String? timeBase,
    int? channels,
    String? channelLayout,
    @Default([]) List<BookChapter> chapters,
    String? embeddedCoverArt,
    AudioMetaTags? metaTags,
    String? mimeType,
  }) = _AudioFile;

  factory AudioFile.fromJson(Map<String, dynamic> json) =>
      _$AudioFileFromJson(json);
}
