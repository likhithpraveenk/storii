// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersNotifier)
final usersProvider = UsersNotifierProvider._();

final class UsersNotifierProvider
    extends $StreamNotifierProvider<UsersNotifier, List<UserDomain>> {
  UsersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersNotifierHash();

  @$internal
  @override
  UsersNotifier create() => UsersNotifier();
}

String _$usersNotifierHash() => r'2dd91df4cb7df2549069b8dd8d48dc6fce0f5455';

abstract class _$UsersNotifier extends $StreamNotifier<List<UserDomain>> {
  Stream<List<UserDomain>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<UserDomain>>, List<UserDomain>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserDomain>>, List<UserDomain>>,
              AsyncValue<List<UserDomain>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(usersOfServer)
final usersOfServerProvider = UsersOfServerFamily._();

final class UsersOfServerProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserDomain>>,
          AsyncValue<List<UserDomain>>,
          AsyncValue<List<UserDomain>>
        >
    with $Provider<AsyncValue<List<UserDomain>>> {
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
  $ProviderElement<AsyncValue<List<UserDomain>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<UserDomain>> create(Ref ref) {
    final argument = this.argument as Uri;
    return usersOfServer(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<UserDomain>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<UserDomain>>>(value),
    );
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

String _$usersOfServerHash() => r'49fb1c9b20eadea2ab0da5bbdd8683c317f6710c';

final class UsersOfServerFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<UserDomain>>, Uri> {
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
