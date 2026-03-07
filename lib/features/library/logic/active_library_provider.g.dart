// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_library_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeLibraryDetails)
final activeLibraryDetailsProvider = ActiveLibraryDetailsProvider._();

final class ActiveLibraryDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryResponse>,
          LibraryResponse,
          FutureOr<LibraryResponse>
        >
    with $FutureModifier<LibraryResponse>, $FutureProvider<LibraryResponse> {
  ActiveLibraryDetailsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeLibraryDetailsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeLibraryDetailsHash();

  @$internal
  @override
  $FutureProviderElement<LibraryResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryResponse> create(Ref ref) {
    return activeLibraryDetails(ref);
  }
}

String _$activeLibraryDetailsHash() =>
    r'6a23ba1caf2dd6d6b0e620eb9c56659ec29ddae6';

@ProviderFor(librarySyncController)
final librarySyncControllerProvider = LibrarySyncControllerProvider._();

final class LibrarySyncControllerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  LibrarySyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'librarySyncControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$librarySyncControllerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return librarySyncController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$librarySyncControllerHash() =>
    r'85e4ed5bacb3cfc65d47048658e886875865852d';
