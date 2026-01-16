// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authenticatedUser)
final authenticatedUserProvider = AuthenticatedUserProvider._();

final class AuthenticatedUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserDomain>,
          UserDomain,
          FutureOr<UserDomain>
        >
    with $FutureModifier<UserDomain>, $FutureProvider<UserDomain> {
  AuthenticatedUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticatedUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticatedUserHash();

  @$internal
  @override
  $FutureProviderElement<UserDomain> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserDomain> create(Ref ref) {
    return authenticatedUser(ref);
  }
}

String _$authenticatedUserHash() => r'25e461b9640c0ba1aea254c1994de91cfc2e36f6';
