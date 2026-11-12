// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(usersStore)
final usersStoreProvider = UsersStoreProvider._();

final class UsersStoreProvider
    extends $FunctionalProvider<UsersStore, UsersStore, UsersStore>
    with $Provider<UsersStore> {
  UsersStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersStoreHash();

  @$internal
  @override
  $ProviderElement<UsersStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersStore create(Ref ref) {
    return usersStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersStore>(value),
    );
  }
}

String _$usersStoreHash() => r'd0ff168dd16344a1e219d926ac054ccb2c1dae6b';

@ProviderFor(users)
final usersProvider = UsersProvider._();

final class UsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserDomain>>,
          List<UserDomain>,
          Stream<List<UserDomain>>
        >
    with $FutureModifier<List<UserDomain>>, $StreamProvider<List<UserDomain>> {
  UsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersHash();

  @$internal
  @override
  $StreamProviderElement<List<UserDomain>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<UserDomain>> create(Ref ref) {
    return users(ref);
  }
}

String _$usersHash() => r'1b12c131191bf256590d13992b6a1ca4a6a3657f';

@ProviderFor(usersOfServer)
final usersOfServerProvider = UsersOfServerFamily._();

final class UsersOfServerProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserDomain>>,
          List<UserDomain>,
          FutureOr<List<UserDomain>>
        >
    with $FutureModifier<List<UserDomain>>, $FutureProvider<List<UserDomain>> {
  UsersOfServerProvider._({
    required UsersOfServerFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'usersOfServerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$usersOfServerHash();

  @override
  String toString() {
    return r'usersOfServerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<UserDomain>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserDomain>> create(Ref ref) {
    final argument = this.argument as Uri;
    return usersOfServer(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersOfServerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$usersOfServerHash() => r'57b99d47f0333ff904a4c52704e98ff89b99928d';

final class UsersOfServerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<UserDomain>>, Uri> {
  UsersOfServerFamily._()
    : super(
        retry: null,
        name: r'usersOfServerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UsersOfServerProvider call(Uri url) =>
      UsersOfServerProvider._(argument: url, from: this);

  @override
  String toString() => r'usersOfServerProvider';
}
