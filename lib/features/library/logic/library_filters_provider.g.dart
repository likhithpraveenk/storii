// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibraryFiltersNotifier)
final libraryFiltersProvider = LibraryFiltersNotifierProvider._();

final class LibraryFiltersNotifierProvider
    extends $NotifierProvider<LibraryFiltersNotifier, FilterState> {
  LibraryFiltersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryFiltersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryFiltersNotifierHash();

  @$internal
  @override
  LibraryFiltersNotifier create() => LibraryFiltersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilterState>(value),
    );
  }
}

String _$libraryFiltersNotifierHash() =>
    r'1fdaa8d3cbbd0ed9f691d98fd4615000b3d731bd';

abstract class _$LibraryFiltersNotifier extends $Notifier<FilterState> {
  FilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FilterState, FilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FilterState, FilterState>,
              FilterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
