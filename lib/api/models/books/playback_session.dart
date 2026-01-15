import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/audio/audio_track.dart';
import 'package:storii/api/models/books/book_chapter.dart';
import 'package:storii/api/models/library/library_item.dart';
import 'package:storii/api/models/media/media_metadata.dart';
import 'package:storii/api/models/users/device_info.dart';
import 'package:storii/api/models/users/session_user.dart';
import 'package:storii/api/models/utils/enums.dart';
import 'package:storii/api/models/utils/json_converters.dart';

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
  }) = PlaybackSessionBase;

  factory PlaybackSession.fromJson(Map<String, dynamic> json) =>
      _$PlaybackSessionFromJson(json);
}
