import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'add_server_notifier.g.dart';

enum ServerStatus { idle, checking, available, unavailable }

class ServerState {
  final ServerStatus status;
  final String? message;
  const ServerState({this.status = .idle, this.message});
}

@riverpod
class AddServerNotifier extends _$AddServerNotifier {
  @override
  ServerState build() => const ServerState();

  Future<void> addServer(
    String url, {
    Server? server,
    Map<String, String> headers = const {},
  }) async {
    state = const ServerState(status: .checking);

    try {
      await ref.logApiCall(() async {
        final authApi = ref.read(authApiProvider(url.normalizedUri));
        await authApi.healthCheck();
        LogService.log('Server is healthy ${url.normalizedUri}', level: .info);
        if (server != null) {
          await ref
              .read(serversProvider.notifier)
              .edit(
                server.url,
                server.copyWith(url: url.normalizedUri, headers: headers),
              );
        } else {
          final id = DateTime.now().microsecondsSinceEpoch.toString();
          final server = Server(
            id: id,
            url: url.normalizedUri,
            headers: headers,
          );
          await ref.read(serversProvider.notifier).add(server);
        }
        state = const ServerState(status: .available);
      }, source: 'AddServerNotifier');
    } on AppError catch (e) {
      state = ServerState(status: .unavailable, message: e.localizedMessage);
    }
  }
}

@Riverpod(keepAlive: true)
Future<ServerStatusResponse> serverStatus(Ref ref, Uri url) async {
  final api = ref.read(authApiProvider(url));
  return ref.logApiCall(api.status, source: 'serverStatus');
}
