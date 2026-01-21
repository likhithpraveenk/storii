// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayerEvent)
final playerEventProvider = PlayerEventProvider._();

final class PlayerEventProvider
    extends $StreamNotifierProvider<PlayerEvent, PlayerState> {
  PlayerEventProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerEventProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerEventHash();

  @$internal
  @override
  PlayerEvent create() => PlayerEvent();
}

String _$playerEventHash() => r'5f883e856a9073929be73310ee10d0c24c0a4752';

abstract class _$PlayerEvent extends $StreamNotifier<PlayerState> {
  Stream<PlayerState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PlayerState>, PlayerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PlayerState>, PlayerState>,
              AsyncValue<PlayerState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PlayerHeight)
final playerHeightProvider = PlayerHeightProvider._();

final class PlayerHeightProvider
    extends $NotifierProvider<PlayerHeight, double> {
  PlayerHeightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerHeightProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerHeightHash();

  @$internal
  @override
  PlayerHeight create() => PlayerHeight();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$playerHeightHash() => r'104ca481cd04c14c1022bcf892018397b445d34d';

abstract class _$PlayerHeight extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PlayerBounds)
final playerBoundsProvider = PlayerBoundsProvider._();

final class PlayerBoundsProvider
    extends $NotifierProvider<PlayerBounds, ({double max, double min})> {
  PlayerBoundsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerBoundsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerBoundsHash();

  @$internal
  @override
  PlayerBounds create() => PlayerBounds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({double max, double min}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<({double max, double min})>(value),
    );
  }
}

String _$playerBoundsHash() => r'6a62f583f180b2acf732503cc78e20c9d82c3f28';

abstract class _$PlayerBounds extends $Notifier<({double max, double min})> {
  ({double max, double min}) build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<({double max, double min}), ({double max, double min})>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({double max, double min}),
                ({double max, double min})
              >,
              ({double max, double min}),
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(playerExpandFactor)
final playerExpandFactorProvider = PlayerExpandFactorProvider._();

final class PlayerExpandFactorProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  PlayerExpandFactorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerExpandFactorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerExpandFactorHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return playerExpandFactor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$playerExpandFactorHash() =>
    r'286f12dba3cd5788ec79aaebf1be9ee9617920eb';

@ProviderFor(playerState)
final playerStateProvider = PlayerStateProvider._();

final class PlayerStateProvider
    extends $FunctionalProvider<PlayerState, PlayerState, PlayerState>
    with $Provider<PlayerState> {
  PlayerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerStateHash();

  @$internal
  @override
  $ProviderElement<PlayerState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayerState create(Ref ref) {
    return playerState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerState>(value),
    );
  }
}

String _$playerStateHash() => r'b590551de11ce7ea4e5907d5e5038d13e4b10fb7';
