import 'package:freezed_annotation/freezed_annotation.dart';

enum HttpMethod { get, post, patch, delete }

enum UserType {
  root,
  admin,
  user,
  guest;

  bool get isAdmin => switch (this) {
    .root || .admin => true,
    _ => false,
  };
}

enum AuthMethod { local, openid }

@JsonEnum(valueField: 'value')
enum ServerLogLevel {
  debug(0),
  info(1),
  warning(2),
  error(3);

  final int value;
  new(this.value);
}

@JsonEnum(valueField: 'type')
enum MediaType {
  book('book'),
  podcast('podcast');

  final String type;

  new(this.type);
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
  new(this.id);

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

  new(this.value);
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

  new(this.value, this.name);
}

enum ScanItemResult {
  nothing('NOTHING'),
  added('ADDED'),
  updated('UPDATED'),
  removed('REMOVED'),
  upToDate('UPTODATE');

  static final byName = {
    for (final value in ScanItemResult.values) value.name: value,
  };

  final String name;

  new(this.name);
}

@JsonEnum(valueField: 'value')
enum Month {
  january(1, 'January'),
  february(2, 'February'),
  march(3, 'March'),
  april(4, 'April'),
  may(5, 'May'),
  june(6, 'June'),
  july(7, 'July'),
  august(8, 'August'),
  september(9, 'September'),
  october(10, 'October'),
  november(11, 'November'),
  december(12, 'December');

  static final byValue = {for (final value in Month.values) value.value: value};

  final int value;
  final String name;

  new(this.value, this.name);
}
