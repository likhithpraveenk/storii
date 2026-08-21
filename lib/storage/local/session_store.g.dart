// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionStore)
final sessionStoreProvider = SessionStoreProvider._();

final class SessionStoreProvider
    extends $StreamNotifierProvider<SessionStore, List<PlaybackSession>> {
  SessionStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionStoreHash();

  @$internal
  @override
  SessionStore create() => SessionStore();
}

String _$sessionStoreHash() => r'f7167ac455ec07dafa5bde4e179776a2e1719512';

abstract class _$SessionStore extends $StreamNotifier<List<PlaybackSession>> {
  Stream<List<PlaybackSession>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<PlaybackSession>>, List<PlaybackSession>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PlaybackSession>>,
                List<PlaybackSession>
              >,
              AsyncValue<List<PlaybackSession>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
