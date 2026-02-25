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
    extends $AsyncNotifierProvider<SeriesListNotifier, List<Series>> {
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
    r'fd9a71df7d82d19367a9f0862aa15f65d9acbb3a';

abstract class _$SeriesListNotifier extends $AsyncNotifier<List<Series>> {
  FutureOr<List<Series>> build();
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
