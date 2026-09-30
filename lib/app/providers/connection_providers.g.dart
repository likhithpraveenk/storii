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
        isAutoDispose: true,
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
    r'63b6e0e427b796cdff6b172cd47ea2b1a7aca8cc';

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
        isAutoDispose: false,
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

String _$connectionTypeHash() => r'ac4f22daf36ed3faf6afdf9ab5031fabf818733a';

@ProviderFor(activeServerUrl)
final activeServerUrlProvider = ActiveServerUrlFamily._();

final class ActiveServerUrlProvider
    extends $FunctionalProvider<AsyncValue<Uri>, Uri, FutureOr<Uri>>
    with $FutureModifier<Uri>, $FutureProvider<Uri> {
  ActiveServerUrlProvider._({
    required ActiveServerUrlFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'activeServerUrlProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activeServerUrlHash();

  @override
  String toString() {
    return r'activeServerUrlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uri> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uri> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return activeServerUrl(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveServerUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeServerUrlHash() => r'077c2a97510482d607fe0f758ffd0c356c4a59f5';

final class ActiveServerUrlFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uri>, UserDomain> {
  ActiveServerUrlFamily._()
    : super(
        retry: null,
        name: r'activeServerUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ActiveServerUrlProvider call(UserDomain user) =>
      ActiveServerUrlProvider._(argument: user, from: this);

  @override
  String toString() => r'activeServerUrlProvider';
}

@ProviderFor(ServerConnection)
final serverConnectionProvider = ServerConnectionProvider._();

final class ServerConnectionProvider
    extends $NotifierProvider<ServerConnection, bool> {
  ServerConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverConnectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverConnectionHash();

  @$internal
  @override
  ServerConnection create() => ServerConnection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$serverConnectionHash() => r'47205f5200b7e2204a5738437d4092d7a971f483';

abstract class _$ServerConnection extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
