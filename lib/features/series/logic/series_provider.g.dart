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
    extends $FunctionalProvider<AsyncValue<Series>, Series, FutureOr<Series>>
    with $FutureModifier<Series>, $FutureProvider<Series> {
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
  $FutureProviderElement<Series> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Series> create(Ref ref) {
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

String _$seriesHash() => r'9e7c3e3109fdd52732e09c795a34322a0d98652f';

final class SeriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Series>, String> {
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
