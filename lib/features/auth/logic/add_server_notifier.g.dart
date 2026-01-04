// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_server_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddServerNotifier)
final addServerProvider = AddServerNotifierProvider._();

final class AddServerNotifierProvider
    extends $NotifierProvider<AddServerNotifier, ServerState> {
  AddServerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addServerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addServerNotifierHash();

  @$internal
  @override
  AddServerNotifier create() => AddServerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerState>(value),
    );
  }
}

String _$addServerNotifierHash() => r'43b29f4379c712415e48114746571ec7142bc223';

abstract class _$AddServerNotifier extends $Notifier<ServerState> {
  ServerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ServerState, ServerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ServerState, ServerState>,
              ServerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
