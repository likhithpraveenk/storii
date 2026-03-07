// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playRequestParams)
final playRequestParamsProvider = PlayRequestParamsProvider._();

final class PlayRequestParamsProvider
    extends
        $FunctionalProvider<
          PlayItemRequestParams,
          PlayItemRequestParams,
          PlayItemRequestParams
        >
    with $Provider<PlayItemRequestParams> {
  PlayRequestParamsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playRequestParamsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playRequestParamsHash();

  @$internal
  @override
  $ProviderElement<PlayItemRequestParams> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlayItemRequestParams create(Ref ref) {
    return playRequestParams(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayItemRequestParams value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayItemRequestParams>(value),
    );
  }
}

String _$playRequestParamsHash() => r'651956008f67dc282cc80bd3c936ac73219b855c';

@ProviderFor(SessionNotifier)
final sessionProvider = SessionNotifierProvider._();

final class SessionNotifierProvider
    extends $NotifierProvider<SessionNotifier, PlaybackSession?> {
  SessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionNotifierHash();

  @$internal
  @override
  SessionNotifier create() => SessionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaybackSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaybackSession?>(value),
    );
  }
}

String _$sessionNotifierHash() => r'088a4d149a2e7ebcbc5386ef50c126e9aa0f731b';

abstract class _$SessionNotifier extends $Notifier<PlaybackSession?> {
  PlaybackSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PlaybackSession?, PlaybackSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlaybackSession?, PlaybackSession?>,
              PlaybackSession?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
