// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servers_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(serversStore)
final serversStoreProvider = ServersStoreProvider._();

final class ServersStoreProvider
    extends $FunctionalProvider<ServersStore, ServersStore, ServersStore>
    with $Provider<ServersStore> {
  ServersStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serversStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serversStoreHash();

  @$internal
  @override
  $ProviderElement<ServersStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServersStore create(Ref ref) {
    return serversStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServersStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServersStore>(value),
    );
  }
}

String _$serversStoreHash() => r'76991f1ba5ea68499015fc097e55f5921e5b7ba5';

@ProviderFor(servers)
final serversProvider = ServersProvider._();

final class ServersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Server>>,
          List<Server>,
          Stream<List<Server>>
        >
    with $FutureModifier<List<Server>>, $StreamProvider<List<Server>> {
  ServersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serversProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serversHash();

  @$internal
  @override
  $StreamProviderElement<List<Server>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Server>> create(Ref ref) {
    return servers(ref);
  }
}

String _$serversHash() => r'd450a23e967145dda8c1aab0e621dc4090562e25';

@ProviderFor(serverStream)
final serverStreamProvider = ServerStreamFamily._();

final class ServerStreamProvider
    extends $FunctionalProvider<AsyncValue<Server?>, Server?, Stream<Server?>>
    with $FutureModifier<Server?>, $StreamProvider<Server?> {
  ServerStreamProvider._({
    required ServerStreamFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'serverStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverStreamHash();

  @override
  String toString() {
    return r'serverStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Server?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Server?> create(Ref ref) {
    final argument = this.argument as Uri;
    return serverStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverStreamHash() => r'5339006096a1286d95dad174408c6c1c31fd6053';

final class ServerStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Server?>, Uri> {
  ServerStreamFamily._()
    : super(
        retry: null,
        name: r'serverStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ServerStreamProvider call(Uri url) =>
      ServerStreamProvider._(argument: url, from: this);

  @override
  String toString() => r'serverStreamProvider';
}
