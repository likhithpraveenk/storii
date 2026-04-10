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

String _$addServerNotifierHash() => r'1835f5b8517eddd9aa2c5b35c12b72bffb2342c3';

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

@ProviderFor(serverStatus)
final serverStatusProvider = ServerStatusFamily._();

final class ServerStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<ServerStatusResponse>,
          ServerStatusResponse,
          FutureOr<ServerStatusResponse>
        >
    with
        $FutureModifier<ServerStatusResponse>,
        $FutureProvider<ServerStatusResponse> {
  ServerStatusProvider._({
    required ServerStatusFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'serverStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverStatusHash();

  @override
  String toString() {
    return r'serverStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ServerStatusResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ServerStatusResponse> create(Ref ref) {
    final argument = this.argument as Uri;
    return serverStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverStatusHash() => r'078dc48ae7c89b20a7d61d80c56d26949cc8b7de';

final class ServerStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ServerStatusResponse>, Uri> {
  ServerStatusFamily._()
    : super(
        retry: null,
        name: r'serverStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ServerStatusProvider call(Uri url) =>
      ServerStatusProvider._(argument: url, from: this);

  @override
  String toString() => r'serverStatusProvider';
}
