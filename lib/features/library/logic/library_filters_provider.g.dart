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
    required CurrentScreen super.argument,
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
    r'1918bc8ac369f59d3b2664a141c301dc391bca0b';

final class LibraryFiltersNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LibraryFiltersNotifier,
          FilterState,
          FilterState,
          FilterState,
          CurrentScreen
        > {
  LibraryFiltersNotifierFamily._()
    : super(
        retry: null,
        name: r'libraryFiltersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LibraryFiltersNotifierProvider call(CurrentScreen screen) =>
      LibraryFiltersNotifierProvider._(argument: screen, from: this);

  @override
  String toString() => r'libraryFiltersProvider';
}

abstract class _$LibraryFiltersNotifier extends $Notifier<FilterState> {
  late final _$args = ref.$arg as CurrentScreen;
  CurrentScreen get screen => _$args;

  FilterState build(CurrentScreen screen);
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
