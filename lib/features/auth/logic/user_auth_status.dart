import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/token_provider.dart';

part 'user_auth_status.g.dart';

enum UserAuthStatus { active, loginRequired }

@riverpod
Future<UserAuthStatus> userAuthStatus(Ref ref, String userId) async {
  try {
    final access = await ref.read(tokenProvider).hasAccessToken(userId);
    return access ? .active : .loginRequired;
  } catch (_) {
    return .loginRequired;
  }
}
