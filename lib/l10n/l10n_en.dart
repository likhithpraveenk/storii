// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get addServer => 'Add Server';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get validateServer => 'Validate Server';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get errorUnknown => 'Something went wrong';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteServer => 'Delete Server';

  @override
  String get deleteServerQ => 'Delete Server?';

  @override
  String deleteUserQ(String user) {
    return 'Delete $user?';
  }

  @override
  String get noUsersServer => 'No users are linked to this server.';

  @override
  String get followingUsers => 'You are about to delete the following users';

  @override
  String get urlCopied => 'URL Copied';

  @override
  String get addUser => 'Add User';

  @override
  String get errorLoadingUsers => 'Error loading users';

  @override
  String welcome(String username) {
    return 'Welcome $username';
  }

  @override
  String switchingToUser(String user) {
    return 'Switching to $user';
  }

  @override
  String get loading => 'Loading';

  @override
  String get active => 'Active';

  @override
  String get noSession => 'No session';

  @override
  String get noAuthor => 'No Author';

  @override
  String get noTitle => 'No Title';

  @override
  String get noImage => 'No Image';

  @override
  String get errorImage => 'Error loading image';

  @override
  String get downloads => 'Downloads';

  @override
  String get settings => 'Settings';

  @override
  String get logs => 'Logs';

  @override
  String get about => 'About';

  @override
  String get switchAccount => 'Switch Account';

  @override
  String get noLibrary => 'No Library';

  @override
  String get empty => 'Empty';

  @override
  String get collapse => 'Collapse';

  @override
  String get readMore => 'Read More';

  @override
  String get retry => 'Retry';

  @override
  String get ascDesc => 'Tap again for ascending/descending';

  @override
  String get gridCount => 'Grid Count';

  @override
  String percentCompleted(String percent) {
    return '$percent% completed';
  }

  @override
  String get description => 'Description';

  @override
  String get noDescription => 'No description available';

  @override
  String get resume => 'Resume';

  @override
  String get play => 'Play';

  @override
  String get replay => 'Replay';

  @override
  String deleteLogsQ(int count) {
    return 'Delete $count logs?';
  }

  @override
  String get audiobooks => 'Audiobooks';

  @override
  String get podcasts => 'Podcasts';

  @override
  String get search => 'Search';

  @override
  String get dateFormat => 'Date Format';

  @override
  String get custom => 'Custom';

  @override
  String get invalidFormat => 'Invalid Format';

  @override
  String get customPattern => 'Custom Pattern';

  @override
  String get save => 'Save';

  @override
  String get fontFamily => 'Change Font';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get systemTheme => 'System Theme';

  @override
  String get systemThemeSubtitle => 'Match device palette';

  @override
  String get pureBlack => 'Pure Black';

  @override
  String get pureBlackSubtitle => 'High contrast theme';

  @override
  String get fontScale => 'Font Size';

  @override
  String get language => 'Language';

  @override
  String get configNav => 'Configure Navigation';

  @override
  String get appearance => 'Appearance';

  @override
  String get mustSelect3 => 'You must select at least 3 items';

  @override
  String get theme => 'Theme';

  @override
  String get reset => 'Reset';

  @override
  String get resetSettingsQ => 'Reset Settings?';

  @override
  String get resetSettingsTxt =>
      'This will revert all preferences to their default values.';

  @override
  String get settingsReset => 'Settings are reset';

  @override
  String get home => 'Home';

  @override
  String get library => 'Library';

  @override
  String get collections => 'Collections';

  @override
  String get all => 'All';

  @override
  String get series => 'Series';

  @override
  String get authors => 'Authors';

  @override
  String get more => 'More';

  @override
  String get books => 'Books';

  @override
  String get profile => 'Profile';

  @override
  String get viewAll => 'View All';

  @override
  String get standaloneBooks => 'Standalone Books';

  @override
  String get sortTitle => 'Title';

  @override
  String get sortAuthor => 'Author';

  @override
  String get sortAuthorLastFirst => 'Author (Last, First)';

  @override
  String get sortAddedAt => 'Date Added';

  @override
  String get sortPublishedYear => 'Published Year';

  @override
  String get sortSize => 'Size';

  @override
  String get sortDuration => 'Duration';

  @override
  String get sortFileBirthtime => 'File Created Date';

  @override
  String get sortFileModified => 'File Modified Date';

  @override
  String get sortProgressUpdated => 'Last Played';

  @override
  String get sortProgressStarted => 'Date Started';

  @override
  String get sortProgressFinished => 'Date Finished';

  @override
  String get sortRandom => 'Random';

  @override
  String get sortNumBooks => 'Number of Books';

  @override
  String get sortName => 'Name';

  @override
  String get sortLastBookAdded => 'Last Book Added';

  @override
  String get sortLastBookUpdated => 'Last Book Updated';

  @override
  String get sortLastFirst => 'Last Name, First Name';

  @override
  String get sortUpdatedAt => 'Last Updated';

  @override
  String get sortNumEpisodes => 'Number of Episodes';

  @override
  String get filter => 'Filter';

  @override
  String get sort => 'Sort';

  @override
  String get display => 'Display';

  @override
  String get gridView => 'Grid View';

  @override
  String get filterGenre => 'Genre';

  @override
  String get filterTag => 'Tag';

  @override
  String get filterAuthor => 'Author';

  @override
  String get filterSeries => 'Series';

  @override
  String get filterStatus => 'Status';

  @override
  String get filterNarrator => 'Narrator';

  @override
  String get filterLanguage => 'Language';

  @override
  String get filterTracks => 'Tracks';

  @override
  String get filterMissing => 'Missing Metadata';

  @override
  String get clearFilter => 'Clear Filter';

  @override
  String get statusFinished => 'Finished';

  @override
  String get statusNotStarted => 'Not Started';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get statusNotFinished => 'Not Finished';

  @override
  String get missingAsin => 'Missing ASIN';

  @override
  String get missingIsbn => 'Missing ISBN';

  @override
  String get missingSubtitle => 'Missing Subtitle';

  @override
  String get missingAuthors => 'Missing Authors';

  @override
  String get missingPublishedYear => 'Missing Year';

  @override
  String get missingSeries => 'Missing Series';

  @override
  String get missingDescription => 'Missing Description';

  @override
  String get missingGenres => 'Missing Genres';

  @override
  String get missingTags => 'Missing Tags';

  @override
  String get missingNarrators => 'Missing Narrators';

  @override
  String get missingPublisher => 'Missing Publisher';

  @override
  String get missingLanguage => 'Missing Language';

  @override
  String get singleTrack => 'Single Track';

  @override
  String get multipleTracks => 'Multiple Tracks';

  @override
  String get issuesFound => 'Items with Issues';

  @override
  String get feedOpen => 'Open Podcast Feed';

  @override
  String get explicit => 'Explicit';

  @override
  String get abridged => 'Abridged';

  @override
  String get displayMode => 'Display Mode';

  @override
  String get comfortable => 'Comfortable';

  @override
  String get compact => 'Compact';

  @override
  String get coverOnly => 'Cover Only';

  @override
  String get ascending => 'Ascending';

  @override
  String get descending => 'Descending';

  @override
  String get listView => 'List View';

  @override
  String get licenses => 'Licenses';

  @override
  String get sourceCode => 'Source Code';

  @override
  String couldNotUrl(String url) {
    return 'Could not launch $url';
  }

  @override
  String get licensedUnder =>
      'Licensed under the GNU General Public License v3.0';

  @override
  String errorText(String text) {
    return 'Error: $text';
  }

  @override
  String versionText(String text) {
    return 'Version: $text';
  }

  @override
  String buildNumber(String text) {
    return 'Build Number: $text';
  }

  @override
  String keepLogsFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get logHistory => 'Log History';

  @override
  String get autoDeleteNotice =>
      'Logs older than this will be automatically deleted.';

  @override
  String get networkLogs => 'Network Logs';

  @override
  String get networkLogsDescription => 'Log HTTP requests and responses';

  @override
  String get networkLogsWarning =>
      'Logging active. This may increase storage usage';
}
