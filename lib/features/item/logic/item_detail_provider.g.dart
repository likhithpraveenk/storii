// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemDetail)
final itemDetailProvider = ItemDetailFamily._();

final class ItemDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ItemDomain>,
          ItemDomain,
          FutureOr<ItemDomain>
        >
    with $FutureModifier<ItemDomain>, $FutureProvider<ItemDomain> {
  ItemDetailProvider._({
    required ItemDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemDetailHash();

  @override
  String toString() {
    return r'itemDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ItemDomain> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ItemDomain> create(Ref ref) {
    final argument = this.argument as String;
    return itemDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemDetailHash() => r'b44280b2cedcfc6574e3927e345407b788b593de';

final class ItemDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ItemDomain>, String> {
  ItemDetailFamily._()
    : super(
        retry: null,
        name: r'itemDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemDetailProvider call(String id) =>
      ItemDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'itemDetailProvider';
}

@ProviderFor(item)
final itemProvider = ItemFamily._();

final class ItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<ItemDomain>,
          ItemDomain,
          FutureOr<ItemDomain>
        >
    with $FutureModifier<ItemDomain>, $FutureProvider<ItemDomain> {
  ItemProvider._({
    required ItemFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemHash();

  @override
  String toString() {
    return r'itemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ItemDomain> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ItemDomain> create(Ref ref) {
    final argument = this.argument as String;
    return item(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemHash() => r'73c24211339e03225f5448b90be4a5ef9ec0d5fa';

final class ItemFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ItemDomain>, String> {
  ItemFamily._()
    : super(
        retry: null,
        name: r'itemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemProvider call(String id) => ItemProvider._(argument: id, from: this);

  @override
  String toString() => r'itemProvider';
}
