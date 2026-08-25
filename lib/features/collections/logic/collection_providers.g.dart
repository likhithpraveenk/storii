// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Collections)
final collectionsProvider = CollectionsProvider._();

final class CollectionsProvider
    extends $AsyncNotifierProvider<Collections, List<Collection>> {
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
  Collections create() => Collections();
}

String _$collectionsHash() => r'd70fd1dbd050feee3f3d00bf45053a3c14c8f521';

abstract class _$Collections extends $AsyncNotifier<List<Collection>> {
  FutureOr<List<Collection>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Collection>>, List<Collection>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Collection>>, List<Collection>>,
              AsyncValue<List<Collection>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CollectionDetail)
final collectionDetailProvider = CollectionDetailFamily._();

final class CollectionDetailProvider
    extends $AsyncNotifierProvider<CollectionDetail, Collection> {
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
  CollectionDetail create() => CollectionDetail();

  @override
  bool operator ==(Object other) {
    return other is CollectionDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$collectionDetailHash() => r'45032bef9f29c416b6b0b0cb5528ed6567915422';

final class CollectionDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          CollectionDetail,
          AsyncValue<Collection>,
          Collection,
          FutureOr<Collection>,
          String
        > {
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

abstract class _$CollectionDetail extends $AsyncNotifier<Collection> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Collection> build(String id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Collection>, Collection>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Collection>, Collection>,
              AsyncValue<Collection>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(CollectionMutations)
final collectionMutationsProvider = CollectionMutationsProvider._();

final class CollectionMutationsProvider
    extends $AsyncNotifierProvider<CollectionMutations, void> {
  CollectionMutationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionMutationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionMutationsHash();

  @$internal
  @override
  CollectionMutations create() => CollectionMutations();
}

String _$collectionMutationsHash() =>
    r'16f8684bb27460bd411619a6a6ffcf55e06b4ed9';

abstract class _$CollectionMutations extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
