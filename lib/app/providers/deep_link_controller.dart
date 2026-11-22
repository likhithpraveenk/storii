import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart' as init;
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/widget/logic/widget_controller.dart';

part 'deep_link_controller.g.dart';

@riverpod
void deepLinkController(Ref ref) {
  Future<void> handle(Uri url) async {
    LogService.log('$url', source: 'deepLinkController');
    final router = ref.read(routerProvider);
    try {
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
    } catch (e, st) {
      LogService.log(
        'failed to handle deep link',
        source: 'deepLinkController',
        originalError: e,
        stackTrace: st,
      );
    }
  }

  final sub = init.appLinks.uriLinkStream.listen(handle);
  ref.onDispose(sub.cancel);
}
