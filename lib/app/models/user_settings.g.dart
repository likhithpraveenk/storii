// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(
  Map<String, dynamic> json,
) => _UserSettings(
  userId: json['userId'] as String,
  currentLibrary: json['currentLibrary'] == null
      ? DefaultUserSettings.currentLibrary
      : Library.fromJson(json['currentLibrary'] as Map<String, dynamic>),
  navTargets:
      (json['navTargets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NavTargetEnumMap, e))
          .toList() ??
      DefaultUserSettings.navTargets,
  libraryDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['libraryDisplayMode']) ??
      DefaultUserSettings.libraryDisplayMode,
  collapseSeries:
      json['collapseSeries'] as bool? ?? DefaultUserSettings.collapseSeries,
  seriesDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['seriesDisplayMode']) ??
      DefaultUserSettings.seriesDisplayMode,
  authorDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['authorDisplayMode']) ??
      DefaultUserSettings.authorDisplayMode,
  startupNav:
      $enumDecodeNullable(_$NavTargetEnumMap, json['startupNav']) ??
      DefaultUserSettings.startupNav,
  navLabelBehavior:
      $enumDecodeNullable(
        _$NavigationDestinationLabelBehaviorEnumMap,
        json['navLabelBehavior'],
      ) ??
      DefaultUserSettings.navLabelBehavior,
  dateTimeFormat:
      json['dateTimeFormat'] as String? ?? DefaultUserSettings.dateTimeFormat,
  fontFamily: json['fontFamily'] as String? ?? 'AtkinsonHyperlegibleNext',
  fontScale:
      (json['fontScale'] as num?)?.toDouble() ?? DefaultUserSettings.fontScale,
  skipForward: json['skipForward'] == null
      ? DefaultUserSettings.skipForward
      : Duration(microseconds: (json['skipForward'] as num).toInt()),
  skipBackward: json['skipBackward'] == null
      ? DefaultUserSettings.skipBackward
      : Duration(microseconds: (json['skipBackward'] as num).toInt()),
  speed: (json['speed'] as num?)?.toDouble() ?? DefaultUserSettings.speed,
  historyLimit:
      (json['historyLimit'] as num?)?.toInt() ??
      DefaultUserSettings.historyLimit,
  downloadOnUnmeteredOnly:
      json['downloadOnUnmeteredOnly'] as bool? ??
      DefaultUserSettings.downloadOnUnmeteredOnly,
  showChapterPositionInHistory:
      json['showChapterPositionInHistory'] as bool? ??
      DefaultUserSettings.showChapterPositionInHistory,
  useBinaryBytes:
      json['useBinaryBytes'] as bool? ?? DefaultUserSettings.useBinaryBytes,
  minBufferDuration: json['minBufferDuration'] == null
      ? DefaultUserSettings.minBufferDuration
      : Duration(microseconds: (json['minBufferDuration'] as num).toInt()),
  marqueeSpeed:
      (json['marqueeSpeed'] as num?)?.toDouble() ??
      DefaultUserSettings.marqueeSpeed,
  rememberSort:
      json['rememberSort'] as bool? ?? DefaultUserSettings.rememberSort,
  librarySortAscending:
      json['librarySortAscending'] as bool? ??
      DefaultUserSettings.librarySortAscending,
  authorSortAscending:
      json['authorSortAscending'] as bool? ??
      DefaultUserSettings.authorSortAscending,
  seriesSortAscending:
      json['seriesSortAscending'] as bool? ??
      DefaultUserSettings.seriesSortAscending,
  audiobookSortValue:
      $enumDecodeNullable(_$AudiobookSortEnumMap, json['audiobookSortValue']) ??
      DefaultUserSettings.audiobookSortValue,
  podcastSortValue:
      $enumDecodeNullable(_$PodcastSortEnumMap, json['podcastSortValue']) ??
      DefaultUserSettings.podcastSortValue,
  authorSortValue:
      $enumDecodeNullable(_$AuthorSortEnumMap, json['authorSortValue']) ??
      DefaultUserSettings.authorSortValue,
  seriesSortValue:
      $enumDecodeNullable(_$SeriesSortEnumMap, json['seriesSortValue']) ??
      DefaultUserSettings.seriesSortValue,
  fadeOnSleep: json['fadeOnSleep'] as bool? ?? DefaultUserSettings.fadeOnSleep,
  fadeOnSleepDuration: json['fadeOnSleepDuration'] == null
      ? DefaultUserSettings.fadeOnSleepDuration
      : Duration(microseconds: (json['fadeOnSleepDuration'] as num).toInt()),
  fadeOnSleepMinVolume:
      (json['fadeOnSleepMinVolume'] as num?)?.toDouble() ??
      DefaultUserSettings.fadeOnSleepMinVolume,
);

Map<String, dynamic> _$UserSettingsToJson(
  _UserSettings instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'currentLibrary': ?instance.currentLibrary?.toJson(),
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'libraryDisplayMode': _$DisplayModeEnumMap[instance.libraryDisplayMode]!,
  'collapseSeries': instance.collapseSeries,
  'seriesDisplayMode': _$DisplayModeEnumMap[instance.seriesDisplayMode]!,
  'authorDisplayMode': _$DisplayModeEnumMap[instance.authorDisplayMode]!,
  'startupNav': _$NavTargetEnumMap[instance.startupNav]!,
  'navLabelBehavior':
      _$NavigationDestinationLabelBehaviorEnumMap[instance.navLabelBehavior]!,
  'dateTimeFormat': instance.dateTimeFormat,
  'fontFamily': ?instance.fontFamily,
  'fontScale': instance.fontScale,
  'skipForward': instance.skipForward.inMicroseconds,
  'skipBackward': instance.skipBackward.inMicroseconds,
  'speed': instance.speed,
  'historyLimit': instance.historyLimit,
  'downloadOnUnmeteredOnly': instance.downloadOnUnmeteredOnly,
  'showChapterPositionInHistory': instance.showChapterPositionInHistory,
  'useBinaryBytes': instance.useBinaryBytes,
  'minBufferDuration': instance.minBufferDuration.inMicroseconds,
  'marqueeSpeed': instance.marqueeSpeed,
  'rememberSort': instance.rememberSort,
  'librarySortAscending': instance.librarySortAscending,
  'authorSortAscending': instance.authorSortAscending,
  'seriesSortAscending': instance.seriesSortAscending,
  'audiobookSortValue': _$AudiobookSortEnumMap[instance.audiobookSortValue]!,
  'podcastSortValue': _$PodcastSortEnumMap[instance.podcastSortValue]!,
  'authorSortValue': _$AuthorSortEnumMap[instance.authorSortValue]!,
  'seriesSortValue': _$SeriesSortEnumMap[instance.seriesSortValue]!,
  'fadeOnSleep': instance.fadeOnSleep,
  'fadeOnSleepDuration': instance.fadeOnSleepDuration.inMicroseconds,
  'fadeOnSleepMinVolume': instance.fadeOnSleepMinVolume,
};

const _$NavTargetEnumMap = {
  NavTarget.home: 'home',
  NavTarget.latest: 'latest',
  NavTarget.library: 'library',
  NavTarget.series: 'series',
  NavTarget.downloads: 'downloads',
  NavTarget.collections: 'collections',
  NavTarget.authors: 'authors',
  NavTarget.more: 'more',
};

const _$DisplayModeEnumMap = {
  DisplayMode.listView: 'listView',
  DisplayMode.compact: 'compact',
  DisplayMode.comfortable: 'comfortable',
  DisplayMode.coverOnly: 'coverOnly',
};

const _$NavigationDestinationLabelBehaviorEnumMap = {
  NavigationDestinationLabelBehavior.alwaysShow: 'alwaysShow',
  NavigationDestinationLabelBehavior.alwaysHide: 'alwaysHide',
  NavigationDestinationLabelBehavior.onlyShowSelected: 'onlyShowSelected',
};

const _$AudiobookSortEnumMap = {
  AudiobookSort.title: 'title',
  AudiobookSort.authorName: 'authorName',
  AudiobookSort.authorNameLF: 'authorNameLF',
  AudiobookSort.addedAt: 'addedAt',
  AudiobookSort.publishedYear: 'publishedYear',
  AudiobookSort.size: 'size',
  AudiobookSort.duration: 'duration',
  AudiobookSort.fileBirthTime: 'fileBirthTime',
  AudiobookSort.fileModified: 'fileModified',
  AudiobookSort.progressLastUpdated: 'progressLastUpdated',
  AudiobookSort.progressStartedAt: 'progressStartedAt',
  AudiobookSort.progressFinishedAt: 'progressFinishedAt',
  AudiobookSort.random: 'random',
};

const _$PodcastSortEnumMap = {
  PodcastSort.addedAt: 'addedAt',
  PodcastSort.size: 'size',
  PodcastSort.birthTime: 'birthTime',
  PodcastSort.mtime: 'mtime',
  PodcastSort.author: 'author',
  PodcastSort.title: 'title',
  PodcastSort.numEpisodes: 'numEpisodes',
  PodcastSort.random: 'random',
};

const _$AuthorSortEnumMap = {
  AuthorSort.name: 'name',
  AuthorSort.lastFirst: 'lastFirst',
  AuthorSort.addedAt: 'addedAt',
  AuthorSort.updatedAt: 'updatedAt',
  AuthorSort.numBooks: 'numBooks',
};

const _$SeriesSortEnumMap = {
  SeriesSort.name: 'name',
  SeriesSort.addedAt: 'addedAt',
  SeriesSort.lastBookAdded: 'lastBookAdded',
  SeriesSort.lastBookUpdated: 'lastBookUpdated',
  SeriesSort.totalDuration: 'totalDuration',
  SeriesSort.numBooks: 'numBooks',
  SeriesSort.random: 'random',
};
