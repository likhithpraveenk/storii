import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';

@GenerateAdapters(
  [AdapterSpec<Server>(), AdapterSpec<UserDomain>()],
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
