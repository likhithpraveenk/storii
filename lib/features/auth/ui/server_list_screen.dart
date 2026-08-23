import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/ui/add_server_sheet.dart';
import 'package:storii/features/auth/ui/add_user_sheet.dart';
import 'package:storii/features/auth/ui/server_tile.dart';
import 'package:storii/features/settings/ui/advanced/backup_settings_tile.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ServerListScreen extends ConsumerWidget {
  const ServerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serversAsync = ref.watch(serversProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        animateColor: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            tooltip: l10n.logs,
            onPressed: () {
              context.push(AppRoute.logs.path);
            },
            icon: const Icon(Icons.bug_report),
          ),
          const RestoreButton(),
          IconButton(
            tooltip: l10n.about,
            onPressed: () {
              context.push(AppRoute.about.path);
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const .all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 48,
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Center(
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: .circle,
                          color: appPrimaryColor,
                        ),
                        child: Image.asset(appIcon, width: 100, height: 100),
                      ),
                    ),
                    Padding(
                      padding: const .symmetric(vertical: 16),
                      child: Material(
                        elevation: 6,
                        color: scheme.secondaryContainer,
                        borderRadius: .circular(kRadius),
                        child: SizedBox(
                          width: double.infinity,
                          child: serversAsync.when(
                            error: (e, _) => SizedBox(
                              height: 120,
                              child: ErrorRetryWidget(
                                e.toString(),
                                onRetry: () => ref.invalidate(serversProvider),
                              ),
                            ),
                            loading: () => const SizedBox(
                              height: 120,
                              child: Center(child: RandomWaveform()),
                            ),
                            data: (servers) {
                              if (servers.isEmpty) {
                                return const SizedBox(
                                  height: 120,
                                  child: EmptyState(),
                                );
                              }

                              return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: .zero,
                                shrinkWrap: true,
                                separatorBuilder: (_, _) =>
                                    Divider(height: 1, color: scheme.outline),
                                itemCount: servers.length,
                                itemBuilder: (context, index) =>
                                    ServerTile(servers[index]),
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
                        text: l10n.addServer,
                        onPressed: () async {
                          final serverUrl = await showAddServerSheet(context);
                          if (serverUrl != null && context.mounted) {
                            await showAddUserSheet(
                              context,
                              serverUrl.normalizedUri,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
