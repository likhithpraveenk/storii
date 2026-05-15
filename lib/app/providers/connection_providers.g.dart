// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(socketStatus)
final socketStatusProvider = SocketStatusProvider._();

final class SocketStatusProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  SocketStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socketStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socketStatusHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return socketStatus(ref);
  }
}

String _$socketStatusHash() => r'c5cd6a92e3767afdf9ed2d07918125accdafcb57';

@ProviderFor(connectivityStream)
final connectivityStreamProvider = ConnectivityStreamProvider._();

final class ConnectivityStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ConnectivityResult>>,
          List<ConnectivityResult>,
          Stream<List<ConnectivityResult>>
        >
    with
        $FutureModifier<List<ConnectivityResult>>,
        $StreamProvider<List<ConnectivityResult>> {
  ConnectivityStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<ConnectivityResult>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ConnectivityResult>> create(Ref ref) {
    return connectivityStream(ref);
  }
}

String _$connectivityStreamHash() =>
    r'9f60aae6c128e0af3ad3f37236c4f05ce64c4a99';

@ProviderFor(connectionType)
final connectionTypeProvider = ConnectionTypeProvider._();

final class ConnectionTypeProvider
    extends $FunctionalProvider<ConnectionType, ConnectionType, ConnectionType>
    with $Provider<ConnectionType> {
  ConnectionTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectionTypeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectionTypeHash();

  @$internal
  @override
  $ProviderElement<ConnectionType> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConnectionType create(Ref ref) {
    return connectionType(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectionType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectionType>(value),
    );
  }
}

String _$connectionTypeHash() => r'9ac7a3dcd4a644f0942d8b4ebecc849b48994d8a';
