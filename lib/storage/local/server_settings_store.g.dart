// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_settings_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerSettingsStore)
final serverSettingsStoreProvider = ServerSettingsStoreProvider._();

final class ServerSettingsStoreProvider
    extends
        $StreamNotifierProvider<
          ServerSettingsStore,
          Map<String, ServerSettings>
        > {
  ServerSettingsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverSettingsStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverSettingsStoreHash();

  @$internal
  @override
  ServerSettingsStore create() => ServerSettingsStore();
}

String _$serverSettingsStoreHash() =>
    r'91a9b0ca5f90ea198a45486cc3d32169108963ea';

abstract class _$ServerSettingsStore
    extends $StreamNotifier<Map<String, ServerSettings>> {
  Stream<Map<String, ServerSettings>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, ServerSettings>>,
              Map<String, ServerSettings>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, ServerSettings>>,
                Map<String, ServerSettings>
              >,
              AsyncValue<Map<String, ServerSettings>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
