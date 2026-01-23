import 'package:audio_service/audio_service.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/item.dart';

extension ItemDomainToMediaItem on ItemDomain {
  List<MediaItem> toMediaItems(Uri serverUrl) {
    return switch (this) {
      final Audiobook a => a.tracks.map((track) {
        return MediaItem(
          id: track.contentUrl,
          title: track.title,
          artist: a.authorName,
          duration: a.duration,
          artUri: serverUrl.resolve(ApiRoutes.itemCover(id)),
        );
      }).toList(),
      final Podcast _ => throw UnimplementedError('Podcasts not supported yet'),
    };
  }
}
