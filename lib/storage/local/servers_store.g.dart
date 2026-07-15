// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servers_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServersStore)
final serversStoreProvider = ServersStoreProvider._();

final class ServersStoreProvider
    extends $StreamNotifierProvider<ServersStore, List<Server>> {
  ServersStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serversStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serversStoreHash();

  @$internal
  @override
  ServersStore create() => ServersStore();
}

String _$serversStoreHash() => r'd47dcdf98186f81e0b685dfe60b6e6375d955a46';

abstract class _$ServersStore extends $StreamNotifier<List<Server>> {
  Stream<List<Server>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Server>>, List<Server>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Server>>, List<Server>>,
              AsyncValue<List<Server>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
