import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/more/ui/changelog_screen.dart';

part 'changelog_provider.g.dart';

class ChangelogGroup {
  const new(this.title, this.items);

  final String title;
  final List<String> items;
}

class ChangelogEntry {
  const new(this.version, this.date, this.groups);

  final String version;
  final DateTime? date;
  final List<ChangelogGroup> groups;
}

class ChangelogParser {
  const new _();

  static final RegExp _header = RegExp(r'^\[(.+?)\](?:\s+-\s+(.+))?$');

  static List<ChangelogEntry> parse(String markdown) {
    final lines = markdown.split('\n');
    final headers = [
      for (final (i, line) in lines.indexed)
        if (line.startsWith('## ')) i,
    ];
    return [
      for (var i = 1; i < headers.length; i++)
        _entry(
          lines.sublist(
            headers[i],
            i + 1 < headers.length ? headers[i + 1] : lines.length,
          ),
        ),
    ];
  }

  static ChangelogEntry _entry(List<String> section) {
    final header = section.first.substring(3).trim();
    final match = _header.firstMatch(header);

    final groups = <ChangelogGroup>[];
    for (final line in section.skip(1)) {
      final trimmed = line.trim();
      if (trimmed.startsWith('### ')) {
        groups.add(ChangelogGroup(trimmed.substring(4).trim(), []));
      } else if (trimmed.startsWith('- ') && groups.isNotEmpty) {
        groups.last.items.add(trimmed.substring(2).trim());
      }
    }

    return ChangelogEntry(
      match?.group(1) ?? header,
      DateTime.tryParse(match?.group(2) ?? ''),
      [
        for (final group in groups)
          if (group.items.isNotEmpty) group,
      ],
    );
  }
}

@riverpod
Future<List<ChangelogEntry>> changelog(Ref ref) async {
  final markdown = await rootBundle.loadString('CHANGELOG.md');
  return ChangelogParser.parse(markdown);
}

@riverpod
Future<ChangelogEntry?> whatsNew(Ref ref) async {
  final entries = await ref.watch(changelogProvider.future);
  final latest = entries.firstOrNull;
  if (latest == null) return null;

  final lastVersion = ref.read(lastVersionProvider);
  return lastVersion == latest.version ? null : latest;
}

@riverpod
Future<void> whatsNewController(Ref ref) async {
  final entry = await ref.watch(whatsNewProvider.future);
  if (entry == null) return;

  await showWhatsNew(entry);
  await ref.read(appSettingsProvider.notifier).setLastVersion(entry.version);
}
