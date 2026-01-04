// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get login => 'Connexion';

  @override
  String get logout => 'Déconnexion';

  @override
  String get addServer => 'Add Server';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get validateServer => 'Validate Server';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get errorUnknown => 'Une erreur est survenue';

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
    return 'Bienvenue, $username';
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
  String get sortTitle => 'Titre';

  @override
  String get sortAuthor => 'Auteur';

  @override
  String get sortAddedAt => 'Date d\'ajout';

  @override
  String get sortUpdatedAt => 'Date de mise à jour';

  @override
  String get sortSize => 'Taille';

  @override
  String get sortDuration => 'Durée';

  @override
  String get sortPublishedYear => 'Année';

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
  String get language => 'Language';

  @override
  String get configNav => 'Configure Navigation';

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
}
