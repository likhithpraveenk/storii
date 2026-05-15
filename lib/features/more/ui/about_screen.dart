import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/device_info_provider.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/logo_header.dart';

class AboutTile extends StatelessWidget {
  const AboutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Text(l10n.about),
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
    final textTheme = Theme.of(context).textTheme;
    final packageInfo = ref.watch(packageInfoProvider).value;
    final deviceInfo = ref.watch(deviceInfoStringProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.about, style: textTheme.titleLarge),
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
                  title: Text(l10n.version),
                  subtitle: Text(
                    '${packageInfo?.version} (${packageInfo?.buildNumber})',
                  ),
                ),
                ListTile(
                  title: Text(l10n.licenses),
                  leading: const Icon(Icons.gavel_outlined),
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: appName,
                    applicationLegalese: l10n.licensedUnder,
                    applicationVersion: '${packageInfo?.version}',
                  ),
                ),
                ListTile(
                  title: Text(l10n.sourceCode),
                  leading: const Icon(Icons.open_in_new),
                  onTap: () => launchUrlHelper(context, githubLink),
                ),
                ListTile(
                  title: Text(l10n.foundBugQ),
                  subtitle: Text(l10n.foundBugQSubtitle),
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
              child: Column(
                mainAxisSize: .min,
                children: [
                  if (deviceInfo != null)
                    SelectableText(
                      deviceInfo,
                      style: textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: .min,
                    children: [
                      const Text('Built with '),
                      Icon(Icons.favorite, size: 16, color: scheme.error),
                      const Text(' in Flutter'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
