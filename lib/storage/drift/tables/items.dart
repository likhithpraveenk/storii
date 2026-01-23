import 'package:drift/drift.dart';
import 'package:storii/app/models/audio_track.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/podcast_episode.dart';
import 'package:storii/storage/drift/converters.dart';
import 'package:storii/storage/drift/tables/libraries.dart';

@UseRowClass(Audiobook, generateInsertable: true)
class Audiobooks extends Table {
  TextColumn get id => text()();
  TextColumn get libraryId =>
      text().references(Libraries, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get addedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isMissing => boolean()();
  IntColumn get size => integer()();
  IntColumn get duration => integer().map(const DurationConverter())();

  TextColumn get title => text().nullable()();
  TextColumn get authorName => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get language => text().nullable()();
  BoolColumn get explicit => boolean().withDefault(const Constant(false))();

  TextColumn get narrators => text().map(const ListConverter<String>())();
  TextColumn get genres => text().map(const ListConverter<String>())();
  TextColumn get tags => text().map(const ListConverter<String>())();
  TextColumn get tracks => text().map(
    const JsonListConverter(fromJson: AudioTrackDomain.fromJson),
  )();
  TextColumn get chapters =>
      text().map(const JsonListConverter(fromJson: ChapterDomain.fromJson))();

  RealColumn get progress => real()();
  BoolColumn get isFinished => boolean().withDefault(const Constant(false))();
  BoolColumn get hideFromContinueListening =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@UseRowClass(Podcast, generateInsertable: true)
class Podcasts extends Table {
  TextColumn get id => text()();
  TextColumn get libraryId =>
      text().references(Libraries, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get addedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isMissing => boolean()();
  IntColumn get size => integer()();

  TextColumn get episodeId => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get authorName => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get language => text().nullable()();
  BoolColumn get explicit => boolean().withDefault(const Constant(false))();

  TextColumn get genres => text().map(const ListConverter<String>())();
  TextColumn get tags => text().map(const ListConverter<String>())();
  TextColumn get episodes => text().map(
    const JsonListConverter(fromJson: PodcastEpisodeDomain.fromJson),
  )();
  TextColumn get feedUrl => text().map(const UriConverter()).nullable()();

  DateTimeColumn get lastEpisodeCheck => dateTime().nullable()();
  RealColumn get progress => real()();
  BoolColumn get isFinished => boolean().withDefault(const Constant(false))();
  BoolColumn get hideFromContinueListening =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
