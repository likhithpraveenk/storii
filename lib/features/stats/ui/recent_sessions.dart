import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/extensions.dart';

class RecentSessions extends StatelessWidget {
  const RecentSessions(this.sessions, {super.key});
  final List<PlaybackSession> sessions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = [...sessions]
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(l10n.recentSessions, style: theme.textTheme.titleMedium),
          ...sorted.map((session) {
            final now = DateTime.now();
            final daysAgo = now.difference(session.updatedAt).inDays;
            final isLessThanMin = session.timeListening.inSeconds < 60;

            return Column(
              children: [
                ListTile(
                  contentPadding: .zero,
                  title: Text('${session.displayTitle}'),
                  subtitle: Text(
                    daysAgo == 0
                        ? l10n.today
                        : daysAgo == 1
                        ? l10n.yesterday
                        : l10n.daysAgo(daysAgo),
                  ),
                  trailing: Text(
                    session.timeListening.toReadableDuration(
                      showSeconds: isLessThanMin,
                    ),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                if (session != sorted.last)
                  const Divider(height: 0, thickness: 0.5),
              ],
            );
          }),
        ],
      ),
    );
  }
}
