import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/builder/annotations.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @noCodeGen required String userId,

    String? currentLibraryId,

    @Default(false) bool isFullySynced,

    @Default(true) bool isItemsGridView,

    @Default(true) bool isSeriesGridView,

    @Default(true) bool isAuthorsGridView,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
