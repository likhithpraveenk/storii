// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ServerAdapter extends TypeAdapter<Server> {
  @override
  final typeId = 1;

  @override
  Server read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Server(id: fields[0] as String, url: fields[1] as Uri);
  }

  @override
  void write(BinaryWriter writer, Server obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDomainAdapter extends TypeAdapter<UserDomain> {
  @override
  final typeId = 2;

  @override
  UserDomain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDomain(
      id: fields[0] as String,
      username: fields[1] as String,
      userType: fields[2] as String,
      serverUrl: fields[3] as Uri,
    );
  }

  @override
  void write(BinaryWriter writer, UserDomain obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.userType)
      ..writeByte(3)
      ..write(obj.serverUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDomainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LibraryItemAdapter extends TypeAdapter<LibraryItem> {
  @override
  final typeId = 3;

  @override
  LibraryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LibraryItem(
      id: fields[0] as String,
      libraryId: fields[1] as String,
      addedAt: fields[2] as DateTime,
      updatedAt: fields[3] as DateTime,
      isMissing: fields[4] as bool,
      mediaType: fields[5] as MediaType,
      media: fields[6] as Media,
      size: (fields[7] as num).toInt(),
      sequence: fields[8] as String?,
      seriesSequence: fields[9] as String?,
      userMediaProgress: fields[10] as MediaProgress?,
      episodesDownloading: (fields[11] as List?)
          ?.cast<PodcastEpisodeDownload>(),
    );
  }

  @override
  void write(BinaryWriter writer, LibraryItem obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.libraryId)
      ..writeByte(2)
      ..write(obj.addedAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.isMissing)
      ..writeByte(5)
      ..write(obj.mediaType)
      ..writeByte(6)
      ..write(obj.media)
      ..writeByte(7)
      ..write(obj.size)
      ..writeByte(8)
      ..write(obj.sequence)
      ..writeByte(9)
      ..write(obj.seriesSequence)
      ..writeByte(10)
      ..write(obj.userMediaProgress)
      ..writeByte(11)
      ..write(obj.episodesDownloading);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibraryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookMediaAdapter extends TypeAdapter<BookMedia> {
  @override
  final typeId = 4;

  @override
  BookMedia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMedia(
      metadata: fields[0] as MediaMetadata,
      tags: (fields[1] as List).cast<String>(),
      duration: fields[2] as Duration,
      size: (fields[3] as num).toInt(),
      coverPath: fields[4] as String?,
      audioFiles: (fields[10] as List?)?.cast<AudioFile>(),
      tracks: (fields[6] as List?)?.cast<AudioTrack>(),
      chapters: (fields[7] as List?)?.cast<BookChapter>(),
      $type: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookMedia obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.metadata)
      ..writeByte(1)
      ..write(obj.tags)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.coverPath)
      ..writeByte(6)
      ..write(obj.tracks)
      ..writeByte(7)
      ..write(obj.chapters)
      ..writeByte(8)
      ..write(obj.$type)
      ..writeByte(10)
      ..write(obj.audioFiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PodcastMediaAdapter extends TypeAdapter<PodcastMedia> {
  @override
  final typeId = 5;

  @override
  PodcastMedia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PodcastMedia(
      metadata: fields[0] as MediaMetadata,
      tags: (fields[1] as List).cast<String>(),
      size: (fields[2] as num).toInt(),
      autoDownloadEpisodes: fields[3] as bool,
      coverPath: fields[4] as String?,
      lastEpisodeCheck: fields[5] as DateTime?,
      episodes: (fields[6] as List?)?.cast<PodcastEpisode>(),
      numEpisodes: (fields[7] as num?)?.toInt(),
      $type: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PodcastMedia obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.metadata)
      ..writeByte(1)
      ..write(obj.tags)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.autoDownloadEpisodes)
      ..writeByte(4)
      ..write(obj.coverPath)
      ..writeByte(5)
      ..write(obj.lastEpisodeCheck)
      ..writeByte(6)
      ..write(obj.episodes)
      ..writeByte(7)
      ..write(obj.numEpisodes)
      ..writeByte(8)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PodcastMediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookMetadataAdapter extends TypeAdapter<BookMetadata> {
  @override
  final typeId = 6;

  @override
  BookMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMetadata(
      title: fields[0] as String?,
      titleIgnorePrefix: fields[1] as String?,
      subtitle: fields[2] as String?,
      authors: (fields[3] as List?)?.cast<Author>(),
      narrators: (fields[4] as List?)?.cast<String>(),
      series: (fields[5] as List?)?.cast<Series>(),
      genres: fields[6] == null ? const [] : (fields[6] as List).cast<String>(),
      publishedYear: fields[7] as String?,
      publishedDate: fields[8] as String?,
      publisher: fields[9] as String?,
      description: fields[10] as String?,
      isbn: fields[11] as String?,
      asin: fields[12] as String?,
      language: fields[13] as String?,
      explicit: fields[14] == null ? false : fields[14] as bool,
      abridged: fields[15] as bool?,
      authorName: fields[16] as String?,
      authorNameLF: fields[17] as String?,
      narratorName: fields[18] as String?,
      seriesName: fields[19] as String?,
      descriptionPlain: fields[20] as String?,
      $type: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookMetadata obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.titleIgnorePrefix)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.narrators)
      ..writeByte(5)
      ..write(obj.series)
      ..writeByte(6)
      ..write(obj.genres)
      ..writeByte(7)
      ..write(obj.publishedYear)
      ..writeByte(8)
      ..write(obj.publishedDate)
      ..writeByte(9)
      ..write(obj.publisher)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.isbn)
      ..writeByte(12)
      ..write(obj.asin)
      ..writeByte(13)
      ..write(obj.language)
      ..writeByte(14)
      ..write(obj.explicit)
      ..writeByte(15)
      ..write(obj.abridged)
      ..writeByte(16)
      ..write(obj.authorName)
      ..writeByte(17)
      ..write(obj.authorNameLF)
      ..writeByte(18)
      ..write(obj.narratorName)
      ..writeByte(19)
      ..write(obj.seriesName)
      ..writeByte(20)
      ..write(obj.descriptionPlain)
      ..writeByte(21)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MediaProgressAdapter extends TypeAdapter<MediaProgress> {
  @override
  final typeId = 7;

  @override
  MediaProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaProgress(
      id: fields[0] as String,
      libraryItemId: fields[1] as String,
      episodeId: fields[2] as String?,
      duration: fields[3] as Duration,
      progress: (fields[4] as num?)?.toDouble(),
      currentTime: fields[5] as Duration,
      isFinished: fields[6] as bool,
      hideFromContinueListening: fields[7] as bool,
      lastUpdate: fields[8] as DateTime,
      startedAt: fields[9] as DateTime,
      finishedAt: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MediaProgress obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.libraryItemId)
      ..writeByte(2)
      ..write(obj.episodeId)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.progress)
      ..writeByte(5)
      ..write(obj.currentTime)
      ..writeByte(6)
      ..write(obj.isFinished)
      ..writeByte(7)
      ..write(obj.hideFromContinueListening)
      ..writeByte(8)
      ..write(obj.lastUpdate)
      ..writeByte(9)
      ..write(obj.startedAt)
      ..writeByte(10)
      ..write(obj.finishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookChapterAdapter extends TypeAdapter<BookChapter> {
  @override
  final typeId = 9;

  @override
  BookChapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookChapter(
      id: (fields[0] as num).toInt(),
      start: fields[1] as Duration,
      end: fields[2] as Duration,
      title: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookChapter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AudioTrackAdapter extends TypeAdapter<AudioTrack> {
  @override
  final typeId = 10;

  @override
  AudioTrack read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioTrack(
      index: (fields[0] as num).toInt(),
      startOffset: fields[1] as Duration,
      duration: fields[2] as Duration,
      title: fields[3] as String,
      contentUrl: fields[4] as String,
      mimeType: fields[5] as String,
      metadata: fields[6] as FileMetadata?,
    );
  }

  @override
  void write(BinaryWriter writer, AudioTrack obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.startOffset)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.contentUrl)
      ..writeByte(5)
      ..write(obj.mimeType)
      ..writeByte(6)
      ..write(obj.metadata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioTrackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PodcastMetadataAdapter extends TypeAdapter<PodcastMetadata> {
  @override
  final typeId = 11;

  @override
  PodcastMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PodcastMetadata(
      title: fields[0] as String?,
      titleIgnorePrefix: fields[1] as String?,
      author: fields[2] as String?,
      description: fields[3] as String?,
      releaseDate: fields[4] as DateTime?,
      genres: fields[5] == null ? const [] : (fields[5] as List).cast<String>(),
      feedUrl: fields[6] as Uri?,
      imageUrl: fields[7] as Uri?,
      itunesPageUrl: fields[8] as Uri?,
      itunesId: (fields[9] as num?)?.toInt(),
      itunesArtistId: (fields[10] as num?)?.toInt(),
      explicit: fields[11] == null ? false : fields[11] as bool,
      language: fields[12] as String?,
      $type: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PodcastMetadata obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.titleIgnorePrefix)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(6)
      ..write(obj.feedUrl)
      ..writeByte(7)
      ..write(obj.imageUrl)
      ..writeByte(8)
      ..write(obj.itunesPageUrl)
      ..writeByte(9)
      ..write(obj.itunesId)
      ..writeByte(10)
      ..write(obj.itunesArtistId)
      ..writeByte(11)
      ..write(obj.explicit)
      ..writeByte(12)
      ..write(obj.language)
      ..writeByte(13)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PodcastMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeriesProgressAdapter extends TypeAdapter<SeriesProgress> {
  @override
  final typeId = 12;

  @override
  SeriesProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesProgress(
      libraryItemIds: (fields[0] as List).cast<String>(),
      libraryItemIdsFinished: (fields[1] as List).cast<String>(),
      isFinished: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SeriesProgress obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.libraryItemIds)
      ..writeByte(1)
      ..write(obj.libraryItemIdsFinished)
      ..writeByte(2)
      ..write(obj.isFinished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeriesAdapter extends TypeAdapter<Series> {
  @override
  final typeId = 13;

  @override
  Series read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Series(
      id: fields[0] as String,
      name: fields[1] as String,
      libraryId: fields[2] as String?,
      nameIgnorePrefix: fields[3] as String?,
      description: fields[4] as String?,
      addedAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      books: fields[7] == null ? [] : (fields[7] as List).cast<LibraryItem>(),
      numBooks: (fields[8] as num?)?.toInt(),
      sequence: fields[9] as String?,
      seriesSequenceList: fields[10] as String?,
      progress: fields[11] as SeriesProgress?,
      inProgress: fields[12] as bool?,
      hasActiveBook: fields[13] as bool?,
      hideFromContinueListening: fields[14] as bool?,
      bookInProgressLastUpdate: fields[15] as DateTime?,
      firstBookUnread: fields[16] as LibraryItem?,
    );
  }

  @override
  void write(BinaryWriter writer, Series obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.libraryId)
      ..writeByte(3)
      ..write(obj.nameIgnorePrefix)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.addedAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.books)
      ..writeByte(8)
      ..write(obj.numBooks)
      ..writeByte(9)
      ..write(obj.sequence)
      ..writeByte(10)
      ..write(obj.seriesSequenceList)
      ..writeByte(11)
      ..write(obj.progress)
      ..writeByte(12)
      ..write(obj.inProgress)
      ..writeByte(13)
      ..write(obj.hasActiveBook)
      ..writeByte(14)
      ..write(obj.hideFromContinueListening)
      ..writeByte(15)
      ..write(obj.bookInProgressLastUpdate)
      ..writeByte(16)
      ..write(obj.firstBookUnread);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final typeId = 14;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(
      id: fields[0] as String,
      name: fields[1] as String,
      lastFirst: fields[2] as String?,
      libraryId: fields[3] as String?,
      asin: fields[4] as String?,
      description: fields[5] as String?,
      imagePath: fields[6] as String?,
      addedAt: fields[7] as DateTime?,
      updatedAt: fields[8] as DateTime?,
      numBooks: (fields[9] as num?)?.toInt(),
      libraryItems: (fields[10] as List?)?.cast<LibraryItem>(),
      series: (fields[11] as List?)?.cast<Series>(),
    );
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastFirst)
      ..writeByte(3)
      ..write(obj.libraryId)
      ..writeByte(4)
      ..write(obj.asin)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.imagePath)
      ..writeByte(7)
      ..write(obj.addedAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.numBooks)
      ..writeByte(10)
      ..write(obj.libraryItems)
      ..writeByte(11)
      ..write(obj.series);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FileMetadataAdapter extends TypeAdapter<FileMetadata> {
  @override
  final typeId = 15;

  @override
  FileMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileMetadata(
      filename: fields[0] as String,
      ext: fields[1] as String,
      path: fields[2] as String,
      relPath: fields[3] as String,
      size: (fields[4] as num).toInt(),
      mtime: fields[5] as DateTime,
      ctime: fields[6] as DateTime,
      birthtime: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FileMetadata obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.filename)
      ..writeByte(1)
      ..write(obj.ext)
      ..writeByte(2)
      ..write(obj.path)
      ..writeByte(3)
      ..write(obj.relPath)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.mtime)
      ..writeByte(6)
      ..write(obj.ctime)
      ..writeByte(7)
      ..write(obj.birthtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AudioMetaTagsAdapter extends TypeAdapter<AudioMetaTags> {
  @override
  final typeId = 16;

  @override
  AudioMetaTags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioMetaTags(
      tagAlbum: fields[0] as String?,
      tagArtist: fields[1] as String?,
      tagGenre: fields[2] as String?,
      tagTitle: fields[3] as String?,
      tagSeries: fields[4] as String?,
      tagSeriesPart: fields[5] as String?,
      tagTrack: fields[6] as String?,
      tagDisc: fields[7] as String?,
      tagSubtitle: fields[8] as String?,
      tagAlbumArtist: fields[9] as String?,
      tagDate: fields[10] as String?,
      tagComposer: fields[11] as String?,
      tagPublisher: fields[12] as String?,
      tagComment: fields[13] as String?,
      tagDescription: fields[14] as String?,
      tagEncoder: fields[15] as String?,
      tagEncodedBy: fields[16] as String?,
      tagIsbn: fields[17] as String?,
      tagLanguage: fields[18] as String?,
      tagASIN: fields[19] as String?,
      tagOverdriveMediaMarker: fields[20] as String?,
      tagOriginalYear: fields[21] as String?,
      tagReleaseCountry: fields[22] as String?,
      tagReleaseType: fields[23] as String?,
      tagReleaseStatus: fields[24] as String?,
      tagISRC: fields[25] as String?,
      tagMusicBrainzTrackId: fields[26] as String?,
      tagMusicBrainzAlbumId: fields[27] as String?,
      tagMusicBrainzAlbumArtistId: fields[28] as String?,
      tagMusicBrainzArtistId: fields[29] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AudioMetaTags obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.tagAlbum)
      ..writeByte(1)
      ..write(obj.tagArtist)
      ..writeByte(2)
      ..write(obj.tagGenre)
      ..writeByte(3)
      ..write(obj.tagTitle)
      ..writeByte(4)
      ..write(obj.tagSeries)
      ..writeByte(5)
      ..write(obj.tagSeriesPart)
      ..writeByte(6)
      ..write(obj.tagTrack)
      ..writeByte(7)
      ..write(obj.tagDisc)
      ..writeByte(8)
      ..write(obj.tagSubtitle)
      ..writeByte(9)
      ..write(obj.tagAlbumArtist)
      ..writeByte(10)
      ..write(obj.tagDate)
      ..writeByte(11)
      ..write(obj.tagComposer)
      ..writeByte(12)
      ..write(obj.tagPublisher)
      ..writeByte(13)
      ..write(obj.tagComment)
      ..writeByte(14)
      ..write(obj.tagDescription)
      ..writeByte(15)
      ..write(obj.tagEncoder)
      ..writeByte(16)
      ..write(obj.tagEncodedBy)
      ..writeByte(17)
      ..write(obj.tagIsbn)
      ..writeByte(18)
      ..write(obj.tagLanguage)
      ..writeByte(19)
      ..write(obj.tagASIN)
      ..writeByte(20)
      ..write(obj.tagOverdriveMediaMarker)
      ..writeByte(21)
      ..write(obj.tagOriginalYear)
      ..writeByte(22)
      ..write(obj.tagReleaseCountry)
      ..writeByte(23)
      ..write(obj.tagReleaseType)
      ..writeByte(24)
      ..write(obj.tagReleaseStatus)
      ..writeByte(25)
      ..write(obj.tagISRC)
      ..writeByte(26)
      ..write(obj.tagMusicBrainzTrackId)
      ..writeByte(27)
      ..write(obj.tagMusicBrainzAlbumId)
      ..writeByte(28)
      ..write(obj.tagMusicBrainzAlbumArtistId)
      ..writeByte(29)
      ..write(obj.tagMusicBrainzArtistId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioMetaTagsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PodcastEpisodeAdapter extends TypeAdapter<PodcastEpisode> {
  @override
  final typeId = 17;

  @override
  PodcastEpisode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PodcastEpisode(
      libraryItemId: fields[0] as String,
      podcastId: fields[1] as String,
      id: fields[2] as String,
      index: (fields[3] as num?)?.toInt(),
      season: fields[4] as String?,
      episode: fields[5] as String?,
      episodeType: fields[6] as String?,
      title: fields[7] as String?,
      subtitle: fields[8] as String?,
      description: fields[9] as String?,
      enclosure: fields[10] as PodcastEpisodeEnclosure?,
      pubDate: fields[11] as String?,
      audioFile: fields[12] as AudioFile,
      publishedAt: fields[13] as DateTime,
      addedAt: fields[14] as DateTime,
      updatedAt: fields[15] as DateTime,
      audioTrack: fields[16] as AudioTrack,
      duration: fields[17] as Duration,
      size: (fields[18] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, PodcastEpisode obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.libraryItemId)
      ..writeByte(1)
      ..write(obj.podcastId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.index)
      ..writeByte(4)
      ..write(obj.season)
      ..writeByte(5)
      ..write(obj.episode)
      ..writeByte(6)
      ..write(obj.episodeType)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(8)
      ..write(obj.subtitle)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.enclosure)
      ..writeByte(11)
      ..write(obj.pubDate)
      ..writeByte(12)
      ..write(obj.audioFile)
      ..writeByte(13)
      ..write(obj.publishedAt)
      ..writeByte(14)
      ..write(obj.addedAt)
      ..writeByte(15)
      ..write(obj.updatedAt)
      ..writeByte(16)
      ..write(obj.audioTrack)
      ..writeByte(17)
      ..write(obj.duration)
      ..writeByte(18)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PodcastEpisodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PodcastEpisodeEnclosureAdapter
    extends TypeAdapter<PodcastEpisodeEnclosure> {
  @override
  final typeId = 18;

  @override
  PodcastEpisodeEnclosure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PodcastEpisodeEnclosure(
      url: fields[0] as Uri,
      type: fields[1] as String,
      length: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PodcastEpisodeEnclosure obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.length);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PodcastEpisodeEnclosureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
