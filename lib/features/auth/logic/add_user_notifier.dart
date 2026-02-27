import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'add_user_notifier.g.dart';

enum LoginStatus { idle, loading, success, error }

class UserState {
  final LoginStatus status;
  final String? message;

  const UserState({this.status = .idle, this.message});

  UserState copyWith({LoginStatus? status, String? message}) {
    return UserState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

@riverpod
class AddUserNotifier extends _$AddUserNotifier {
  @override
  UserState build() => const UserState();

  Future<void> login(Uri url, String username, String password) async {
    state = state.copyWith(status: .loading);

    try {
      final authApi = ref.read(authApiProvider(url));
      final response = await authApi.login(
        username: username,
        password: password,
      );

      final storeUser = response.user.toDomain(url);

      await ref.read(usersProvider.notifier).add(storeUser);
      await ref
          .read(tokenProvider)
          .saveTokens(
            response.user.id,
            response.user.accessToken,
            response.user.refreshToken,
          );
      await ref.read(appSettingsProvider.notifier).setCurrentUser(storeUser);
      await ref
          .read(userSettingsProvider.notifier)
          .setCurrentLibraryId(response.userDefaultLibraryId);
      LogService.log('${storeUser.username} logged in', level: .info);
      state = state.copyWith(status: .success);
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'Error while adding $username',
        source: 'AddUserNotifier',
        level: .error,
        stackTrace: st,
      );
      state = state.copyWith(status: .error, message: error.message);
    }
  }
}
