import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart' as init;
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/player/logic/queue_providers.dart';

part 'deep_link_controller.g.dart';

@riverpod
void deepLinkController(Ref ref) {
  final router = ref.watch(routerProvider);

  Future<void> handle(Uri url) async {
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
      default:
        LogService.log('Unhandled deep link: $url');
    }
  }

  final sub = init.appLinks.uriLinkStream.listen(handle);
  ref.onDispose(sub.cancel);
}
