import 'package:flutter/widgets.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/playable_item.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/l10n/l10n.dart';

extension UserToDomain on User {
  UserDomain toDomain(Uri url) {
    return UserDomain(
      id: id,
      username: username,
      userType: type.name,
      serverUrl: url,
    );
  }
}

extension MediaTypeX on MediaType {
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return switch (this) {
      .book => l10n.audiobooks,
      .podcast => l10n.podcasts,
    };
  }
}

extension PlaybackSessionX on PlaybackSession {
  PlayableItem toDomain(Uri serverUrl) {
    return switch (mediaType) {
      .book => AudiobookItem(
        libraryId: libraryId,
        id: libraryItemId,
        sessionId: id,
        cover: serverUrl.resolve(ApiRoutes.itemCover(libraryItemId)),
        tracks: audioTracks ?? [],
        chapters: chapters,
        duration: duration,
      ),
      .podcast => () {
        assert(episodeId != null, 'episodeId is cannot be null in podcast');
        return PodcastItem(
          libraryId: libraryId,
          id: episodeId!,
          podcastId: libraryItemId,
          sessionId: id,
          cover: serverUrl.resolve(ApiRoutes.itemCover(libraryItemId)),
          tracks: audioTracks ?? [],
          duration: duration,
        );
      }(),
    };
  }
}
