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

String _$serversNotifierHash() => r'ae7bb96b0d943487302bbcbd84277c63d5531fba';

abstract class _$ServersNotifier extends $StreamNotifier<List<Server>> {
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
  void runBuild() {
    final ref = this.ref as $Ref<Server?, Server?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Server?, Server?>,
              Server?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
