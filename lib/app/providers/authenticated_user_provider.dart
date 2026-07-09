import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'authenticated_user_provider.g.dart';

@Riverpod(keepAlive: true)
Future<UserDomain> authenticatedUser(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');

  final isConnected = ref.watch(serverConnectionProvider);
  if (!isConnected) return user;

  try {
    await ref.logApiCall(
      () => ref.read(serverApiProvider(user)).authorize(),
      source: 'authenticatedUser',
      logMessage: 'Error authenticating user',
    );
    return user;
  } on AppError catch (error) {
    if (error.type == .network || error.type == .timeout) {
      return user;
    }
    rethrow;
  }
}
