import 'package:audio_service/audio_service.dart';
import 'package:storii/abs_api/abs_api.dart';

extension ItemDomainToMediaItem on LibraryItem {
  List<MediaItem> toMediaItems(Uri serverUrl) {
    return switch (mediaType) {
      .book => () {
        var accumulated = Duration.zero;
        return tracks.map((track) {
          final item = MediaItem(
            id: track.contentUrl,
            title: title ?? '',
            artist: authorName,
            duration: duration,
            artUri: serverUrl.resolve(ApiRoutes.itemCover(id)),
            extras: {
              'bookId': id,
              'trackIndex': tracks.indexOf(track),
              'startOffset': accumulated.inMilliseconds,
              'trackDuration': track.duration.inMilliseconds,
            },
          );
          accumulated += track.duration;
          return item;
        }).toList();
      }(),
      .podcast => throw UnimplementedError('Podcasts not supported yet'),
    };
  }
}
