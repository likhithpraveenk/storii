import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_provider.g.dart';

@riverpod
Future<PackageInfo> packageInfo(Ref ref) => PackageInfo.fromPlatform();

@riverpod
Future<BaseDeviceInfo> deviceInfo(Ref ref) {
  return DeviceInfoPlugin().deviceInfo;
}

@riverpod
Future<String> deviceInfoString(Ref ref) async {
  final package = await ref.watch(packageInfoProvider.future);
  final device = await ref.watch(deviceInfoProvider.future);

  final osDetails = switch (device) {
    final AndroidDeviceInfo d =>
      'Android ${d.version.release} (SDK ${d.version.sdkInt}) | '
          '${d.manufacturer} ${d.model}',

    final IosDeviceInfo d => 'iOS ${d.systemVersion} | ${d.modelName}',

    _ => 'Unknown platform',
  };

  return '''
    App ID: ${package.packageName}
    App version: ${package.version} (${package.buildNumber})
    $osDetails'''
      .split('\n')
      .map((line) => line.trim())
      .join('\n')
      .trim();
}
