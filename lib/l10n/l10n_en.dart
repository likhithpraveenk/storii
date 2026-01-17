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
  String get sortTitle => 'Title';

  @override
  String get sortAuthor => 'Author';

  @override
  String get sortAddedAt => 'Date Added';

  @override
  String get sortUpdatedAt => 'Date Updated';

  @override
  String get sortSize => 'Size';

  @override
  String get sortDuration => 'Duration';

  @override
  String get sortPublishedYear => 'Year';

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
  String deleteLogsQ(int count) {
    return 'Delete $count logs?';
  }

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
  String get fontFamily => 'Font Family';

  @override
  String get system => 'System';

  @override
  String get fontScale => 'Font Scale';

  @override
  String get language => 'Language';

  @override
  String get configNav => 'Configure Navigation';

  @override
  String get mustSelect3 => 'You must select at least 3 items';

  @override
  String get maxSelect5 => 'You can select a maximum of 5 items';

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
}
