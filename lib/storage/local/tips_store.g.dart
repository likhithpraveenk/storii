// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tipsStore)
final tipsStoreProvider = TipsStoreProvider._();

final class TipsStoreProvider
    extends $FunctionalProvider<TipsStore, TipsStore, TipsStore>
    with $Provider<TipsStore> {
  TipsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tipsStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tipsStoreHash();

  @$internal
  @override
  $ProviderElement<TipsStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TipsStore create(Ref ref) {
    return tipsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TipsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TipsStore>(value),
    );
  }
}

String _$tipsStoreHash() => r'90af8eb367acc2e3c9a5937a906e4b1fac5179cc';
