// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_library_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeLibrary)
final activeLibraryProvider = ActiveLibraryProvider._();

final class ActiveLibraryProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryDomain>,
          LibraryDomain,
          FutureOr<LibraryDomain>
        >
    with $FutureModifier<LibraryDomain>, $FutureProvider<LibraryDomain> {
  ActiveLibraryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeLibraryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeLibraryHash();

  @$internal
  @override
  $FutureProviderElement<LibraryDomain> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryDomain> create(Ref ref) {
    return activeLibrary(ref);
  }
}

String _$activeLibraryHash() => r'e0080dc72f62be08428299807e5639ba91fdb689';
