// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class LogEntryAdapter extends TypeAdapter<LogEntry> {
  @override
  final typeId = 0;

  @override
  LogEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogEntry(
      timestamp: fields[0] as DateTime,
      message: fields[1] as String,
      level: fields[2] as LogLevel,
      source: fields[3] as String?,
      stackTrace: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LogEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.level)
      ..writeByte(3)
      ..write(obj.source)
      ..writeByte(4)
      ..write(obj.stackTrace);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
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

class LogLevelAdapter extends TypeAdapter<LogLevel> {
  @override
  final typeId = 5;

  @override
  LogLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LogLevel.http;
      case 1:
        return LogLevel.debug;
      case 2:
        return LogLevel.info;
      case 3:
        return LogLevel.warning;
      case 4:
        return LogLevel.error;
      default:
        return LogLevel.http;
    }
  }

  @override
  void write(BinaryWriter writer, LogLevel obj) {
    switch (obj) {
      case LogLevel.http:
        writer.writeByte(0);
      case LogLevel.debug:
        writer.writeByte(1);
      case LogLevel.info:
        writer.writeByte(2);
      case LogLevel.warning:
        writer.writeByte(3);
      case LogLevel.error:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UriAdapter extends TypeAdapter<Uri> {
  @override
  final typeId = 6;

  @override
  Uri read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Uri(
      scheme: fields[0] as String?,
      userInfo: fields[1] as String?,
      host: fields[2] as String?,
      port: (fields[3] as num?)?.toInt(),
      path: fields[4] as String?,
      pathSegments: (fields[7] as List?)?.cast<String>(),
      query: fields[5] as String?,
      queryParameters: (fields[8] as Map?)?.cast<String, dynamic>(),
      fragment: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Uri obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.scheme)
      ..writeByte(1)
      ..write(obj.userInfo)
      ..writeByte(2)
      ..write(obj.host)
      ..writeByte(3)
      ..write(obj.port)
      ..writeByte(4)
      ..write(obj.path)
      ..writeByte(5)
      ..write(obj.query)
      ..writeByte(6)
      ..write(obj.fragment)
      ..writeByte(7)
      ..write(obj.pathSegments)
      ..writeByte(8)
      ..write(obj.queryParameters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UriAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
