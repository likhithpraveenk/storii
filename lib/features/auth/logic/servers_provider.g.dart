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

String _$serversNotifierHash() => r'0279ade244ace09f31b8c1c206d283f05bbbc9d1';

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
