import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'connection_providers.g.dart';

@riverpod
Stream<bool> socketStatus(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    yield false;
    return;
  }

  final socketApi = await ref.watch(socketApiProvider(user).future);
  yield* socketApi.isConnected;
}

enum ConnectionType { none, wifi, mobile, ethernet }

@Riverpod(keepAlive: true)
Stream<List<ConnectivityResult>> connectivityStream(Ref ref) {
  return Connectivity().onConnectivityChanged;
}

@Riverpod(keepAlive: true)
ConnectionType connectionType(Ref ref) {
  final results = ref.watch(connectivityStreamProvider).value ?? [];
  if (results.contains(ConnectivityResult.wifi)) return .wifi;
  if (results.contains(ConnectivityResult.ethernet)) return .ethernet;
  if (results.contains(ConnectivityResult.mobile)) return .mobile;
  return .none;
}
