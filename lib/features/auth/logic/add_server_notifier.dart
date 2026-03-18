import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

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

  Future<void> addServer(String url, [Server? server]) async {
    state = const ServerState(status: .checking);

    try {
      final authApi = ref.read(authApiProvider(url.normalizedUri));
      await authApi.healthCheck();
      LogService.log('Server is healthy ${url.normalizedUri}', level: .info);
      if (server != null) {
        await ref
            .read(serversProvider.notifier)
            .edit(server.url, server.copyWith(url: url.normalizedUri));
      } else {
        await ref.read(serversProvider.notifier).add(url.normalizedUri);
      }
      state = const ServerState(status: .available);
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'Server validation failed: ${url.normalizedUri}: $error',
        source: 'AddServerNotifier',
        level: .error,
        stackTrace: st,
      );
      state = ServerState(status: .unavailable, message: error.message);
    }
  }
}
