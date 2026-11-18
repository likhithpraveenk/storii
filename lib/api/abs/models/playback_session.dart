import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/audio_track.dart';
import 'package:storii/api/abs/models/book_chapter.dart';
import 'package:storii/api/abs/models/device_info.dart';
import 'package:storii/api/abs/models/enums.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/library_item.dart';
import 'package:storii/api/abs/models/media_metadata.dart';
import 'package:storii/api/abs/models/session_user.dart';

part 'playback_session.freezed.dart';
part 'playback_session.g.dart';

@freezed
abstract class PlaybackSession with _$PlaybackSession {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory({
    required String id,
    required String userId,
    required String libraryId,
    required String libraryItemId,
    String? episodeId,
    required MediaType mediaType,
    MediaMetadata? mediaMetadata,
    @Default([]) List<BookChapter> chapters,
    String? displayTitle,
    String? displayAuthor,
    String? coverPath,
    required Duration duration,
    PlayMethod? playMethod,
    String? mediaPlayer,
    DeviceInfo? deviceInfo,
    String? date,
    String? dayOfWeek,
    Duration? timeListening,
    Duration? startTime,
    Duration? currentTime,
    required DateTime startedAt,
    required DateTime updatedAt,
    SessionUser? user,
    List<AudioTrack>? audioTracks,
    LibraryItem? libraryItem,
  }) = _PlaybackSession;

  factory fromJson(Map<String, dynamic> json) =>
      _$PlaybackSessionFromJson(json);
}
