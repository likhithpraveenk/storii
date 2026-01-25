import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:storii/app/config/app_styles.dart';
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
    final width = (MediaQuery.sizeOf(context).width * 0.3).clamp(100.0, 300.0);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l.about, style: textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        padding: const .all(24),
        child: Center(
          child: Column(
            children: [
              Image.asset(LocalAssets.appIcon, width: width, height: width),
              const SizedBox(height: 16),
              Text(AppConstants.appName, style: textTheme.titleLarge),
              const SizedBox(height: 8),
              FutureBuilder(
                future: getAboutInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  } else {
                    return Column(
                      mainAxisSize: .min,
                      children: [
                        InkWell(
                          onLongPress: () {
                            if (snapshot.data?.version != null) {
                              Clipboard.setData(
                                ClipboardData(text: snapshot.data!.version),
                              );
                            }
                          },
                          borderRadius: AppStyles.circularRadius,
                          child: Padding(
                            padding: const .fromLTRB(16, 4, 16, 4),
                            child: Text(
                              l.versionText('${snapshot.data?.version}'),
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        InkWell(
                          onLongPress: () {
                            if (snapshot.data?.buildNumber != null) {
                              Clipboard.setData(
                                ClipboardData(text: snapshot.data!.buildNumber),
                              );
                            }
                          },
                          borderRadius: AppStyles.circularRadius,
                          child: Padding(
                            padding: const .fromLTRB(16, 4, 16, 4),
                            child: Text(
                              l.buildNumber('${snapshot.data?.buildNumber}'),
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              Text(
                l.licensedUnder,
                style: textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: .w500,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            SizedBox(
              width: double.infinity,
              child: AppOutlinedButton(
                text: l.sourceCode,
                icon: const Icon(Icons.open_in_new),
                onPressed: () => _launchUrl(context),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                text: l.licenses,
                icon: const Icon(Icons.gavel_outlined),
                onPressed: () => showLicensePage(context: context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context) async {
    final url = Uri.parse(AppConstants.githubLink);
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

Future<({String version, String buildNumber})> getAboutInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return (version: packageInfo.version, buildNumber: packageInfo.buildNumber);
}
