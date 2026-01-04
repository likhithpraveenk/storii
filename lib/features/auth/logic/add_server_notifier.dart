import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/endpoints/errors.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/logs_provider.dart';
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

  Future<void> addServer(String url) async {
    state = const ServerState(status: .checking);

    try {
      final authApi = ref.read(authApiProvider(url.normalizedUri));
      await authApi.healthCheck();
      ref
          .read(logsProvider.notifier)
          .log(
            'Server validated: ${url.normalizedUri}',
            source: 'AddServerNotifier',
          );
      state = const ServerState(status: .available);
    } on UnsupportedScheme catch (e) {
      state = ServerState(status: .unavailable, message: e.message);
    } catch (e, st) {
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'Server validated failed: ${url.normalizedUri}',
            source: 'AddServerNotifier',
            level: .error,
            stackTrace: st.toLimitedString(),
          );
      state = ServerState(status: .unavailable, message: error.message);
    }
  }
}
