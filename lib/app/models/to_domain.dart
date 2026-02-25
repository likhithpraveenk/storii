import 'package:flutter/widgets.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/l10n/l10n.dart';

extension UserToDomain on User {
  UserDomain toDomain(Uri url) {
    return UserDomain(
      id: id,
      username: username,
      userType: type.name,
      serverUrl: url,
    );
  }
}

extension MediaTypeX on MediaType {
  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return switch (this) {
      .book => l10n.audiobooks,
      .podcast => l10n.podcasts,
    };
  }
}
