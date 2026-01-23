// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ServersTable extends Servers with TableInfo<$ServersTable, Server> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServersTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> url =
      GeneratedColumn<String>(
        'url',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Uri>($ServersTable.$converterurl);
  @override
  List<GeneratedColumn> get $columns => [url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'servers';
  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  Server map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Server(
      url: $ServersTable.$converterurl.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}url'],
        )!,
      ),
    );
  }

  @override
  $ServersTable createAlias(String alias) {
    return $ServersTable(attachedDatabase, alias);
  }

  static TypeConverter<Uri, String> $converterurl = const UriConverter();
}

class ServersCompanion extends UpdateCompanion<Server> {
  final Value<Uri> url;
  final Value<int> rowid;
  const ServersCompanion({
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServersCompanion.insert({required Uri url, this.rowid = const Value.absent()})
    : url = Value(url);
  static Insertable<Server> custom({
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServersCompanion copyWith({Value<Uri>? url, Value<int>? rowid}) {
    return ServersCompanion(url: url ?? this.url, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(
        $ServersTable.$converterurl.toSql(url.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServersCompanion(')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$ServerInsertable implements Insertable<Server> {
  Server _object;
  _$ServerInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return ServersCompanion(url: Value(_object.url)).toColumns(false);
  }
}

extension ServerToInsertable on Server {
  _$ServerInsertable toInsertable() {
    return _$ServerInsertable(this);
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userTypeMeta = const VerificationMeta(
    'userType',
  );
  @override
  late final GeneratedColumn<String> userType = GeneratedColumn<String>(
    'user_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> serverUrl =
      GeneratedColumn<String>(
        'server_url',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES servers (url) ON DELETE CASCADE',
        ),
      ).withConverter<Uri>($UsersTable.$converterserverUrl);
  @override
  List<GeneratedColumn> get $columns => [id, username, userType, serverUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('user_type')) {
      context.handle(
        _userTypeMeta,
        userType.isAcceptableOrUnknown(data['user_type']!, _userTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_userTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDomain(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      userType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_type'],
      )!,
      serverUrl: $UsersTable.$converterserverUrl.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}server_url'],
        )!,
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static TypeConverter<Uri, String> $converterserverUrl = const UriConverter();
}

class UsersCompanion extends UpdateCompanion<UserDomain> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> userType;
  final Value<Uri> serverUrl;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.userType = const Value.absent(),
    this.serverUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String username,
    required String userType,
    required Uri serverUrl,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       username = Value(username),
       userType = Value(userType),
       serverUrl = Value(serverUrl);
  static Insertable<UserDomain> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? userType,
    Expression<String>? serverUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (userType != null) 'user_type': userType,
      if (serverUrl != null) 'server_url': serverUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? username,
    Value<String>? userType,
    Value<Uri>? serverUrl,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      userType: userType ?? this.userType,
      serverUrl: serverUrl ?? this.serverUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (userType.present) {
      map['user_type'] = Variable<String>(userType.value);
    }
    if (serverUrl.present) {
      map['server_url'] = Variable<String>(
        $UsersTable.$converterserverUrl.toSql(serverUrl.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('userType: $userType, ')
          ..write('serverUrl: $serverUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$UserDomainInsertable implements Insertable<UserDomain> {
  UserDomain _object;
  _$UserDomainInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(_object.id),
      username: Value(_object.username),
      userType: Value(_object.userType),
      serverUrl: Value(_object.serverUrl),
    ).toColumns(false);
  }
}

extension UserDomainToInsertable on UserDomain {
  _$UserDomainInsertable toInsertable() {
    return _$UserDomainInsertable(this);
  }
}

class $AppLogsTable extends AppLogs with TableInfo<$AppLogsTable, LogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LogLevelDomain, String> level =
      GeneratedColumn<String>(
        'level',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LogLevelDomain>($AppLogsTable.$converterlevel);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stackTraceMeta = const VerificationMeta(
    'stackTrace',
  );
  @override
  late final GeneratedColumn<String> stackTrace = GeneratedColumn<String>(
    'stack_trace',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    timestamp,
    message,
    level,
    source,
    stackTrace,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('stack_trace')) {
      context.handle(
        _stackTraceMeta,
        stackTrace.isAcceptableOrUnknown(data['stack_trace']!, _stackTraceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {timestamp};
  @override
  LogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogEntry(
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      level: $AppLogsTable.$converterlevel.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}level'],
        )!,
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      stackTrace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stack_trace'],
      ),
    );
  }

  @override
  $AppLogsTable createAlias(String alias) {
    return $AppLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogLevelDomain, String, String> $converterlevel =
      const EnumNameConverter(LogLevelDomain.values);
}

class AppLogsCompanion extends UpdateCompanion<LogEntry> {
  final Value<DateTime> timestamp;
  final Value<String> message;
  final Value<LogLevelDomain> level;
  final Value<String?> source;
  final Value<String?> stackTrace;
  final Value<int> rowid;
  const AppLogsCompanion({
    this.timestamp = const Value.absent(),
    this.message = const Value.absent(),
    this.level = const Value.absent(),
    this.source = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppLogsCompanion.insert({
    required DateTime timestamp,
    required String message,
    required LogLevelDomain level,
    this.source = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : timestamp = Value(timestamp),
       message = Value(message),
       level = Value(level);
  static Insertable<LogEntry> custom({
    Expression<DateTime>? timestamp,
    Expression<String>? message,
    Expression<String>? level,
    Expression<String>? source,
    Expression<String>? stackTrace,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (timestamp != null) 'timestamp': timestamp,
      if (message != null) 'message': message,
      if (level != null) 'level': level,
      if (source != null) 'source': source,
      if (stackTrace != null) 'stack_trace': stackTrace,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppLogsCompanion copyWith({
    Value<DateTime>? timestamp,
    Value<String>? message,
    Value<LogLevelDomain>? level,
    Value<String?>? source,
    Value<String?>? stackTrace,
    Value<int>? rowid,
  }) {
    return AppLogsCompanion(
      timestamp: timestamp ?? this.timestamp,
      message: message ?? this.message,
      level: level ?? this.level,
      source: source ?? this.source,
      stackTrace: stackTrace ?? this.stackTrace,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(
        $AppLogsTable.$converterlevel.toSql(level.value),
      );
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (stackTrace.present) {
      map['stack_trace'] = Variable<String>(stackTrace.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppLogsCompanion(')
          ..write('timestamp: $timestamp, ')
          ..write('message: $message, ')
          ..write('level: $level, ')
          ..write('source: $source, ')
          ..write('stackTrace: $stackTrace, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$LogEntryInsertable implements Insertable<LogEntry> {
  LogEntry _object;
  _$LogEntryInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return AppLogsCompanion(
      timestamp: Value(_object.timestamp),
      message: Value(_object.message),
      level: Value(_object.level),
      source: Value(_object.source),
      stackTrace: Value(_object.stackTrace),
    ).toColumns(false);
  }
}

extension LogEntryToInsertable on LogEntry {
  _$LogEntryInsertable toInsertable() {
    return _$LogEntryInsertable(this);
  }
}

class $LibrariesTable extends Libraries
    with TableInfo<$LibrariesTable, LibraryDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LibrariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> serverUrl =
      GeneratedColumn<String>(
        'server_url',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES servers (url) ON DELETE CASCADE',
        ),
      ).withConverter<Uri>($LibrariesTable.$converterserverUrl);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaContent, String>
  mediaContent = GeneratedColumn<String>(
    'media_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MediaContent>($LibrariesTable.$convertermediaContent);
  @override
  List<GeneratedColumn> get $columns => [id, serverUrl, name, mediaContent];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'libraries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LibraryDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LibraryDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LibraryDomain(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      serverUrl: $LibrariesTable.$converterserverUrl.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}server_url'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      mediaContent: $LibrariesTable.$convertermediaContent.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_content'],
        )!,
      ),
    );
  }

  @override
  $LibrariesTable createAlias(String alias) {
    return $LibrariesTable(attachedDatabase, alias);
  }

  static TypeConverter<Uri, String> $converterserverUrl = const UriConverter();
  static JsonTypeConverter2<MediaContent, String, String>
  $convertermediaContent = const EnumNameConverter(MediaContent.values);
}

class LibrariesCompanion extends UpdateCompanion<LibraryDomain> {
  final Value<String> id;
  final Value<Uri> serverUrl;
  final Value<String> name;
  final Value<MediaContent> mediaContent;
  final Value<int> rowid;
  const LibrariesCompanion({
    this.id = const Value.absent(),
    this.serverUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.mediaContent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LibrariesCompanion.insert({
    required String id,
    required Uri serverUrl,
    required String name,
    required MediaContent mediaContent,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       serverUrl = Value(serverUrl),
       name = Value(name),
       mediaContent = Value(mediaContent);
  static Insertable<LibraryDomain> custom({
    Expression<String>? id,
    Expression<String>? serverUrl,
    Expression<String>? name,
    Expression<String>? mediaContent,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverUrl != null) 'server_url': serverUrl,
      if (name != null) 'name': name,
      if (mediaContent != null) 'media_content': mediaContent,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LibrariesCompanion copyWith({
    Value<String>? id,
    Value<Uri>? serverUrl,
    Value<String>? name,
    Value<MediaContent>? mediaContent,
    Value<int>? rowid,
  }) {
    return LibrariesCompanion(
      id: id ?? this.id,
      serverUrl: serverUrl ?? this.serverUrl,
      name: name ?? this.name,
      mediaContent: mediaContent ?? this.mediaContent,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (serverUrl.present) {
      map['server_url'] = Variable<String>(
        $LibrariesTable.$converterserverUrl.toSql(serverUrl.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (mediaContent.present) {
      map['media_content'] = Variable<String>(
        $LibrariesTable.$convertermediaContent.toSql(mediaContent.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LibrariesCompanion(')
          ..write('id: $id, ')
          ..write('serverUrl: $serverUrl, ')
          ..write('name: $name, ')
          ..write('mediaContent: $mediaContent, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$LibraryDomainInsertable implements Insertable<LibraryDomain> {
  LibraryDomain _object;
  _$LibraryDomainInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return LibrariesCompanion(
      id: Value(_object.id),
      serverUrl: Value(_object.serverUrl),
      name: Value(_object.name),
      mediaContent: Value(_object.mediaContent),
    ).toColumns(false);
  }
}

extension LibraryDomainToInsertable on LibraryDomain {
  _$LibraryDomainInsertable toInsertable() {
    return _$LibraryDomainInsertable(this);
  }
}

class $AudiobooksTable extends Audiobooks
    with TableInfo<$AudiobooksTable, Audiobook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudiobooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isMissingMeta = const VerificationMeta(
    'isMissing',
  );
  @override
  late final GeneratedColumn<bool> isMissing = GeneratedColumn<bool>(
    'is_missing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_missing" IN (0, 1))',
    ),
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Duration, int> duration =
      GeneratedColumn<int>(
        'duration',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Duration>($AudiobooksTable.$converterduration);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorNameMeta = const VerificationMeta(
    'authorName',
  );
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
    'author_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _explicitMeta = const VerificationMeta(
    'explicit',
  );
  @override
  late final GeneratedColumn<bool> explicit = GeneratedColumn<bool>(
    'explicit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("explicit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> narrators =
      GeneratedColumn<String>(
        'narrators',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($AudiobooksTable.$converternarrators);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> genres =
      GeneratedColumn<String>(
        'genres',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($AudiobooksTable.$convertergenres);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($AudiobooksTable.$convertertags);
  @override
  late final GeneratedColumnWithTypeConverter<List<AudioTrackDomain>, String>
  tracks = GeneratedColumn<String>(
    'tracks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<AudioTrackDomain>>($AudiobooksTable.$convertertracks);
  @override
  late final GeneratedColumnWithTypeConverter<List<ChapterDomain>, String>
  chapters = GeneratedColumn<String>(
    'chapters',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<ChapterDomain>>($AudiobooksTable.$converterchapters);
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFinishedMeta = const VerificationMeta(
    'isFinished',
  );
  @override
  late final GeneratedColumn<bool> isFinished = GeneratedColumn<bool>(
    'is_finished',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_finished" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hideFromContinueListeningMeta =
      const VerificationMeta('hideFromContinueListening');
  @override
  late final GeneratedColumn<bool> hideFromContinueListening =
      GeneratedColumn<bool>(
        'hide_from_continue_listening',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("hide_from_continue_listening" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    libraryId,
    addedAt,
    updatedAt,
    isMissing,
    size,
    duration,
    title,
    authorName,
    description,
    language,
    explicit,
    narrators,
    genres,
    tags,
    tracks,
    chapters,
    progress,
    isFinished,
    hideFromContinueListening,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audiobooks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Audiobook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_missing')) {
      context.handle(
        _isMissingMeta,
        isMissing.isAcceptableOrUnknown(data['is_missing']!, _isMissingMeta),
      );
    } else if (isInserting) {
      context.missing(_isMissingMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('author_name')) {
      context.handle(
        _authorNameMeta,
        authorName.isAcceptableOrUnknown(data['author_name']!, _authorNameMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('explicit')) {
      context.handle(
        _explicitMeta,
        explicit.isAcceptableOrUnknown(data['explicit']!, _explicitMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('is_finished')) {
      context.handle(
        _isFinishedMeta,
        isFinished.isAcceptableOrUnknown(data['is_finished']!, _isFinishedMeta),
      );
    }
    if (data.containsKey('hide_from_continue_listening')) {
      context.handle(
        _hideFromContinueListeningMeta,
        hideFromContinueListening.isAcceptableOrUnknown(
          data['hide_from_continue_listening']!,
          _hideFromContinueListeningMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Audiobook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Audiobook(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isMissing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_missing'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      )!,
      duration: $AudiobooksTable.$converterduration.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}duration'],
        )!,
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      authorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      explicit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}explicit'],
      )!,
      narrators: $AudiobooksTable.$converternarrators.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}narrators'],
        )!,
      ),
      genres: $AudiobooksTable.$convertergenres.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}genres'],
        )!,
      ),
      tags: $AudiobooksTable.$convertertags.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        )!,
      ),
      tracks: $AudiobooksTable.$convertertracks.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tracks'],
        )!,
      ),
      chapters: $AudiobooksTable.$converterchapters.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}chapters'],
        )!,
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      isFinished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_finished'],
      )!,
      hideFromContinueListening: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}hide_from_continue_listening'],
      )!,
    );
  }

  @override
  $AudiobooksTable createAlias(String alias) {
    return $AudiobooksTable(attachedDatabase, alias);
  }

  static TypeConverter<Duration, int> $converterduration =
      const DurationConverter();
  static TypeConverter<List<String>, String> $converternarrators =
      const ListConverter<String>();
  static TypeConverter<List<String>, String> $convertergenres =
      const ListConverter<String>();
  static TypeConverter<List<String>, String> $convertertags =
      const ListConverter<String>();
  static TypeConverter<List<AudioTrackDomain>, String> $convertertracks =
      const JsonListConverter(fromJson: AudioTrackDomain.fromJson);
  static TypeConverter<List<ChapterDomain>, String> $converterchapters =
      const JsonListConverter(fromJson: ChapterDomain.fromJson);
}

class AudiobooksCompanion extends UpdateCompanion<Audiobook> {
  final Value<String> id;
  final Value<String> libraryId;
  final Value<DateTime> addedAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isMissing;
  final Value<int> size;
  final Value<Duration> duration;
  final Value<String?> title;
  final Value<String?> authorName;
  final Value<String?> description;
  final Value<String?> language;
  final Value<bool> explicit;
  final Value<List<String>> narrators;
  final Value<List<String>> genres;
  final Value<List<String>> tags;
  final Value<List<AudioTrackDomain>> tracks;
  final Value<List<ChapterDomain>> chapters;
  final Value<double> progress;
  final Value<bool> isFinished;
  final Value<bool> hideFromContinueListening;
  final Value<int> rowid;
  const AudiobooksCompanion({
    this.id = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isMissing = const Value.absent(),
    this.size = const Value.absent(),
    this.duration = const Value.absent(),
    this.title = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
    this.explicit = const Value.absent(),
    this.narrators = const Value.absent(),
    this.genres = const Value.absent(),
    this.tags = const Value.absent(),
    this.tracks = const Value.absent(),
    this.chapters = const Value.absent(),
    this.progress = const Value.absent(),
    this.isFinished = const Value.absent(),
    this.hideFromContinueListening = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AudiobooksCompanion.insert({
    required String id,
    required String libraryId,
    required DateTime addedAt,
    required DateTime updatedAt,
    required bool isMissing,
    required int size,
    required Duration duration,
    this.title = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
    this.explicit = const Value.absent(),
    required List<String> narrators,
    required List<String> genres,
    required List<String> tags,
    required List<AudioTrackDomain> tracks,
    required List<ChapterDomain> chapters,
    required double progress,
    this.isFinished = const Value.absent(),
    this.hideFromContinueListening = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       libraryId = Value(libraryId),
       addedAt = Value(addedAt),
       updatedAt = Value(updatedAt),
       isMissing = Value(isMissing),
       size = Value(size),
       duration = Value(duration),
       narrators = Value(narrators),
       genres = Value(genres),
       tags = Value(tags),
       tracks = Value(tracks),
       chapters = Value(chapters),
       progress = Value(progress);
  static Insertable<Audiobook> custom({
    Expression<String>? id,
    Expression<String>? libraryId,
    Expression<DateTime>? addedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isMissing,
    Expression<int>? size,
    Expression<int>? duration,
    Expression<String>? title,
    Expression<String>? authorName,
    Expression<String>? description,
    Expression<String>? language,
    Expression<bool>? explicit,
    Expression<String>? narrators,
    Expression<String>? genres,
    Expression<String>? tags,
    Expression<String>? tracks,
    Expression<String>? chapters,
    Expression<double>? progress,
    Expression<bool>? isFinished,
    Expression<bool>? hideFromContinueListening,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (libraryId != null) 'library_id': libraryId,
      if (addedAt != null) 'added_at': addedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isMissing != null) 'is_missing': isMissing,
      if (size != null) 'size': size,
      if (duration != null) 'duration': duration,
      if (title != null) 'title': title,
      if (authorName != null) 'author_name': authorName,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
      if (explicit != null) 'explicit': explicit,
      if (narrators != null) 'narrators': narrators,
      if (genres != null) 'genres': genres,
      if (tags != null) 'tags': tags,
      if (tracks != null) 'tracks': tracks,
      if (chapters != null) 'chapters': chapters,
      if (progress != null) 'progress': progress,
      if (isFinished != null) 'is_finished': isFinished,
      if (hideFromContinueListening != null)
        'hide_from_continue_listening': hideFromContinueListening,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AudiobooksCompanion copyWith({
    Value<String>? id,
    Value<String>? libraryId,
    Value<DateTime>? addedAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isMissing,
    Value<int>? size,
    Value<Duration>? duration,
    Value<String?>? title,
    Value<String?>? authorName,
    Value<String?>? description,
    Value<String?>? language,
    Value<bool>? explicit,
    Value<List<String>>? narrators,
    Value<List<String>>? genres,
    Value<List<String>>? tags,
    Value<List<AudioTrackDomain>>? tracks,
    Value<List<ChapterDomain>>? chapters,
    Value<double>? progress,
    Value<bool>? isFinished,
    Value<bool>? hideFromContinueListening,
    Value<int>? rowid,
  }) {
    return AudiobooksCompanion(
      id: id ?? this.id,
      libraryId: libraryId ?? this.libraryId,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isMissing: isMissing ?? this.isMissing,
      size: size ?? this.size,
      duration: duration ?? this.duration,
      title: title ?? this.title,
      authorName: authorName ?? this.authorName,
      description: description ?? this.description,
      language: language ?? this.language,
      explicit: explicit ?? this.explicit,
      narrators: narrators ?? this.narrators,
      genres: genres ?? this.genres,
      tags: tags ?? this.tags,
      tracks: tracks ?? this.tracks,
      chapters: chapters ?? this.chapters,
      progress: progress ?? this.progress,
      isFinished: isFinished ?? this.isFinished,
      hideFromContinueListening:
          hideFromContinueListening ?? this.hideFromContinueListening,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isMissing.present) {
      map['is_missing'] = Variable<bool>(isMissing.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(
        $AudiobooksTable.$converterduration.toSql(duration.value),
      );
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (explicit.present) {
      map['explicit'] = Variable<bool>(explicit.value);
    }
    if (narrators.present) {
      map['narrators'] = Variable<String>(
        $AudiobooksTable.$converternarrators.toSql(narrators.value),
      );
    }
    if (genres.present) {
      map['genres'] = Variable<String>(
        $AudiobooksTable.$convertergenres.toSql(genres.value),
      );
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
        $AudiobooksTable.$convertertags.toSql(tags.value),
      );
    }
    if (tracks.present) {
      map['tracks'] = Variable<String>(
        $AudiobooksTable.$convertertracks.toSql(tracks.value),
      );
    }
    if (chapters.present) {
      map['chapters'] = Variable<String>(
        $AudiobooksTable.$converterchapters.toSql(chapters.value),
      );
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (isFinished.present) {
      map['is_finished'] = Variable<bool>(isFinished.value);
    }
    if (hideFromContinueListening.present) {
      map['hide_from_continue_listening'] = Variable<bool>(
        hideFromContinueListening.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudiobooksCompanion(')
          ..write('id: $id, ')
          ..write('libraryId: $libraryId, ')
          ..write('addedAt: $addedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isMissing: $isMissing, ')
          ..write('size: $size, ')
          ..write('duration: $duration, ')
          ..write('title: $title, ')
          ..write('authorName: $authorName, ')
          ..write('description: $description, ')
          ..write('language: $language, ')
          ..write('explicit: $explicit, ')
          ..write('narrators: $narrators, ')
          ..write('genres: $genres, ')
          ..write('tags: $tags, ')
          ..write('tracks: $tracks, ')
          ..write('chapters: $chapters, ')
          ..write('progress: $progress, ')
          ..write('isFinished: $isFinished, ')
          ..write('hideFromContinueListening: $hideFromContinueListening, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$AudiobookInsertable implements Insertable<Audiobook> {
  Audiobook _object;
  _$AudiobookInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return AudiobooksCompanion(
      id: Value(_object.id),
      libraryId: Value(_object.libraryId),
      addedAt: Value(_object.addedAt),
      updatedAt: Value(_object.updatedAt),
      isMissing: Value(_object.isMissing),
      size: Value(_object.size),
      duration: Value(_object.duration),
      title: Value(_object.title),
      authorName: Value(_object.authorName),
      description: Value(_object.description),
      language: Value(_object.language),
      explicit: Value(_object.explicit),
      narrators: Value(_object.narrators),
      genres: Value(_object.genres),
      tags: Value(_object.tags),
      tracks: Value(_object.tracks),
      chapters: Value(_object.chapters),
      progress: Value(_object.progress),
      isFinished: Value(_object.isFinished),
      hideFromContinueListening: Value(_object.hideFromContinueListening),
    ).toColumns(false);
  }
}

extension AudiobookToInsertable on Audiobook {
  _$AudiobookInsertable toInsertable() {
    return _$AudiobookInsertable(this);
  }
}

class $PodcastsTable extends Podcasts with TableInfo<$PodcastsTable, Podcast> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodcastsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isMissingMeta = const VerificationMeta(
    'isMissing',
  );
  @override
  late final GeneratedColumn<bool> isMissing = GeneratedColumn<bool>(
    'is_missing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_missing" IN (0, 1))',
    ),
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<String> episodeId = GeneratedColumn<String>(
    'episode_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorNameMeta = const VerificationMeta(
    'authorName',
  );
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
    'author_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _explicitMeta = const VerificationMeta(
    'explicit',
  );
  @override
  late final GeneratedColumn<bool> explicit = GeneratedColumn<bool>(
    'explicit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("explicit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> genres =
      GeneratedColumn<String>(
        'genres',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($PodcastsTable.$convertergenres);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($PodcastsTable.$convertertags);
  @override
  late final GeneratedColumnWithTypeConverter<
    List<PodcastEpisodeDomain>,
    String
  >
  episodes =
      GeneratedColumn<String>(
        'episodes',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<PodcastEpisodeDomain>>(
        $PodcastsTable.$converterepisodes,
      );
  @override
  late final GeneratedColumnWithTypeConverter<Uri?, String> feedUrl =
      GeneratedColumn<String>(
        'feed_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Uri?>($PodcastsTable.$converterfeedUrln);
  static const VerificationMeta _lastEpisodeCheckMeta = const VerificationMeta(
    'lastEpisodeCheck',
  );
  @override
  late final GeneratedColumn<DateTime> lastEpisodeCheck =
      GeneratedColumn<DateTime>(
        'last_episode_check',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFinishedMeta = const VerificationMeta(
    'isFinished',
  );
  @override
  late final GeneratedColumn<bool> isFinished = GeneratedColumn<bool>(
    'is_finished',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_finished" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hideFromContinueListeningMeta =
      const VerificationMeta('hideFromContinueListening');
  @override
  late final GeneratedColumn<bool> hideFromContinueListening =
      GeneratedColumn<bool>(
        'hide_from_continue_listening',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("hide_from_continue_listening" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    libraryId,
    addedAt,
    updatedAt,
    isMissing,
    size,
    episodeId,
    title,
    authorName,
    description,
    language,
    explicit,
    genres,
    tags,
    episodes,
    feedUrl,
    lastEpisodeCheck,
    progress,
    isFinished,
    hideFromContinueListening,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'podcasts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Podcast> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_missing')) {
      context.handle(
        _isMissingMeta,
        isMissing.isAcceptableOrUnknown(data['is_missing']!, _isMissingMeta),
      );
    } else if (isInserting) {
      context.missing(_isMissingMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('author_name')) {
      context.handle(
        _authorNameMeta,
        authorName.isAcceptableOrUnknown(data['author_name']!, _authorNameMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('explicit')) {
      context.handle(
        _explicitMeta,
        explicit.isAcceptableOrUnknown(data['explicit']!, _explicitMeta),
      );
    }
    if (data.containsKey('last_episode_check')) {
      context.handle(
        _lastEpisodeCheckMeta,
        lastEpisodeCheck.isAcceptableOrUnknown(
          data['last_episode_check']!,
          _lastEpisodeCheckMeta,
        ),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('is_finished')) {
      context.handle(
        _isFinishedMeta,
        isFinished.isAcceptableOrUnknown(data['is_finished']!, _isFinishedMeta),
      );
    }
    if (data.containsKey('hide_from_continue_listening')) {
      context.handle(
        _hideFromContinueListeningMeta,
        hideFromContinueListening.isAcceptableOrUnknown(
          data['hide_from_continue_listening']!,
          _hideFromContinueListeningMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Podcast map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Podcast(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isMissing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_missing'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      )!,
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}episode_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      authorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      explicit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}explicit'],
      )!,
      genres: $PodcastsTable.$convertergenres.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}genres'],
        )!,
      ),
      tags: $PodcastsTable.$convertertags.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        )!,
      ),
      episodes: $PodcastsTable.$converterepisodes.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}episodes'],
        )!,
      ),
      feedUrl: $PodcastsTable.$converterfeedUrln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}feed_url'],
        ),
      ),
      lastEpisodeCheck: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_episode_check'],
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      isFinished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_finished'],
      )!,
      hideFromContinueListening: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}hide_from_continue_listening'],
      )!,
    );
  }

  @override
  $PodcastsTable createAlias(String alias) {
    return $PodcastsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertergenres =
      const ListConverter<String>();
  static TypeConverter<List<String>, String> $convertertags =
      const ListConverter<String>();
  static TypeConverter<List<PodcastEpisodeDomain>, String> $converterepisodes =
      const JsonListConverter(fromJson: PodcastEpisodeDomain.fromJson);
  static TypeConverter<Uri, String> $converterfeedUrl = const UriConverter();
  static TypeConverter<Uri?, String?> $converterfeedUrln =
      NullAwareTypeConverter.wrap($converterfeedUrl);
}

class PodcastsCompanion extends UpdateCompanion<Podcast> {
  final Value<String> id;
  final Value<String> libraryId;
  final Value<DateTime> addedAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isMissing;
  final Value<int> size;
  final Value<String?> episodeId;
  final Value<String?> title;
  final Value<String?> authorName;
  final Value<String?> description;
  final Value<String?> language;
  final Value<bool> explicit;
  final Value<List<String>> genres;
  final Value<List<String>> tags;
  final Value<List<PodcastEpisodeDomain>> episodes;
  final Value<Uri?> feedUrl;
  final Value<DateTime?> lastEpisodeCheck;
  final Value<double> progress;
  final Value<bool> isFinished;
  final Value<bool> hideFromContinueListening;
  final Value<int> rowid;
  const PodcastsCompanion({
    this.id = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isMissing = const Value.absent(),
    this.size = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.title = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
    this.explicit = const Value.absent(),
    this.genres = const Value.absent(),
    this.tags = const Value.absent(),
    this.episodes = const Value.absent(),
    this.feedUrl = const Value.absent(),
    this.lastEpisodeCheck = const Value.absent(),
    this.progress = const Value.absent(),
    this.isFinished = const Value.absent(),
    this.hideFromContinueListening = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PodcastsCompanion.insert({
    required String id,
    required String libraryId,
    required DateTime addedAt,
    required DateTime updatedAt,
    required bool isMissing,
    required int size,
    this.episodeId = const Value.absent(),
    this.title = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
    this.explicit = const Value.absent(),
    required List<String> genres,
    required List<String> tags,
    required List<PodcastEpisodeDomain> episodes,
    this.feedUrl = const Value.absent(),
    this.lastEpisodeCheck = const Value.absent(),
    required double progress,
    this.isFinished = const Value.absent(),
    this.hideFromContinueListening = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       libraryId = Value(libraryId),
       addedAt = Value(addedAt),
       updatedAt = Value(updatedAt),
       isMissing = Value(isMissing),
       size = Value(size),
       genres = Value(genres),
       tags = Value(tags),
       episodes = Value(episodes),
       progress = Value(progress);
  static Insertable<Podcast> custom({
    Expression<String>? id,
    Expression<String>? libraryId,
    Expression<DateTime>? addedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isMissing,
    Expression<int>? size,
    Expression<String>? episodeId,
    Expression<String>? title,
    Expression<String>? authorName,
    Expression<String>? description,
    Expression<String>? language,
    Expression<bool>? explicit,
    Expression<String>? genres,
    Expression<String>? tags,
    Expression<String>? episodes,
    Expression<String>? feedUrl,
    Expression<DateTime>? lastEpisodeCheck,
    Expression<double>? progress,
    Expression<bool>? isFinished,
    Expression<bool>? hideFromContinueListening,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (libraryId != null) 'library_id': libraryId,
      if (addedAt != null) 'added_at': addedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isMissing != null) 'is_missing': isMissing,
      if (size != null) 'size': size,
      if (episodeId != null) 'episode_id': episodeId,
      if (title != null) 'title': title,
      if (authorName != null) 'author_name': authorName,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
      if (explicit != null) 'explicit': explicit,
      if (genres != null) 'genres': genres,
      if (tags != null) 'tags': tags,
      if (episodes != null) 'episodes': episodes,
      if (feedUrl != null) 'feed_url': feedUrl,
      if (lastEpisodeCheck != null) 'last_episode_check': lastEpisodeCheck,
      if (progress != null) 'progress': progress,
      if (isFinished != null) 'is_finished': isFinished,
      if (hideFromContinueListening != null)
        'hide_from_continue_listening': hideFromContinueListening,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PodcastsCompanion copyWith({
    Value<String>? id,
    Value<String>? libraryId,
    Value<DateTime>? addedAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isMissing,
    Value<int>? size,
    Value<String?>? episodeId,
    Value<String?>? title,
    Value<String?>? authorName,
    Value<String?>? description,
    Value<String?>? language,
    Value<bool>? explicit,
    Value<List<String>>? genres,
    Value<List<String>>? tags,
    Value<List<PodcastEpisodeDomain>>? episodes,
    Value<Uri?>? feedUrl,
    Value<DateTime?>? lastEpisodeCheck,
    Value<double>? progress,
    Value<bool>? isFinished,
    Value<bool>? hideFromContinueListening,
    Value<int>? rowid,
  }) {
    return PodcastsCompanion(
      id: id ?? this.id,
      libraryId: libraryId ?? this.libraryId,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isMissing: isMissing ?? this.isMissing,
      size: size ?? this.size,
      episodeId: episodeId ?? this.episodeId,
      title: title ?? this.title,
      authorName: authorName ?? this.authorName,
      description: description ?? this.description,
      language: language ?? this.language,
      explicit: explicit ?? this.explicit,
      genres: genres ?? this.genres,
      tags: tags ?? this.tags,
      episodes: episodes ?? this.episodes,
      feedUrl: feedUrl ?? this.feedUrl,
      lastEpisodeCheck: lastEpisodeCheck ?? this.lastEpisodeCheck,
      progress: progress ?? this.progress,
      isFinished: isFinished ?? this.isFinished,
      hideFromContinueListening:
          hideFromContinueListening ?? this.hideFromContinueListening,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isMissing.present) {
      map['is_missing'] = Variable<bool>(isMissing.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<String>(episodeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (explicit.present) {
      map['explicit'] = Variable<bool>(explicit.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(
        $PodcastsTable.$convertergenres.toSql(genres.value),
      );
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
        $PodcastsTable.$convertertags.toSql(tags.value),
      );
    }
    if (episodes.present) {
      map['episodes'] = Variable<String>(
        $PodcastsTable.$converterepisodes.toSql(episodes.value),
      );
    }
    if (feedUrl.present) {
      map['feed_url'] = Variable<String>(
        $PodcastsTable.$converterfeedUrln.toSql(feedUrl.value),
      );
    }
    if (lastEpisodeCheck.present) {
      map['last_episode_check'] = Variable<DateTime>(lastEpisodeCheck.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (isFinished.present) {
      map['is_finished'] = Variable<bool>(isFinished.value);
    }
    if (hideFromContinueListening.present) {
      map['hide_from_continue_listening'] = Variable<bool>(
        hideFromContinueListening.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastsCompanion(')
          ..write('id: $id, ')
          ..write('libraryId: $libraryId, ')
          ..write('addedAt: $addedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isMissing: $isMissing, ')
          ..write('size: $size, ')
          ..write('episodeId: $episodeId, ')
          ..write('title: $title, ')
          ..write('authorName: $authorName, ')
          ..write('description: $description, ')
          ..write('language: $language, ')
          ..write('explicit: $explicit, ')
          ..write('genres: $genres, ')
          ..write('tags: $tags, ')
          ..write('episodes: $episodes, ')
          ..write('feedUrl: $feedUrl, ')
          ..write('lastEpisodeCheck: $lastEpisodeCheck, ')
          ..write('progress: $progress, ')
          ..write('isFinished: $isFinished, ')
          ..write('hideFromContinueListening: $hideFromContinueListening, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$PodcastInsertable implements Insertable<Podcast> {
  Podcast _object;
  _$PodcastInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PodcastsCompanion(
      id: Value(_object.id),
      libraryId: Value(_object.libraryId),
      addedAt: Value(_object.addedAt),
      updatedAt: Value(_object.updatedAt),
      isMissing: Value(_object.isMissing),
      size: Value(_object.size),
      episodeId: Value(_object.episodeId),
      title: Value(_object.title),
      authorName: Value(_object.authorName),
      description: Value(_object.description),
      language: Value(_object.language),
      explicit: Value(_object.explicit),
      genres: Value(_object.genres),
      tags: Value(_object.tags),
      episodes: Value(_object.episodes),
      feedUrl: Value(_object.feedUrl),
      lastEpisodeCheck: Value(_object.lastEpisodeCheck),
      progress: Value(_object.progress),
      isFinished: Value(_object.isFinished),
      hideFromContinueListening: Value(_object.hideFromContinueListening),
    ).toColumns(false);
  }
}

extension PodcastToInsertable on Podcast {
  _$PodcastInsertable toInsertable() {
    return _$PodcastInsertable(this);
  }
}

class $SeriesTableTable extends SeriesTable
    with TableInfo<$SeriesTableTable, SeriesDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameIgnorePrefixMeta = const VerificationMeta(
    'nameIgnorePrefix',
  );
  @override
  late final GeneratedColumn<String> nameIgnorePrefix = GeneratedColumn<String>(
    'name_ignore_prefix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFinishedMeta = const VerificationMeta(
    'isFinished',
  );
  @override
  late final GeneratedColumn<bool> isFinished = GeneratedColumn<bool>(
    'is_finished',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_finished" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    libraryId,
    name,
    nameIgnorePrefix,
    description,
    addedAt,
    updatedAt,
    isFinished,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_ignore_prefix')) {
      context.handle(
        _nameIgnorePrefixMeta,
        nameIgnorePrefix.isAcceptableOrUnknown(
          data['name_ignore_prefix']!,
          _nameIgnorePrefixMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_finished')) {
      context.handle(
        _isFinishedMeta,
        isFinished.isAcceptableOrUnknown(data['is_finished']!, _isFinishedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SeriesDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesDomain(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
      nameIgnorePrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ignore_prefix'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isFinished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_finished'],
      )!,
    );
  }

  @override
  $SeriesTableTable createAlias(String alias) {
    return $SeriesTableTable(attachedDatabase, alias);
  }
}

class SeriesTableCompanion extends UpdateCompanion<SeriesDomain> {
  final Value<String> id;
  final Value<String> libraryId;
  final Value<String> name;
  final Value<String?> nameIgnorePrefix;
  final Value<String?> description;
  final Value<DateTime?> addedAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isFinished;
  final Value<int> rowid;
  const SeriesTableCompanion({
    this.id = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.name = const Value.absent(),
    this.nameIgnorePrefix = const Value.absent(),
    this.description = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isFinished = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeriesTableCompanion.insert({
    required String id,
    required String libraryId,
    required String name,
    this.nameIgnorePrefix = const Value.absent(),
    this.description = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isFinished = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       libraryId = Value(libraryId),
       name = Value(name);
  static Insertable<SeriesDomain> custom({
    Expression<String>? id,
    Expression<String>? libraryId,
    Expression<String>? name,
    Expression<String>? nameIgnorePrefix,
    Expression<String>? description,
    Expression<DateTime>? addedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isFinished,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (libraryId != null) 'library_id': libraryId,
      if (name != null) 'name': name,
      if (nameIgnorePrefix != null) 'name_ignore_prefix': nameIgnorePrefix,
      if (description != null) 'description': description,
      if (addedAt != null) 'added_at': addedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isFinished != null) 'is_finished': isFinished,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeriesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? libraryId,
    Value<String>? name,
    Value<String?>? nameIgnorePrefix,
    Value<String?>? description,
    Value<DateTime?>? addedAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isFinished,
    Value<int>? rowid,
  }) {
    return SeriesTableCompanion(
      id: id ?? this.id,
      libraryId: libraryId ?? this.libraryId,
      name: name ?? this.name,
      nameIgnorePrefix: nameIgnorePrefix ?? this.nameIgnorePrefix,
      description: description ?? this.description,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFinished: isFinished ?? this.isFinished,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameIgnorePrefix.present) {
      map['name_ignore_prefix'] = Variable<String>(nameIgnorePrefix.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isFinished.present) {
      map['is_finished'] = Variable<bool>(isFinished.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesTableCompanion(')
          ..write('id: $id, ')
          ..write('libraryId: $libraryId, ')
          ..write('name: $name, ')
          ..write('nameIgnorePrefix: $nameIgnorePrefix, ')
          ..write('description: $description, ')
          ..write('addedAt: $addedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFinished: $isFinished, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$SeriesDomainInsertable implements Insertable<SeriesDomain> {
  SeriesDomain _object;
  _$SeriesDomainInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return SeriesTableCompanion(
      id: Value(_object.id),
      libraryId: Value(_object.libraryId),
      name: Value(_object.name),
      nameIgnorePrefix: Value(_object.nameIgnorePrefix),
      description: Value(_object.description),
      addedAt: Value(_object.addedAt),
      updatedAt: Value(_object.updatedAt),
      isFinished: Value(_object.isFinished),
    ).toColumns(false);
  }
}

extension SeriesDomainToInsertable on SeriesDomain {
  _$SeriesDomainInsertable toInsertable() {
    return _$SeriesDomainInsertable(this);
  }
}

class $AudiobookSeriesTable extends AudiobookSeries
    with TableInfo<$AudiobookSeriesTable, AudiobookSeriesLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudiobookSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _audiobookIdMeta = const VerificationMeta(
    'audiobookId',
  );
  @override
  late final GeneratedColumn<String> audiobookId = GeneratedColumn<String>(
    'audiobook_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audiobooks (id)',
    ),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<String> seriesId = GeneratedColumn<String>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series_table (id)',
    ),
  );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraries (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [audiobookId, seriesId, libraryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audiobook_series';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudiobookSeriesLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('audiobook_id')) {
      context.handle(
        _audiobookIdMeta,
        audiobookId.isAcceptableOrUnknown(
          data['audiobook_id']!,
          _audiobookIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_audiobookIdMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {audiobookId, seriesId, libraryId};
  @override
  AudiobookSeriesLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudiobookSeriesLink(
      audiobookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audiobook_id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_id'],
      )!,
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
    );
  }

  @override
  $AudiobookSeriesTable createAlias(String alias) {
    return $AudiobookSeriesTable(attachedDatabase, alias);
  }
}

class AudiobookSeriesLink extends DataClass
    implements Insertable<AudiobookSeriesLink> {
  final String audiobookId;
  final String seriesId;
  final String libraryId;
  const AudiobookSeriesLink({
    required this.audiobookId,
    required this.seriesId,
    required this.libraryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['audiobook_id'] = Variable<String>(audiobookId);
    map['series_id'] = Variable<String>(seriesId);
    map['library_id'] = Variable<String>(libraryId);
    return map;
  }

  AudiobookSeriesCompanion toCompanion(bool nullToAbsent) {
    return AudiobookSeriesCompanion(
      audiobookId: Value(audiobookId),
      seriesId: Value(seriesId),
      libraryId: Value(libraryId),
    );
  }

  factory AudiobookSeriesLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudiobookSeriesLink(
      audiobookId: serializer.fromJson<String>(json['audiobookId']),
      seriesId: serializer.fromJson<String>(json['seriesId']),
      libraryId: serializer.fromJson<String>(json['libraryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'audiobookId': serializer.toJson<String>(audiobookId),
      'seriesId': serializer.toJson<String>(seriesId),
      'libraryId': serializer.toJson<String>(libraryId),
    };
  }

  AudiobookSeriesLink copyWith({
    String? audiobookId,
    String? seriesId,
    String? libraryId,
  }) => AudiobookSeriesLink(
    audiobookId: audiobookId ?? this.audiobookId,
    seriesId: seriesId ?? this.seriesId,
    libraryId: libraryId ?? this.libraryId,
  );
  AudiobookSeriesLink copyWithCompanion(AudiobookSeriesCompanion data) {
    return AudiobookSeriesLink(
      audiobookId: data.audiobookId.present
          ? data.audiobookId.value
          : this.audiobookId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      libraryId: data.libraryId.present ? data.libraryId.value : this.libraryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudiobookSeriesLink(')
          ..write('audiobookId: $audiobookId, ')
          ..write('seriesId: $seriesId, ')
          ..write('libraryId: $libraryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(audiobookId, seriesId, libraryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudiobookSeriesLink &&
          other.audiobookId == this.audiobookId &&
          other.seriesId == this.seriesId &&
          other.libraryId == this.libraryId);
}

class AudiobookSeriesCompanion extends UpdateCompanion<AudiobookSeriesLink> {
  final Value<String> audiobookId;
  final Value<String> seriesId;
  final Value<String> libraryId;
  final Value<int> rowid;
  const AudiobookSeriesCompanion({
    this.audiobookId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AudiobookSeriesCompanion.insert({
    required String audiobookId,
    required String seriesId,
    required String libraryId,
    this.rowid = const Value.absent(),
  }) : audiobookId = Value(audiobookId),
       seriesId = Value(seriesId),
       libraryId = Value(libraryId);
  static Insertable<AudiobookSeriesLink> custom({
    Expression<String>? audiobookId,
    Expression<String>? seriesId,
    Expression<String>? libraryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (audiobookId != null) 'audiobook_id': audiobookId,
      if (seriesId != null) 'series_id': seriesId,
      if (libraryId != null) 'library_id': libraryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AudiobookSeriesCompanion copyWith({
    Value<String>? audiobookId,
    Value<String>? seriesId,
    Value<String>? libraryId,
    Value<int>? rowid,
  }) {
    return AudiobookSeriesCompanion(
      audiobookId: audiobookId ?? this.audiobookId,
      seriesId: seriesId ?? this.seriesId,
      libraryId: libraryId ?? this.libraryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (audiobookId.present) {
      map['audiobook_id'] = Variable<String>(audiobookId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<String>(seriesId.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudiobookSeriesCompanion(')
          ..write('audiobookId: $audiobookId, ')
          ..write('seriesId: $seriesId, ')
          ..write('libraryId: $libraryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthorsTable extends Authors
    with TableInfo<$AuthorsTable, AuthorDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    libraryId,
    name,
    description,
    addedAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authors';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthorDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthorDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthorDomain(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(attachedDatabase, alias);
  }
}

class AuthorsCompanion extends UpdateCompanion<AuthorDomain> {
  final Value<String> id;
  final Value<String> libraryId;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime?> addedAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthorsCompanion.insert({
    required String id,
    required String libraryId,
    required String name,
    this.description = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       libraryId = Value(libraryId),
       name = Value(name);
  static Insertable<AuthorDomain> custom({
    Expression<String>? id,
    Expression<String>? libraryId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? addedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (libraryId != null) 'library_id': libraryId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (addedAt != null) 'added_at': addedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthorsCompanion copyWith({
    Value<String>? id,
    Value<String>? libraryId,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime?>? addedAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return AuthorsCompanion(
      id: id ?? this.id,
      libraryId: libraryId ?? this.libraryId,
      name: name ?? this.name,
      description: description ?? this.description,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsCompanion(')
          ..write('id: $id, ')
          ..write('libraryId: $libraryId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('addedAt: $addedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$AuthorDomainInsertable implements Insertable<AuthorDomain> {
  AuthorDomain _object;
  _$AuthorDomainInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return AuthorsCompanion(
      id: Value(_object.id),
      libraryId: Value(_object.libraryId),
      name: Value(_object.name),
      description: Value(_object.description),
      addedAt: Value(_object.addedAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension AuthorDomainToInsertable on AuthorDomain {
  _$AuthorDomainInsertable toInsertable() {
    return _$AuthorDomainInsertable(this);
  }
}

class $AudiobookAuthorsTable extends AudiobookAuthors
    with TableInfo<$AudiobookAuthorsTable, AudiobookAuthorsLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudiobookAuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _audiobookIdMeta = const VerificationMeta(
    'audiobookId',
  );
  @override
  late final GeneratedColumn<String> audiobookId = GeneratedColumn<String>(
    'audiobook_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audiobooks (id)',
    ),
  );
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES authors (id)',
    ),
  );
  static const VerificationMeta _libraryIdMeta = const VerificationMeta(
    'libraryId',
  );
  @override
  late final GeneratedColumn<String> libraryId = GeneratedColumn<String>(
    'library_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraries (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [audiobookId, authorId, libraryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audiobook_authors';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudiobookAuthorsLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('audiobook_id')) {
      context.handle(
        _audiobookIdMeta,
        audiobookId.isAcceptableOrUnknown(
          data['audiobook_id']!,
          _audiobookIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_audiobookIdMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('library_id')) {
      context.handle(
        _libraryIdMeta,
        libraryId.isAcceptableOrUnknown(data['library_id']!, _libraryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_libraryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {audiobookId, authorId, libraryId};
  @override
  AudiobookAuthorsLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudiobookAuthorsLink(
      audiobookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audiobook_id'],
      )!,
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_id'],
      )!,
      libraryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}library_id'],
      )!,
    );
  }

  @override
  $AudiobookAuthorsTable createAlias(String alias) {
    return $AudiobookAuthorsTable(attachedDatabase, alias);
  }
}

class AudiobookAuthorsLink extends DataClass
    implements Insertable<AudiobookAuthorsLink> {
  final String audiobookId;
  final String authorId;
  final String libraryId;
  const AudiobookAuthorsLink({
    required this.audiobookId,
    required this.authorId,
    required this.libraryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['audiobook_id'] = Variable<String>(audiobookId);
    map['author_id'] = Variable<String>(authorId);
    map['library_id'] = Variable<String>(libraryId);
    return map;
  }

  AudiobookAuthorsCompanion toCompanion(bool nullToAbsent) {
    return AudiobookAuthorsCompanion(
      audiobookId: Value(audiobookId),
      authorId: Value(authorId),
      libraryId: Value(libraryId),
    );
  }

  factory AudiobookAuthorsLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudiobookAuthorsLink(
      audiobookId: serializer.fromJson<String>(json['audiobookId']),
      authorId: serializer.fromJson<String>(json['authorId']),
      libraryId: serializer.fromJson<String>(json['libraryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'audiobookId': serializer.toJson<String>(audiobookId),
      'authorId': serializer.toJson<String>(authorId),
      'libraryId': serializer.toJson<String>(libraryId),
    };
  }

  AudiobookAuthorsLink copyWith({
    String? audiobookId,
    String? authorId,
    String? libraryId,
  }) => AudiobookAuthorsLink(
    audiobookId: audiobookId ?? this.audiobookId,
    authorId: authorId ?? this.authorId,
    libraryId: libraryId ?? this.libraryId,
  );
  AudiobookAuthorsLink copyWithCompanion(AudiobookAuthorsCompanion data) {
    return AudiobookAuthorsLink(
      audiobookId: data.audiobookId.present
          ? data.audiobookId.value
          : this.audiobookId,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      libraryId: data.libraryId.present ? data.libraryId.value : this.libraryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudiobookAuthorsLink(')
          ..write('audiobookId: $audiobookId, ')
          ..write('authorId: $authorId, ')
          ..write('libraryId: $libraryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(audiobookId, authorId, libraryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudiobookAuthorsLink &&
          other.audiobookId == this.audiobookId &&
          other.authorId == this.authorId &&
          other.libraryId == this.libraryId);
}

class AudiobookAuthorsCompanion extends UpdateCompanion<AudiobookAuthorsLink> {
  final Value<String> audiobookId;
  final Value<String> authorId;
  final Value<String> libraryId;
  final Value<int> rowid;
  const AudiobookAuthorsCompanion({
    this.audiobookId = const Value.absent(),
    this.authorId = const Value.absent(),
    this.libraryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AudiobookAuthorsCompanion.insert({
    required String audiobookId,
    required String authorId,
    required String libraryId,
    this.rowid = const Value.absent(),
  }) : audiobookId = Value(audiobookId),
       authorId = Value(authorId),
       libraryId = Value(libraryId);
  static Insertable<AudiobookAuthorsLink> custom({
    Expression<String>? audiobookId,
    Expression<String>? authorId,
    Expression<String>? libraryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (audiobookId != null) 'audiobook_id': audiobookId,
      if (authorId != null) 'author_id': authorId,
      if (libraryId != null) 'library_id': libraryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AudiobookAuthorsCompanion copyWith({
    Value<String>? audiobookId,
    Value<String>? authorId,
    Value<String>? libraryId,
    Value<int>? rowid,
  }) {
    return AudiobookAuthorsCompanion(
      audiobookId: audiobookId ?? this.audiobookId,
      authorId: authorId ?? this.authorId,
      libraryId: libraryId ?? this.libraryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (audiobookId.present) {
      map['audiobook_id'] = Variable<String>(audiobookId.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (libraryId.present) {
      map['library_id'] = Variable<String>(libraryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudiobookAuthorsCompanion(')
          ..write('audiobookId: $audiobookId, ')
          ..write('authorId: $authorId, ')
          ..write('libraryId: $libraryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ServersTable servers = $ServersTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AppLogsTable appLogs = $AppLogsTable(this);
  late final $LibrariesTable libraries = $LibrariesTable(this);
  late final $AudiobooksTable audiobooks = $AudiobooksTable(this);
  late final $PodcastsTable podcasts = $PodcastsTable(this);
  late final $SeriesTableTable seriesTable = $SeriesTableTable(this);
  late final $AudiobookSeriesTable audiobookSeries = $AudiobookSeriesTable(
    this,
  );
  late final $AuthorsTable authors = $AuthorsTable(this);
  late final $AudiobookAuthorsTable audiobookAuthors = $AudiobookAuthorsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    servers,
    users,
    appLogs,
    libraries,
    audiobooks,
    podcasts,
    seriesTable,
    audiobookSeries,
    authors,
    audiobookAuthors,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'servers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('users', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'servers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('libraries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('audiobooks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('podcasts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('series_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('audiobook_series', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('authors', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('audiobook_authors', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ServersTableCreateCompanionBuilder =
    ServersCompanion Function({required Uri url, Value<int> rowid});
typedef $$ServersTableUpdateCompanionBuilder =
    ServersCompanion Function({Value<Uri> url, Value<int> rowid});

final class $$ServersTableReferences
    extends BaseReferences<_$AppDatabase, $ServersTable, Server> {
  $$ServersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<UserDomain>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: $_aliasNameGenerator(db.servers.url, db.users.serverUrl),
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.serverUrl.url.sqlEquals($_itemColumn<String>('url')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LibrariesTable, List<LibraryDomain>>
  _librariesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.libraries,
    aliasName: $_aliasNameGenerator(db.servers.url, db.libraries.serverUrl),
  );

  $$LibrariesTableProcessedTableManager get librariesRefs {
    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.serverUrl.url.sqlEquals($_itemColumn<String>('url')!));

    final cache = $_typedResult.readTableOrNull(_librariesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ServersTableFilterComposer
    extends Composer<_$AppDatabase, $ServersTable> {
  $$ServersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<Uri, Uri, String> get url =>
      $composableBuilder(
        column: $table.url,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.serverUrl,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> librariesRefs(
    Expression<bool> Function($$LibrariesTableFilterComposer f) f,
  ) {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.serverUrl,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServersTableOrderingComposer
    extends Composer<_$AppDatabase, $ServersTable> {
  $$ServersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServersTable> {
  $$ServersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<Uri, String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.serverUrl,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> librariesRefs<T extends Object>(
    Expression<T> Function($$LibrariesTableAnnotationComposer a) f,
  ) {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.serverUrl,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServersTable,
          Server,
          $$ServersTableFilterComposer,
          $$ServersTableOrderingComposer,
          $$ServersTableAnnotationComposer,
          $$ServersTableCreateCompanionBuilder,
          $$ServersTableUpdateCompanionBuilder,
          (Server, $$ServersTableReferences),
          Server,
          PrefetchHooks Function({bool usersRefs, bool librariesRefs})
        > {
  $$ServersTableTableManager(_$AppDatabase db, $ServersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<Uri> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServersCompanion(url: url, rowid: rowid),
          createCompanionCallback:
              ({required Uri url, Value<int> rowid = const Value.absent()}) =>
                  ServersCompanion.insert(url: url, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usersRefs = false, librariesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (usersRefs) db.users,
                if (librariesRefs) db.libraries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<
                      Server,
                      $ServersTable,
                      UserDomain
                    >(
                      currentTable: table,
                      referencedTable: $$ServersTableReferences._usersRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$ServersTableReferences(db, table, p0).usersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.serverUrl == item.url),
                      typedResults: items,
                    ),
                  if (librariesRefs)
                    await $_getPrefetchedData<
                      Server,
                      $ServersTable,
                      LibraryDomain
                    >(
                      currentTable: table,
                      referencedTable: $$ServersTableReferences
                          ._librariesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ServersTableReferences(db, table, p0).librariesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.serverUrl == item.url),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ServersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServersTable,
      Server,
      $$ServersTableFilterComposer,
      $$ServersTableOrderingComposer,
      $$ServersTableAnnotationComposer,
      $$ServersTableCreateCompanionBuilder,
      $$ServersTableUpdateCompanionBuilder,
      (Server, $$ServersTableReferences),
      Server,
      PrefetchHooks Function({bool usersRefs, bool librariesRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String username,
      required String userType,
      required Uri serverUrl,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> username,
      Value<String> userType,
      Value<Uri> serverUrl,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserDomain> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ServersTable _serverUrlTable(_$AppDatabase db) => db.servers
      .createAlias($_aliasNameGenerator(db.users.serverUrl, db.servers.url));

  $$ServersTableProcessedTableManager get serverUrl {
    final $_column = $_itemColumn<String>('server_url')!;

    final manager = $$ServersTableTableManager(
      $_db,
      $_db.servers,
    ).filter((f) => f.url.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_serverUrlTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userType => $composableBuilder(
    column: $table.userType,
    builder: (column) => ColumnFilters(column),
  );

  $$ServersTableFilterComposer get serverUrl {
    final $$ServersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serverUrl,
      referencedTable: $db.servers,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServersTableFilterComposer(
            $db: $db,
            $table: $db.servers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userType => $composableBuilder(
    column: $table.userType,
    builder: (column) => ColumnOrderings(column),
  );

  $$ServersTableOrderingComposer get serverUrl {
    final $$ServersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serverUrl,
      referencedTable: $db.servers,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServersTableOrderingComposer(
            $db: $db,
            $table: $db.servers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get userType =>
      $composableBuilder(column: $table.userType, builder: (column) => column);

  $$ServersTableAnnotationComposer get serverUrl {
    final $$ServersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serverUrl,
      referencedTable: $db.servers,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServersTableAnnotationComposer(
            $db: $db,
            $table: $db.servers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          UserDomain,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (UserDomain, $$UsersTableReferences),
          UserDomain,
          PrefetchHooks Function({bool serverUrl})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> userType = const Value.absent(),
                Value<Uri> serverUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                userType: userType,
                serverUrl: serverUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String username,
                required String userType,
                required Uri serverUrl,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                userType: userType,
                serverUrl: serverUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({serverUrl = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (serverUrl) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.serverUrl,
                                referencedTable: $$UsersTableReferences
                                    ._serverUrlTable(db),
                                referencedColumn: $$UsersTableReferences
                                    ._serverUrlTable(db)
                                    .url,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      UserDomain,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (UserDomain, $$UsersTableReferences),
      UserDomain,
      PrefetchHooks Function({bool serverUrl})
    >;
typedef $$AppLogsTableCreateCompanionBuilder =
    AppLogsCompanion Function({
      required DateTime timestamp,
      required String message,
      required LogLevelDomain level,
      Value<String?> source,
      Value<String?> stackTrace,
      Value<int> rowid,
    });
typedef $$AppLogsTableUpdateCompanionBuilder =
    AppLogsCompanion Function({
      Value<DateTime> timestamp,
      Value<String> message,
      Value<LogLevelDomain> level,
      Value<String?> source,
      Value<String?> stackTrace,
      Value<int> rowid,
    });

class $$AppLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AppLogsTable> {
  $$AppLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LogLevelDomain, LogLevelDomain, String>
  get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stackTrace => $composableBuilder(
    column: $table.stackTrace,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppLogsTable> {
  $$AppLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stackTrace => $composableBuilder(
    column: $table.stackTrace,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppLogsTable> {
  $$AppLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogLevelDomain, String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get stackTrace => $composableBuilder(
    column: $table.stackTrace,
    builder: (column) => column,
  );
}

class $$AppLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppLogsTable,
          LogEntry,
          $$AppLogsTableFilterComposer,
          $$AppLogsTableOrderingComposer,
          $$AppLogsTableAnnotationComposer,
          $$AppLogsTableCreateCompanionBuilder,
          $$AppLogsTableUpdateCompanionBuilder,
          (LogEntry, BaseReferences<_$AppDatabase, $AppLogsTable, LogEntry>),
          LogEntry,
          PrefetchHooks Function()
        > {
  $$AppLogsTableTableManager(_$AppDatabase db, $AppLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<LogLevelDomain> level = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String?> stackTrace = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppLogsCompanion(
                timestamp: timestamp,
                message: message,
                level: level,
                source: source,
                stackTrace: stackTrace,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required DateTime timestamp,
                required String message,
                required LogLevelDomain level,
                Value<String?> source = const Value.absent(),
                Value<String?> stackTrace = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppLogsCompanion.insert(
                timestamp: timestamp,
                message: message,
                level: level,
                source: source,
                stackTrace: stackTrace,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppLogsTable,
      LogEntry,
      $$AppLogsTableFilterComposer,
      $$AppLogsTableOrderingComposer,
      $$AppLogsTableAnnotationComposer,
      $$AppLogsTableCreateCompanionBuilder,
      $$AppLogsTableUpdateCompanionBuilder,
      (LogEntry, BaseReferences<_$AppDatabase, $AppLogsTable, LogEntry>),
      LogEntry,
      PrefetchHooks Function()
    >;
typedef $$LibrariesTableCreateCompanionBuilder =
    LibrariesCompanion Function({
      required String id,
      required Uri serverUrl,
      required String name,
      required MediaContent mediaContent,
      Value<int> rowid,
    });
typedef $$LibrariesTableUpdateCompanionBuilder =
    LibrariesCompanion Function({
      Value<String> id,
      Value<Uri> serverUrl,
      Value<String> name,
      Value<MediaContent> mediaContent,
      Value<int> rowid,
    });

final class $$LibrariesTableReferences
    extends BaseReferences<_$AppDatabase, $LibrariesTable, LibraryDomain> {
  $$LibrariesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ServersTable _serverUrlTable(_$AppDatabase db) =>
      db.servers.createAlias(
        $_aliasNameGenerator(db.libraries.serverUrl, db.servers.url),
      );

  $$ServersTableProcessedTableManager get serverUrl {
    final $_column = $_itemColumn<String>('server_url')!;

    final manager = $$ServersTableTableManager(
      $_db,
      $_db.servers,
    ).filter((f) => f.url.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_serverUrlTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AudiobooksTable, List<Audiobook>>
  _audiobooksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobooks,
    aliasName: $_aliasNameGenerator(db.libraries.id, db.audiobooks.libraryId),
  );

  $$AudiobooksTableProcessedTableManager get audiobooksRefs {
    final manager = $$AudiobooksTableTableManager(
      $_db,
      $_db.audiobooks,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_audiobooksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PodcastsTable, List<Podcast>> _podcastsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.podcasts,
    aliasName: $_aliasNameGenerator(db.libraries.id, db.podcasts.libraryId),
  );

  $$PodcastsTableProcessedTableManager get podcastsRefs {
    final manager = $$PodcastsTableTableManager(
      $_db,
      $_db.podcasts,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_podcastsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SeriesTableTable, List<SeriesDomain>>
  _seriesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.seriesTable,
    aliasName: $_aliasNameGenerator(db.libraries.id, db.seriesTable.libraryId),
  );

  $$SeriesTableTableProcessedTableManager get seriesTableRefs {
    final manager = $$SeriesTableTableTableManager(
      $_db,
      $_db.seriesTable,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_seriesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AudiobookSeriesTable, List<AudiobookSeriesLink>>
  _audiobookSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobookSeries,
    aliasName: $_aliasNameGenerator(
      db.libraries.id,
      db.audiobookSeries.libraryId,
    ),
  );

  $$AudiobookSeriesTableProcessedTableManager get audiobookSeriesRefs {
    final manager = $$AudiobookSeriesTableTableManager(
      $_db,
      $_db.audiobookSeries,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _audiobookSeriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AuthorsTable, List<AuthorDomain>>
  _authorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.authors,
    aliasName: $_aliasNameGenerator(db.libraries.id, db.authors.libraryId),
  );

  $$AuthorsTableProcessedTableManager get authorsRefs {
    final manager = $$AuthorsTableTableManager(
      $_db,
      $_db.authors,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_authorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AudiobookAuthorsTable, List<AudiobookAuthorsLink>>
  _audiobookAuthorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobookAuthors,
    aliasName: $_aliasNameGenerator(
      db.libraries.id,
      db.audiobookAuthors.libraryId,
    ),
  );

  $$AudiobookAuthorsTableProcessedTableManager get audiobookAuthorsRefs {
    final manager = $$AudiobookAuthorsTableTableManager(
      $_db,
      $_db.audiobookAuthors,
    ).filter((f) => f.libraryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _audiobookAuthorsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LibrariesTableFilterComposer
    extends Composer<_$AppDatabase, $LibrariesTable> {
  $$LibrariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaContent, MediaContent, String>
  get mediaContent => $composableBuilder(
    column: $table.mediaContent,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$ServersTableFilterComposer get serverUrl {
    final $$ServersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serverUrl,
      referencedTable: $db.servers,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServersTableFilterComposer(
            $db: $db,
            $table: $db.servers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> audiobooksRefs(
    Expression<bool> Function($$AudiobooksTableFilterComposer f) f,
  ) {
    final $$AudiobooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableFilterComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> podcastsRefs(
    Expression<bool> Function($$PodcastsTableFilterComposer f) f,
  ) {
    final $$PodcastsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.podcasts,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PodcastsTableFilterComposer(
            $db: $db,
            $table: $db.podcasts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> seriesTableRefs(
    Expression<bool> Function($$SeriesTableTableFilterComposer f) f,
  ) {
    final $$SeriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableFilterComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> audiobookSeriesRefs(
    Expression<bool> Function($$AudiobookSeriesTableFilterComposer f) f,
  ) {
    final $$AudiobookSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookSeries,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookSeriesTableFilterComposer(
            $db: $db,
            $table: $db.audiobookSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> authorsRefs(
    Expression<bool> Function($$AuthorsTableFilterComposer f) f,
  ) {
    final $$AuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableFilterComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> audiobookAuthorsRefs(
    Expression<bool> Function($$AudiobookAuthorsTableFilterComposer f) f,
  ) {
    final $$AudiobookAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookAuthors,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.audiobookAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LibrariesTableOrderingComposer
    extends Composer<_$AppDatabase, $LibrariesTable> {
  $$LibrariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaContent => $composableBuilder(
    column: $table.mediaContent,
    builder: (column) => ColumnOrderings(column),
  );

  $$ServersTableOrderingComposer get serverUrl {
    final $$ServersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serverUrl,
      referencedTable: $db.servers,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServersTableOrderingComposer(
            $db: $db,
            $table: $db.servers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LibrariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LibrariesTable> {
  $$LibrariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaContent, String> get mediaContent =>
      $composableBuilder(
        column: $table.mediaContent,
        builder: (column) => column,
      );

  $$ServersTableAnnotationComposer get serverUrl {
    final $$ServersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serverUrl,
      referencedTable: $db.servers,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServersTableAnnotationComposer(
            $db: $db,
            $table: $db.servers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> audiobooksRefs<T extends Object>(
    Expression<T> Function($$AudiobooksTableAnnotationComposer a) f,
  ) {
    final $$AudiobooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> podcastsRefs<T extends Object>(
    Expression<T> Function($$PodcastsTableAnnotationComposer a) f,
  ) {
    final $$PodcastsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.podcasts,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PodcastsTableAnnotationComposer(
            $db: $db,
            $table: $db.podcasts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> seriesTableRefs<T extends Object>(
    Expression<T> Function($$SeriesTableTableAnnotationComposer a) f,
  ) {
    final $$SeriesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> audiobookSeriesRefs<T extends Object>(
    Expression<T> Function($$AudiobookSeriesTableAnnotationComposer a) f,
  ) {
    final $$AudiobookSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookSeries,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobookSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> authorsRefs<T extends Object>(
    Expression<T> Function($$AuthorsTableAnnotationComposer a) f,
  ) {
    final $$AuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> audiobookAuthorsRefs<T extends Object>(
    Expression<T> Function($$AudiobookAuthorsTableAnnotationComposer a) f,
  ) {
    final $$AudiobookAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookAuthors,
      getReferencedColumn: (t) => t.libraryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobookAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LibrariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LibrariesTable,
          LibraryDomain,
          $$LibrariesTableFilterComposer,
          $$LibrariesTableOrderingComposer,
          $$LibrariesTableAnnotationComposer,
          $$LibrariesTableCreateCompanionBuilder,
          $$LibrariesTableUpdateCompanionBuilder,
          (LibraryDomain, $$LibrariesTableReferences),
          LibraryDomain,
          PrefetchHooks Function({
            bool serverUrl,
            bool audiobooksRefs,
            bool podcastsRefs,
            bool seriesTableRefs,
            bool audiobookSeriesRefs,
            bool authorsRefs,
            bool audiobookAuthorsRefs,
          })
        > {
  $$LibrariesTableTableManager(_$AppDatabase db, $LibrariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LibrariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LibrariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LibrariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<Uri> serverUrl = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<MediaContent> mediaContent = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LibrariesCompanion(
                id: id,
                serverUrl: serverUrl,
                name: name,
                mediaContent: mediaContent,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required Uri serverUrl,
                required String name,
                required MediaContent mediaContent,
                Value<int> rowid = const Value.absent(),
              }) => LibrariesCompanion.insert(
                id: id,
                serverUrl: serverUrl,
                name: name,
                mediaContent: mediaContent,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LibrariesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                serverUrl = false,
                audiobooksRefs = false,
                podcastsRefs = false,
                seriesTableRefs = false,
                audiobookSeriesRefs = false,
                authorsRefs = false,
                audiobookAuthorsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (audiobooksRefs) db.audiobooks,
                    if (podcastsRefs) db.podcasts,
                    if (seriesTableRefs) db.seriesTable,
                    if (audiobookSeriesRefs) db.audiobookSeries,
                    if (authorsRefs) db.authors,
                    if (audiobookAuthorsRefs) db.audiobookAuthors,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (serverUrl) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.serverUrl,
                                    referencedTable: $$LibrariesTableReferences
                                        ._serverUrlTable(db),
                                    referencedColumn: $$LibrariesTableReferences
                                        ._serverUrlTable(db)
                                        .url,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (audiobooksRefs)
                        await $_getPrefetchedData<
                          LibraryDomain,
                          $LibrariesTable,
                          Audiobook
                        >(
                          currentTable: table,
                          referencedTable: $$LibrariesTableReferences
                              ._audiobooksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LibrariesTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobooksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.libraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (podcastsRefs)
                        await $_getPrefetchedData<
                          LibraryDomain,
                          $LibrariesTable,
                          Podcast
                        >(
                          currentTable: table,
                          referencedTable: $$LibrariesTableReferences
                              ._podcastsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LibrariesTableReferences(
                                db,
                                table,
                                p0,
                              ).podcastsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.libraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (seriesTableRefs)
                        await $_getPrefetchedData<
                          LibraryDomain,
                          $LibrariesTable,
                          SeriesDomain
                        >(
                          currentTable: table,
                          referencedTable: $$LibrariesTableReferences
                              ._seriesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LibrariesTableReferences(
                                db,
                                table,
                                p0,
                              ).seriesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.libraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (audiobookSeriesRefs)
                        await $_getPrefetchedData<
                          LibraryDomain,
                          $LibrariesTable,
                          AudiobookSeriesLink
                        >(
                          currentTable: table,
                          referencedTable: $$LibrariesTableReferences
                              ._audiobookSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LibrariesTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobookSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.libraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (authorsRefs)
                        await $_getPrefetchedData<
                          LibraryDomain,
                          $LibrariesTable,
                          AuthorDomain
                        >(
                          currentTable: table,
                          referencedTable: $$LibrariesTableReferences
                              ._authorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LibrariesTableReferences(
                                db,
                                table,
                                p0,
                              ).authorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.libraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (audiobookAuthorsRefs)
                        await $_getPrefetchedData<
                          LibraryDomain,
                          $LibrariesTable,
                          AudiobookAuthorsLink
                        >(
                          currentTable: table,
                          referencedTable: $$LibrariesTableReferences
                              ._audiobookAuthorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LibrariesTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobookAuthorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.libraryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LibrariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LibrariesTable,
      LibraryDomain,
      $$LibrariesTableFilterComposer,
      $$LibrariesTableOrderingComposer,
      $$LibrariesTableAnnotationComposer,
      $$LibrariesTableCreateCompanionBuilder,
      $$LibrariesTableUpdateCompanionBuilder,
      (LibraryDomain, $$LibrariesTableReferences),
      LibraryDomain,
      PrefetchHooks Function({
        bool serverUrl,
        bool audiobooksRefs,
        bool podcastsRefs,
        bool seriesTableRefs,
        bool audiobookSeriesRefs,
        bool authorsRefs,
        bool audiobookAuthorsRefs,
      })
    >;
typedef $$AudiobooksTableCreateCompanionBuilder =
    AudiobooksCompanion Function({
      required String id,
      required String libraryId,
      required DateTime addedAt,
      required DateTime updatedAt,
      required bool isMissing,
      required int size,
      required Duration duration,
      Value<String?> title,
      Value<String?> authorName,
      Value<String?> description,
      Value<String?> language,
      Value<bool> explicit,
      required List<String> narrators,
      required List<String> genres,
      required List<String> tags,
      required List<AudioTrackDomain> tracks,
      required List<ChapterDomain> chapters,
      required double progress,
      Value<bool> isFinished,
      Value<bool> hideFromContinueListening,
      Value<int> rowid,
    });
typedef $$AudiobooksTableUpdateCompanionBuilder =
    AudiobooksCompanion Function({
      Value<String> id,
      Value<String> libraryId,
      Value<DateTime> addedAt,
      Value<DateTime> updatedAt,
      Value<bool> isMissing,
      Value<int> size,
      Value<Duration> duration,
      Value<String?> title,
      Value<String?> authorName,
      Value<String?> description,
      Value<String?> language,
      Value<bool> explicit,
      Value<List<String>> narrators,
      Value<List<String>> genres,
      Value<List<String>> tags,
      Value<List<AudioTrackDomain>> tracks,
      Value<List<ChapterDomain>> chapters,
      Value<double> progress,
      Value<bool> isFinished,
      Value<bool> hideFromContinueListening,
      Value<int> rowid,
    });

final class $$AudiobooksTableReferences
    extends BaseReferences<_$AppDatabase, $AudiobooksTable, Audiobook> {
  $$AudiobooksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LibrariesTable _libraryIdTable(_$AppDatabase db) =>
      db.libraries.createAlias(
        $_aliasNameGenerator(db.audiobooks.libraryId, db.libraries.id),
      );

  $$LibrariesTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AudiobookSeriesTable, List<AudiobookSeriesLink>>
  _audiobookSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobookSeries,
    aliasName: $_aliasNameGenerator(
      db.audiobooks.id,
      db.audiobookSeries.audiobookId,
    ),
  );

  $$AudiobookSeriesTableProcessedTableManager get audiobookSeriesRefs {
    final manager = $$AudiobookSeriesTableTableManager(
      $_db,
      $_db.audiobookSeries,
    ).filter((f) => f.audiobookId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _audiobookSeriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AudiobookAuthorsTable, List<AudiobookAuthorsLink>>
  _audiobookAuthorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobookAuthors,
    aliasName: $_aliasNameGenerator(
      db.audiobooks.id,
      db.audiobookAuthors.audiobookId,
    ),
  );

  $$AudiobookAuthorsTableProcessedTableManager get audiobookAuthorsRefs {
    final manager = $$AudiobookAuthorsTableTableManager(
      $_db,
      $_db.audiobookAuthors,
    ).filter((f) => f.audiobookId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _audiobookAuthorsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AudiobooksTableFilterComposer
    extends Composer<_$AppDatabase, $AudiobooksTable> {
  $$AudiobooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMissing => $composableBuilder(
    column: $table.isMissing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Duration, Duration, int> get duration =>
      $composableBuilder(
        column: $table.duration,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get explicit => $composableBuilder(
    column: $table.explicit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get narrators => $composableBuilder(
    column: $table.narrators,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
        column: $table.tags,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<
    List<AudioTrackDomain>,
    List<AudioTrackDomain>,
    String
  >
  get tracks => $composableBuilder(
    column: $table.tracks,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<ChapterDomain>,
    List<ChapterDomain>,
    String
  >
  get chapters => $composableBuilder(
    column: $table.chapters,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hideFromContinueListening => $composableBuilder(
    column: $table.hideFromContinueListening,
    builder: (column) => ColumnFilters(column),
  );

  $$LibrariesTableFilterComposer get libraryId {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> audiobookSeriesRefs(
    Expression<bool> Function($$AudiobookSeriesTableFilterComposer f) f,
  ) {
    final $$AudiobookSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookSeries,
      getReferencedColumn: (t) => t.audiobookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookSeriesTableFilterComposer(
            $db: $db,
            $table: $db.audiobookSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> audiobookAuthorsRefs(
    Expression<bool> Function($$AudiobookAuthorsTableFilterComposer f) f,
  ) {
    final $$AudiobookAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookAuthors,
      getReferencedColumn: (t) => t.audiobookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.audiobookAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AudiobooksTableOrderingComposer
    extends Composer<_$AppDatabase, $AudiobooksTable> {
  $$AudiobooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMissing => $composableBuilder(
    column: $table.isMissing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get explicit => $composableBuilder(
    column: $table.explicit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get narrators => $composableBuilder(
    column: $table.narrators,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tracks => $composableBuilder(
    column: $table.tracks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapters => $composableBuilder(
    column: $table.chapters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hideFromContinueListening => $composableBuilder(
    column: $table.hideFromContinueListening,
    builder: (column) => ColumnOrderings(column),
  );

  $$LibrariesTableOrderingComposer get libraryId {
    final $$LibrariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableOrderingComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudiobooksTable> {
  $$AudiobooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isMissing =>
      $composableBuilder(column: $table.isMissing, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Duration, int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<bool> get explicit =>
      $composableBuilder(column: $table.explicit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get narrators =>
      $composableBuilder(column: $table.narrators, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<AudioTrackDomain>, String> get tracks =>
      $composableBuilder(column: $table.tracks, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ChapterDomain>, String> get chapters =>
      $composableBuilder(column: $table.chapters, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hideFromContinueListening => $composableBuilder(
    column: $table.hideFromContinueListening,
    builder: (column) => column,
  );

  $$LibrariesTableAnnotationComposer get libraryId {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> audiobookSeriesRefs<T extends Object>(
    Expression<T> Function($$AudiobookSeriesTableAnnotationComposer a) f,
  ) {
    final $$AudiobookSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookSeries,
      getReferencedColumn: (t) => t.audiobookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobookSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> audiobookAuthorsRefs<T extends Object>(
    Expression<T> Function($$AudiobookAuthorsTableAnnotationComposer a) f,
  ) {
    final $$AudiobookAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookAuthors,
      getReferencedColumn: (t) => t.audiobookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobookAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AudiobooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudiobooksTable,
          Audiobook,
          $$AudiobooksTableFilterComposer,
          $$AudiobooksTableOrderingComposer,
          $$AudiobooksTableAnnotationComposer,
          $$AudiobooksTableCreateCompanionBuilder,
          $$AudiobooksTableUpdateCompanionBuilder,
          (Audiobook, $$AudiobooksTableReferences),
          Audiobook,
          PrefetchHooks Function({
            bool libraryId,
            bool audiobookSeriesRefs,
            bool audiobookAuthorsRefs,
          })
        > {
  $$AudiobooksTableTableManager(_$AppDatabase db, $AudiobooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudiobooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudiobooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudiobooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isMissing = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<Duration> duration = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> authorName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<bool> explicit = const Value.absent(),
                Value<List<String>> narrators = const Value.absent(),
                Value<List<String>> genres = const Value.absent(),
                Value<List<String>> tags = const Value.absent(),
                Value<List<AudioTrackDomain>> tracks = const Value.absent(),
                Value<List<ChapterDomain>> chapters = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<bool> isFinished = const Value.absent(),
                Value<bool> hideFromContinueListening = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudiobooksCompanion(
                id: id,
                libraryId: libraryId,
                addedAt: addedAt,
                updatedAt: updatedAt,
                isMissing: isMissing,
                size: size,
                duration: duration,
                title: title,
                authorName: authorName,
                description: description,
                language: language,
                explicit: explicit,
                narrators: narrators,
                genres: genres,
                tags: tags,
                tracks: tracks,
                chapters: chapters,
                progress: progress,
                isFinished: isFinished,
                hideFromContinueListening: hideFromContinueListening,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String libraryId,
                required DateTime addedAt,
                required DateTime updatedAt,
                required bool isMissing,
                required int size,
                required Duration duration,
                Value<String?> title = const Value.absent(),
                Value<String?> authorName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<bool> explicit = const Value.absent(),
                required List<String> narrators,
                required List<String> genres,
                required List<String> tags,
                required List<AudioTrackDomain> tracks,
                required List<ChapterDomain> chapters,
                required double progress,
                Value<bool> isFinished = const Value.absent(),
                Value<bool> hideFromContinueListening = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudiobooksCompanion.insert(
                id: id,
                libraryId: libraryId,
                addedAt: addedAt,
                updatedAt: updatedAt,
                isMissing: isMissing,
                size: size,
                duration: duration,
                title: title,
                authorName: authorName,
                description: description,
                language: language,
                explicit: explicit,
                narrators: narrators,
                genres: genres,
                tags: tags,
                tracks: tracks,
                chapters: chapters,
                progress: progress,
                isFinished: isFinished,
                hideFromContinueListening: hideFromContinueListening,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AudiobooksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                libraryId = false,
                audiobookSeriesRefs = false,
                audiobookAuthorsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (audiobookSeriesRefs) db.audiobookSeries,
                    if (audiobookAuthorsRefs) db.audiobookAuthors,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (libraryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.libraryId,
                                    referencedTable: $$AudiobooksTableReferences
                                        ._libraryIdTable(db),
                                    referencedColumn:
                                        $$AudiobooksTableReferences
                                            ._libraryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (audiobookSeriesRefs)
                        await $_getPrefetchedData<
                          Audiobook,
                          $AudiobooksTable,
                          AudiobookSeriesLink
                        >(
                          currentTable: table,
                          referencedTable: $$AudiobooksTableReferences
                              ._audiobookSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AudiobooksTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobookSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.audiobookId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (audiobookAuthorsRefs)
                        await $_getPrefetchedData<
                          Audiobook,
                          $AudiobooksTable,
                          AudiobookAuthorsLink
                        >(
                          currentTable: table,
                          referencedTable: $$AudiobooksTableReferences
                              ._audiobookAuthorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AudiobooksTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobookAuthorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.audiobookId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AudiobooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudiobooksTable,
      Audiobook,
      $$AudiobooksTableFilterComposer,
      $$AudiobooksTableOrderingComposer,
      $$AudiobooksTableAnnotationComposer,
      $$AudiobooksTableCreateCompanionBuilder,
      $$AudiobooksTableUpdateCompanionBuilder,
      (Audiobook, $$AudiobooksTableReferences),
      Audiobook,
      PrefetchHooks Function({
        bool libraryId,
        bool audiobookSeriesRefs,
        bool audiobookAuthorsRefs,
      })
    >;
typedef $$PodcastsTableCreateCompanionBuilder =
    PodcastsCompanion Function({
      required String id,
      required String libraryId,
      required DateTime addedAt,
      required DateTime updatedAt,
      required bool isMissing,
      required int size,
      Value<String?> episodeId,
      Value<String?> title,
      Value<String?> authorName,
      Value<String?> description,
      Value<String?> language,
      Value<bool> explicit,
      required List<String> genres,
      required List<String> tags,
      required List<PodcastEpisodeDomain> episodes,
      Value<Uri?> feedUrl,
      Value<DateTime?> lastEpisodeCheck,
      required double progress,
      Value<bool> isFinished,
      Value<bool> hideFromContinueListening,
      Value<int> rowid,
    });
typedef $$PodcastsTableUpdateCompanionBuilder =
    PodcastsCompanion Function({
      Value<String> id,
      Value<String> libraryId,
      Value<DateTime> addedAt,
      Value<DateTime> updatedAt,
      Value<bool> isMissing,
      Value<int> size,
      Value<String?> episodeId,
      Value<String?> title,
      Value<String?> authorName,
      Value<String?> description,
      Value<String?> language,
      Value<bool> explicit,
      Value<List<String>> genres,
      Value<List<String>> tags,
      Value<List<PodcastEpisodeDomain>> episodes,
      Value<Uri?> feedUrl,
      Value<DateTime?> lastEpisodeCheck,
      Value<double> progress,
      Value<bool> isFinished,
      Value<bool> hideFromContinueListening,
      Value<int> rowid,
    });

final class $$PodcastsTableReferences
    extends BaseReferences<_$AppDatabase, $PodcastsTable, Podcast> {
  $$PodcastsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LibrariesTable _libraryIdTable(_$AppDatabase db) =>
      db.libraries.createAlias(
        $_aliasNameGenerator(db.podcasts.libraryId, db.libraries.id),
      );

  $$LibrariesTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PodcastsTableFilterComposer
    extends Composer<_$AppDatabase, $PodcastsTable> {
  $$PodcastsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMissing => $composableBuilder(
    column: $table.isMissing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get episodeId => $composableBuilder(
    column: $table.episodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get explicit => $composableBuilder(
    column: $table.explicit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
        column: $table.tags,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<
    List<PodcastEpisodeDomain>,
    List<PodcastEpisodeDomain>,
    String
  >
  get episodes => $composableBuilder(
    column: $table.episodes,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Uri?, Uri, String> get feedUrl =>
      $composableBuilder(
        column: $table.feedUrl,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get lastEpisodeCheck => $composableBuilder(
    column: $table.lastEpisodeCheck,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hideFromContinueListening => $composableBuilder(
    column: $table.hideFromContinueListening,
    builder: (column) => ColumnFilters(column),
  );

  $$LibrariesTableFilterComposer get libraryId {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PodcastsTableOrderingComposer
    extends Composer<_$AppDatabase, $PodcastsTable> {
  $$PodcastsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMissing => $composableBuilder(
    column: $table.isMissing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get episodeId => $composableBuilder(
    column: $table.episodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get explicit => $composableBuilder(
    column: $table.explicit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get episodes => $composableBuilder(
    column: $table.episodes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedUrl => $composableBuilder(
    column: $table.feedUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastEpisodeCheck => $composableBuilder(
    column: $table.lastEpisodeCheck,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hideFromContinueListening => $composableBuilder(
    column: $table.hideFromContinueListening,
    builder: (column) => ColumnOrderings(column),
  );

  $$LibrariesTableOrderingComposer get libraryId {
    final $$LibrariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableOrderingComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PodcastsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PodcastsTable> {
  $$PodcastsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isMissing =>
      $composableBuilder(column: $table.isMissing, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get episodeId =>
      $composableBuilder(column: $table.episodeId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<bool> get explicit =>
      $composableBuilder(column: $table.explicit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<PodcastEpisodeDomain>, String>
  get episodes =>
      $composableBuilder(column: $table.episodes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Uri?, String> get feedUrl =>
      $composableBuilder(column: $table.feedUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get lastEpisodeCheck => $composableBuilder(
    column: $table.lastEpisodeCheck,
    builder: (column) => column,
  );

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hideFromContinueListening => $composableBuilder(
    column: $table.hideFromContinueListening,
    builder: (column) => column,
  );

  $$LibrariesTableAnnotationComposer get libraryId {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PodcastsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PodcastsTable,
          Podcast,
          $$PodcastsTableFilterComposer,
          $$PodcastsTableOrderingComposer,
          $$PodcastsTableAnnotationComposer,
          $$PodcastsTableCreateCompanionBuilder,
          $$PodcastsTableUpdateCompanionBuilder,
          (Podcast, $$PodcastsTableReferences),
          Podcast,
          PrefetchHooks Function({bool libraryId})
        > {
  $$PodcastsTableTableManager(_$AppDatabase db, $PodcastsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PodcastsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PodcastsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PodcastsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isMissing = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<String?> episodeId = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> authorName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<bool> explicit = const Value.absent(),
                Value<List<String>> genres = const Value.absent(),
                Value<List<String>> tags = const Value.absent(),
                Value<List<PodcastEpisodeDomain>> episodes =
                    const Value.absent(),
                Value<Uri?> feedUrl = const Value.absent(),
                Value<DateTime?> lastEpisodeCheck = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<bool> isFinished = const Value.absent(),
                Value<bool> hideFromContinueListening = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PodcastsCompanion(
                id: id,
                libraryId: libraryId,
                addedAt: addedAt,
                updatedAt: updatedAt,
                isMissing: isMissing,
                size: size,
                episodeId: episodeId,
                title: title,
                authorName: authorName,
                description: description,
                language: language,
                explicit: explicit,
                genres: genres,
                tags: tags,
                episodes: episodes,
                feedUrl: feedUrl,
                lastEpisodeCheck: lastEpisodeCheck,
                progress: progress,
                isFinished: isFinished,
                hideFromContinueListening: hideFromContinueListening,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String libraryId,
                required DateTime addedAt,
                required DateTime updatedAt,
                required bool isMissing,
                required int size,
                Value<String?> episodeId = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> authorName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<bool> explicit = const Value.absent(),
                required List<String> genres,
                required List<String> tags,
                required List<PodcastEpisodeDomain> episodes,
                Value<Uri?> feedUrl = const Value.absent(),
                Value<DateTime?> lastEpisodeCheck = const Value.absent(),
                required double progress,
                Value<bool> isFinished = const Value.absent(),
                Value<bool> hideFromContinueListening = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PodcastsCompanion.insert(
                id: id,
                libraryId: libraryId,
                addedAt: addedAt,
                updatedAt: updatedAt,
                isMissing: isMissing,
                size: size,
                episodeId: episodeId,
                title: title,
                authorName: authorName,
                description: description,
                language: language,
                explicit: explicit,
                genres: genres,
                tags: tags,
                episodes: episodes,
                feedUrl: feedUrl,
                lastEpisodeCheck: lastEpisodeCheck,
                progress: progress,
                isFinished: isFinished,
                hideFromContinueListening: hideFromContinueListening,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PodcastsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({libraryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (libraryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.libraryId,
                                referencedTable: $$PodcastsTableReferences
                                    ._libraryIdTable(db),
                                referencedColumn: $$PodcastsTableReferences
                                    ._libraryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PodcastsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PodcastsTable,
      Podcast,
      $$PodcastsTableFilterComposer,
      $$PodcastsTableOrderingComposer,
      $$PodcastsTableAnnotationComposer,
      $$PodcastsTableCreateCompanionBuilder,
      $$PodcastsTableUpdateCompanionBuilder,
      (Podcast, $$PodcastsTableReferences),
      Podcast,
      PrefetchHooks Function({bool libraryId})
    >;
typedef $$SeriesTableTableCreateCompanionBuilder =
    SeriesTableCompanion Function({
      required String id,
      required String libraryId,
      required String name,
      Value<String?> nameIgnorePrefix,
      Value<String?> description,
      Value<DateTime?> addedAt,
      Value<DateTime?> updatedAt,
      Value<bool> isFinished,
      Value<int> rowid,
    });
typedef $$SeriesTableTableUpdateCompanionBuilder =
    SeriesTableCompanion Function({
      Value<String> id,
      Value<String> libraryId,
      Value<String> name,
      Value<String?> nameIgnorePrefix,
      Value<String?> description,
      Value<DateTime?> addedAt,
      Value<DateTime?> updatedAt,
      Value<bool> isFinished,
      Value<int> rowid,
    });

final class $$SeriesTableTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesTableTable, SeriesDomain> {
  $$SeriesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LibrariesTable _libraryIdTable(_$AppDatabase db) =>
      db.libraries.createAlias(
        $_aliasNameGenerator(db.seriesTable.libraryId, db.libraries.id),
      );

  $$LibrariesTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AudiobookSeriesTable, List<AudiobookSeriesLink>>
  _audiobookSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobookSeries,
    aliasName: $_aliasNameGenerator(
      db.seriesTable.id,
      db.audiobookSeries.seriesId,
    ),
  );

  $$AudiobookSeriesTableProcessedTableManager get audiobookSeriesRefs {
    final manager = $$AudiobookSeriesTableTableManager(
      $_db,
      $_db.audiobookSeries,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _audiobookSeriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SeriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameIgnorePrefix => $composableBuilder(
    column: $table.nameIgnorePrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => ColumnFilters(column),
  );

  $$LibrariesTableFilterComposer get libraryId {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> audiobookSeriesRefs(
    Expression<bool> Function($$AudiobookSeriesTableFilterComposer f) f,
  ) {
    final $$AudiobookSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookSeries,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookSeriesTableFilterComposer(
            $db: $db,
            $table: $db.audiobookSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameIgnorePrefix => $composableBuilder(
    column: $table.nameIgnorePrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => ColumnOrderings(column),
  );

  $$LibrariesTableOrderingComposer get libraryId {
    final $$LibrariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableOrderingComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameIgnorePrefix => $composableBuilder(
    column: $table.nameIgnorePrefix,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isFinished => $composableBuilder(
    column: $table.isFinished,
    builder: (column) => column,
  );

  $$LibrariesTableAnnotationComposer get libraryId {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> audiobookSeriesRefs<T extends Object>(
    Expression<T> Function($$AudiobookSeriesTableAnnotationComposer a) f,
  ) {
    final $$AudiobookSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookSeries,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobookSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesTableTable,
          SeriesDomain,
          $$SeriesTableTableFilterComposer,
          $$SeriesTableTableOrderingComposer,
          $$SeriesTableTableAnnotationComposer,
          $$SeriesTableTableCreateCompanionBuilder,
          $$SeriesTableTableUpdateCompanionBuilder,
          (SeriesDomain, $$SeriesTableTableReferences),
          SeriesDomain,
          PrefetchHooks Function({bool libraryId, bool audiobookSeriesRefs})
        > {
  $$SeriesTableTableTableManager(_$AppDatabase db, $SeriesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nameIgnorePrefix = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime?> addedAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isFinished = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SeriesTableCompanion(
                id: id,
                libraryId: libraryId,
                name: name,
                nameIgnorePrefix: nameIgnorePrefix,
                description: description,
                addedAt: addedAt,
                updatedAt: updatedAt,
                isFinished: isFinished,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String libraryId,
                required String name,
                Value<String?> nameIgnorePrefix = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime?> addedAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isFinished = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SeriesTableCompanion.insert(
                id: id,
                libraryId: libraryId,
                name: name,
                nameIgnorePrefix: nameIgnorePrefix,
                description: description,
                addedAt: addedAt,
                updatedAt: updatedAt,
                isFinished: isFinished,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SeriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({libraryId = false, audiobookSeriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (audiobookSeriesRefs) db.audiobookSeries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (libraryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.libraryId,
                                    referencedTable:
                                        $$SeriesTableTableReferences
                                            ._libraryIdTable(db),
                                    referencedColumn:
                                        $$SeriesTableTableReferences
                                            ._libraryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (audiobookSeriesRefs)
                        await $_getPrefetchedData<
                          SeriesDomain,
                          $SeriesTableTable,
                          AudiobookSeriesLink
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTableTableReferences
                              ._audiobookSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobookSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.seriesId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SeriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesTableTable,
      SeriesDomain,
      $$SeriesTableTableFilterComposer,
      $$SeriesTableTableOrderingComposer,
      $$SeriesTableTableAnnotationComposer,
      $$SeriesTableTableCreateCompanionBuilder,
      $$SeriesTableTableUpdateCompanionBuilder,
      (SeriesDomain, $$SeriesTableTableReferences),
      SeriesDomain,
      PrefetchHooks Function({bool libraryId, bool audiobookSeriesRefs})
    >;
typedef $$AudiobookSeriesTableCreateCompanionBuilder =
    AudiobookSeriesCompanion Function({
      required String audiobookId,
      required String seriesId,
      required String libraryId,
      Value<int> rowid,
    });
typedef $$AudiobookSeriesTableUpdateCompanionBuilder =
    AudiobookSeriesCompanion Function({
      Value<String> audiobookId,
      Value<String> seriesId,
      Value<String> libraryId,
      Value<int> rowid,
    });

final class $$AudiobookSeriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AudiobookSeriesTable,
          AudiobookSeriesLink
        > {
  $$AudiobookSeriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AudiobooksTable _audiobookIdTable(_$AppDatabase db) =>
      db.audiobooks.createAlias(
        $_aliasNameGenerator(db.audiobookSeries.audiobookId, db.audiobooks.id),
      );

  $$AudiobooksTableProcessedTableManager get audiobookId {
    final $_column = $_itemColumn<String>('audiobook_id')!;

    final manager = $$AudiobooksTableTableManager(
      $_db,
      $_db.audiobooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_audiobookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SeriesTableTable _seriesIdTable(_$AppDatabase db) =>
      db.seriesTable.createAlias(
        $_aliasNameGenerator(db.audiobookSeries.seriesId, db.seriesTable.id),
      );

  $$SeriesTableTableProcessedTableManager get seriesId {
    final $_column = $_itemColumn<String>('series_id')!;

    final manager = $$SeriesTableTableTableManager(
      $_db,
      $_db.seriesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LibrariesTable _libraryIdTable(_$AppDatabase db) =>
      db.libraries.createAlias(
        $_aliasNameGenerator(db.audiobookSeries.libraryId, db.libraries.id),
      );

  $$LibrariesTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AudiobookSeriesTableFilterComposer
    extends Composer<_$AppDatabase, $AudiobookSeriesTable> {
  $$AudiobookSeriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AudiobooksTableFilterComposer get audiobookId {
    final $$AudiobooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audiobookId,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableFilterComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableFilterComposer get seriesId {
    final $$SeriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableFilterComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LibrariesTableFilterComposer get libraryId {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobookSeriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AudiobookSeriesTable> {
  $$AudiobookSeriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AudiobooksTableOrderingComposer get audiobookId {
    final $$AudiobooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audiobookId,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableOrderingComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableOrderingComposer get seriesId {
    final $$SeriesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableOrderingComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LibrariesTableOrderingComposer get libraryId {
    final $$LibrariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableOrderingComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobookSeriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudiobookSeriesTable> {
  $$AudiobookSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AudiobooksTableAnnotationComposer get audiobookId {
    final $$AudiobooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audiobookId,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableAnnotationComposer get seriesId {
    final $$SeriesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LibrariesTableAnnotationComposer get libraryId {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobookSeriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudiobookSeriesTable,
          AudiobookSeriesLink,
          $$AudiobookSeriesTableFilterComposer,
          $$AudiobookSeriesTableOrderingComposer,
          $$AudiobookSeriesTableAnnotationComposer,
          $$AudiobookSeriesTableCreateCompanionBuilder,
          $$AudiobookSeriesTableUpdateCompanionBuilder,
          (AudiobookSeriesLink, $$AudiobookSeriesTableReferences),
          AudiobookSeriesLink,
          PrefetchHooks Function({
            bool audiobookId,
            bool seriesId,
            bool libraryId,
          })
        > {
  $$AudiobookSeriesTableTableManager(
    _$AppDatabase db,
    $AudiobookSeriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudiobookSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudiobookSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudiobookSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> audiobookId = const Value.absent(),
                Value<String> seriesId = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudiobookSeriesCompanion(
                audiobookId: audiobookId,
                seriesId: seriesId,
                libraryId: libraryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String audiobookId,
                required String seriesId,
                required String libraryId,
                Value<int> rowid = const Value.absent(),
              }) => AudiobookSeriesCompanion.insert(
                audiobookId: audiobookId,
                seriesId: seriesId,
                libraryId: libraryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AudiobookSeriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({audiobookId = false, seriesId = false, libraryId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (audiobookId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.audiobookId,
                                    referencedTable:
                                        $$AudiobookSeriesTableReferences
                                            ._audiobookIdTable(db),
                                    referencedColumn:
                                        $$AudiobookSeriesTableReferences
                                            ._audiobookIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (seriesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.seriesId,
                                    referencedTable:
                                        $$AudiobookSeriesTableReferences
                                            ._seriesIdTable(db),
                                    referencedColumn:
                                        $$AudiobookSeriesTableReferences
                                            ._seriesIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (libraryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.libraryId,
                                    referencedTable:
                                        $$AudiobookSeriesTableReferences
                                            ._libraryIdTable(db),
                                    referencedColumn:
                                        $$AudiobookSeriesTableReferences
                                            ._libraryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AudiobookSeriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudiobookSeriesTable,
      AudiobookSeriesLink,
      $$AudiobookSeriesTableFilterComposer,
      $$AudiobookSeriesTableOrderingComposer,
      $$AudiobookSeriesTableAnnotationComposer,
      $$AudiobookSeriesTableCreateCompanionBuilder,
      $$AudiobookSeriesTableUpdateCompanionBuilder,
      (AudiobookSeriesLink, $$AudiobookSeriesTableReferences),
      AudiobookSeriesLink,
      PrefetchHooks Function({bool audiobookId, bool seriesId, bool libraryId})
    >;
typedef $$AuthorsTableCreateCompanionBuilder =
    AuthorsCompanion Function({
      required String id,
      required String libraryId,
      required String name,
      Value<String?> description,
      Value<DateTime?> addedAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$AuthorsTableUpdateCompanionBuilder =
    AuthorsCompanion Function({
      Value<String> id,
      Value<String> libraryId,
      Value<String> name,
      Value<String?> description,
      Value<DateTime?> addedAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$AuthorsTableReferences
    extends BaseReferences<_$AppDatabase, $AuthorsTable, AuthorDomain> {
  $$AuthorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LibrariesTable _libraryIdTable(_$AppDatabase db) => db.libraries
      .createAlias($_aliasNameGenerator(db.authors.libraryId, db.libraries.id));

  $$LibrariesTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AudiobookAuthorsTable, List<AudiobookAuthorsLink>>
  _audiobookAuthorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.audiobookAuthors,
    aliasName: $_aliasNameGenerator(
      db.authors.id,
      db.audiobookAuthors.authorId,
    ),
  );

  $$AudiobookAuthorsTableProcessedTableManager get audiobookAuthorsRefs {
    final manager = $$AudiobookAuthorsTableTableManager(
      $_db,
      $_db.audiobookAuthors,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _audiobookAuthorsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LibrariesTableFilterComposer get libraryId {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> audiobookAuthorsRefs(
    Expression<bool> Function($$AudiobookAuthorsTableFilterComposer f) f,
  ) {
    final $$AudiobookAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookAuthors,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.audiobookAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LibrariesTableOrderingComposer get libraryId {
    final $$LibrariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableOrderingComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LibrariesTableAnnotationComposer get libraryId {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> audiobookAuthorsRefs<T extends Object>(
    Expression<T> Function($$AudiobookAuthorsTableAnnotationComposer a) f,
  ) {
    final $$AudiobookAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audiobookAuthors,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobookAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobookAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthorsTable,
          AuthorDomain,
          $$AuthorsTableFilterComposer,
          $$AuthorsTableOrderingComposer,
          $$AuthorsTableAnnotationComposer,
          $$AuthorsTableCreateCompanionBuilder,
          $$AuthorsTableUpdateCompanionBuilder,
          (AuthorDomain, $$AuthorsTableReferences),
          AuthorDomain,
          PrefetchHooks Function({bool libraryId, bool audiobookAuthorsRefs})
        > {
  $$AuthorsTableTableManager(_$AppDatabase db, $AuthorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime?> addedAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuthorsCompanion(
                id: id,
                libraryId: libraryId,
                name: name,
                description: description,
                addedAt: addedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String libraryId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<DateTime?> addedAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuthorsCompanion.insert(
                id: id,
                libraryId: libraryId,
                name: name,
                description: description,
                addedAt: addedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuthorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({libraryId = false, audiobookAuthorsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (audiobookAuthorsRefs) db.audiobookAuthors,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (libraryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.libraryId,
                                    referencedTable: $$AuthorsTableReferences
                                        ._libraryIdTable(db),
                                    referencedColumn: $$AuthorsTableReferences
                                        ._libraryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (audiobookAuthorsRefs)
                        await $_getPrefetchedData<
                          AuthorDomain,
                          $AuthorsTable,
                          AudiobookAuthorsLink
                        >(
                          currentTable: table,
                          referencedTable: $$AuthorsTableReferences
                              ._audiobookAuthorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorsTableReferences(
                                db,
                                table,
                                p0,
                              ).audiobookAuthorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.authorId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AuthorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthorsTable,
      AuthorDomain,
      $$AuthorsTableFilterComposer,
      $$AuthorsTableOrderingComposer,
      $$AuthorsTableAnnotationComposer,
      $$AuthorsTableCreateCompanionBuilder,
      $$AuthorsTableUpdateCompanionBuilder,
      (AuthorDomain, $$AuthorsTableReferences),
      AuthorDomain,
      PrefetchHooks Function({bool libraryId, bool audiobookAuthorsRefs})
    >;
typedef $$AudiobookAuthorsTableCreateCompanionBuilder =
    AudiobookAuthorsCompanion Function({
      required String audiobookId,
      required String authorId,
      required String libraryId,
      Value<int> rowid,
    });
typedef $$AudiobookAuthorsTableUpdateCompanionBuilder =
    AudiobookAuthorsCompanion Function({
      Value<String> audiobookId,
      Value<String> authorId,
      Value<String> libraryId,
      Value<int> rowid,
    });

final class $$AudiobookAuthorsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AudiobookAuthorsTable,
          AudiobookAuthorsLink
        > {
  $$AudiobookAuthorsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AudiobooksTable _audiobookIdTable(_$AppDatabase db) =>
      db.audiobooks.createAlias(
        $_aliasNameGenerator(db.audiobookAuthors.audiobookId, db.audiobooks.id),
      );

  $$AudiobooksTableProcessedTableManager get audiobookId {
    final $_column = $_itemColumn<String>('audiobook_id')!;

    final manager = $$AudiobooksTableTableManager(
      $_db,
      $_db.audiobooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_audiobookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AuthorsTable _authorIdTable(_$AppDatabase db) =>
      db.authors.createAlias(
        $_aliasNameGenerator(db.audiobookAuthors.authorId, db.authors.id),
      );

  $$AuthorsTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<String>('author_id')!;

    final manager = $$AuthorsTableTableManager(
      $_db,
      $_db.authors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LibrariesTable _libraryIdTable(_$AppDatabase db) =>
      db.libraries.createAlias(
        $_aliasNameGenerator(db.audiobookAuthors.libraryId, db.libraries.id),
      );

  $$LibrariesTableProcessedTableManager get libraryId {
    final $_column = $_itemColumn<String>('library_id')!;

    final manager = $$LibrariesTableTableManager(
      $_db,
      $_db.libraries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_libraryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AudiobookAuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $AudiobookAuthorsTable> {
  $$AudiobookAuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AudiobooksTableFilterComposer get audiobookId {
    final $$AudiobooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audiobookId,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableFilterComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableFilterComposer get authorId {
    final $$AuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableFilterComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LibrariesTableFilterComposer get libraryId {
    final $$LibrariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableFilterComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobookAuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $AudiobookAuthorsTable> {
  $$AudiobookAuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AudiobooksTableOrderingComposer get audiobookId {
    final $$AudiobooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audiobookId,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableOrderingComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableOrderingComposer get authorId {
    final $$AuthorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableOrderingComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LibrariesTableOrderingComposer get libraryId {
    final $$LibrariesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableOrderingComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobookAuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudiobookAuthorsTable> {
  $$AudiobookAuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AudiobooksTableAnnotationComposer get audiobookId {
    final $$AudiobooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.audiobookId,
      referencedTable: $db.audiobooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AudiobooksTableAnnotationComposer(
            $db: $db,
            $table: $db.audiobooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableAnnotationComposer get authorId {
    final $$AuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.authors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LibrariesTableAnnotationComposer get libraryId {
    final $$LibrariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.libraryId,
      referencedTable: $db.libraries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibrariesTableAnnotationComposer(
            $db: $db,
            $table: $db.libraries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AudiobookAuthorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudiobookAuthorsTable,
          AudiobookAuthorsLink,
          $$AudiobookAuthorsTableFilterComposer,
          $$AudiobookAuthorsTableOrderingComposer,
          $$AudiobookAuthorsTableAnnotationComposer,
          $$AudiobookAuthorsTableCreateCompanionBuilder,
          $$AudiobookAuthorsTableUpdateCompanionBuilder,
          (AudiobookAuthorsLink, $$AudiobookAuthorsTableReferences),
          AudiobookAuthorsLink,
          PrefetchHooks Function({
            bool audiobookId,
            bool authorId,
            bool libraryId,
          })
        > {
  $$AudiobookAuthorsTableTableManager(
    _$AppDatabase db,
    $AudiobookAuthorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudiobookAuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudiobookAuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudiobookAuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> audiobookId = const Value.absent(),
                Value<String> authorId = const Value.absent(),
                Value<String> libraryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudiobookAuthorsCompanion(
                audiobookId: audiobookId,
                authorId: authorId,
                libraryId: libraryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String audiobookId,
                required String authorId,
                required String libraryId,
                Value<int> rowid = const Value.absent(),
              }) => AudiobookAuthorsCompanion.insert(
                audiobookId: audiobookId,
                authorId: authorId,
                libraryId: libraryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AudiobookAuthorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({audiobookId = false, authorId = false, libraryId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (audiobookId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.audiobookId,
                                    referencedTable:
                                        $$AudiobookAuthorsTableReferences
                                            ._audiobookIdTable(db),
                                    referencedColumn:
                                        $$AudiobookAuthorsTableReferences
                                            ._audiobookIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (authorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.authorId,
                                    referencedTable:
                                        $$AudiobookAuthorsTableReferences
                                            ._authorIdTable(db),
                                    referencedColumn:
                                        $$AudiobookAuthorsTableReferences
                                            ._authorIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (libraryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.libraryId,
                                    referencedTable:
                                        $$AudiobookAuthorsTableReferences
                                            ._libraryIdTable(db),
                                    referencedColumn:
                                        $$AudiobookAuthorsTableReferences
                                            ._libraryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AudiobookAuthorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudiobookAuthorsTable,
      AudiobookAuthorsLink,
      $$AudiobookAuthorsTableFilterComposer,
      $$AudiobookAuthorsTableOrderingComposer,
      $$AudiobookAuthorsTableAnnotationComposer,
      $$AudiobookAuthorsTableCreateCompanionBuilder,
      $$AudiobookAuthorsTableUpdateCompanionBuilder,
      (AudiobookAuthorsLink, $$AudiobookAuthorsTableReferences),
      AudiobookAuthorsLink,
      PrefetchHooks Function({bool audiobookId, bool authorId, bool libraryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ServersTableTableManager get servers =>
      $$ServersTableTableManager(_db, _db.servers);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AppLogsTableTableManager get appLogs =>
      $$AppLogsTableTableManager(_db, _db.appLogs);
  $$LibrariesTableTableManager get libraries =>
      $$LibrariesTableTableManager(_db, _db.libraries);
  $$AudiobooksTableTableManager get audiobooks =>
      $$AudiobooksTableTableManager(_db, _db.audiobooks);
  $$PodcastsTableTableManager get podcasts =>
      $$PodcastsTableTableManager(_db, _db.podcasts);
  $$SeriesTableTableTableManager get seriesTable =>
      $$SeriesTableTableTableManager(_db, _db.seriesTable);
  $$AudiobookSeriesTableTableManager get audiobookSeries =>
      $$AudiobookSeriesTableTableManager(_db, _db.audiobookSeries);
  $$AuthorsTableTableManager get authors =>
      $$AuthorsTableTableManager(_db, _db.authors);
  $$AudiobookAuthorsTableTableManager get audiobookAuthors =>
      $$AudiobookAuthorsTableTableManager(_db, _db.audiobookAuthors);
}
