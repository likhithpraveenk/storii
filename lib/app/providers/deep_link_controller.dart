import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart' as init;
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/widget_controller.dart';
import 'package:storii/features/player/logic/queue_providers.dart';

part 'deep_link_controller.g.dart';

@riverpod
void deepLinkController(Ref ref) {
  final router = ref.watch(routerProvider);

  Future<void> handle(Uri url) async {
    LogService.log('$url', source: 'deepLinkController');
    switch (url.host) {
      case 'oauth':
        router.go('/oauth${url.path}', extra: url);

      case 'play':
        final itemId = url.queryParameters['id'];
        final episodeId = url.queryParameters['episodeId'];
        if (itemId != null) {
          await ref
              .read(queueProvider.notifier)
              .play(itemId: itemId, episodeId: episodeId);
        }

      case 'play-last':
        await ref.read(queueProvider.notifier).playLastPlayed();

      case 'widget':
        final widgetId = int.tryParse(url.queryParameters['id'] ?? '');
        if (widgetId != null) {
          ref.read(widgetControllerProvider.notifier).setWidgetId(widgetId);
        }

      case '':
        router.go(url.path);

      default:
        LogService.log(
          'Unhandled deep link: $url',
          source: 'deepLinkController',
        );
    }
  }

  final sub = init.appLinks.uriLinkStream.listen(handle);
  ref.onDispose(sub.cancel);
}
