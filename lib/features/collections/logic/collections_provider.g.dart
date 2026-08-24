// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(collections)
final collectionsProvider = CollectionsProvider._();

final class CollectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Collection>>,
          List<Collection>,
          FutureOr<List<Collection>>
        >
    with $FutureModifier<List<Collection>>, $FutureProvider<List<Collection>> {
  CollectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Collection>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Collection>> create(Ref ref) {
    return collections(ref);
  }
}

String _$collectionsHash() => r'fa274f9302c9193e7208979b92af4b2bc733d1d1';

@ProviderFor(collection)
final collectionProvider = CollectionFamily._();

final class CollectionProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          FutureOr<Collection>
        >
    with $FutureModifier<Collection>, $FutureProvider<Collection> {
  CollectionProvider._({
    required CollectionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'collectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$collectionHash();

  @override
  String toString() {
    return r'collectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Collection> create(Ref ref) {
    final argument = this.argument as String;
    return collection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$collectionHash() => r'79361a0c16b30580a7a5e0fbee4740ef3167d4a7';

final class CollectionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Collection>, String> {
  CollectionFamily._()
    : super(
        retry: null,
        name: r'collectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CollectionProvider call(String id) =>
      CollectionProvider._(argument: id, from: this);

  @override
  String toString() => r'collectionProvider';
}
