import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/servers_store.dart';
import 'package:storii/storage/local/users_store.dart';

part 'servers_provider.g.dart';

@Riverpod(keepAlive: true)
class ServersNotifier extends _$ServersNotifier {
  @override
  Stream<List<Server>> build() async* {
    final servers = await ref.watch(serversStoreProvider.future);
    yield servers;
  }

  Future<void> add(Server server) async {
    await ref.read(serversStoreProvider.notifier).add(server);
  }

  Server? get(Uri uri) {
    return ref.read(serversStoreProvider.notifier).get(uri);
  }

  Future<void> edit(Uri oldUrl, Server server) async {
    await ref.read(serversStoreProvider.notifier).add(server);
    await ref
        .read(usersStoreProvider.notifier)
        .updateServerUrl(oldUrl, server.url);
  }

  Future<void> delete(Server server) async {
    final users = await ref
        .read(usersProvider.notifier)
        .deleteUsersByServer(server.url);
    await ref.read(appSettingsProvider.notifier).deleteSettings(users);
    await ref.read(serversStoreProvider.notifier).remove(server.id);
  }

  Map<String, String>? getServerHeaders(Uri url) {
    final server = ref.read(serversStoreProvider.notifier).get(url);
    return server?.headers;
  }
}

@riverpod
Future<String?> pingServer(Ref ref, Uri url) async {
  try {
    final authApi = ref.read(authApiProvider(url));
    await authApi.healthCheck();
    LogService.log('server is reachable at $url', level: .info);
    return null;
  } catch (e, st) {
    final error = AppError.from(e, st);
    return error.localizedMessage;
  }
}

@riverpod
Stream<Server?> serverStream(Ref ref, Uri uri) {
  return ref.read(serversStoreProvider.notifier).watch(uri);
}

@Riverpod(keepAlive: true)
class TempServer extends _$TempServer {
  @override
  Server? build() => null;

  void init({Server? server, Uri? url}) {
    state = server ?? Server(id: '', url: url ?? Uri.parse('https://'));
  }

  void setHeaders(Map<String, String> headers) {
    final current = state;
    if (current == null) return;
    state = current.copyWith(headers: headers);
  }
}
