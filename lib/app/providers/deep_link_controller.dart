import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart' as init;
import 'package:storii/app/logs/log_service.dart';

part 'deep_link_controller.g.dart';

@riverpod
void deepLinkController(Ref ref) {
  final router = ref.watch(routerProvider);

  Future<void> handle(Uri url) async {
    switch (url.host) {
      case 'oauth':
        router.go('/oauth${url.path}', extra: url);
      default:
        LogService.log('Unhandled deep link: $url');
    }
  }

  final sub = init.appLinks.uriLinkStream.listen(handle);
  ref.onDispose(sub.cancel);
}
