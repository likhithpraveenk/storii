// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_queue.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadQueue)
final downloadQueueProvider = DownloadQueueProvider._();

final class DownloadQueueProvider
    extends $AsyncNotifierProvider<DownloadQueue, List<String>> {
  DownloadQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadQueueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadQueueHash();

  @$internal
  @override
  DownloadQueue create() => DownloadQueue();
}

String _$downloadQueueHash() => r'e1ebd2fd6399220d6bc21a2ee3ee0b2a4545c0c2';

abstract class _$DownloadQueue extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
