import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(l.about, style: textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        padding: const .all(24),
        child: Center(
          child: Column(
            children: [
              Image.asset(ImagePaths.appIcon, height: 100, width: 100),
              const SizedBox(height: 16),
              Text('Storii', style: textTheme.titleLarge),
              FutureBuilder(
                future: getVersion,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Version: ${snapshot.data ?? "Unknown"}');
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Licensed under the GNU General Public License v3.0',
                style: textTheme.titleSmall?.copyWith(
                  color: scheme.outline,
                  fontWeight: .w500,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (context) {
                  return AppOutlinedButton(
                    text: 'View Source Code',
                    icon: const Icon(Icons.link),
                    onPressed: () => _launchUrl(context),
                  );
                },
              ),
              const SizedBox(height: 16),
              AppFilledButton(
                text: 'Licenses',
                icon: const Icon(Icons.gavel_outlined),
                onPressed: () {
                  showLicensePage(context: context);
                },
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context) async {
    final url = Uri.parse('https://github.com/likhithpraveenk/storii');
    if (!await launchUrl(url, mode: .externalApplication) && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }
}

Future<String?> getVersion = () async {
  final packageInfo = await PackageInfo.fromPlatform();
  return '${packageInfo.version}+${packageInfo.buildNumber}';
}();
