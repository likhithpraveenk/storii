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

String _$shelvesHash() => r'66b7fcf219e86408fb5ad4d59eb3c21a25134afc';

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

String _$rawShelvesHash() => r'4535b37f2586ddafa71974c98af28ef32269c345';
