// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaProgressNotifier)
final mediaProgressProvider = MediaProgressNotifierFamily._();

final class MediaProgressNotifierProvider
    extends $AsyncNotifierProvider<MediaProgressNotifier, MediaProgress?> {
  MediaProgressNotifierProvider._({
    required MediaProgressNotifierFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'mediaProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressNotifierHash();

  @override
  String toString() {
    return r'mediaProgressProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  MediaProgressNotifier create() => MediaProgressNotifier();

  @override
  bool operator ==(Object other) {
    return other is MediaProgressNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mediaProgressNotifierHash() =>
    r'40fbf53cc3614c438aed10cacd844ec13036201d';

final class MediaProgressNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MediaProgressNotifier,
          AsyncValue<MediaProgress?>,
          MediaProgress?,
          FutureOr<MediaProgress?>,
          (String, String?)
        > {
  MediaProgressNotifierFamily._()
    : super(
        retry: null,
        name: r'mediaProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MediaProgressNotifierProvider call(String itemId, [String? episodeId]) =>
      MediaProgressNotifierProvider._(
        argument: (itemId, episodeId),
        from: this,
      );

  @override
  String toString() => r'mediaProgressProvider';
}

abstract class _$MediaProgressNotifier extends $AsyncNotifier<MediaProgress?> {
  late final _$args = ref.$arg as (String, String?);
  String get itemId => _$args.$1;
  String? get episodeId => _$args.$2;

  FutureOr<MediaProgress?> build(String itemId, [String? episodeId]);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MediaProgress?>, MediaProgress?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MediaProgress?>, MediaProgress?>,
              AsyncValue<MediaProgress?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
