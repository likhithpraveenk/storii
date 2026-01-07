// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_series_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibrarySeriesNotifier)
final librarySeriesProvider = LibrarySeriesNotifierProvider._();

final class LibrarySeriesNotifierProvider
    extends $StreamNotifierProvider<LibrarySeriesNotifier, List<Series>> {
  LibrarySeriesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'librarySeriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$librarySeriesNotifierHash();

  @$internal
  @override
  LibrarySeriesNotifier create() => LibrarySeriesNotifier();
}

String _$librarySeriesNotifierHash() =>
    r'0b904d1a8719fb56593c87fb882abcd68d3bc172';

abstract class _$LibrarySeriesNotifier extends $StreamNotifier<List<Series>> {
  Stream<List<Series>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Series>>, List<Series>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Series>>, List<Series>>,
              AsyncValue<List<Series>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
