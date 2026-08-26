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
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverUserHash();

  @$internal
  @override
  ServerUser create() => ServerUser();
}

String _$serverUserHash() => r'd0473f9bdaf0b4ea2696c912417a1fbe7bf052ba';

abstract class _$ServerUser extends $AsyncNotifier<User> {
  FutureOr<User> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<User>, User>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User>, User>,
              AsyncValue<User>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
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
        isAutoDispose: true,
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

String _$userPermissionsHash() => r'753fe88499d06fead54880b3b1504222ceaaa3de';

@ProviderFor(isUserAdmin)
final isUserAdminProvider = IsUserAdminProvider._();

final class IsUserAdminProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsUserAdminProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isUserAdminProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isUserAdminHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isUserAdmin(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isUserAdminHash() => r'c96de0368859e48e9ef7a9637eff8a66936f808c';

@ProviderFor(currentServerSettings)
final currentServerSettingsProvider = CurrentServerSettingsProvider._();

final class CurrentServerSettingsProvider
    extends
        $FunctionalProvider<ServerSettings?, ServerSettings?, ServerSettings?>
    with $Provider<ServerSettings?> {
  CurrentServerSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentServerSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentServerSettingsHash();

  @$internal
  @override
  $ProviderElement<ServerSettings?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerSettings? create(Ref ref) {
    return currentServerSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerSettings? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerSettings?>(value),
    );
  }
}

String _$currentServerSettingsHash() =>
    r'2cec323c1be8fab5873bb9801d22d6748715ec3f';

@ProviderFor(canUserUpdate)
final canUserUpdateProvider = CanUserUpdateProvider._();

final class CanUserUpdateProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  CanUserUpdateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canUserUpdateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canUserUpdateHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return canUserUpdate(ref);
  }
}

String _$canUserUpdateHash() => r'01927116eba35e47a54f3cb256bd973fda2ce2ba';

@ProviderFor(canUserDelete)
final canUserDeleteProvider = CanUserDeleteProvider._();

final class CanUserDeleteProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  CanUserDeleteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canUserDeleteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canUserDeleteHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return canUserDelete(ref);
  }
}

String _$canUserDeleteHash() => r'9d62277a56e6b487f0acc0188b6bb145c820a657';
