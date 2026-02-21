import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/globals.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/debug_info.dart';
import 'package:storii/shared/widgets/logo_header.dart';
import 'package:url_launcher/url_launcher.dart';

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

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final deviceInfo = getDeviceInfo();

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
                    '${packageInfo.version} (${packageInfo.buildNumber})',
                  ),
                ),
                ListTile(
                  title: Text(l.licenses),
                  leading: const Icon(Icons.gavel_outlined),
                  onTap: () => showLicensePage(context: context),
                ),
                ListTile(
                  title: Text(l.sourceCode),
                  leading: const Icon(Icons.open_in_new),
                  onTap: () => _launchUrl(context),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const .symmetric(horizontal: 16),
                  child: Text(
                    l.licensedUnder,
                    style: textTheme.titleSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: .w500,
                    ),
                    textAlign: .center,
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              alignment: .bottomCenter,
              padding: const .all(24),
              child: GestureDetector(
                onLongPress: () async {
                  await Clipboard.setData(ClipboardData(text: deviceInfo));
                },
                child: Text(
                  deviceInfo,
                  style: textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context) async {
    final url = Uri.parse(githubLink);
    if (!await launchUrl(url, mode: .externalApplication) && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.couldNotUrl(url.toString()),
          ),
        ),
      );
    }
  }
}
