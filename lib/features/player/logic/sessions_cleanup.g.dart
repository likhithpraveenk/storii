// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_cleanup.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionsCleanup)
final sessionsCleanupProvider = SessionsCleanupProvider._();

final class SessionsCleanupProvider
    extends $NotifierProvider<SessionsCleanup, void> {
  SessionsCleanupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionsCleanupProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionsCleanupHash();

  @$internal
  @override
  SessionsCleanup create() => SessionsCleanup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sessionsCleanupHash() => r'9c77f47038235c4fa038c475505527daf7ffbc7f';

abstract class _$SessionsCleanup extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
