// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaProgressNotifier)
final mediaProgressProvider = MediaProgressNotifierProvider._();

final class MediaProgressNotifierProvider
    extends $NotifierProvider<MediaProgressNotifier, void> {
  MediaProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressNotifierHash();

  @$internal
  @override
  MediaProgressNotifier create() => MediaProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$mediaProgressNotifierHash() =>
    r'59af9e3a8d8273c4c2f8162456991d58012aa275';

abstract class _$MediaProgressNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
