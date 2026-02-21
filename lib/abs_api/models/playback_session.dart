import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/audio_track.dart';
import 'package:storii/abs_api/models/book_chapter.dart';
import 'package:storii/abs_api/models/device_info.dart';
import 'package:storii/abs_api/models/enums.dart';
import 'package:storii/abs_api/models/json_converters.dart';
import 'package:storii/abs_api/models/library_item.dart';
import 'package:storii/abs_api/models/media_metadata.dart';
import 'package:storii/abs_api/models/session_user.dart';

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
