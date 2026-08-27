// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Playlists)
final playlistsProvider = PlaylistsProvider._();

final class PlaylistsProvider
    extends $AsyncNotifierProvider<Playlists, List<Playlist>> {
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
  Playlists create() => Playlists();
}

String _$playlistsHash() => r'd7e8db851e3638d0010b7566a551e2d5113fc17d';

abstract class _$Playlists extends $AsyncNotifier<List<Playlist>> {
  FutureOr<List<Playlist>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Playlist>>, List<Playlist>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Playlist>>, List<Playlist>>,
              AsyncValue<List<Playlist>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(PlaylistDetail)
final playlistDetailProvider = PlaylistDetailFamily._();

final class PlaylistDetailProvider
    extends $AsyncNotifierProvider<PlaylistDetail, Playlist> {
  PlaylistDetailProvider._({
    required PlaylistDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playlistDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistDetailHash();

  @override
  String toString() {
    return r'playlistDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlaylistDetail create() => PlaylistDetail();

  @override
  bool operator ==(Object other) {
    return other is PlaylistDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistDetailHash() => r'5a6adfcbfc25f65739364f9e30c67404a52afd50';

final class PlaylistDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaylistDetail,
          AsyncValue<Playlist>,
          Playlist,
          FutureOr<Playlist>,
          String
        > {
  PlaylistDetailFamily._()
    : super(
        retry: null,
        name: r'playlistDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistDetailProvider call(String id) =>
      PlaylistDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'playlistDetailProvider';
}

abstract class _$PlaylistDetail extends $AsyncNotifier<Playlist> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Playlist> build(String id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Playlist>, Playlist>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Playlist>, Playlist>,
              AsyncValue<Playlist>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
