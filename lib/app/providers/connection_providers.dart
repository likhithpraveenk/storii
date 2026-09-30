import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';

part 'connection_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> socketStatus(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    yield false;
    return;
  }

  final socketApi = await ref.watch(socketApiProvider(user).future);
  yield* socketApi.isConnected;
}

enum ConnectionType {
  none,
  wifi,
  mobile,
  ethernet;

  String get label {
    return switch (this) {
      .none => l10n.connectionTypeNone,
      .mobile => l10n.connectionTypeMobile,
      .wifi => l10n.connectionTypeWifi,
      .ethernet => l10n.connectionTypeEthernet,
    };
  }
}

@riverpod
Stream<List<ConnectivityResult>> connectivityStream(Ref ref) async* {
  final connectivity = Connectivity();
  yield await connectivity.checkConnectivity();
  yield* connectivity.onConnectivityChanged;
}

@Riverpod(keepAlive: true)
ConnectionType connectionType(Ref ref) {
  final results = ref.watch(connectivityStreamProvider).value ?? [];
  // log('available connections: $results');
  if (results.contains(ConnectivityResult.wifi)) return .wifi;
  if (results.contains(ConnectivityResult.ethernet)) return .ethernet;
  if (results.contains(ConnectivityResult.mobile)) return .mobile;
  return .none;
}

@Riverpod(keepAlive: true)
Future<Uri> activeServerUrl(Ref ref, UserDomain user) async {
  final server = ref.watch(serverStreamProvider(user.serverUrl)).value;
  final localUrl = server?.localUrl;
  if (localUrl == null) return user.serverUrl;

  final canCheck = ref.watch(
    connectionTypeProvider.select((c) => c == .wifi || c == .ethernet),
  );
  if (!canCheck) return user.serverUrl;

  final error = await ref
      .read(pingServerProvider(localUrl).future)
      .timeout(const Duration(seconds: 2), onTimeout: () => 'error');
  if (error == null) return localUrl;

  return user.serverUrl;
}

@Riverpod(keepAlive: true)
class ServerConnection extends _$ServerConnection {
  @override
  bool build() {
    ref.listen(connectivityStreamProvider, (_, next) {
      final list = next.value ?? [];
      if (list.contains(ConnectivityResult.none)) {
        LogService.log('No connections available');
        state = false;
      }
    });

    ref.listen(socketStatusProvider, (prev, next) {
      final connected = next.value ?? false;
      LogService.log('Socket ${connected ? 'connected' : 'disconnected'}');
      state = connected;
    });

    return true; //! optimistic true
  }
}
