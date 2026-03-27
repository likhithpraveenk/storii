// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchFilterNotifier)
final searchFilterProvider = SearchFilterNotifierProvider._();

final class SearchFilterNotifierProvider
    extends $NotifierProvider<SearchFilterNotifier, SearchFilter> {
  SearchFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchFilterNotifierHash();

  @$internal
  @override
  SearchFilterNotifier create() => SearchFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchFilter>(value),
    );
  }
}

String _$searchFilterNotifierHash() =>
    r'a0e4119e01f0534ea0f5aa47383c262ad8ef590f';

abstract class _$SearchFilterNotifier extends $Notifier<SearchFilter> {
  SearchFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SearchFilter, SearchFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchFilter, SearchFilter>,
              SearchFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SearchNotifier)
final searchProvider = SearchNotifierFamily._();

final class SearchNotifierProvider
    extends $AsyncNotifierProvider<SearchNotifier, SearchResponse?> {
  SearchNotifierProvider._({
    required SearchNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchNotifierHash();

  @override
  String toString() {
    return r'searchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SearchNotifier create() => SearchNotifier();

  @override
  bool operator ==(Object other) {
    return other is SearchNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchNotifierHash() => r'bb080b72241cab6f2bd4d60e63e53ec5b30dc5d6';

final class SearchNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SearchNotifier,
          AsyncValue<SearchResponse?>,
          SearchResponse?,
          FutureOr<SearchResponse?>,
          String
        > {
  SearchNotifierFamily._()
    : super(
        retry: null,
        name: r'searchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchNotifierProvider call(String query) =>
      SearchNotifierProvider._(argument: query, from: this);

  @override
  String toString() => r'searchProvider';
}

abstract class _$SearchNotifier extends $AsyncNotifier<SearchResponse?> {
  late final _$args = ref.$arg as String;
  String get query => _$args;

  FutureOr<SearchResponse?> build(String query);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SearchResponse?>, SearchResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SearchResponse?>, SearchResponse?>,
              AsyncValue<SearchResponse?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
