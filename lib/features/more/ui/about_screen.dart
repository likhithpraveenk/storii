import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/device_info_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/logo_header.dart';

class AboutTile extends StatelessWidget {
  const AboutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Text(AppLocalizations.of(context)!.about),
      onTap: () {
        context.push(AppRoute.about.path);
      },
    );
  }
}

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final packageInfo = ref.watch(packageInfoProvider).value;
    final deviceInfo = ref.watch(deviceInfoStringProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l.about, style: textTheme.titleLarge),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const LogoHeader(),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.tag),
                  title: Text(l.version),
                  subtitle: Text(
                    '${packageInfo?.version} (${packageInfo?.buildNumber})',
                  ),
                ),
                ListTile(
                  title: Text(l.licenses),
                  leading: const Icon(Icons.gavel_outlined),
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: appName,
                    applicationLegalese: l.licensedUnder,
                    applicationVersion: '${packageInfo?.version}',
                  ),
                ),
                ListTile(
                  title: Text(l.sourceCode),
                  leading: const Icon(Icons.open_in_new),
                  onTap: () => launchUrlHelper(context, githubLink),
                ),
                ListTile(
                  title: Text(l.foundBugQ),
                  subtitle: Text(l.foundBugQSubtitle),
                  leading: const Icon(Icons.feedback_outlined),
                  onTap: () => launchUrlHelper(context, githubIssueLink),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              alignment: .bottomCenter,
              padding: const .all(24),
              child: deviceInfo != null
                  ? GestureDetector(
                      onLongPress: () async {
                        await Clipboard.setData(
                          ClipboardData(text: deviceInfo),
                        );
                      },
                      child: Text(
                        deviceInfo,
                        style: textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
