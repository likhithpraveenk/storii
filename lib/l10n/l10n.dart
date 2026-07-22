import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_zh.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

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

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @customHeaders.
  ///
  /// In en, this message translates to:
  /// **'Custom Headers'**
  String get customHeaders;

  /// No description provided for @key.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get key;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @duplicateHeader.
  ///
  /// In en, this message translates to:
  /// **'Duplicate header'**
  String get duplicateHeader;

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

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

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

  /// No description provided for @recentSessions.
  ///
  /// In en, this message translates to:
  /// **'Recent Sessions'**
  String get recentSessions;

  /// No description provided for @noAuthor.
  ///
  /// In en, this message translates to:
  /// **'No Author'**
  String get noAuthor;

  /// No description provided for @noArtist.
  ///
  /// In en, this message translates to:
  /// **'No Artist'**
  String get noArtist;

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

  /// No description provided for @switchAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Switch to another account?'**
  String get switchAccountConfirm;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Log out from this account?'**
  String get logoutConfirm;

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

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

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

  /// No description provided for @playEpisodeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Play this episode?'**
  String get playEpisodeConfirm;

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

  /// No description provided for @navBar.
  ///
  /// In en, this message translates to:
  /// **'Navbar'**
  String get navBar;

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

  /// No description provided for @librarySettings.
  ///
  /// In en, this message translates to:
  /// **'Library Settings'**
  String get librarySettings;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @latest.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get latest;

  /// No description provided for @latestEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Latest episodes'**
  String get latestEpisodes;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

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

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @metadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get metadata;

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

  /// No description provided for @publishedDate.
  ///
  /// In en, this message translates to:
  /// **'Published Date'**
  String get publishedDate;

  /// No description provided for @releaseDate.
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get releaseDate;

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

  /// No description provided for @itunesId.
  ///
  /// In en, this message translates to:
  /// **'iTunes ID'**
  String get itunesId;

  /// No description provided for @itunesArtistId.
  ///
  /// In en, this message translates to:
  /// **'iTunes Artist ID'**
  String get itunesArtistId;

  /// No description provided for @itunesPageUrl.
  ///
  /// In en, this message translates to:
  /// **'iTunes Page Url'**
  String get itunesPageUrl;

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

  /// No description provided for @inComplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get inComplete;

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

  /// No description provided for @moreInfo.
  ///
  /// In en, this message translates to:
  /// **'More Info'**
  String get moreInfo;

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

  /// No description provided for @trustAllCertificates.
  ///
  /// In en, this message translates to:
  /// **'Trust all certificates'**
  String get trustAllCertificates;

  /// No description provided for @trustAllCertificatesDescription.
  ///
  /// In en, this message translates to:
  /// **'Disables certificate validation'**
  String get trustAllCertificatesDescription;

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

  /// No description provided for @endOfChapter.
  ///
  /// In en, this message translates to:
  /// **'End of Chapter'**
  String get endOfChapter;

  /// No description provided for @endOfNChapters.
  ///
  /// In en, this message translates to:
  /// **'End of {count} Chapters'**
  String endOfNChapters(int count);

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

  /// No description provided for @syncIntervalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Controls server sync frequency, overriding the 1-minute mobile data restriction if set higher'**
  String get syncIntervalSubtitle;

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

  /// No description provided for @connectionStatus.
  ///
  /// In en, this message translates to:
  /// **'Connection Status'**
  String get connectionStatus;

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

  /// No description provided for @audioBufferDuration.
  ///
  /// In en, this message translates to:
  /// **'Audio Buffer Duration'**
  String get audioBufferDuration;

  /// No description provided for @audioBufferDurationDescription.
  ///
  /// In en, this message translates to:
  /// **'How much audio to keep ahead of playback. Higher values reduce interruptions on slow connections'**
  String get audioBufferDurationDescription;

  /// No description provided for @fadeOnSleep.
  ///
  /// In en, this message translates to:
  /// **'Audio fade-out'**
  String get fadeOnSleep;

  /// No description provided for @fadeOnSleepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Gradually lowers the volume before the sleep timer ends'**
  String get fadeOnSleepSubtitle;

  /// No description provided for @fadeOnSleepDuration.
  ///
  /// In en, this message translates to:
  /// **'Fade window'**
  String get fadeOnSleepDuration;

  /// No description provided for @fadeOnSleepDurationDescription.
  ///
  /// In en, this message translates to:
  /// **'Sets how long the fade-out effect lasts before the timer ends'**
  String get fadeOnSleepDurationDescription;

  /// No description provided for @fadeOnSleepMinVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume floor'**
  String get fadeOnSleepMinVolume;

  /// No description provided for @fadeOnSleepMinVolumeDescription.
  ///
  /// In en, this message translates to:
  /// **'Defines the lowest audio level reached during the fade'**
  String get fadeOnSleepMinVolumeDescription;

  /// No description provided for @avoidMobileData.
  ///
  /// In en, this message translates to:
  /// **'Avoid mobile data'**
  String get avoidMobileData;

  /// No description provided for @avoidMobileDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Downloads will pause on mobile networks'**
  String get avoidMobileDataSubtitle;

  /// No description provided for @totalListeningTime.
  ///
  /// In en, this message translates to:
  /// **'Total Listening Time'**
  String get totalListeningTime;

  /// No description provided for @currentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get currentStreak;

  /// No description provided for @longestStreak.
  ///
  /// In en, this message translates to:
  /// **'Longest streak'**
  String get longestStreak;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get thisMonth;

  /// No description provided for @thisYear.
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get thisYear;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String daysAgo(int days);

  /// No description provided for @booksFinished.
  ///
  /// In en, this message translates to:
  /// **'Books finished'**
  String get booksFinished;

  /// No description provided for @episodesFinished.
  ///
  /// In en, this message translates to:
  /// **'Episodes finished'**
  String get episodesFinished;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @increaseVolume.
  ///
  /// In en, this message translates to:
  /// **'Increase Volume'**
  String get increaseVolume;

  /// No description provided for @decreaseVolume.
  ///
  /// In en, this message translates to:
  /// **'Decrease Volume'**
  String get decreaseVolume;

  /// No description provided for @showChapterPosition.
  ///
  /// In en, this message translates to:
  /// **'Show chapter position'**
  String get showChapterPosition;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out'**
  String get errorTimeout;

  /// No description provided for @errorAuth.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get errorAuth;

  /// No description provided for @errorForbidden.
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get errorForbidden;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Content not found'**
  String get errorNotFound;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error, please try again'**
  String get errorServer;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorUnknown;

  /// No description provided for @errorType.
  ///
  /// In en, this message translates to:
  /// **'Type error'**
  String get errorType;

  /// No description provided for @changeRestartRequired.
  ///
  /// In en, this message translates to:
  /// **'Changes take effect after restart'**
  String get changeRestartRequired;

  /// No description provided for @playbackErrorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Connection issue. Audio may be interrupted'**
  String get playbackErrorNetwork;

  /// No description provided for @playbackErrorSource.
  ///
  /// In en, this message translates to:
  /// **'Audio file could not be loaded'**
  String get playbackErrorSource;

  /// No description provided for @playbackErrorDecoder.
  ///
  /// In en, this message translates to:
  /// **'File format unsupported'**
  String get playbackErrorDecoder;

  /// No description provided for @playbackErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong with playback'**
  String get playbackErrorUnknown;

  /// No description provided for @codec.
  ///
  /// In en, this message translates to:
  /// **'Codec'**
  String get codec;

  /// No description provided for @bitrate.
  ///
  /// In en, this message translates to:
  /// **'Bitrate'**
  String get bitrate;

  /// No description provided for @channels.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channels;

  /// No description provided for @format.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get format;

  /// No description provided for @path.
  ///
  /// In en, this message translates to:
  /// **'Path'**
  String get path;

  /// No description provided for @scrollThumbVisibility.
  ///
  /// In en, this message translates to:
  /// **'Show scroll thumb'**
  String get scrollThumbVisibility;

  /// No description provided for @scrollThumbVisibilitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Displays a draggable thumb on long lists'**
  String get scrollThumbVisibilitySubtitle;

  /// No description provided for @scrollThumbSettings.
  ///
  /// In en, this message translates to:
  /// **'Scroll Thumb'**
  String get scrollThumbSettings;

  /// No description provided for @scrollThumbDuration.
  ///
  /// In en, this message translates to:
  /// **'Hide after'**
  String get scrollThumbDuration;

  /// No description provided for @scrollThumbDurationDescription.
  ///
  /// In en, this message translates to:
  /// **'How long the thumb stays visible after you stop scrolling'**
  String get scrollThumbDurationDescription;

  /// No description provided for @scrollThumbHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get scrollThumbHeight;

  /// No description provided for @scrollThumbHeightDescription.
  ///
  /// In en, this message translates to:
  /// **'Thumb height in pixels'**
  String get scrollThumbHeightDescription;

  /// No description provided for @scrollThumbWidth.
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get scrollThumbWidth;

  /// No description provided for @scrollThumbWidthDescription.
  ///
  /// In en, this message translates to:
  /// **'Thumb width in pixels'**
  String get scrollThumbWidthDescription;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @binaryUnits.
  ///
  /// In en, this message translates to:
  /// **'Binary units'**
  String get binaryUnits;

  /// No description provided for @binaryUnitsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'1 KB = 1024 B'**
  String get binaryUnitsSubtitle;

  /// No description provided for @decimalUnits.
  ///
  /// In en, this message translates to:
  /// **'Decimal units'**
  String get decimalUnits;

  /// No description provided for @decimalUnitsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'1 KB = 1000 B'**
  String get decimalUnitsSubtitle;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup & restore'**
  String get backup;

  /// No description provided for @createBackup.
  ///
  /// In en, this message translates to:
  /// **'Create backup'**
  String get createBackup;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore backup'**
  String get restoreBackup;

  /// No description provided for @backupDescription.
  ///
  /// In en, this message translates to:
  /// **'Export or import your accounts, settings and history'**
  String get backupDescription;

  /// No description provided for @backupCreated.
  ///
  /// In en, this message translates to:
  /// **'Backup saved'**
  String get backupCreated;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not create backup'**
  String get backupFailed;

  /// No description provided for @restoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup restored'**
  String get restoreSuccess;

  /// No description provided for @restoreRestart.
  ///
  /// In en, this message translates to:
  /// **'Backup restored. Restart the app to apply changes'**
  String get restoreRestart;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not restore backup'**
  String get restoreFailed;

  /// No description provided for @marqueeSpeed.
  ///
  /// In en, this message translates to:
  /// **'Text Scroll Speed'**
  String get marqueeSpeed;

  /// No description provided for @schemeVariant.
  ///
  /// In en, this message translates to:
  /// **'Theme Style'**
  String get schemeVariant;

  /// No description provided for @schemeVariantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how your theme colors are generated'**
  String get schemeVariantSubtitle;

  /// No description provided for @tonalSpot.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get tonalSpot;

  /// No description provided for @tonalSpotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Soft, natural, and easy on the eyes'**
  String get tonalSpotSubtitle;

  /// No description provided for @fidelity.
  ///
  /// In en, this message translates to:
  /// **'Close Match'**
  String get fidelity;

  /// No description provided for @fidelitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sticks closely to your chosen color'**
  String get fidelitySubtitle;

  /// No description provided for @vibrant.
  ///
  /// In en, this message translates to:
  /// **'Vibrant'**
  String get vibrant;

  /// No description provided for @vibrantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Bright colors with high contrast'**
  String get vibrantSubtitle;

  /// No description provided for @expressive.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get expressive;

  /// No description provided for @expressiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Playful colors with unique accents'**
  String get expressiveSubtitle;

  /// No description provided for @monochrome.
  ///
  /// In en, this message translates to:
  /// **'Monochrome'**
  String get monochrome;

  /// No description provided for @monochromeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pure black, white, and gray'**
  String get monochromeSubtitle;

  /// No description provided for @neutral.
  ///
  /// In en, this message translates to:
  /// **'Subtle'**
  String get neutral;

  /// No description provided for @neutralSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Muted tones with just a hint of color'**
  String get neutralSubtitle;

  /// No description provided for @appColor.
  ///
  /// In en, this message translates to:
  /// **'App Color'**
  String get appColor;

  /// No description provided for @hexColor.
  ///
  /// In en, this message translates to:
  /// **'Hex Color'**
  String get hexColor;

  /// No description provided for @invalidHex.
  ///
  /// In en, this message translates to:
  /// **'Invalid hex'**
  String get invalidHex;

  /// No description provided for @hexFormatHint.
  ///
  /// In en, this message translates to:
  /// **'Use RGB, RRGGBB, or AARRGGBB'**
  String get hexFormatHint;

  /// No description provided for @primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get primary;

  /// No description provided for @secondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get secondary;

  /// No description provided for @tertiary.
  ///
  /// In en, this message translates to:
  /// **'Tertiary'**
  String get tertiary;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @rememberSort.
  ///
  /// In en, this message translates to:
  /// **'Remember sort'**
  String get rememberSort;

  /// No description provided for @rememberSortSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Persist sort order when app restarts'**
  String get rememberSortSubtitle;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @pubDate.
  ///
  /// In en, this message translates to:
  /// **'Pub Date'**
  String get pubDate;

  /// No description provided for @added.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get added;

  /// No description provided for @mimeType.
  ///
  /// In en, this message translates to:
  /// **'MIME Type'**
  String get mimeType;

  /// No description provided for @season.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get season;

  /// No description provided for @episode.
  ///
  /// In en, this message translates to:
  /// **'Episode'**
  String get episode;

  /// No description provided for @libraryIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'{library} Library is empty!'**
  String libraryIsEmpty(String library);

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// No description provided for @internalStorage.
  ///
  /// In en, this message translates to:
  /// **'Internal Storage'**
  String get internalStorage;

  /// No description provided for @changeLocation.
  ///
  /// In en, this message translates to:
  /// **'Change Location'**
  String get changeLocation;

  /// No description provided for @resetToInternal.
  ///
  /// In en, this message translates to:
  /// **'Reset to Internal'**
  String get resetToInternal;

  /// No description provided for @downloadLocation.
  ///
  /// In en, this message translates to:
  /// **'Download Location'**
  String get downloadLocation;

  /// No description provided for @storageSubDirsNote.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks and podcasts will be stored in separate subdirectories: \n- audiobooks/<itemId>/\n- podcasts/<podcastId>/\nThis ensures stable paths even if server metadata changes'**
  String get storageSubDirsNote;

  /// No description provided for @localSession.
  ///
  /// In en, this message translates to:
  /// **'Local Session'**
  String get localSession;

  /// No description provided for @currentPosition.
  ///
  /// In en, this message translates to:
  /// **'Current Position'**
  String get currentPosition;

  /// No description provided for @localSessionSheetBody.
  ///
  /// In en, this message translates to:
  /// **'Progress saved locally. Sync pending.'**
  String get localSessionSheetBody;

  /// No description provided for @bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// No description provided for @bookmarkFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save bookmark'**
  String get bookmarkFailed;

  /// No description provided for @addBookmark.
  ///
  /// In en, this message translates to:
  /// **'Add Bookmark'**
  String get addBookmark;

  /// No description provided for @editBookmark.
  ///
  /// In en, this message translates to:
  /// **'Edit Bookmark'**
  String get editBookmark;
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
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
