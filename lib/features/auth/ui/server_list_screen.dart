import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/ui/add_server_sheet.dart';
import 'package:storii/features/auth/ui/add_user_sheet.dart';
import 'package:storii/features/auth/ui/server_tile.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ServerListScreen extends ConsumerWidget {
  const ServerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serversAsync = ref.watch(serversProvider);
    final scheme = Theme.of(context).colorScheme;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.5;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        animateColor: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoute.logs.path);
            },
            icon: const Icon(Icons.bug_report),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Center(child: Image.asset(appIcon, width: 150, height: 150)),
              Padding(
                padding: const .symmetric(vertical: 16),
                child: Material(
                  elevation: 6,
                  color: scheme.secondaryContainer,
                  borderRadius: kBorderRadius,
                  child: SizedBox(
                    width: double.infinity,
                    child: serversAsync.when(
                      error: (error, _) => SizedBox(
                        height: 120,
                        child: ErrorRetryWidget(
                          '$error',
                          onRetry: () => ref.invalidate(serversProvider),
                        ),
                      ),
                      loading: () => const SizedBox(
                        height: 120,
                        child: Center(child: RandomWaveform()),
                      ),
                      data: (servers) {
                        if (servers.isEmpty) {
                          return SizedBox(
                            height: 120,
                            child: Center(
                              child: Text(
                                '-',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: maxHeight),
                          child: ListView.separated(
                            padding: .zero,
                            shrinkWrap: true,
                            separatorBuilder: (_, _) =>
                                Divider(height: 1, color: scheme.outline),
                            itemCount: servers.length,
                            itemBuilder: (context, index) =>
                                ServerTile(servers[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: AppOutlinedButton(
                  icon: const Icon(Icons.add),
                  text: AppLocalizations.of(context)!.addServer,
                  onPressed: () async {
                    final serverUrl = await showAddServerSheet(context);
                    if (serverUrl != null && context.mounted) {
                      await showAddUserSheet(context, serverUrl.normalizedUri);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
