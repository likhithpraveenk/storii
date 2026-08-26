// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlistAdded)
final playlistAddedProvider = PlaylistAddedProvider._();

final class PlaylistAddedProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, Stream<Playlist>>
    with $FutureModifier<Playlist>, $StreamProvider<Playlist> {
  PlaylistAddedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistAddedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistAddedHash();

  @$internal
  @override
  $StreamProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Playlist> create(Ref ref) {
    return playlistAdded(ref);
  }
}

String _$playlistAddedHash() => r'4b099e4e6fe7b866f54398754b48b098f0e60d06';

@ProviderFor(playlistUpdated)
final playlistUpdatedProvider = PlaylistUpdatedProvider._();

final class PlaylistUpdatedProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, Stream<Playlist>>
    with $FutureModifier<Playlist>, $StreamProvider<Playlist> {
  PlaylistUpdatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistUpdatedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistUpdatedHash();

  @$internal
  @override
  $StreamProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Playlist> create(Ref ref) {
    return playlistUpdated(ref);
  }
}

String _$playlistUpdatedHash() => r'1f026ddc46483352ee313f26c283e81855384761';

@ProviderFor(playlistRemoved)
final playlistRemovedProvider = PlaylistRemovedProvider._();

final class PlaylistRemovedProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, Stream<Playlist>>
    with $FutureModifier<Playlist>, $StreamProvider<Playlist> {
  PlaylistRemovedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistRemovedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistRemovedHash();

  @$internal
  @override
  $StreamProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Playlist> create(Ref ref) {
    return playlistRemoved(ref);
  }
}

String _$playlistRemovedHash() => r'5cba44963ec9320e99b758ccf7b0b3c8898c91dd';
