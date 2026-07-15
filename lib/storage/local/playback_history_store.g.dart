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
    r'21a135780749485772796f902a151b8f4610dd0f';

abstract class _$PlaybackHistoryStore extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
