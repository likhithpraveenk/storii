// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_session_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CastSessionStore)
final castSessionStoreProvider = CastSessionStoreProvider._();

final class CastSessionStoreProvider
    extends $NotifierProvider<CastSessionStore, void> {
  CastSessionStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'castSessionStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$castSessionStoreHash();

  @$internal
  @override
  CastSessionStore create() => CastSessionStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$castSessionStoreHash() => r'1c314f38f98c394fd2c729b481e476d8c3436e75';

abstract class _$CastSessionStore extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
