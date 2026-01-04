import 'package:freezed_annotation/freezed_annotation.dart';

enum HttpMethod { get, post, patch, delete }

enum UserType { root, guest, user, admin }

enum AuthMethod { local, openid }

@JsonEnum(valueField: 'value')
enum LogLevel {
  debug(0),
  info(1),
  warning(2),
  error(3);

  final int value;
  const LogLevel(this.value);
}

@JsonEnum(valueField: 'type')
enum MediaType {
  book('book'),
  podcast('podcast');

  final String type;

  const MediaType(this.type);
}

enum FileType { image, audio, ebook, video, text, metadata, unknown }

enum ShelfIdentity {
  continueListening('continue-listening'),
  continueSeries('continue-series'),
  discover('discover'),
  recentlyAdded('recently-added'),
  recentSeries('recent-series'),
  newestAuthors('newest-authors'),
  newestEpisodes('newest-episodes'),
  listenAgain('listen-again');

  final String id;
  const ShelfIdentity(this.id);

  static ShelfIdentity? fromId(String id) {
    for (final val in ShelfIdentity.values) {
      if (id == val.id) {
        return val;
      }
    }
    return null;
  }
}

enum ShelfType { book, series, authors, episode, podcast }
