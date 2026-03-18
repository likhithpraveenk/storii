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
