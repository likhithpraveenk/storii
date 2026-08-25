// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_providers.dart';

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

@ProviderFor(collectionDetail)
final collectionDetailProvider = CollectionDetailFamily._();

final class CollectionDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          FutureOr<Collection>
        >
    with $FutureModifier<Collection>, $FutureProvider<Collection> {
  CollectionDetailProvider._({
    required CollectionDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'collectionDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$collectionDetailHash();

  @override
  String toString() {
    return r'collectionDetailProvider'
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
    return collectionDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$collectionDetailHash() => r'0a859a9322b323a5e8de06aa6f703d6a2433e9fa';

final class CollectionDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Collection>, String> {
  CollectionDetailFamily._()
    : super(
        retry: null,
        name: r'collectionDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CollectionDetailProvider call(String id) =>
      CollectionDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'collectionDetailProvider';
}
