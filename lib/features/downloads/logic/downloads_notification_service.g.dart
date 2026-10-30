// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_notification_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadsNotifications)
final downloadsNotificationsProvider = DownloadsNotificationsProvider._();

final class DownloadsNotificationsProvider
    extends
        $FunctionalProvider<
          DownloadsNotifications,
          DownloadsNotifications,
          DownloadsNotifications
        >
    with $Provider<DownloadsNotifications> {
  DownloadsNotificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsNotificationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsNotificationsHash();

  @$internal
  @override
  $ProviderElement<DownloadsNotifications> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DownloadsNotifications create(Ref ref) {
    return downloadsNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadsNotifications value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadsNotifications>(value),
    );
  }
}

String _$downloadsNotificationsHash() =>
    r'2eca888b7f090e48ed1a5b9d43e053c5ab97e849';
