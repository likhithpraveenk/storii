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
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressMapHash();

  @$internal
  @override
  MediaProgressMap create() => MediaProgressMap();
}

String _$mediaProgressMapHash() => r'c6a31768ab74f5369598914e923c2efb3f5bb91a';

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

@ProviderFor(mediaProgressFromMap)
final mediaProgressFromMapProvider = MediaProgressFromMapFamily._();

final class MediaProgressFromMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaProgress?>,
          MediaProgress?,
          FutureOr<MediaProgress?>
        >
    with $FutureModifier<MediaProgress?>, $FutureProvider<MediaProgress?> {
  MediaProgressFromMapProvider._({
    required MediaProgressFromMapFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'mediaProgressFromMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressFromMapHash();

  @override
  String toString() {
    return r'mediaProgressFromMapProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<MediaProgress?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MediaProgress?> create(Ref ref) {
    final argument = this.argument as (String, String?);
    return mediaProgressFromMap(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaProgressFromMapProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mediaProgressFromMapHash() =>
    r'd9750454d9d3153c2e33bf974143d410ae50251a';

final class MediaProgressFromMapFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<MediaProgress?>, (String, String?)> {
  MediaProgressFromMapFamily._()
    : super(
        retry: null,
        name: r'mediaProgressFromMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MediaProgressFromMapProvider call(
    String libraryItemId, [
    String? episodeId,
  ]) => MediaProgressFromMapProvider._(
    argument: (libraryItemId, episodeId),
    from: this,
  );

  @override
  String toString() => r'mediaProgressFromMapProvider';
}
