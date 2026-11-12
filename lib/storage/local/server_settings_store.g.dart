// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_settings_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(serverSettingsStore)
final serverSettingsStoreProvider = ServerSettingsStoreProvider._();

final class ServerSettingsStoreProvider
    extends
        $FunctionalProvider<
          ServerSettingsStore,
          ServerSettingsStore,
          ServerSettingsStore
        >
    with $Provider<ServerSettingsStore> {
  ServerSettingsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverSettingsStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverSettingsStoreHash();

  @$internal
  @override
  $ProviderElement<ServerSettingsStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ServerSettingsStore create(Ref ref) {
    return serverSettingsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerSettingsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerSettingsStore>(value),
    );
  }
}

String _$serverSettingsStoreHash() =>
    r'b30e6a8e7e1631d5c15ca1ffeaf5937fe92775d7';

@ProviderFor(serverSettings)
final serverSettingsProvider = ServerSettingsFamily._();

final class ServerSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ServerSettings?>,
          ServerSettings?,
          Stream<ServerSettings?>
        >
    with $FutureModifier<ServerSettings?>, $StreamProvider<ServerSettings?> {
  ServerSettingsProvider._({
    required ServerSettingsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'serverSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverSettingsHash();

  @override
  String toString() {
    return r'serverSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ServerSettings?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ServerSettings?> create(Ref ref) {
    final argument = this.argument as String;
    return serverSettings(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerSettingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverSettingsHash() => r'1e568baa8f06c73bc99751893d4122abf05f4a11';

final class ServerSettingsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ServerSettings?>, String> {
  ServerSettingsFamily._()
    : super(
        retry: null,
        name: r'serverSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ServerSettingsProvider call(String id) =>
      ServerSettingsProvider._(argument: id, from: this);

  @override
  String toString() => r'serverSettingsProvider';
}
