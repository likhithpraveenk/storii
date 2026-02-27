// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayerMode)
final playerModeProvider = PlayerModeProvider._();

final class PlayerModeProvider
    extends $NotifierProvider<PlayerMode, PlayerViewState> {
  PlayerModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerModeHash();

  @$internal
  @override
  PlayerMode create() => PlayerMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerViewState>(value),
    );
  }
}

String _$playerModeHash() => r'85973874bd45cc1a5e4b6976b14b89bc142a5186';

abstract class _$PlayerMode extends $Notifier<PlayerViewState> {
  PlayerViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PlayerViewState, PlayerViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlayerViewState, PlayerViewState>,
              PlayerViewState,
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

String _$playerHeightHash() => r'5c5706541b1eadcfc79bc54dbe99693e6229d3fa';

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

@ProviderFor(playerViewState)
final playerViewStateProvider = PlayerViewStateProvider._();

final class PlayerViewStateProvider
    extends
        $FunctionalProvider<PlayerViewState, PlayerViewState, PlayerViewState>
    with $Provider<PlayerViewState> {
  PlayerViewStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerViewStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerViewStateHash();

  @$internal
  @override
  $ProviderElement<PlayerViewState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayerViewState create(Ref ref) {
    return playerViewState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerViewState>(value),
    );
  }
}

String _$playerViewStateHash() => r'1cee937014a975aa297a4e9a80689a5b43a289f5';
