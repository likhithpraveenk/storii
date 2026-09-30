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

String _$seriesHash() => r'0d9322d77feb8cb050d37c494f1163cf0e8a66c2';

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

@ProviderFor(addToContinueSeries)
final addToContinueSeriesProvider = AddToContinueSeriesFamily._();

final class AddToContinueSeriesProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  AddToContinueSeriesProvider._({
    required AddToContinueSeriesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'addToContinueSeriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addToContinueSeriesHash();

  @override
  String toString() {
    return r'addToContinueSeriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return addToContinueSeries(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddToContinueSeriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addToContinueSeriesHash() =>
    r'a684690decebe893b0c9ed2bb8dce53b64584688';

final class AddToContinueSeriesFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  AddToContinueSeriesFamily._()
    : super(
        retry: null,
        name: r'addToContinueSeriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddToContinueSeriesProvider call(String seriesId) =>
      AddToContinueSeriesProvider._(argument: seriesId, from: this);

  @override
  String toString() => r'addToContinueSeriesProvider';
}
