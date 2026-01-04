import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'authenticated_user_provider.g.dart';

@Riverpod(keepAlive: true)
Future<User> authenticatedUser(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');
  try {
    await ref.read(serverApiProvider(user)).authorize();
    return user;
  } catch (e) {
    final error = AppError.resolve(e);
    final errMsg = 'Error validating user session: $error';
    ref
        .read(logsProvider.notifier)
        .log(errMsg, source: 'AuthenticatedUserProvider', level: .error);
    throw error;
  }
}
