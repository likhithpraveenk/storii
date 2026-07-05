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
  String get recentSessions => 'Recent Sessions';

  @override
  String get noAuthor => 'No Author';

  @override
  String get noArtist => 'No Artist';

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
  String get switchAccountConfirm => 'Switch to another account?';

  @override
  String get logoutConfirm => 'Log out from this account?';

  @override
  String get noLibrary => 'No Library';

  @override
  String get libraries => 'Libraries';

  @override
  String get empty => 'Empty';

  @override
  String get collapse => 'Collapse';

  @override
  String get refresh => 'Refresh';

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
  String get playEpisodeConfirm => 'Play this episode?';

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
  String get librarySettings => 'Library Settings';

  @override
  String get collections => 'Collections';

  @override
  String get latest => 'Latest';

  @override
  String get latestEpisodes => 'Latest episodes';

  @override
  String get all => 'All';

  @override
  String get id => 'ID';

  @override
  String get series => 'Series';

  @override
  String get authors => 'Authors';

  @override
  String get more => 'More';

  @override
  String get books => 'Books';

  @override
  String get stats => 'Stats';

  @override
  String get viewAll => 'View All';

  @override
  String get metadata => 'Metadata';

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
  String get publishedDate => 'Published Date';

  @override
  String get releaseDate => 'Release Date';

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
  String get itunesId => 'iTunes ID';

  @override
  String get itunesArtistId => 'iTunes Artist ID';

  @override
  String get itunesPageUrl => 'iTunes Page Url';

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
  String get inComplete => 'Incomplete';

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
  String get moreInfo => 'More Info';

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

  @override
  String get oidcRedirectUriHintPrefix => 'Requires';

  @override
  String get oidcRedirectUriHintSuffix =>
      'in ABS → Settings → Authentication → Allowed Mobile Redirect URIs';

  @override
  String get queued => 'Queued';

  @override
  String get downloading => 'Downloading';

  @override
  String get paused => 'Paused';

  @override
  String get failed => 'Failed';

  @override
  String get download => 'Download';

  @override
  String get completed => 'Completed';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get resumeDownload => 'Resume Download';

  @override
  String get removeDownloadQ => 'Remove Download?';

  @override
  String willBeFreed(String bytes) {
    return '$bytes will be freed';
  }

  @override
  String get downloadFailed => 'Download failed - tap to retry';

  @override
  String get directPlay => 'Direct Play';

  @override
  String get directStream => 'Direct Stream';

  @override
  String get transcode => 'Transcode';

  @override
  String get local => 'Local';

  @override
  String get downloaded => 'Downloaded';

  @override
  String get connectionStatus => 'Connection Status';

  @override
  String get connectionChecking => 'Checking connection...';

  @override
  String get connectionPleaseWait => 'Please wait';

  @override
  String get connectionServerConnected => 'Connected to server';

  @override
  String get connectionServerDisconnected => 'Not connected to server';

  @override
  String get connectionTypeWifi => 'Wi-Fi';

  @override
  String get connectionTypeMobile => 'Mobile data';

  @override
  String get connectionTypeEthernet => 'Ethernet';

  @override
  String get connectionTypeNone => 'No network';

  @override
  String connectionCantReachServer(String networkType) {
    return 'Can\'t reach server ($networkType)';
  }

  @override
  String connectionViaNetwork(String networkType) {
    return 'Connected via $networkType';
  }

  @override
  String get foundBugQ => 'Found a bug?';

  @override
  String get foundBugQSubtitle =>
      'Open a GitHub issue for any bug you encountered';

  @override
  String get audioBufferDuration => 'Audio Buffer Duration';

  @override
  String get audioBufferDurationDescription =>
      'How much audio to keep ahead of playback. Higher values reduce interruptions on slow connections';

  @override
  String get avoidMobileData => 'Avoid mobile data';

  @override
  String get avoidMobileDataSubtitle =>
      'Downloads will pause on mobile networks';

  @override
  String get totalListeningTime => 'Total Listening Time';

  @override
  String get currentStreak => 'Current streak';

  @override
  String get longestStreak => 'Longest streak';

  @override
  String get thisMonth => 'This month';

  @override
  String get thisYear => 'This year';

  @override
  String get days => 'days';

  @override
  String daysAgo(int days) {
    return '$days days ago';
  }

  @override
  String get booksFinished => 'Books finished';

  @override
  String get episodesFinished => 'Episodes finished';

  @override
  String get volume => 'Volume';

  @override
  String get increaseVolume => 'Increase Volume';

  @override
  String get decreaseVolume => 'Decrease Volume';

  @override
  String get showChapterPosition => 'Show chapter position';

  @override
  String get errorNetwork => 'No internet connection';

  @override
  String get errorTimeout => 'Connection timed out';

  @override
  String get errorAuth => 'Unauthorized';

  @override
  String get errorForbidden => 'Access denied';

  @override
  String get errorNotFound => 'Content not found';

  @override
  String get errorServer => 'Server error, please try again';

  @override
  String get errorUnknown => 'Something went wrong';

  @override
  String get errorType => 'Type error';

  @override
  String get changeRestartRequired => 'Changes take effect after restart';

  @override
  String get playbackErrorNetwork =>
      'Connection issue. Audio may be interrupted';

  @override
  String get playbackErrorSource => 'audio file could not be loaded';

  @override
  String get playbackErrorDecoder => 'File format unsupported';

  @override
  String get playbackErrorUnknown => 'Something went wrong with playback';

  @override
  String get codec => 'Codec';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get channels => 'Channels';

  @override
  String get format => 'Format';

  @override
  String get path => 'Path';

  @override
  String get binaryUnits => 'Binary units';

  @override
  String get binaryUnitsSubtitle => '1 KB = 1024 B';

  @override
  String get decimalUnits => 'Decimal units';

  @override
  String get decimalUnitsSubtitle => '1 KB = 1000 B';

  @override
  String get marqueeSpeed => 'Text Scroll Speed';

  @override
  String get schemeVariant => 'Theme Style';

  @override
  String get schemeVariantSubtitle =>
      'Choose how your theme colors are generated';

  @override
  String get tonalSpot => 'Balanced';

  @override
  String get tonalSpotSubtitle => 'Soft, natural, and easy on the eyes';

  @override
  String get fidelity => 'Close Match';

  @override
  String get fidelitySubtitle => 'Sticks closely to your chosen color';

  @override
  String get vibrant => 'Vibrant';

  @override
  String get vibrantSubtitle => 'Bright colors with high contrast';

  @override
  String get expressive => 'Bold';

  @override
  String get expressiveSubtitle => 'Playful colors with unique accents';

  @override
  String get monochrome => 'Monochrome';

  @override
  String get monochromeSubtitle => 'Pure black, white, and gray';

  @override
  String get neutral => 'Subtle';

  @override
  String get neutralSubtitle => 'Muted tones with just a hint of color';

  @override
  String get appColor => 'App Color';

  @override
  String get hexColor => 'Hex Color';

  @override
  String get invalidHex => 'Invalid hex';

  @override
  String get hexFormatHint => 'Use RGB, RRGGBB, or AARRGGBB';

  @override
  String get primary => 'Primary';

  @override
  String get secondary => 'Secondary';

  @override
  String get tertiary => 'Tertiary';

  @override
  String get error => 'Error';

  @override
  String get rememberSort => 'Remember sort';

  @override
  String get rememberSortSubtitle => 'Persist sort order when app restarts';

  @override
  String get type => 'Type';

  @override
  String get pubDate => 'Pub Date';

  @override
  String get added => 'Added';

  @override
  String get mimeType => 'MIME Type';

  @override
  String get season => 'Season';

  @override
  String get episode => 'Episode';

  @override
  String libraryIsEmpty(String library) {
    return '$library Library is empty!';
  }

  @override
  String get storage => 'Storage';

  @override
  String get internalStorage => 'Internal Storage';

  @override
  String get changeLocation => 'Change Location';

  @override
  String get resetToInternal => 'Reset to Internal';

  @override
  String get downloadLocation => 'Download Location';

  @override
  String get storageSubDirsNote =>
      'Audiobooks and podcasts will be stored in separate subdirectories: \n- audiobooks/<itemId>/\n- podcasts/<podcastId>/\nThis ensures stable paths even if server metadata changes';

  @override
  String localSession(String time) {
    return 'Local Session: $time';
  }

  @override
  String get localSessionDeleteQ => 'Delete local session?';

  @override
  String get localSessionDeleteBody =>
      'This progress may not be fully synced yet. Check playback history for confirmation.';
}
