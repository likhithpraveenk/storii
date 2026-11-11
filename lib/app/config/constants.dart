import 'package:material_ui/material_ui.dart' show Curves;

/// 0.001
const kEpsilon = 0.001;

/// 4.0
const kRadiusXs = 4.0;

/// 6.0
const kRadiusSm = 6.0;

/// 8.0
const kRadiusMd = 8.0;

/// 12.0
const kRadius = 12.0;

/// 16.0
const kRadiusLg = 16.0;

/// 24.0
const kRadiusXl = 24.0;

/// 100ms
const kDurationXs = Duration(milliseconds: 100);

/// 200ms
const kDurationSm = Duration(milliseconds: 200);

/// 300ms
const kDurationMd = Duration(milliseconds: 300);

/// 400ms
const kDurationLg = Duration(milliseconds: 400);

/// easeInOutCubic
const kCurveStandard = Curves.easeInOutCubic;

/// easeInOutCubicEmphasized
const kCurveEmphasized = Curves.easeInOutCubicEmphasized;

/// easeOutCubic
const kCurveDecelerate = Curves.easeOutCubic;

/// 0.5
const kBorderHairline = 0.5;

/// 4.0
const kSpacingXs = 4.0;

/// 8.0
const kSpacingSm = 8.0;

/// 16.0
const kSpacingMd = 16.0;

/// 24.0
const kSpacingLg = 24.0;

/// 32.0
const kSpacingXl = 32.0;

const imgSizeInMiniPlayer = 64.0;
const imgLeftPaddingInMiniPlayer = 8.0;
const maxImgSizeInFullPlayer = 480.0;

const appName = 'Storii';
const kMediaPlayer = '$appName just_audio';
const githubLink = 'https://github.com/likhithpraveenk/storii';
const githubIssueLink = '$githubLink/issues/new?template=bug_report.md';
const githubFeatureLink = '$githubLink/issues/new?template=feature_request.md';

const appIcon = 'assets/icons/icon.png';

const downloadsDir = 'downloads';
const audiobooksSubDir = 'audiobooks';
const podcastsSubDir = 'podcasts';
const coverName = 'cover.jpg';

// special symbols
const kDot = '\u2022';
const kSmallDot = '\u00B7';
const kMinus = '\u2212';
const kMultiple = '\u00D7';
const kNbsp = '\u00A0'; // non-breaking space

const speedMin = 0.5;
const speedMax = 3.0;
const speedStep = 0.05;
const speedPresets = [1.0, 1.25, 1.5, 1.75, 2.0];

/// sentinel for "use system font"
const systemFont = 'system';
