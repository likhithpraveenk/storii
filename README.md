# Storii

A flutter client for [audiobookshelf](https://github.com/advplyr/audiobookshelf) focused on simple UX, and maintainable architecture.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0)
[![GitHub Version](https://img.shields.io/github/v/release/likhithpraveenk/storii.svg?logo=github&label=GitHub&style=for-the-badge)](https://github.com/likhithpraveenk/storii/releases)
[![IzzyOnDroid Version](https://img.shields.io/endpoint?url=https://apt.izzysoft.de/fdroid/api/v1/shield/com.likhithpraveenk.storii&label=IzzyOnDroid&style=for-the-badge)](https://apt.izzysoft.de/fdroid/index/apk/com.likhithpraveenk.storii)

[![Get it on GitHub](https://img.shields.io/badge/Get%20it%20on-GitHub-black?style=for-the-badge&logo=github)](https://github.com/likhithpraveenk/storii/releases/latest)
[<img src="https://gitlab.com/IzzyOnDroid/repo/-/raw/master/assets/IzzyOnDroidButtonGreyBorder_nofont.png" height="50" alt="Get it at IzzyOnDroid">](https://apt.izzysoft.de/packages/com.likhithpraveenk.storii)

![GitHub all releases](https://img.shields.io/github/downloads/likhithpraveenk/storii/total?logo=github)
[![IzzyOnDroid Monthly Downloads](https://img.shields.io/badge/dynamic/json?url=https://dlstats.izzyondroid.org/iod-stats-collector/stats/basic/monthly/rolling.json&query=$.['com.likhithpraveenk.storii']&label=IzzyOnDroid%20monthly%20downloads)](https://apt.izzysoft.de/packages/com.likhithpraveenk.storii)

## Features

- Audiobook streaming with background playback and progress sync
- **Offline downloads** - fully functional download manager with pause/resume and local playback
- Multi-user, multi-server and OIDC support with persistent sessions
- Personalized home shelves: continue listening, recent series, newest authors, etc.
- Advanced library browsing with filters, sorting, and series grouping
- Search across books, series, authors, narrators, tags, and genres
- Customizable player: sleep timer, speed control, seek buttons, chapter navigation, and listening history
- Appearance settings: system/light/dark themes, dynamic colors, pure black mode, custom fonts, font scaling
- Navigation customization: reorder tabs, choose startup screen, label behavior

> **Note:** Podcast support is not yet available.

## Demo

[Watch demo](https://youtube.com/shorts/ngYgcCmK-cE)

## Screenshots

| Library | Downloads |
|:--------|:-------|
| <img src="metadata/android/en-US/images/phoneScreenshots/1.jpg" width="300" alt="library view showing audiobooks"> | <img src="metadata/android/en-US/images/phoneScreenshots/9.jpg" width="300" alt="active downloads screen"> |

| Home with Player | Now Playing |
|:-----------------|:------------|
| <img src="metadata/android/en-US/images/phoneScreenshots/3.jpg" width="300" alt="home screen with mini player"> | <img src="metadata/android/en-US/images/phoneScreenshots/4.jpg" width="300" alt="now playing screen with playback controls"> |

| Book Details | Series |
|:-------------|:-------|
| <img src="metadata/android/en-US/images/phoneScreenshots/5.jpg" width="300" alt="audiobook detail screen with chapters"> | <img src="metadata/android/en-US/images/phoneScreenshots/6.jpg" width="300" alt="series view listing related books"> |

| Settings | Appearance |
|:---------|:-----------|
| <img src="metadata/android/en-US/images/phoneScreenshots/7.jpg" width="300" alt="settings screen"> | <img src="metadata/android/en-US/images/phoneScreenshots/8.jpg" width="300" alt="appearance and theme settings"> |

## Roadmap

- User stats
- Additional player enhancements (bookmarks, equalizer)
- Collections / playlists support
- Complete podcast playback and episode management

## Tech Stack

| Layer           | Technologies |
|-----------------|--------------|
| **State**       | Riverpod |
| **Networking**  | Dio (REST), Socket.IO (real‑time) |
| **Audio**       | just_audio, audio_service, audio_session |
| **Local Data**  | Hive CE, Flutter Secure Storage |
| **Routing**     | GoRouter |
| **Code Gen**    | Freezed, json_serializable, riverpod_generator, build_runner |

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a PR.

## License

Storii is licensed under the [GNU General Public License v3.0](LICENSE.txt).

    Storii
    Copyright (C) 2026 Likhith Praveen K

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
