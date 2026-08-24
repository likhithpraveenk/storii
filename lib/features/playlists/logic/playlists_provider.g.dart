// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlists)
final playlistsProvider = PlaylistsProvider._();

final class PlaylistsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Playlist>>,
          List<Playlist>,
          FutureOr<List<Playlist>>
        >
    with $FutureModifier<List<Playlist>>, $FutureProvider<List<Playlist>> {
  PlaylistsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistsHash();

  @$internal
  @override
  $FutureProviderElement<List<Playlist>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Playlist>> create(Ref ref) {
    return playlists(ref);
  }
}

String _$playlistsHash() => r'2e7b23683b8b812f3fe566fd0a9de71aa807d9aa';

@ProviderFor(playlist)
final playlistProvider = PlaylistFamily._();

final class PlaylistProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, FutureOr<Playlist>>
    with $FutureModifier<Playlist>, $FutureProvider<Playlist> {
  PlaylistProvider._({
    required PlaylistFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playlistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistHash();

  @override
  String toString() {
    return r'playlistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Playlist> create(Ref ref) {
    final argument = this.argument as String;
    return playlist(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistHash() => r'87450d5408ea2e392ef5ad502d723c11e8063501';

final class PlaylistFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Playlist>, String> {
  PlaylistFamily._()
    : super(
        retry: null,
        name: r'playlistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistProvider call(String id) =>
      PlaylistProvider._(argument: id, from: this);

  @override
  String toString() => r'playlistProvider';
}
