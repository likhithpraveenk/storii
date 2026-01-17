// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibraryFiltersNotifier)
final libraryFiltersProvider = LibraryFiltersNotifierFamily._();

final class LibraryFiltersNotifierProvider
    extends $NotifierProvider<LibraryFiltersNotifier, FilterState> {
  LibraryFiltersNotifierProvider._({
    required LibraryFiltersNotifierFamily super.from,
    required FiltersScreen super.argument,
  }) : super(
         retry: null,
         name: r'libraryFiltersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryFiltersNotifierHash();

  @override
  String toString() {
    return r'libraryFiltersProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is LibraryFiltersNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryFiltersNotifierHash() =>
    r'b9e98e3ecf6e08a8e140a67ca716179a4a28dc1a';

final class LibraryFiltersNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LibraryFiltersNotifier,
          FilterState,
          FilterState,
          FilterState,
          FiltersScreen
        > {
  LibraryFiltersNotifierFamily._()
    : super(
        retry: null,
        name: r'libraryFiltersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LibraryFiltersNotifierProvider call(FiltersScreen tab) =>
      LibraryFiltersNotifierProvider._(argument: tab, from: this);

  @override
  String toString() => r'libraryFiltersProvider';
}

abstract class _$LibraryFiltersNotifier extends $Notifier<FilterState> {
  late final _$args = ref.$arg as FiltersScreen;
  FiltersScreen get tab => _$args;

  FilterState build(FiltersScreen tab);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
