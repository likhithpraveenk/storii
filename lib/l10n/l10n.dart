import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @addServer.
  ///
  /// In en, this message translates to:
  /// **'Add Server'**
  String get addServer;

  /// No description provided for @serverUrl.
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get serverUrl;

  /// No description provided for @validateServer.
  ///
  /// In en, this message translates to:
  /// **'Validate Server'**
  String get validateServer;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @deleteServer.
  ///
  /// In en, this message translates to:
  /// **'Delete Server'**
  String get deleteServer;

  /// No description provided for @deleteServerQ.
  ///
  /// In en, this message translates to:
  /// **'Delete Server?'**
  String get deleteServerQ;

  /// No description provided for @deleteUserQ.
  ///
  /// In en, this message translates to:
  /// **'Delete {user}?'**
  String deleteUserQ(String user);

  /// No description provided for @noUsersServer.
  ///
  /// In en, this message translates to:
  /// **'No users are linked to this server.'**
  String get noUsersServer;

  /// No description provided for @followingUsers.
  ///
  /// In en, this message translates to:
  /// **'You are about to delete the following users'**
  String get followingUsers;

  /// No description provided for @urlCopied.
  ///
  /// In en, this message translates to:
  /// **'URL Copied'**
  String get urlCopied;

  /// No description provided for @addUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get addUser;

  /// No description provided for @editServer.
  ///
  /// In en, this message translates to:
  /// **'Edit Server'**
  String get editServer;

  /// No description provided for @errorLoadingUsers.
  ///
  /// In en, this message translates to:
  /// **'Error loading users'**
  String get errorLoadingUsers;

  /// No description provided for @switchingToUser.
  ///
  /// In en, this message translates to:
  /// **'Switching to {user}'**
  String switchingToUser(String user);

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @noSession.
  ///
  /// In en, this message translates to:
  /// **'No session'**
  String get noSession;

  /// No description provided for @noAuthor.
  ///
  /// In en, this message translates to:
  /// **'No Author'**
  String get noAuthor;

  /// No description provided for @noTitle.
  ///
  /// In en, this message translates to:
  /// **'No Title'**
  String get noTitle;

  /// No description provided for @noImage.
  ///
  /// In en, this message translates to:
  /// **'No Image'**
  String get noImage;

  /// No description provided for @errorImage.
  ///
  /// In en, this message translates to:
  /// **'Error loading image'**
  String get errorImage;

  /// No description provided for @downloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @switchAccount.
  ///
  /// In en, this message translates to:
  /// **'Switch Account'**
  String get switchAccount;

  /// No description provided for @noLibrary.
  ///
  /// In en, this message translates to:
  /// **'No Library'**
  String get noLibrary;

  /// No description provided for @libraries.
  ///
  /// In en, this message translates to:
  /// **'Libraries'**
  String get libraries;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description available'**
  String get noDescription;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @replay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get replay;

  /// No description provided for @deleteLogsQ.
  ///
  /// In en, this message translates to:
  /// **'Delete all logs?'**
  String get deleteLogsQ;

  /// No description provided for @audiobooks.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks'**
  String get audiobooks;

  /// No description provided for @podcasts.
  ///
  /// In en, this message translates to:
  /// **'Podcasts'**
  String get podcasts;

  /// No description provided for @episodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'Date Format'**
  String get dateFormat;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @invalidFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid Format'**
  String get invalidFormat;

  /// No description provided for @customPattern.
  ///
  /// In en, this message translates to:
  /// **'Custom Pattern'**
  String get customPattern;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @fontFamily.
  ///
  /// In en, this message translates to:
  /// **'Change Font'**
  String get fontFamily;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get systemTheme;

  /// No description provided for @systemThemeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match device palette'**
  String get systemThemeSubtitle;

  /// No description provided for @pureBlack.
  ///
  /// In en, this message translates to:
  /// **'Pure Black'**
  String get pureBlack;

  /// No description provided for @pureBlackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'High contrast theme'**
  String get pureBlackSubtitle;

  /// No description provided for @fontScale.
  ///
  /// In en, this message translates to:
  /// **'Font Scale'**
  String get fontScale;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @configNav.
  ///
  /// In en, this message translates to:
  /// **'Configure Navigation'**
  String get configNav;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @resetSettingsQ.
  ///
  /// In en, this message translates to:
  /// **'Reset Settings?'**
  String get resetSettingsQ;

  /// No description provided for @resetSettingsTxt.
  ///
  /// In en, this message translates to:
  /// **'This will revert all preferences to their default values.'**
  String get resetSettingsTxt;

  /// No description provided for @settingsReset.
  ///
  /// In en, this message translates to:
  /// **'Settings are reset'**
  String get settingsReset;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @series.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get series;

  /// No description provided for @authors.
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get authors;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @author.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// No description provided for @authorLastFirst.
  ///
  /// In en, this message translates to:
  /// **'Author (Last, First)'**
  String get authorLastFirst;

  /// No description provided for @dateAdded.
  ///
  /// In en, this message translates to:
  /// **'Date Added'**
  String get dateAdded;

  /// No description provided for @publishedYear.
  ///
  /// In en, this message translates to:
  /// **'Published Year'**
  String get publishedYear;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @fileCreatedDate.
  ///
  /// In en, this message translates to:
  /// **'File Created Date'**
  String get fileCreatedDate;

  /// No description provided for @fileModifiedDate.
  ///
  /// In en, this message translates to:
  /// **'File Modified Date'**
  String get fileModifiedDate;

  /// No description provided for @lastPlayed.
  ///
  /// In en, this message translates to:
  /// **'Last Played'**
  String get lastPlayed;

  /// No description provided for @dateStarted.
  ///
  /// In en, this message translates to:
  /// **'Date Started'**
  String get dateStarted;

  /// No description provided for @dateFinished.
  ///
  /// In en, this message translates to:
  /// **'Date Finished'**
  String get dateFinished;

  /// No description provided for @random.
  ///
  /// In en, this message translates to:
  /// **'Random'**
  String get random;

  /// No description provided for @numOfBooks.
  ///
  /// In en, this message translates to:
  /// **'Number of Books'**
  String get numOfBooks;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @lastBookAdded.
  ///
  /// In en, this message translates to:
  /// **'Last Book Added'**
  String get lastBookAdded;

  /// No description provided for @lastBookUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Book Updated'**
  String get lastBookUpdated;

  /// No description provided for @lastFirst.
  ///
  /// In en, this message translates to:
  /// **'Last Name, First Name'**
  String get lastFirst;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @numOfEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Number of Episodes'**
  String get numOfEpisodes;

  /// No description provided for @hasEbook.
  ///
  /// In en, this message translates to:
  /// **'Has ebook'**
  String get hasEbook;

  /// No description provided for @hasNoEbook.
  ///
  /// In en, this message translates to:
  /// **'Has no ebook'**
  String get hasNoEbook;

  /// No description provided for @hasSupplementary.
  ///
  /// In en, this message translates to:
  /// **'Has supplementary ebook'**
  String get hasSupplementary;

  /// No description provided for @hasNoSupplementary.
  ///
  /// In en, this message translates to:
  /// **'Has no supplementary ebook'**
  String get hasNoSupplementary;

  /// No description provided for @collapseSeries.
  ///
  /// In en, this message translates to:
  /// **'Collapse Series'**
  String get collapseSeries;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @publisher.
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get publisher;

  /// No description provided for @publishedDecade.
  ///
  /// In en, this message translates to:
  /// **'Published Decade'**
  String get publishedDecade;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @narrators.
  ///
  /// In en, this message translates to:
  /// **'Narrators'**
  String get narrators;

  /// No description provided for @tracks.
  ///
  /// In en, this message translates to:
  /// **'Tracks'**
  String get tracks;

  /// No description provided for @missingMetadata.
  ///
  /// In en, this message translates to:
  /// **'Missing Metadata'**
  String get missingMetadata;

  /// No description provided for @ebooks.
  ///
  /// In en, this message translates to:
  /// **'Ebooks'**
  String get ebooks;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// No description provided for @notStarted.
  ///
  /// In en, this message translates to:
  /// **'Not Started'**
  String get notStarted;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @notFinished.
  ///
  /// In en, this message translates to:
  /// **'Not Finished'**
  String get notFinished;

  /// No description provided for @asin.
  ///
  /// In en, this message translates to:
  /// **'ASIN'**
  String get asin;

  /// No description provided for @isbn.
  ///
  /// In en, this message translates to:
  /// **'ISBN'**
  String get isbn;

  /// No description provided for @subtitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitle'**
  String get subtitle;

  /// No description provided for @singleTrack.
  ///
  /// In en, this message translates to:
  /// **'Single Track'**
  String get singleTrack;

  /// No description provided for @multipleTracks.
  ///
  /// In en, this message translates to:
  /// **'Multiple Tracks'**
  String get multipleTracks;

  /// No description provided for @noTracks.
  ///
  /// In en, this message translates to:
  /// **'No Tracks'**
  String get noTracks;

  /// No description provided for @itemsWithIssues.
  ///
  /// In en, this message translates to:
  /// **'Items with Issues'**
  String get itemsWithIssues;

  /// No description provided for @rssFeedOpen.
  ///
  /// In en, this message translates to:
  /// **'RSS Feed Open'**
  String get rssFeedOpen;

  /// No description provided for @explicit.
  ///
  /// In en, this message translates to:
  /// **'Explicit'**
  String get explicit;

  /// No description provided for @abridged.
  ///
  /// In en, this message translates to:
  /// **'Abridged'**
  String get abridged;

  /// No description provided for @displayMode.
  ///
  /// In en, this message translates to:
  /// **'Display Mode'**
  String get displayMode;

  /// No description provided for @comfortable.
  ///
  /// In en, this message translates to:
  /// **'Comfortable'**
  String get comfortable;

  /// No description provided for @compact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get compact;

  /// No description provided for @coverOnly.
  ///
  /// In en, this message translates to:
  /// **'Cover Only'**
  String get coverOnly;

  /// No description provided for @listView.
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get listView;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// No description provided for @couldNotUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not launch {url}'**
  String couldNotUrl(String url);

  /// No description provided for @licensedUnder.
  ///
  /// In en, this message translates to:
  /// **'Licensed under the GNU General Public License v3.0'**
  String get licensedUnder;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @buildNumber.
  ///
  /// In en, this message translates to:
  /// **'Build Number: {text}'**
  String buildNumber(String text);

  /// No description provided for @networkLogs.
  ///
  /// In en, this message translates to:
  /// **'Network Logs'**
  String get networkLogs;

  /// No description provided for @networkLogsDescription.
  ///
  /// In en, this message translates to:
  /// **'Log HTTP requests and responses'**
  String get networkLogsDescription;

  /// No description provided for @readableDuration.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =0{} other{{hours}h }}{minutes}m'**
  String readableDuration(int hours, int minutes);

  /// No description provided for @readableDurationFull.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =0{} other{{hours}h }}{minutes}m {seconds}s'**
  String readableDurationFull(int hours, int minutes, int seconds);

  /// No description provided for @durationLeft.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =0{} other{{hours}h }}{minutes}m left'**
  String durationLeft(int hours, int minutes);

  /// No description provided for @chapters.
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get chapters;

  /// No description provided for @removeProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove progress?'**
  String get removeProgressTitle;

  /// No description provided for @removeProgressMessage.
  ///
  /// In en, this message translates to:
  /// **'This will reset your listening progress and cannot be undone.'**
  String get removeProgressMessage;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @markAsComplete.
  ///
  /// In en, this message translates to:
  /// **'Mark as complete?'**
  String get markAsComplete;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @progressMarkedComplete.
  ///
  /// In en, this message translates to:
  /// **'Marked as complete'**
  String get progressMarkedComplete;

  /// No description provided for @progressMarkCompleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to mark as complete'**
  String get progressMarkCompleteFailed;

  /// No description provided for @progressRemoved.
  ///
  /// In en, this message translates to:
  /// **'Progress removed'**
  String get progressRemoved;

  /// No description provided for @progressRemoveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove progress'**
  String get progressRemoveFailed;

  /// No description provided for @playerSettings.
  ///
  /// In en, this message translates to:
  /// **'Player Settings'**
  String get playerSettings;

  /// No description provided for @skipForward.
  ///
  /// In en, this message translates to:
  /// **'Skip forward'**
  String get skipForward;

  /// No description provided for @skipBack.
  ///
  /// In en, this message translates to:
  /// **'Skip back'**
  String get skipBack;

  /// No description provided for @startPlayback.
  ///
  /// In en, this message translates to:
  /// **'Start playback'**
  String get startPlayback;

  /// No description provided for @playbackSpeed.
  ///
  /// In en, this message translates to:
  /// **'Playback speed'**
  String get playbackSpeed;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer'**
  String get sleepTimer;

  /// No description provided for @cancelTimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel timer'**
  String get cancelTimer;

  /// No description provided for @timeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{time} min'**
  String timeMinutes(int time);

  /// No description provided for @settingsStartupRouteTitle.
  ///
  /// In en, this message translates to:
  /// **'Start on app open'**
  String get settingsStartupRouteTitle;

  /// No description provided for @settingsReorderNavTitle.
  ///
  /// In en, this message translates to:
  /// **'Navigation tabs'**
  String get settingsReorderNavTitle;

  /// No description provided for @settingsReorderNavSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reorder and enable or disable tabs'**
  String get settingsReorderNavSubtitle;

  /// No description provided for @sampleText.
  ///
  /// In en, this message translates to:
  /// **'Sphinx of black quartz, judge my vow - 0123456789'**
  String get sampleText;

  /// No description provided for @addFonts.
  ///
  /// In en, this message translates to:
  /// **'Add fonts'**
  String get addFonts;

  /// No description provided for @appCache.
  ///
  /// In en, this message translates to:
  /// **'App Cache'**
  String get appCache;

  /// No description provided for @settingsNavLabelBehavior.
  ///
  /// In en, this message translates to:
  /// **'Navigation label'**
  String get settingsNavLabelBehavior;

  /// No description provided for @alwaysShow.
  ///
  /// In en, this message translates to:
  /// **'Always show'**
  String get alwaysShow;

  /// No description provided for @onlyShowSelected.
  ///
  /// In en, this message translates to:
  /// **'Only show when selected'**
  String get onlyShowSelected;

  /// No description provided for @alwaysHide.
  ///
  /// In en, this message translates to:
  /// **'Always hide'**
  String get alwaysHide;

  /// No description provided for @syncInterval.
  ///
  /// In en, this message translates to:
  /// **'Sync Interval'**
  String get syncInterval;

  /// No description provided for @emptyMsg.
  ///
  /// In en, this message translates to:
  /// **'So empty...'**
  String get emptyMsg;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @seek.
  ///
  /// In en, this message translates to:
  /// **'Seek'**
  String get seek;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @playbackError.
  ///
  /// In en, this message translates to:
  /// **'playback error'**
  String get playbackError;

  /// No description provided for @loginOidc.
  ///
  /// In en, this message translates to:
  /// **'Login with OpenID'**
  String get loginOidc;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @oidcRedirectUriHintPrefix.
  ///
  /// In en, this message translates to:
  /// **'Requires'**
  String get oidcRedirectUriHintPrefix;

  /// No description provided for @oidcRedirectUriHintSuffix.
  ///
  /// In en, this message translates to:
  /// **'in ABS → Settings → Authentication → Allowed Mobile Redirect URIs'**
  String get oidcRedirectUriHintSuffix;

  /// No description provided for @queued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get queued;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @resumeDownload.
  ///
  /// In en, this message translates to:
  /// **'Resume Download'**
  String get resumeDownload;

  /// No description provided for @removeDownloadQ.
  ///
  /// In en, this message translates to:
  /// **'Remove Download?'**
  String get removeDownloadQ;

  /// No description provided for @willBeFreed.
  ///
  /// In en, this message translates to:
  /// **'{bytes} will be freed'**
  String willBeFreed(String bytes);

  /// No description provided for @downloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed - tap to retry'**
  String get downloadFailed;

  /// No description provided for @directPlay.
  ///
  /// In en, this message translates to:
  /// **'Direct Play'**
  String get directPlay;

  /// No description provided for @directStream.
  ///
  /// In en, this message translates to:
  /// **'Direct Stream'**
  String get directStream;

  /// No description provided for @transcode.
  ///
  /// In en, this message translates to:
  /// **'Transcode'**
  String get transcode;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get local;

  /// No description provided for @downloaded.
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloaded;

  /// No description provided for @connectionChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking connection...'**
  String get connectionChecking;

  /// No description provided for @connectionPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get connectionPleaseWait;

  /// No description provided for @connectionServerConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected to server'**
  String get connectionServerConnected;

  /// No description provided for @connectionServerDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected to server'**
  String get connectionServerDisconnected;

  /// No description provided for @connectionTypeWifi.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi'**
  String get connectionTypeWifi;

  /// No description provided for @connectionTypeMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile data'**
  String get connectionTypeMobile;

  /// No description provided for @connectionTypeEthernet.
  ///
  /// In en, this message translates to:
  /// **'Ethernet'**
  String get connectionTypeEthernet;

  /// No description provided for @connectionTypeNone.
  ///
  /// In en, this message translates to:
  /// **'No network'**
  String get connectionTypeNone;

  /// No description provided for @connectionCantReachServer.
  ///
  /// In en, this message translates to:
  /// **'Can\'t reach server ({networkType})'**
  String connectionCantReachServer(String networkType);

  /// No description provided for @connectionViaNetwork.
  ///
  /// In en, this message translates to:
  /// **'Connected via {networkType}'**
  String connectionViaNetwork(String networkType);

  /// No description provided for @foundBugQ.
  ///
  /// In en, this message translates to:
  /// **'Found a bug?'**
  String get foundBugQ;

  /// No description provided for @foundBugQSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open a GitHub issue for any bug you encountered'**
  String get foundBugQSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
