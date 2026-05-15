import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';

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

@Riverpod(keepAlive: true)
Stream<List<ConnectivityResult>> connectivityStream(Ref ref) {
  return Connectivity().onConnectivityChanged;
}

@riverpod
ConnectionType connectionType(Ref ref) {
  final results = ref.watch(connectivityStreamProvider).value ?? [];
  // log('available connections: $results');
  if (results.contains(ConnectivityResult.wifi)) return .wifi;
  if (results.contains(ConnectivityResult.ethernet)) return .ethernet;
  if (results.contains(ConnectivityResult.mobile)) return .mobile;
  return .none;
}
