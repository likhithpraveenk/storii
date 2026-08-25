// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(collectionAdded)
final collectionAddedProvider = CollectionAddedProvider._();

final class CollectionAddedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          Stream<Collection>
        >
    with $FutureModifier<Collection>, $StreamProvider<Collection> {
  CollectionAddedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionAddedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionAddedHash();

  @$internal
  @override
  $StreamProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Collection> create(Ref ref) {
    return collectionAdded(ref);
  }
}

String _$collectionAddedHash() => r'f9cba44685e1f08fef2be2ae99b841fd3d588941';

@ProviderFor(collectionUpdated)
final collectionUpdatedProvider = CollectionUpdatedProvider._();

final class CollectionUpdatedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          Stream<Collection>
        >
    with $FutureModifier<Collection>, $StreamProvider<Collection> {
  CollectionUpdatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionUpdatedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionUpdatedHash();

  @$internal
  @override
  $StreamProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Collection> create(Ref ref) {
    return collectionUpdated(ref);
  }
}

String _$collectionUpdatedHash() => r'258a20251f03456e160de3f22ff8b523c2ae7cde';

@ProviderFor(collectionRemoved)
final collectionRemovedProvider = CollectionRemovedProvider._();

final class CollectionRemovedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          Stream<Collection>
        >
    with $FutureModifier<Collection>, $StreamProvider<Collection> {
  CollectionRemovedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionRemovedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionRemovedHash();

  @$internal
  @override
  $StreamProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Collection> create(Ref ref) {
    return collectionRemoved(ref);
  }
}

String _$collectionRemovedHash() => r'd7407cd6a5d47ae65273f989be87d66ff945946f';
