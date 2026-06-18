// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SpeedStore)
final speedStoreProvider = SpeedStoreProvider._();

final class SpeedStoreProvider extends $NotifierProvider<SpeedStore, void> {
  SpeedStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'speedStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$speedStoreHash();

  @$internal
  @override
  SpeedStore create() => SpeedStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$speedStoreHash() => r'a8ddd1f72af1cf4cb92a397a1692d78cb915591e';

abstract class _$SpeedStore extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
