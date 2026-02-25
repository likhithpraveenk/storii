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
    extends $StreamNotifierProvider<LogsNotifier, List<LogEntry>> {
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
}

String _$logsNotifierHash() => r'99e1816df71d7fb2eecbf764cba04c4fd64832dd';

abstract class _$LogsNotifier extends $StreamNotifier<List<LogEntry>> {
  Stream<List<LogEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<LogEntry>>, List<LogEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LogEntry>>, List<LogEntry>>,
              AsyncValue<List<LogEntry>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
