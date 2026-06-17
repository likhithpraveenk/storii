import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';

part 'user_permissions_provider.g.dart';

@Riverpod(keepAlive: true)
Future<UserPermissions?> userPermissions(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final response = await ref.read(meApiProvider(user)).getUser();
  return response.permissions;
}
