// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_history_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaybackHistoryStore)
final playbackHistoryStoreProvider = PlaybackHistoryStoreProvider._();

final class PlaybackHistoryStoreProvider
    extends $AsyncNotifierProvider<PlaybackHistoryStore, void> {
  PlaybackHistoryStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackHistoryStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackHistoryStoreHash();

  @$internal
  @override
  PlaybackHistoryStore create() => PlaybackHistoryStore();
}

String _$playbackHistoryStoreHash() =>
    r'24ba8b22d167db7c4f85fba50b2500bd3151ab97';

abstract class _$PlaybackHistoryStore extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
