// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shelves)
final shelvesProvider = ShelvesProvider._();

final class ShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          FutureOr<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $FutureProvider<List<Shelf>> {
  ShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelvesHash();

  @$internal
  @override
  $FutureProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Shelf>> create(Ref ref) {
    return shelves(ref);
  }
}

String _$shelvesHash() => r'345fdd366f9cefc848d6b0ff19a4198de267b466';

@ProviderFor(sortedShelves)
final sortedShelvesProvider = SortedShelvesProvider._();

final class SortedShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          FutureOr<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $FutureProvider<List<Shelf>> {
  SortedShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedShelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedShelvesHash();

  @$internal
  @override
  $FutureProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Shelf>> create(Ref ref) {
    return sortedShelves(ref);
  }
}

String _$sortedShelvesHash() => r'cfc11ad73226a33e6f9b2241f5f36fa75c69b469';

@ProviderFor(rawShelves)
final rawShelvesProvider = RawShelvesProvider._();

final class RawShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          FutureOr<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $FutureProvider<List<Shelf>> {
  RawShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawShelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawShelvesHash();

  @$internal
  @override
  $FutureProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Shelf>> create(Ref ref) {
    return rawShelves(ref);
  }
}

String _$rawShelvesHash() => r'9a858951d20f786387f19fed942b9eee9baf97a7';
