// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FilterData)
final filterDataProvider = FilterDataProvider._();

final class FilterDataProvider
    extends $NotifierProvider<FilterData, LibraryFilterData> {
  FilterDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filterDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filterDataHash();

  @$internal
  @override
  FilterData create() => FilterData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryFilterData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryFilterData>(value),
    );
  }
}

String _$filterDataHash() => r'59abdcc6265b10ff842561d7b6d75790d3643097';

abstract class _$FilterData extends $Notifier<LibraryFilterData> {
  LibraryFilterData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LibraryFilterData, LibraryFilterData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LibraryFilterData, LibraryFilterData>,
              LibraryFilterData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
