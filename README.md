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
- Multi-user, multi-server and OIDC support with persistent sessions
- Advanced library browsing with filters, sorting, and series grouping
- Supports downloads and offline sessions
- Responsive UI with reusable components across feature modules

## Demo

[Watch demo](https://youtube.com/shorts/ngYgcCmK-cE)

## Screenshots

| Library | Server |
|:--------|:-------|
| <img src="metadata/android/en-US/images/phoneScreenshots/1.jpg" width="300" alt="Storii library view showing audiobooks"> | <img src="metadata/android/en-US/images/phoneScreenshots/2.jpg" width="300" alt="Storii server connection screen"> |

| Home with Player | Now Playing |
|:-----------------|:------------|
| <img src="metadata/android/en-US/images/phoneScreenshots/3.jpg" width="300" alt="Storii home screen with mini player"> | <img src="metadata/android/en-US/images/phoneScreenshots/4.jpg" width="300" alt="Storii now playing screen with playback controls"> |

| Book Details | Series |
|:-------------|:-------|
| <img src="metadata/android/en-US/images/phoneScreenshots/5.jpg" width="300" alt="Storii audiobook detail screen with chapters"> | <img src="metadata/android/en-US/images/phoneScreenshots/6.jpg" width="300" alt="Storii series view listing related books"> |

| Settings | Appearance |
|:---------|:-----------|
| <img src="metadata/android/en-US/images/phoneScreenshots/7.jpg" width="300" alt="Storii application settings screen"> | <img src="metadata/android/en-US/images/phoneScreenshots/8.jpg" width="300" alt="Storii appearance and theme settings"> |

## Roadmap

- Offline downloads for audiobooks  
- Podcast support  

## Tech Stack & Architecture

- Flutter (Dart) with feature-based modular architecture

- Riverpod for scalable state management

- Dio-based API layer with interceptors and endpoint abstraction

- Background audio handling with persistent playback state

- Local storage using Hive and secure storage for authentication

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a PR.

## Acknowledgements

Adapted and extended from the original [audiobookshelf_api](https://github.com/audiobookshelf-flutter/audiobookshelf_api), which provided the initial API structure.
Extended by migrating from http to Dio, adding interceptors and improved error handling.
Full credit to the original contributors for the foundation.

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
