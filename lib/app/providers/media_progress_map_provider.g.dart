// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaProgressSyncController)
final mediaProgressSyncControllerProvider =
    MediaProgressSyncControllerProvider._();

final class MediaProgressSyncControllerProvider
    extends $NotifierProvider<MediaProgressSyncController, void> {
  MediaProgressSyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressSyncControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressSyncControllerHash();

  @$internal
  @override
  MediaProgressSyncController create() => MediaProgressSyncController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$mediaProgressSyncControllerHash() =>
    r'd787c228a84667426732f257665960de4bd9efa1';

abstract class _$MediaProgressSyncController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(mediaProgressMap)
final mediaProgressMapProvider = MediaProgressMapProvider._();

final class MediaProgressMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, MediaProgress>>,
          Map<String, MediaProgress>,
          FutureOr<Map<String, MediaProgress>>
        >
    with
        $FutureModifier<Map<String, MediaProgress>>,
        $FutureProvider<Map<String, MediaProgress>> {
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
  $FutureProviderElement<Map<String, MediaProgress>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, MediaProgress>> create(Ref ref) {
    return mediaProgressMap(ref);
  }
}

String _$mediaProgressMapHash() => r'32ed97a5aeef813ebfaa38b0ae61db06ab069e4c';

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
    r'7433542fbdf0624bd04dccb95b28abc9e5a17067';

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
