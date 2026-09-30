// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServersNotifier)
final serversProvider = ServersNotifierProvider._();

final class ServersNotifierProvider
    extends $StreamNotifierProvider<ServersNotifier, List<Server>> {
  ServersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serversProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serversNotifierHash();

  @$internal
  @override
  ServersNotifier create() => ServersNotifier();
}

String _$serversNotifierHash() => r'e6e932c32deac3ddeca6361c98d2deaec0715af4';

abstract class _$ServersNotifier extends $StreamNotifier<List<Server>> {
  Stream<List<Server>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Server>>, List<Server>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Server>>, List<Server>>,
              AsyncValue<List<Server>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(pingServer)
final pingServerProvider = PingServerFamily._();

final class PingServerProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  PingServerProvider._({
    required PingServerFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'pingServerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pingServerHash();

  @override
  String toString() {
    return r'pingServerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as Uri;
    return pingServer(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PingServerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pingServerHash() => r'42e33648f8603b4aefe4071cb24d4183ee06150a';

final class PingServerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, Uri> {
  PingServerFamily._()
    : super(
        retry: null,
        name: r'pingServerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PingServerProvider call(Uri url) =>
      PingServerProvider._(argument: url, from: this);

  @override
  String toString() => r'pingServerProvider';
}

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

String _$serverStreamHash() => r'937796e117d3167f02ffbb6f2f44ac28d0b5c4cc';

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

  ServerStreamProvider call(Uri uri) =>
      ServerStreamProvider._(argument: uri, from: this);

  @override
  String toString() => r'serverStreamProvider';
}

@ProviderFor(TempServer)
final tempServerProvider = TempServerProvider._();

final class TempServerProvider extends $NotifierProvider<TempServer, Server?> {
  TempServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tempServerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tempServerHash();

  @$internal
  @override
  TempServer create() => TempServer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Server? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Server?>(value),
    );
  }
}

String _$tempServerHash() => r'2bf03820d6ed6fa1cb28c702354a2742c359ac2e';

abstract class _$TempServer extends $Notifier<Server?> {
  Server? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Server?, Server?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Server?, Server?>,
              Server?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
