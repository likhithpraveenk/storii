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

@ProviderFor(cachedItem)
final cachedItemProvider = CachedItemFamily._();

final class CachedItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem?>,
          LibraryItem?,
          FutureOr<LibraryItem?>
        >
    with $FutureModifier<LibraryItem?>, $FutureProvider<LibraryItem?> {
  CachedItemProvider._({
    required CachedItemFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cachedItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cachedItemHash();

  @override
  String toString() {
    return r'cachedItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LibraryItem?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItem?> create(Ref ref) {
    final argument = this.argument as String;
    return cachedItem(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CachedItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cachedItemHash() => r'dd3c93c68d8ee68c661a8ccbf1ac0b7b4db13c65';

final class CachedItemFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LibraryItem?>, String> {
  CachedItemFamily._()
    : super(
        retry: null,
        name: r'cachedItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CachedItemProvider call(String id) =>
      CachedItemProvider._(argument: id, from: this);

  @override
  String toString() => r'cachedItemProvider';
}
