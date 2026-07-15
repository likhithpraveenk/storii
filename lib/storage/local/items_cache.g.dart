// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemsCache)
final itemsCacheProvider = ItemsCacheProvider._();

final class ItemsCacheProvider extends $NotifierProvider<ItemsCache, void> {
  ItemsCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemsCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemsCacheHash();

  @$internal
  @override
  ItemsCache create() => ItemsCache();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$itemsCacheHash() => r'2dbbf23d7eea0d5a359eb55c6d90b77af2ba1b84';

abstract class _$ItemsCache extends $Notifier<void> {
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
