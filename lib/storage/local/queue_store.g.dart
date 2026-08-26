// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QueueStore)
final queueStoreProvider = QueueStoreProvider._();

final class QueueStoreProvider extends $NotifierProvider<QueueStore, void> {
  QueueStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueStoreHash();

  @$internal
  @override
  QueueStore create() => QueueStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$queueStoreHash() => r'ab3c4364418a3a2bdb5a5581098586c5cc8d0102';

abstract class _$QueueStore extends $Notifier<void> {
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
