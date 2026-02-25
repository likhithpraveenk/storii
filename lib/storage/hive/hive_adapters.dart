import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';

@GenerateAdapters([
  AdapterSpec<LogLevel>(),
  AdapterSpec<LogEntry>(),
  AdapterSpec<Uri>(),
  AdapterSpec<Server>(),
  AdapterSpec<UserDomain>(),
])
part 'hive_adapters.g.dart';
