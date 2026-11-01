// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_transport.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadTransport)
final downloadTransportProvider = DownloadTransportProvider._();

final class DownloadTransportProvider
    extends
        $FunctionalProvider<
          DownloadTransport,
          DownloadTransport,
          DownloadTransport
        >
    with $Provider<DownloadTransport> {
  DownloadTransportProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadTransportProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadTransportHash();

  @$internal
  @override
  $ProviderElement<DownloadTransport> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DownloadTransport create(Ref ref) {
    return downloadTransport(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadTransport value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadTransport>(value),
    );
  }
}

String _$downloadTransportHash() => r'b1817160d7aec6542d8e120d8cb784a2d28d59fa';
