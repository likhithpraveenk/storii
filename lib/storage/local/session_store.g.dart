// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sessionStore)
final sessionStoreProvider = SessionStoreProvider._();

final class SessionStoreProvider
    extends $FunctionalProvider<SessionStore, SessionStore, SessionStore>
    with $Provider<SessionStore> {
  SessionStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionStoreHash();

  @$internal
  @override
  $ProviderElement<SessionStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionStore create(Ref ref) {
    return sessionStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionStore>(value),
    );
  }
}

String _$sessionStoreHash() => r'ae6ea1e7ebdab3dcd5f144825aae92f68b18bd10';

@ProviderFor(localSessions)
final localSessionsProvider = LocalSessionsProvider._();

final class LocalSessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PlaybackSession>>,
          List<PlaybackSession>,
          Stream<List<PlaybackSession>>
        >
    with
        $FutureModifier<List<PlaybackSession>>,
        $StreamProvider<List<PlaybackSession>> {
  LocalSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSessionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSessionsHash();

  @$internal
  @override
  $StreamProviderElement<List<PlaybackSession>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PlaybackSession>> create(Ref ref) {
    return localSessions(ref);
  }
}

String _$localSessionsHash() => r'c4521918a448feaae8eb71a5a97348c893488525';

@ProviderFor(localSessionById)
final localSessionByIdProvider = LocalSessionByIdFamily._();

final class LocalSessionByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaybackSession?>,
          PlaybackSession?,
          Stream<PlaybackSession?>
        >
    with $FutureModifier<PlaybackSession?>, $StreamProvider<PlaybackSession?> {
  LocalSessionByIdProvider._({
    required LocalSessionByIdFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'localSessionByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$localSessionByIdHash();

  @override
  String toString() {
    return r'localSessionByIdProvider'
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
    return localSessionById(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalSessionByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$localSessionByIdHash() => r'7487ff86e8902a45853f16f5bd2c5c570ef2e87e';

final class LocalSessionByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<Stream<PlaybackSession?>, (String, String?)> {
  LocalSessionByIdFamily._()
    : super(
        retry: null,
        name: r'localSessionByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LocalSessionByIdProvider call(String itemId, [String? episodeId]) =>
      LocalSessionByIdProvider._(argument: (itemId, episodeId), from: this);

  @override
  String toString() => r'localSessionByIdProvider';
}
