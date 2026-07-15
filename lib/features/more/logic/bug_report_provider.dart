import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/device_info_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/add_server_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'bug_report_provider.g.dart';

@Riverpod(keepAlive: true)
Future<String> bugReportBody(Ref ref) async {
  final package = await ref.watch(packageInfoProvider.future);
  final device = await ref.watch(deviceInfoProvider.future);

  final os = switch (device) {
    final AndroidDeviceInfo d =>
      'Android ${d.version.release} (SDK ${d.version.sdkInt}) | '
          '${d.manufacturer} ${d.model}',
    final IosDeviceInfo d => 'iOS ${d.systemVersion} | ${d.modelName}',
    _ => 'Unknown platform',
  };

  var serverVersion = 'Unknown';
  final user = ref.read(currentUserProvider);
  if (user != null) {
    try {
      final serverStatus = await ref.watch(
        serverStatusProvider(user.serverUrl).future,
      );
      serverVersion = serverStatus.serverVersion ?? 'Unknown';
    } catch (_) {}
  }

  final logs = ref
      .read(errorLogsProvider)
      .take(5)
      .map((e) {
        final header =
            '[${e.timestamp.fString(forLogs: true)}] '
            '${e.level.name.toUpperCase()} '
            '${e.source != null ? '${e.source}: ' : ''}${e.message}';
        final trace = e.stackTrace;
        return trace != null ? '$header\n$trace' : header;
      })
      .join('\n');

  return '''
## Description

<!-- Describe the bug -->

## Steps to Reproduce

1. 
2. 
3. 

## Expected Behavior


## Actual Behavior


## Environment

- Storii version: ${package.version} (${package.buildNumber})
- Device: $os
- Audiobookshelf server version: $serverVersion

## Recent Logs

> **Before submitting, review the logs below and remove any personal data or delete this block entirely if it is unrelated to the bug.**

```text
$logs
```

## Screenshots

<!-- If applicable, add screenshots to help explain the problem. -->
''';
}
