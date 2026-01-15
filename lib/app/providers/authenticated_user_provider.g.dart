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
    extends $FunctionalProvider<AsyncValue<User>, User, FutureOr<User>>
    with $FutureModifier<User>, $FutureProvider<User> {
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
  $FutureProviderElement<User> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User> create(Ref ref) {
    return authenticatedUser(ref);
  }
}

String _$authenticatedUserHash() => r'39e8ee0d3b773c865cbddf3874d1281b080317ef';
