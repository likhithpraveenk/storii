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
    extends $FunctionalProvider<AsyncValue<Library>, Library, FutureOr<Library>>
    with $FutureModifier<Library>, $FutureProvider<Library> {
  ActiveLibraryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeLibraryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeLibraryHash();

  @$internal
  @override
  $FutureProviderElement<Library> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Library> create(Ref ref) {
    return activeLibrary(ref);
  }
}

String _$activeLibraryHash() => r'f68a07ac38074aa827ab4ff57e4287fcdfe43044';
