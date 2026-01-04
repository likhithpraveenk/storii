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
    extends $StreamNotifierProvider<UsersNotifier, List<User>> {
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

String _$usersNotifierHash() => r'757822be6d285fccdeaef760d8505fbc4e504632';

abstract class _$UsersNotifier extends $StreamNotifier<List<User>> {
  Stream<List<User>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<User>>, List<User>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<User>>, List<User>>,
              AsyncValue<List<User>>,
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
          AsyncValue<List<User>>,
          AsyncValue<List<User>>,
          AsyncValue<List<User>>
        >
    with $Provider<AsyncValue<List<User>>> {
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
  $ProviderElement<AsyncValue<List<User>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<User>> create(Ref ref) {
    final argument = this.argument as Uri;
    return usersOfServer(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<User>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<User>>>(value),
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

String _$usersOfServerHash() => r'a013bc800a15d361672ed55047804d25b2e2b57f';

final class UsersOfServerFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<User>>, Uri> {
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
