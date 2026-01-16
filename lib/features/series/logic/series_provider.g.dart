// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(series)
final seriesProvider = SeriesFamily._();

final class SeriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<SeriesDomain>,
          SeriesDomain,
          FutureOr<SeriesDomain>
        >
    with $FutureModifier<SeriesDomain>, $FutureProvider<SeriesDomain> {
  SeriesProvider._({
    required SeriesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'seriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$seriesHash();

  @override
  String toString() {
    return r'seriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SeriesDomain> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SeriesDomain> create(Ref ref) {
    final argument = this.argument as String;
    return series(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$seriesHash() => r'1572c7cc48367bbaca057e50df24b946c4b100cc';

final class SeriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SeriesDomain>, String> {
  SeriesFamily._()
    : super(
        retry: null,
        name: r'seriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SeriesProvider call(String seriesId) =>
      SeriesProvider._(argument: seriesId, from: this);

  @override
  String toString() => r'seriesProvider';
}
