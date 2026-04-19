import 'package:freezed_annotation/freezed_annotation.dart';

enum HttpMethod { get, post, patch, delete }

enum UserType { root, guest, user, admin }

enum AuthMethod { local, openid }

@JsonEnum(valueField: 'value')
enum ServerLogLevel {
  debug(0),
  info(1),
  warning(2),
  error(3);

  final int value;
  const ServerLogLevel(this.value);
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

@JsonEnum(valueField: 'value')
enum PlayMethod {
  directPlay(0),
  directStream(1),
  transcode(2),
  local(3);

  final int value;

  const PlayMethod(this.value);
}

@JsonEnum(valueField: 'name')
enum DayOfTheWeek {
  sunday(0, 'Sunday'),
  monday(1, 'Monday'),
  tuesday(2, 'Tuesday'),
  wednesday(3, 'Wednesday'),
  thursday(4, 'Thursday'),
  friday(5, 'Friday'),
  saturday(6, 'Saturday');

  static final byValue = {
    for (final value in DayOfTheWeek.values) value.value: value,
  };

  final int value;
  final String name;

  const DayOfTheWeek(this.value, this.name);
}
