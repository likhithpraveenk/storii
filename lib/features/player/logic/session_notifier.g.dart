// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$sessionNotifierHash() => r'dbcd653cc800a1cc4439cd071610e5f5dd7d875e';

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
