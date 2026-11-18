import 'package:material_ui/material_ui.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/stats/ui/stat_widgets.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class RecentSessions extends StatelessWidget {
  const new(this.sessions, {super.key});
  final List<PlaybackSession> sessions;

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) return const EmptyState();
    final sorted = [...sessions]
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return Padding(
      padding: const .symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            l10n.recentSessions,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          for (final (i, session) in sorted.indexed)
            Column(
              children: [
                ListTile(
                  contentPadding: .zero,
                  title: Text('${session.displayTitle}'),
                  subtitle: Text(session.updatedAt.toRelativeTime()),
                  trailing: DurationPill(session.timeListening ?? .zero),
                ),
                if (i != sorted.length - 1)
                  const Divider(height: 0, thickness: 0.5),
              ],
            ),
        ],
      ),
    );
  }
}
