// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(seriesList)
final seriesListProvider = SeriesListProvider._();

final class SeriesListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Series>>,
          List<Series>,
          FutureOr<List<Series>>
        >
    with $FutureModifier<List<Series>>, $FutureProvider<List<Series>> {
  SeriesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'seriesListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$seriesListHash();

  @$internal
  @override
  $FutureProviderElement<List<Series>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Series>> create(Ref ref) {
    return seriesList(ref);
  }
}

String _$seriesListHash() => r'1497792e026755b744fb0299dc571342ffdc92ee';
