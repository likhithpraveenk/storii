// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_filesystem_helper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadsFsHelper)
final downloadsFsHelperProvider = DownloadsFsHelperProvider._();

final class DownloadsFsHelperProvider
    extends
        $FunctionalProvider<
          DownloadsFilesystemHelper,
          DownloadsFilesystemHelper,
          DownloadsFilesystemHelper
        >
    with $Provider<DownloadsFilesystemHelper> {
  DownloadsFsHelperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsFsHelperProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsFsHelperHash();

  @$internal
  @override
  $ProviderElement<DownloadsFilesystemHelper> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DownloadsFilesystemHelper create(Ref ref) {
    return downloadsFsHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadsFilesystemHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadsFilesystemHelper>(value),
    );
  }
}

String _$downloadsFsHelperHash() => r'f1087d43dfccea21f1f0ff337b03186842d73ba7';
