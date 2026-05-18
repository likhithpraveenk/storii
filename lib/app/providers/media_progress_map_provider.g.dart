// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaProgressMap)
final mediaProgressMapProvider = MediaProgressMapProvider._();

final class MediaProgressMapProvider
    extends
        $AsyncNotifierProvider<MediaProgressMap, Map<String, MediaProgress>> {
  MediaProgressMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressMapHash();

  @$internal
  @override
  MediaProgressMap create() => MediaProgressMap();
}

String _$mediaProgressMapHash() => r'2af3bd3c396fd21f772b65ccd406f8d07820a375';

abstract class _$MediaProgressMap
    extends $AsyncNotifier<Map<String, MediaProgress>> {
  FutureOr<Map<String, MediaProgress>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, MediaProgress>>,
              Map<String, MediaProgress>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, MediaProgress>>,
                Map<String, MediaProgress>
              >,
              AsyncValue<Map<String, MediaProgress>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(totalFinishedBooks)
final totalFinishedBooksProvider = TotalFinishedBooksProvider._();

final class TotalFinishedBooksProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  TotalFinishedBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalFinishedBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalFinishedBooksHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalFinishedBooks(ref);
  }
}

String _$totalFinishedBooksHash() =>
    r'b477eec071d2bf4456f3aa1a09775df871d6934c';

@ProviderFor(totalFinishedEpisodes)
final totalFinishedEpisodesProvider = TotalFinishedEpisodesProvider._();

final class TotalFinishedEpisodesProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  TotalFinishedEpisodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalFinishedEpisodesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalFinishedEpisodesHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalFinishedEpisodes(ref);
  }
}

String _$totalFinishedEpisodesHash() =>
    r'121b41f5c82d4c6245dfa18fddcb4871ddca494f';
