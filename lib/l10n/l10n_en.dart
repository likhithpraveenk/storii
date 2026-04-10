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
  String get editServer => 'Edit Server';

  @override
  String get errorLoadingUsers => 'Error loading users';

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
  String get libraries => 'Libraries';

  @override
  String get empty => 'Empty';

  @override
  String get collapse => 'Collapse';

  @override
  String get retry => 'Retry';

  @override
  String get description => 'Description';

  @override
  String get noDescription => 'No description available';

  @override
  String get resume => 'Resume';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get replay => 'Replay';

  @override
  String get deleteLogsQ => 'Delete all logs?';

  @override
  String get audiobooks => 'Audiobooks';

  @override
  String get podcasts => 'Podcasts';

  @override
  String get episodes => 'Episodes';

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
  String get fontScale => 'Font Scale';

  @override
  String get language => 'Language';

  @override
  String get configNav => 'Configure Navigation';

  @override
  String get appearance => 'Appearance';

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
  String get title => 'Title';

  @override
  String get author => 'Author';

  @override
  String get authorLastFirst => 'Author (Last, First)';

  @override
  String get dateAdded => 'Date Added';

  @override
  String get publishedYear => 'Published Year';

  @override
  String get size => 'Size';

  @override
  String get duration => 'Duration';

  @override
  String get fileCreatedDate => 'File Created Date';

  @override
  String get fileModifiedDate => 'File Modified Date';

  @override
  String get lastPlayed => 'Last Played';

  @override
  String get dateStarted => 'Date Started';

  @override
  String get dateFinished => 'Date Finished';

  @override
  String get random => 'Random';

  @override
  String get numOfBooks => 'Number of Books';

  @override
  String get name => 'Name';

  @override
  String get lastBookAdded => 'Last Book Added';

  @override
  String get lastBookUpdated => 'Last Book Updated';

  @override
  String get lastFirst => 'Last Name, First Name';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get numOfEpisodes => 'Number of Episodes';

  @override
  String get hasEbook => 'Has ebook';

  @override
  String get hasNoEbook => 'Has no ebook';

  @override
  String get hasSupplementary => 'Has supplementary ebook';

  @override
  String get hasNoSupplementary => 'Has no supplementary ebook';

  @override
  String get collapseSeries => 'Collapse Series';

  @override
  String get filter => 'Filter';

  @override
  String get sort => 'Sort';

  @override
  String get display => 'Display';

  @override
  String get genres => 'Genres';

  @override
  String get tags => 'Tags';

  @override
  String get publisher => 'Publisher';

  @override
  String get publishedDecade => 'Published Decade';

  @override
  String get progress => 'Progress';

  @override
  String get narrators => 'Narrators';

  @override
  String get tracks => 'Tracks';

  @override
  String get missingMetadata => 'Missing Metadata';

  @override
  String get ebooks => 'Ebooks';

  @override
  String get finished => 'Finished';

  @override
  String get notStarted => 'Not Started';

  @override
  String get inProgress => 'In Progress';

  @override
  String get notFinished => 'Not Finished';

  @override
  String get asin => 'ASIN';

  @override
  String get isbn => 'ISBN';

  @override
  String get subtitle => 'Subtitle';

  @override
  String get singleTrack => 'Single Track';

  @override
  String get multipleTracks => 'Multiple Tracks';

  @override
  String get noTracks => 'No Tracks';

  @override
  String get itemsWithIssues => 'Items with Issues';

  @override
  String get rssFeedOpen => 'RSS Feed Open';

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
  String get version => 'Version';

  @override
  String buildNumber(String text) {
    return 'Build Number: $text';
  }

  @override
  String get networkLogs => 'Network Logs';

  @override
  String get networkLogsDescription => 'Log HTTP requests and responses';

  @override
  String readableDuration(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '${hours}h ',
      zero: '',
    );
    return '$_temp0${minutes}m';
  }

  @override
  String readableDurationFull(int hours, int minutes, int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '${hours}h ',
      zero: '',
    );
    return '$_temp0${minutes}m ${seconds}s';
  }

  @override
  String durationLeft(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '${hours}h ',
      zero: '',
    );
    return '$_temp0${minutes}m left';
  }

  @override
  String get chapters => 'Chapters';

  @override
  String get removeProgressTitle => 'Remove progress?';

  @override
  String get removeProgressMessage =>
      'This will reset your listening progress and cannot be undone.';

  @override
  String get remove => 'Remove';

  @override
  String get markAsComplete => 'Mark as complete?';

  @override
  String get confirm => 'Confirm';

  @override
  String get progressMarkedComplete => 'Marked as complete';

  @override
  String get progressMarkCompleteFailed => 'Failed to mark as complete';

  @override
  String get progressRemoved => 'Progress removed';

  @override
  String get progressRemoveFailed => 'Failed to remove progress';

  @override
  String get playerSettings => 'Player Settings';

  @override
  String get skipForward => 'Skip forward';

  @override
  String get skipBack => 'Skip back';

  @override
  String get startPlayback => 'Start playback';

  @override
  String get playbackSpeed => 'Playback speed';

  @override
  String get sleepTimer => 'Sleep timer';

  @override
  String get cancelTimer => 'Cancel timer';

  @override
  String timeMinutes(int time) {
    return '$time min';
  }

  @override
  String get settingsStartupRouteTitle => 'Start on app open';

  @override
  String get settingsReorderNavTitle => 'Navigation tabs';

  @override
  String get settingsReorderNavSubtitle => 'Reorder and enable or disable tabs';

  @override
  String get sampleText => 'Sphinx of black quartz, judge my vow - 0123456789';

  @override
  String get addFonts => 'Add fonts';

  @override
  String get appCache => 'App Cache';

  @override
  String get settingsNavLabelBehavior => 'Navigation label';

  @override
  String get alwaysShow => 'Always show';

  @override
  String get onlyShowSelected => 'Only show when selected';

  @override
  String get alwaysHide => 'Always hide';

  @override
  String get syncInterval => 'Sync Interval';

  @override
  String get emptyMsg => 'So empty...';

  @override
  String get history => 'History';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get seek => 'Seek';

  @override
  String get stop => 'Stop';

  @override
  String get complete => 'Complete';

  @override
  String get sync => 'Sync';

  @override
  String get playbackError => 'playback error';

  @override
  String get loginOidc => 'Login with OpenID';

  @override
  String get or => 'Or';
}
