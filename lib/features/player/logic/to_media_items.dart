import 'package:audio_service/audio_service.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/item.dart';

extension ItemDomainToMediaItem on ItemDomain {
  List<MediaItem> toMediaItems(Uri serverUrl) {
    return switch (this) {
      final Audiobook a => () {
        var accumulated = Duration.zero;
        return a.tracks.map((track) {
          final item = MediaItem(
            id: track.contentUrl,
            title: a.title ?? '',
            artist: a.authorName,
            duration: a.duration,
            artUri: serverUrl.resolve(ApiRoutes.itemCover(id)),
            extras: {
              'bookId': a.id,
              'trackIndex': a.tracks.indexOf(track),
              'startOffset': accumulated.inMilliseconds,
              'trackDuration': track.duration.inMilliseconds,
            },
          );
          accumulated += track.duration;
          return item;
        }).toList();
      }(),
      final Podcast _ => throw UnimplementedError('Podcasts not supported yet'),
    };
  }
}
