# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/2.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## Fixed

- Skip-back now restarts the chapter after 3 seconds instead of jumping to the start

## [v0.5.6] - 2026-07-15

### Added

- Customizable full player action buttons via "more"
- Scroll thumb customization
- Backup and restore of all accounts, settings and playback history

### Fixed

- Player stop with mini player dismiss race condition

## [v0.5.5] - 2026-07-09

### Changed

- refactored server connection into a single provider
- Minor UI fixes

## [v0.5.4] - 2026-07-08

### Added

- trust all certificates setting
- custom headers

## [v0.5.3] - 2026-07-07

### Added

- Scrollbar for episode list
- Sleep timer audio fade-out and customization options

### Fixed

- Episode list scroll lag
- Sleep timer persists off-screen

## [v0.5.2] - 2026-07-05

### Fixed

- Improve scrollbar and drag handling
- Podcast enclosure model updated

## [v0.5.1] - 2026-07-05

### Added

- "Latest" navigation button for recent episodes

### Changed

- Episode tile UI improvements

### Fixed

- Socket reconnection on connection status change

## [v0.5.0] - 2026-07-04

### Changed

- Refactored download storage to use safe ID-based paths with automatic migration from old paths

### Fixed

- Enable podcast episode downloads
- Local session offline progress restoration
- Show downloads in home screen when offline
- Item detail provider cache fallback

## [v0.4.8] - 2026-07-01

### Fixed

- Disable downloads for episodes
- Changed "not started" filter to "incomplete" for episodes
- Podcast episode published date now nullable
- Session sync and cleanup skipped when offline

## [v0.4.7] - 2026-06-30

### Added

- Support for downloading podcast episodes for offline playback
- Display queue position for pending downloads in the downloads list

### Fixed

- Download queue race condition
- Dismiss download notification on cancel
- Ensure downloads run and display in order based on queue time
- Scroll Position in bottom nav tabs is now saved
- Navigation tab reordering bug when dragging tiles down

## [v0.4.6] - 2026-06-27

### Added

- Custom app color with hex input and live preview
- Device colors selection
- Theme style selection (balanced, close match, vibrant, etc.)

## [v0.4.5] - 2026-06-26

### Added

- Podcast episode progress with mark complete and remove actions
- Episode play button with smart resume for podcasts

### Changed

- Logout and switch account moved to Settings with confirmation dialogs
- Show episode number badge on library cards
- Hide chapter position toggle for podcasts in history sheet
- Updated types of podcast metadata fields

### Fixed

- onClose callback on playback complete
- Instant dialog dismiss for episode play confirmation
- Series progress calculation for collapsed series in library

## [v0.4.5-beta.1] - 2026-06-26

### Fixed

- Crash parsing podcast metadata

## [v0.4.4] - 2026-06-25

### Fixed

- Sync playback position and index to OS media controls during playback

## [v0.4.3] - 2026-06-24

### Fixed

- Content padding to prevent overlap with Android navigation buttons
- Bottom padding in about screen
- Image sizing on smaller screens

## [v0.4.2] - 2026-06-22

### Added

- Library settings screen with "remember sort" toggle to persist sort

## [v0.4.1] - 2026-06-21

### Added

- Podcast episode metadata sheet with full details
- Episode progress percentage displayed inline in episode list tiles
- Play confirmation dialog when tapping an episode tile

### Changed

- Episode list tile simplified
- Hide action buttons for podcasts

## [v0.4.0] - 2026-06-20

### Added

- Can browse podcast libraries
- Podcast episode list with filter and sort within item detail screen

## [v0.3.0] - 2026-06-19

### Added

- Per-book speed is now persisted across sessions
- Marquee speed setting to control how fast scrolling title text animates

### Fixed

- Seeking to position from history sheet
- Force logout when wrong user is active
- Marquee scroll controller crash guard

## [v0.3.0-beta.2] - 2026-06-17

### Added

- Binary units for size display (B, KB, MB, GB)
- Audio tracks info sheet in item details
- User permissions handling (download button hidden when not permitted)
- Per-book speed setting (separate from global speed)
- Audio buffer configuration in player settings
- Server details in connection status

### Fixed

- Stream subscription cancellation
- Timer sync interval accuracy
- Marquee text display (scrolling title text)

## [v0.3.0-beta.1] - 2026-06-15

### Changed

- Refactored internal playback, storage, and provider layers with no user-facing changes

### Fixed

- Server not being deleted properly
- Search screen back arrow removed
- App initialization order (localizations before runApp)

## [v0.2.10] - 2026-06-06

### Added

- Chapter position display in playback history events

### Fixed

- Listen time accumulation (was rolling back instead of accumulating)

## [v0.2.9] - 2026-06-06

### Added

- Download notifications with foreground service

### Fixed

- Seek position accuracy
- Audio playback state updates
- Connection detail sheet title

## [v0.2.8] - 2026-05-18

### Added

- Volume slider control in the full player
- Separate sync interval setting for metered connections

### Fixed

- Playback state update synchronization
- Seeking within chapter boundaries
- Session cleanup when server returns 404

## [v0.2.7] - 2026-05-18

### Added

- Stats screen with listening statistics, streaks, and recent sessions
- Full metadata sheet for detailed media information
- Connection status icon in the UI
- Consistent app bar across screens
- Acknowledgments section in About screen
- HTTP logging toggle in settings

### Fixed

- Battery drain from excessive background operations

## [v0.2.6] - 2026-05-08

### Added

- Download queue with status tracking (downloading, completed, failed)
- Completed download tiles in downloads tab
- "Download only on unmetered networks" setting
- Download status badges on library items and tabs
- Offline playback for downloaded content

### Fixed

- Playback position resets when switching users/servers
- Downloaded items from different servers handled correctly
- Download pause delay
- Downloads tab syncing across sessions
- Stale library items after download cleanup

## [v0.2.5] - 2026-04-27

### Fixed

- App icon padding in launcher

## [v0.2.4] - 2026-04-26

### Added

- iOS platform support

### Changed

- New icon set

### Fixed

- Audio transcoding: audio sources now correctly selected based on MIME type

## [v0.2.3] - 2026-04-22

### Fixed

- Null values in media progress tracking

## [v0.2.2] - 2026-04-22

### Added

- Bug reporting with easy access from server list and logs screen
- Logs button for quick access to debug logs

### Fixed

- Duration error message display
- Old session cleanup

## [v0.2.1] - 2026-04-18

### Added

- New bottom sheet for chapter list
- Custom app dialog component

### Fixed

- Seek to correct time

## [v0.2.0] - 2026-04-17

### Added

- Downloads: download audiobooks for offline playback
- Download queue with status tracking
- Download button with progress indicators on library items
- Size information in media metadata
- Connection info display

### Fixed

- Local session not closing properly
- Error handling improvements across the app

## [v0.1.5] - 2026-04-10

### Added

- OAuth / OIDC authentication: sign in with OpenID Connect providers
- Custom login form for OAuth flow

### Fixed

- User login issue during OAuth flow

## [v0.1.5-beta.1] - 2026-04-08

### Added

- OAuth / OIDC authentication support

### Fixed

- User login issue during OAuth flow

## [v0.1.4] - 2026-04-03

### Added

- Seek to start button
- Play button loading state indicator

### Fixed

- Playback history not being saved
- Playback event synchronization
- Player stops when logging out

## [v0.1.3] - 2026-03-30

### Added

- Playback history: track what you have listened to, with a history button in the player

## [v0.1.2] - 2026-03-28

### Added

- Search: find content across your library
- Collapsible series filter
- Filter active indicator dot on library screens

## [v0.1.1] - 2026-03-24

### Added

- Sync interval setting (wheel picker)
- Startup navigation preference to choose which tab opens on launch
- Display mode setting (grid/list)
- Reorderable navigation tabs
- Clear app cache button

## [v0.1] - 2026-03-16

### Added

- Initial release: core Audiobookshelf streaming client
- Library browsing with tabs and filtering
- Full player with playback controls and mini player
- Series browsing and filtering
- Chapter support with skip functionality
- Skip interval settings
- Speed control
- Sleep timer
- User authentication
- Settings screen with user and player preferences
- Session management with server sync
- Media progress tracking across screens
- WebSocket sync for real-time updates
- Hive local storage for cache
- Shell route navigation
- Filter and sort buttons for library screens
- Custom fonts support
- Dynamic theme support

[Unreleased]: https://github.com/likhithpraveenk/storii/compare/v0.5.6...HEAD
[v0.5.6]: https://github.com/likhithpraveenk/storii/compare/v0.5.5...v0.5.6
[v0.5.5]: https://github.com/likhithpraveenk/storii/compare/v0.5.4...v0.5.5
[v0.5.4]: https://github.com/likhithpraveenk/storii/compare/v0.5.3...v0.5.4
[v0.5.3]: https://github.com/likhithpraveenk/storii/compare/v0.5.2...v0.5.3
[v0.5.2]: https://github.com/likhithpraveenk/storii/compare/v0.5.1...v0.5.2
[v0.5.1]: https://github.com/likhithpraveenk/storii/compare/v0.5.0...v0.5.1
[v0.5.0]: https://github.com/likhithpraveenk/storii/compare/v0.4.8...v0.5.0
[v0.4.8]: https://github.com/likhithpraveenk/storii/compare/v0.4.7...v0.4.8
[v0.4.7]: https://github.com/likhithpraveenk/storii/compare/v0.4.6...v0.4.7
[v0.4.6]: https://github.com/likhithpraveenk/storii/compare/v0.4.5...v0.4.6
[v0.4.5]: https://github.com/likhithpraveenk/storii/compare/v0.4.5-beta.1...v0.4.5
[v0.4.5-beta.1]: https://github.com/likhithpraveenk/storii/compare/v0.4.4...v0.4.5-beta.1
[v0.4.4]: https://github.com/likhithpraveenk/storii/compare/v0.4.3...v0.4.4
[v0.4.3]: https://github.com/likhithpraveenk/storii/compare/v0.4.2...v0.4.3
[v0.4.2]: https://github.com/likhithpraveenk/storii/compare/v0.4.1...v0.4.2
[v0.4.1]: https://github.com/likhithpraveenk/storii/compare/v0.4.0...v0.4.1
[v0.4.0]: https://github.com/likhithpraveenk/storii/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/likhithpraveenk/storii/compare/v0.3.0-beta.2...v0.3.0
[v0.3.0-beta.2]: https://github.com/likhithpraveenk/storii/compare/v0.3.0-beta.1...v0.3.0-beta.2
[v0.3.0-beta.1]: https://github.com/likhithpraveenk/storii/compare/v0.2.10...v0.3.0-beta.1
[v0.2.10]: https://github.com/likhithpraveenk/storii/compare/v0.2.9...v0.2.10
[v0.2.9]: https://github.com/likhithpraveenk/storii/compare/v0.2.8...v0.2.9
[v0.2.8]: https://github.com/likhithpraveenk/storii/compare/v0.2.7...v0.2.8
[v0.2.7]: https://github.com/likhithpraveenk/storii/compare/v0.2.6...v0.2.7
[v0.2.6]: https://github.com/likhithpraveenk/storii/compare/v0.2.5...v0.2.6
[v0.2.5]: https://github.com/likhithpraveenk/storii/compare/v0.2.4...v0.2.5
[v0.2.4]: https://github.com/likhithpraveenk/storii/compare/v0.2.3...v0.2.4
[v0.2.3]: https://github.com/likhithpraveenk/storii/compare/v0.2.2...v0.2.3
[v0.2.2]: https://github.com/likhithpraveenk/storii/compare/v0.2.1...v0.2.2
[v0.2.1]: https://github.com/likhithpraveenk/storii/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/likhithpraveenk/storii/compare/v0.1.5...v0.2.0
[v0.1.5]: https://github.com/likhithpraveenk/storii/compare/v0.1.5-beta.1...v0.1.5
[v0.1.5-beta.1]: https://github.com/likhithpraveenk/storii/compare/v0.1.4...v0.1.5-beta.1
[v0.1.4]: https://github.com/likhithpraveenk/storii/compare/v0.1.3...v0.1.4
[v0.1.3]: https://github.com/likhithpraveenk/storii/compare/v0.1.2...v0.1.3
[v0.1.2]: https://github.com/likhithpraveenk/storii/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/likhithpraveenk/storii/compare/v0.1...v0.1.1
[v0.1]: https://github.com/likhithpraveenk/storii/compare/3fd448b...v0.1
