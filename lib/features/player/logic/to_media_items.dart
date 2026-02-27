import 'package:audio_service/audio_service.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/shared/helpers/extensions.dart';

extension ItemDomainToMediaItem on LibraryItem {
  List<MediaItem> toMediaItems(Uri serverUrl) {
    return switch (mediaType) {
      .book => () {
        double accumulated = 0.0;
        return tracks.map((track) {
          final item = MediaItem(
            id: track.contentUrl,
            title: title ?? '',
            artist: authorName,
            duration: track.duration,
            artUri: serverUrl.resolve(ApiRoutes.itemCover(id)),
            extras: {
              'itemId': id,
              'trackIndex': tracks.indexOf(track),
              'startOffset': accumulated,
              'totalDuration': duration.inSecondsPrecise,
            },
          );
          accumulated += track.duration.inSecondsPrecise;
          return item;
        }).toList();
      }(),
      .podcast => throw UnimplementedError('Podcasts not supported yet'),
    };
  }
}
