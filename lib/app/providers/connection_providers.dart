import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/storage/local/servers_store.dart';

part 'connection_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> socketStatus(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    yield false;
    return;
  }

  final socketApi = await ref.watch(socketApiProvider(user).future);
  yield* socketApi.statusStream.map((status) => status != .disconnected);
}

@riverpod
Stream<SocketStatus> socketState(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    yield .disconnected;
    return;
  }

  final socketApi = await ref.watch(socketApiProvider(user).future);
  yield* socketApi.statusStream;
}

@riverpod
Stream<InitEvent?> socketInit(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    yield null;
    return;
  }

  final socketApi = await ref.watch(socketApiProvider(user).future);
  yield* socketApi.payloadStream;
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
bool isOffline(Ref ref) {
  final results = ref.watch(connectivityStreamProvider).value;
  return results?.contains(ConnectivityResult.none) ?? false;
}

@Riverpod(keepAlive: true)
class ActiveServerUrl extends _$ActiveServerUrl {
  @override
  Uri build() {
    final user = ref.watch(currentUserProvider);
    if (user == null) throw StateError('No current user');

    final server = ref.watch(serverStreamProvider(user.serverUrl)).value;
    final localUrl = server?.localUrl;
    if (localUrl == null) return user.serverUrl;

    ref.listen(connectionTypeProvider, (_, conn) {
      final canCheck = conn == .wifi || conn == .ethernet;
      if (!canCheck) {
        state = user.serverUrl;
        return;
      }
      _resolve(localUrl, user.serverUrl);
    });

    final canCheck = ref.read(
      connectionTypeProvider.select((c) => c == .wifi || c == .ethernet),
    );
    if (canCheck) _resolve(localUrl, user.serverUrl);

    return user.serverUrl;
  }

  Future<void> _resolve(Uri localUrl, Uri remoteUrl) async {
    final error = await ref
        .read(pingServerProvider(localUrl).future)
        .timeout(const Duration(seconds: 2), onTimeout: () => 'error');
    if (!ref.mounted) return;
    state = error == null ? localUrl : remoteUrl;
  }
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

    ref.listen(socketStatusProvider, (_, next) {
      final connected = next.value;
      if (connected == null) return;
      LogService.log('Socket ${connected ? 'connected' : 'disconnected'}');
      state = connected;
    });

    return ref.read(socketStatusProvider).value ?? true;
  }
}
