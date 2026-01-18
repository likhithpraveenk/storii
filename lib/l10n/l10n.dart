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

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorUnknown;

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

  /// No description provided for @errorLoadingUsers.
  ///
  /// In en, this message translates to:
  /// **'Error loading users'**
  String get errorLoadingUsers;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome {username}'**
  String welcome(String username);

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

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @ascDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap again for ascending/descending'**
  String get ascDesc;

  /// No description provided for @gridCount.
  ///
  /// In en, this message translates to:
  /// **'Grid Count'**
  String get gridCount;

  /// No description provided for @percentCompleted.
  ///
  /// In en, this message translates to:
  /// **'{percent}% completed'**
  String percentCompleted(String percent);

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

  /// No description provided for @replay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get replay;

  /// No description provided for @deleteLogsQ.
  ///
  /// In en, this message translates to:
  /// **'Delete {count} logs?'**
  String deleteLogsQ(int count);

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
  /// **'Font Family'**
  String get fontFamily;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

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

  /// No description provided for @mustSelect3.
  ///
  /// In en, this message translates to:
  /// **'You must select at least 3 items'**
  String get mustSelect3;

  /// No description provided for @maxSelect5.
  ///
  /// In en, this message translates to:
  /// **'You can select a maximum of 5 items'**
  String get maxSelect5;

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

  /// No description provided for @standaloneBooks.
  ///
  /// In en, this message translates to:
  /// **'Standalone Books'**
  String get standaloneBooks;

  /// No description provided for @sortTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get sortTitle;

  /// No description provided for @sortAuthor.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get sortAuthor;

  /// No description provided for @sortAuthorLastFirst.
  ///
  /// In en, this message translates to:
  /// **'Author (Last, First)'**
  String get sortAuthorLastFirst;

  /// No description provided for @sortAddedAt.
  ///
  /// In en, this message translates to:
  /// **'Date Added'**
  String get sortAddedAt;

  /// No description provided for @sortPublishedYear.
  ///
  /// In en, this message translates to:
  /// **'Published Year'**
  String get sortPublishedYear;

  /// No description provided for @sortSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get sortSize;

  /// No description provided for @sortDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get sortDuration;

  /// No description provided for @sortFileBirthtime.
  ///
  /// In en, this message translates to:
  /// **'File Created Date'**
  String get sortFileBirthtime;

  /// No description provided for @sortFileModified.
  ///
  /// In en, this message translates to:
  /// **'File Modified Date'**
  String get sortFileModified;

  /// No description provided for @sortProgressUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Played'**
  String get sortProgressUpdated;

  /// No description provided for @sortProgressStarted.
  ///
  /// In en, this message translates to:
  /// **'Date Started'**
  String get sortProgressStarted;

  /// No description provided for @sortProgressFinished.
  ///
  /// In en, this message translates to:
  /// **'Date Finished'**
  String get sortProgressFinished;

  /// No description provided for @sortRandom.
  ///
  /// In en, this message translates to:
  /// **'Random'**
  String get sortRandom;

  /// No description provided for @sortNumBooks.
  ///
  /// In en, this message translates to:
  /// **'Number of Books'**
  String get sortNumBooks;

  /// No description provided for @sortName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sortName;

  /// No description provided for @sortLastBookAdded.
  ///
  /// In en, this message translates to:
  /// **'Last Book Added'**
  String get sortLastBookAdded;

  /// No description provided for @sortLastBookUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Book Updated'**
  String get sortLastBookUpdated;

  /// No description provided for @sortLastFirst.
  ///
  /// In en, this message translates to:
  /// **'Last Name, First Name'**
  String get sortLastFirst;

  /// No description provided for @sortUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get sortUpdatedAt;

  /// No description provided for @sortNumEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Number of Episodes'**
  String get sortNumEpisodes;

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

  /// No description provided for @gridView.
  ///
  /// In en, this message translates to:
  /// **'Grid View'**
  String get gridView;

  /// No description provided for @filterGenre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get filterGenre;

  /// No description provided for @filterTag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get filterTag;

  /// No description provided for @filterAuthor.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get filterAuthor;

  /// No description provided for @filterSeries.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get filterSeries;

  /// No description provided for @filterStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get filterStatus;

  /// No description provided for @filterNarrator.
  ///
  /// In en, this message translates to:
  /// **'Narrator'**
  String get filterNarrator;

  /// No description provided for @filterLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get filterLanguage;

  /// No description provided for @filterTracks.
  ///
  /// In en, this message translates to:
  /// **'Tracks'**
  String get filterTracks;

  /// No description provided for @filterMissing.
  ///
  /// In en, this message translates to:
  /// **'Missing Metadata'**
  String get filterMissing;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear Filter'**
  String get clearFilter;

  /// No description provided for @statusFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get statusFinished;

  /// No description provided for @statusNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Not Started'**
  String get statusNotStarted;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get statusInProgress;

  /// No description provided for @statusNotFinished.
  ///
  /// In en, this message translates to:
  /// **'Not Finished'**
  String get statusNotFinished;

  /// No description provided for @missingAsin.
  ///
  /// In en, this message translates to:
  /// **'Missing ASIN'**
  String get missingAsin;

  /// No description provided for @missingIsbn.
  ///
  /// In en, this message translates to:
  /// **'Missing ISBN'**
  String get missingIsbn;

  /// No description provided for @missingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Missing Subtitle'**
  String get missingSubtitle;

  /// No description provided for @missingAuthors.
  ///
  /// In en, this message translates to:
  /// **'Missing Authors'**
  String get missingAuthors;

  /// No description provided for @missingPublishedYear.
  ///
  /// In en, this message translates to:
  /// **'Missing Year'**
  String get missingPublishedYear;

  /// No description provided for @missingSeries.
  ///
  /// In en, this message translates to:
  /// **'Missing Series'**
  String get missingSeries;

  /// No description provided for @missingDescription.
  ///
  /// In en, this message translates to:
  /// **'Missing Description'**
  String get missingDescription;

  /// No description provided for @missingGenres.
  ///
  /// In en, this message translates to:
  /// **'Missing Genres'**
  String get missingGenres;

  /// No description provided for @missingTags.
  ///
  /// In en, this message translates to:
  /// **'Missing Tags'**
  String get missingTags;

  /// No description provided for @missingNarrators.
  ///
  /// In en, this message translates to:
  /// **'Missing Narrators'**
  String get missingNarrators;

  /// No description provided for @missingPublisher.
  ///
  /// In en, this message translates to:
  /// **'Missing Publisher'**
  String get missingPublisher;

  /// No description provided for @missingLanguage.
  ///
  /// In en, this message translates to:
  /// **'Missing Language'**
  String get missingLanguage;

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

  /// No description provided for @issuesFound.
  ///
  /// In en, this message translates to:
  /// **'Items with Issues'**
  String get issuesFound;

  /// No description provided for @feedOpen.
  ///
  /// In en, this message translates to:
  /// **'Open Podcast Feed'**
  String get feedOpen;

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

  /// No description provided for @ascending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get ascending;

  /// No description provided for @descending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get descending;

  /// No description provided for @listView.
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get listView;
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
