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
    extends
        $FunctionalProvider<
          AsyncValue<SocketStatus>,
          SocketStatus,
          Stream<SocketStatus>
        >
    with $FutureModifier<SocketStatus>, $StreamProvider<SocketStatus> {
  SocketStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socketStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socketStatusHash();

  @$internal
  @override
  $StreamProviderElement<SocketStatus> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<SocketStatus> create(Ref ref) {
    return socketStatus(ref);
  }
}

String _$socketStatusHash() => r'7dd50afce7e29f9654e8e3b639d3c7fc288223cf';

@ProviderFor(socketInit)
final socketInitProvider = SocketInitProvider._();

final class SocketInitProvider
    extends
        $FunctionalProvider<
          AsyncValue<InitEvent?>,
          InitEvent?,
          Stream<InitEvent?>
        >
    with $FutureModifier<InitEvent?>, $StreamProvider<InitEvent?> {
  SocketInitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socketInitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socketInitHash();

  @$internal
  @override
  $StreamProviderElement<InitEvent?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<InitEvent?> create(Ref ref) {
    return socketInit(ref);
  }
}

String _$socketInitHash() => r'f10796d5c2c8b3b59073fd3e7ec41b4ce5c122fb';

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

@ProviderFor(isOffline)
final isOfflineProvider = IsOfflineProvider._();

final class IsOfflineProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsOfflineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOfflineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOfflineHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isOffline(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isOfflineHash() => r'69a1ccc003ad123d7ea82e90235da0ebad9f24df';

@ProviderFor(isServerOffline)
final isServerOfflineProvider = IsServerOfflineProvider._();

final class IsServerOfflineProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsServerOfflineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isServerOfflineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isServerOfflineHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isServerOffline(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isServerOfflineHash() => r'95fa17ba611909319350b8a011c8ea0f858f2af2';

/// Android 17+: asks for local network access when the active server
/// resolves to a LAN address. Re-checked on network changes and when the
/// app returns to the foreground, since a split-horizon domain is only
/// local while on the home network.

@ProviderFor(localNetworkAccessWatcher)
final localNetworkAccessWatcherProvider = LocalNetworkAccessWatcherProvider._();

/// Android 17+: asks for local network access when the active server
/// resolves to a LAN address. Re-checked on network changes and when the
/// app returns to the foreground, since a split-horizon domain is only
/// local while on the home network.

final class LocalNetworkAccessWatcherProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// Android 17+: asks for local network access when the active server
  /// resolves to a LAN address. Re-checked on network changes and when the
  /// app returns to the foreground, since a split-horizon domain is only
  /// local while on the home network.
  LocalNetworkAccessWatcherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localNetworkAccessWatcherProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localNetworkAccessWatcherHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return localNetworkAccessWatcher(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$localNetworkAccessWatcherHash() =>
    r'3eef8423642d32fbe4c297babc110fe32a8dad84';

@ProviderFor(ActiveServerUrl)
final activeServerUrlProvider = ActiveServerUrlProvider._();

final class ActiveServerUrlProvider
    extends $NotifierProvider<ActiveServerUrl, Uri> {
  ActiveServerUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeServerUrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeServerUrlHash();

  @$internal
  @override
  ActiveServerUrl create() => ActiveServerUrl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uri value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Uri>(value),
    );
  }
}

String _$activeServerUrlHash() => r'ecee7ab2bdd3fb61fd94a4a9a6b9c7469f60ee1a';

abstract class _$ActiveServerUrl extends $Notifier<Uri> {
  Uri build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Uri, Uri>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Uri, Uri>,
              Uri,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
