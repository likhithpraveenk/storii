// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerUser)
final serverUserProvider = ServerUserProvider._();

final class ServerUserProvider
    extends $AsyncNotifierProvider<ServerUser, User> {
  ServerUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverUserHash();

  @$internal
  @override
  ServerUser create() => ServerUser();
}

String _$serverUserHash() => r'efc446571bfdce3ce11cae4d0a9c9587a23687be';

abstract class _$ServerUser extends $AsyncNotifier<User> {
  FutureOr<User> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<User>, User>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User>, User>,
              AsyncValue<User>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(userPermissions)
final userPermissionsProvider = UserPermissionsProvider._();

final class UserPermissionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserPermissions?>,
          UserPermissions?,
          FutureOr<UserPermissions?>
        >
    with $FutureModifier<UserPermissions?>, $FutureProvider<UserPermissions?> {
  UserPermissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPermissionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPermissionsHash();

  @$internal
  @override
  $FutureProviderElement<UserPermissions?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserPermissions?> create(Ref ref) {
    return userPermissions(ref);
  }
}

String _$userPermissionsHash() => r'76096e2742fbe51c4ae9cffbe92e0c3f8f476440';
