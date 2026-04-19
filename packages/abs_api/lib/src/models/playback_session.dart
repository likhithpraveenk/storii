import 'package:abs_api/src/models/audio_track.dart';
import 'package:abs_api/src/models/book_chapter.dart';
import 'package:abs_api/src/models/device_info.dart';
import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/library_item.dart';
import 'package:abs_api/src/models/media_metadata.dart';
import 'package:abs_api/src/models/session_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playback_session.freezed.dart';
part 'playback_session.g.dart';

@freezed
abstract class PlaybackSession with _$PlaybackSession {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory PlaybackSession({
    required String id,
    required String userId,
    required String libraryId,
    required String libraryItemId,
    String? episodeId,
    required MediaType mediaType,
    required MediaMetadata mediaMetadata,
    required List<BookChapter> chapters,
    required String displayTitle,
    required String displayAuthor,
    String? coverPath,
    required Duration duration,
    required PlayMethod playMethod,
    required String mediaPlayer,
    DeviceInfo? deviceInfo,
    required String date,
    required String dayOfWeek,
    required Duration timeListening,
    required Duration startTime,
    required Duration currentTime,
    required DateTime startedAt,
    required DateTime updatedAt,
    SessionUser? user,
    List<AudioTrack>? audioTracks,
    LibraryItem? libraryItem,
  }) = _PlaybackSession;

  factory PlaybackSession.fromJson(Map<String, dynamic> json) =>
      _$PlaybackSessionFromJson(json);
}
