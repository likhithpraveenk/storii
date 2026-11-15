// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemsCache)
final itemsCacheProvider = ItemsCacheProvider._();

final class ItemsCacheProvider
    extends $FunctionalProvider<ItemsCache, ItemsCache, ItemsCache>
    with $Provider<ItemsCache> {
  ItemsCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemsCacheProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemsCacheHash();

  @$internal
  @override
  $ProviderElement<ItemsCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemsCache create(Ref ref) {
    return itemsCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemsCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemsCache>(value),
    );
  }
}

String _$itemsCacheHash() => r'fbb87eb121ca560c00358ca615ba92950afc03ba';
