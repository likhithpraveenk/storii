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

String _$sessionNotifierHash() => r'10cf10230ea1e14962f5fd7fd3692b72c597a929';

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

@ProviderFor(localSession)
final localSessionProvider = LocalSessionFamily._();

final class LocalSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaybackSession?>,
          PlaybackSession?,
          Stream<PlaybackSession?>
        >
    with $FutureModifier<PlaybackSession?>, $StreamProvider<PlaybackSession?> {
  LocalSessionProvider._({
    required LocalSessionFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'localSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$localSessionHash();

  @override
  String toString() {
    return r'localSessionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<PlaybackSession?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PlaybackSession?> create(Ref ref) {
    final argument = this.argument as (String, String?);
    return localSession(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalSessionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$localSessionHash() => r'0e7829392162f18a2251cc924ea490bd9d9837fe';

final class LocalSessionFamily extends $Family
    with
        $FunctionalFamilyOverride<Stream<PlaybackSession?>, (String, String?)> {
  LocalSessionFamily._()
    : super(
        retry: null,
        name: r'localSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LocalSessionProvider call(String itemId, [String? episodeId]) =>
      LocalSessionProvider._(argument: (itemId, episodeId), from: this);

  @override
  String toString() => r'localSessionProvider';
}
