import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';

@GenerateAdapters(
  [
    AdapterSpec<Server>(),
    AdapterSpec<UserDomain>(),
    AdapterSpec<LibraryItem>(),
    AdapterSpec<BookMedia>(),
    AdapterSpec<PodcastMedia>(),
    AdapterSpec<PodcastEpisode>(),
    AdapterSpec<PodcastEpisodeEnclosure>(),
    AdapterSpec<BookMetadata>(),
    AdapterSpec<PodcastMetadata>(),
    AdapterSpec<MediaProgress>(),
    AdapterSpec<AudioTrack>(),
    AdapterSpec<BookChapter>(),
    AdapterSpec<SeriesProgress>(),
    AdapterSpec<Series>(),
    AdapterSpec<Author>(),
    AdapterSpec<FileMetadata>(),
    AdapterSpec<AudioMetaTags>(),
  ],
  reservedTypeIds: {0},
)
part 'hive_adapters.g.dart';

class UriAdapter extends TypeAdapter<Uri> {
  @override
  final int typeId = 0;

  @override
  Uri read(BinaryReader reader) {
    final uriString = reader.readString();
    return Uri.parse(uriString);
  }

  @override
  void write(BinaryWriter writer, Uri obj) {
    writer.writeString(obj.toString());
  }
}
