// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersStore)
final usersStoreProvider = UsersStoreProvider._();

final class UsersStoreProvider
    extends $StreamNotifierProvider<UsersStore, List<UserDomain>> {
  UsersStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersStoreHash();

  @$internal
  @override
  UsersStore create() => UsersStore();
}

String _$usersStoreHash() => r'7109718b2ab0d4a5efad77b5db412f24dcf41d71';

abstract class _$UsersStore extends $StreamNotifier<List<UserDomain>> {
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
