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
        isAutoDispose: true,
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

String _$seriesListHash() => r'dea658dbeed9e36bb1de55f7ee067d46951c6f0a';

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
        isAutoDispose: true,
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

String _$rawSeriesListHash() => r'591e5b0163868992abde38b8cb97a50a10c1aa36';
