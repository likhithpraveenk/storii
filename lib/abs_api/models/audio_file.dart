import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/audio_meta_tags.dart';
import 'package:storii/abs_api/models/book_chapter.dart';
import 'package:storii/abs_api/models/file_metadata.dart';
import 'package:storii/abs_api/models/json_converters.dart';

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
    required String mimeType,
  }) = _AudioFile;

  factory AudioFile.fromJson(Map<String, dynamic> json) =>
      _$AudioFileFromJson(json);
}
