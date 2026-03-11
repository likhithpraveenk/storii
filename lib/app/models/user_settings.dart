import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/builder/annotations.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @noCodeGen required String userId,

    Library? currentLibrary,

    @Default(defaultNavTargets) List<NavTarget> navTargets,

    @Default(false) bool isFullySynced,

    @Default(true) bool isItemsGridView,

    @Default(true) bool isSeriesGridView,

    @Default(true) bool isAuthorsGridView,

    @Default(true) bool showTitleForItem,

    @Default(false) bool stackTitleOnImage,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
