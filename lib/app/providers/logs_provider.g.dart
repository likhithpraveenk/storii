// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogsNotifier)
final logsProvider = LogsNotifierProvider._();

final class LogsNotifierProvider
    extends $NotifierProvider<LogsNotifier, List<LogEntry>> {
  LogsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsNotifierHash();

  @$internal
  @override
  LogsNotifier create() => LogsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LogEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LogEntry>>(value),
    );
  }
}

String _$logsNotifierHash() => r'32459f1ec119c8d4592adeee29330ee851e5ff69';

abstract class _$LogsNotifier extends $Notifier<List<LogEntry>> {
  List<LogEntry> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<LogEntry>, List<LogEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<LogEntry>, List<LogEntry>>,
              List<LogEntry>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
