// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_cleanup.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sessionsCleanup)
final sessionsCleanupProvider = SessionsCleanupFamily._();

final class SessionsCleanupProvider
    extends
        $FunctionalProvider<SessionsCleanup, SessionsCleanup, SessionsCleanup>
    with $Provider<SessionsCleanup> {
  SessionsCleanupProvider._({
    required SessionsCleanupFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'sessionsCleanupProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionsCleanupHash();

  @override
  String toString() {
    return r'sessionsCleanupProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SessionsCleanup> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionsCleanup create(Ref ref) {
    final argument = this.argument as UserDomain;
    return sessionsCleanup(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionsCleanup value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionsCleanup>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionsCleanupProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionsCleanupHash() => r'f0eff3fac301a989ae0fe5c90bc9ae3bdca22405';

final class SessionsCleanupFamily extends $Family
    with $FunctionalFamilyOverride<SessionsCleanup, UserDomain> {
  SessionsCleanupFamily._()
    : super(
        retry: null,
        name: r'sessionsCleanupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionsCleanupProvider call(UserDomain user) =>
      SessionsCleanupProvider._(argument: user, from: this);

  @override
  String toString() => r'sessionsCleanupProvider';
}
