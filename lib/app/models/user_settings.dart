import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/config/nav_targets.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/builder/annotations.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

class DefaultUserSettings {
  static const Library? currentLibrary = null;
  static const navTargets = defaultNavTargets;
  static const DisplayMode libraryDisplayMode = .comfortable;
  static const collapseSeries = false;
  static const DisplayMode seriesDisplayMode = .comfortable;
  static const DisplayMode authorDisplayMode = .comfortable;
  static const startupNav = NavTarget.home;
  static const NavigationDestinationLabelBehavior navLabelBehavior =
      .alwaysShow;
  static const dateTimeFormat = 'dd MMM y';
  static const String? fontFamily = null;
  static const fontScale = 1.0;
  static const skipForward = Duration(seconds: 30);
  static const skipBackward = Duration(seconds: 10);
  static const speed = 1.0;
  static const historyLimit = 200;
  static const downloadOnUnmeteredOnly = false;
  static const showChapterPositionInHistory = false;
  static const useBinaryBytes = true;
  static const minBufferDuration = Duration(seconds: 30);
  static const marqueeSpeed = 40.0;
  static const rememberSort = true;
  static const librarySortAscending = true;
  static const authorSortAscending = true;
  static const seriesSortAscending = true;
  static const AudiobookSort audiobookSortValue = .title;
  static const PodcastSort podcastSortValue = .title;
  static const AuthorSort authorSortValue = .name;
  static const SeriesSort seriesSortValue = .name;
  static const fadeOnSleep = true;
  static const fadeOnSleepDuration = Duration(minutes: 1);
  static const fadeOnSleepMinVolume = 0.2;
  static const pinnedPlayerActions = defaultPlayerActions;
  static const scrollThumbVisibility = true;
  static const scrollThumbDuration = Duration(seconds: 2);
  static const scrollThumbHeight = 48.0;
  static const scrollThumbWidth = 26.0;
}

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @noCodeGen required String userId,

    @Default(DefaultUserSettings.currentLibrary) Library? currentLibrary,

    @Default(DefaultUserSettings.navTargets) List<NavTarget> navTargets,

    @Default(DefaultUserSettings.libraryDisplayMode)
    DisplayMode libraryDisplayMode,

    @Default(DefaultUserSettings.collapseSeries) bool collapseSeries,

    @Default(DefaultUserSettings.seriesDisplayMode)
    DisplayMode seriesDisplayMode,

    @Default(DefaultUserSettings.authorDisplayMode)
    DisplayMode authorDisplayMode,

    @Default(DefaultUserSettings.startupNav) NavTarget startupNav,

    @Default(DefaultUserSettings.navLabelBehavior)
    NavigationDestinationLabelBehavior navLabelBehavior,

    @Default(DefaultUserSettings.dateTimeFormat) String dateTimeFormat,

    @Default('AtkinsonHyperlegibleNext') String? fontFamily,

    @Default(DefaultUserSettings.fontScale) double fontScale,

    @Default(DefaultUserSettings.skipForward) Duration skipForward,

    @Default(DefaultUserSettings.skipBackward) Duration skipBackward,

    @Default(DefaultUserSettings.speed) double speed,

    @Default(DefaultUserSettings.historyLimit) int historyLimit,

    @Default(DefaultUserSettings.downloadOnUnmeteredOnly)
    bool downloadOnUnmeteredOnly,

    @Default(DefaultUserSettings.showChapterPositionInHistory)
    bool showChapterPositionInHistory,

    @Default(DefaultUserSettings.useBinaryBytes) bool useBinaryBytes,

    @Default(DefaultUserSettings.minBufferDuration) Duration minBufferDuration,

    @Default(DefaultUserSettings.marqueeSpeed) double marqueeSpeed,

    @Default(DefaultUserSettings.rememberSort) bool rememberSort,

    @Default(DefaultUserSettings.librarySortAscending)
    bool librarySortAscending,

    @Default(DefaultUserSettings.authorSortAscending) bool authorSortAscending,

    @Default(DefaultUserSettings.seriesSortAscending) bool seriesSortAscending,

    @Default(DefaultUserSettings.audiobookSortValue)
    AudiobookSort audiobookSortValue,

    @Default(DefaultUserSettings.podcastSortValue) PodcastSort podcastSortValue,

    @Default(DefaultUserSettings.authorSortValue) AuthorSort authorSortValue,

    @Default(DefaultUserSettings.seriesSortValue) SeriesSort seriesSortValue,

    @Default(DefaultUserSettings.fadeOnSleep) bool fadeOnSleep,

    @Default(DefaultUserSettings.fadeOnSleepDuration)
    Duration fadeOnSleepDuration,

    @Default(DefaultUserSettings.fadeOnSleepMinVolume)
    double fadeOnSleepMinVolume,

    @Default(DefaultUserSettings.pinnedPlayerActions)
    List<FullPlayerActions> pinnedPlayerActions,

    @Default(DefaultUserSettings.scrollThumbVisibility)
    bool scrollThumbVisibility,

    @Default(DefaultUserSettings.scrollThumbDuration)
    Duration scrollThumbDuration,

    @Default(DefaultUserSettings.scrollThumbHeight) double scrollThumbHeight,

    @Default(DefaultUserSettings.scrollThumbWidth) double scrollThumbWidth,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
