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

String _$seriesListHash() => r'49c8c3f0771cbb6cdb9c0b452584845e61dd0bff';

@ProviderFor(rawSeriesList)
final rawSeriesListProvider = RawSeriesListProvider._();

final class RawSeriesListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Series>>,
          List<Series>,
          FutureOr<List<Series>>
        >
    with $FutureModifier<List<Series>>, $FutureProvider<List<Series>> {
  RawSeriesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawSeriesListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawSeriesListHash();

  @$internal
  @override
  $FutureProviderElement<List<Series>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Series>> create(Ref ref) {
    return rawSeriesList(ref);
  }
}

String _$rawSeriesListHash() => r'6b5ad56b90853980a4c1ecb2c9e03c6450c81e09';
