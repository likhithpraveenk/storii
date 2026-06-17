// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_permissions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$userPermissionsHash() => r'46fad02db134cf0ebd509ff5a0dc79d5ddf26146';
