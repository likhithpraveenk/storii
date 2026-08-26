import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';

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

class ServerAdapter extends TypeAdapter<Server> {
  @override
  final typeId = 1;

  @override
  Server read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Server(
      id: fields[0] as String,
      url: fields[1] as Uri,
      headers: fields[2] == null
          ? {}
          : (fields[2] as Map).cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Server obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.headers);
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
