// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SeriesListNotifier)
final seriesListProvider = SeriesListNotifierProvider._();

final class SeriesListNotifierProvider
    extends $AsyncNotifierProvider<SeriesListNotifier, List<SeriesDomain>> {
  SeriesListNotifierProvider._()
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
  String debugGetCreateSourceHash() => _$seriesListNotifierHash();

  @$internal
  @override
  SeriesListNotifier create() => SeriesListNotifier();
}

String _$seriesListNotifierHash() =>
    r'70fbd093222bf0009b34258804ea511444cba2cc';

abstract class _$SeriesListNotifier extends $AsyncNotifier<List<SeriesDomain>> {
  FutureOr<List<SeriesDomain>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<SeriesDomain>>, List<SeriesDomain>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SeriesDomain>>, List<SeriesDomain>>,
              AsyncValue<List<SeriesDomain>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
