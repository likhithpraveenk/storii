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
    extends $AsyncNotifierProvider<SeriesListNotifier, SeriesListState> {
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
    r'38107f6883ba25e27fe68926b94f701467ebfc67';

abstract class _$SeriesListNotifier extends $AsyncNotifier<SeriesListState> {
  FutureOr<SeriesListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SeriesListState>, SeriesListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SeriesListState>, SeriesListState>,
              AsyncValue<SeriesListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
