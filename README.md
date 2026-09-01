<br />
<div align="center">
   <img alt="Storii banner" src="assets/banner.png" width="600">
</div>
<br />

# Storii

A Flutter client for <a href="https://github.com/advplyr/audiobookshelf">Audiobookshelf</a> focused on simple UX and maintainable architecture

![CI](https://github.com/likhithpraveenk/storii/actions/workflows/ci.yml/badge.svg?branch=main)
![Release Status](https://github.com/likhithpraveenk/storii/actions/workflows/release.yml/badge.svg)
[![RB Status](https://shields.rbtlog.dev/simple/com.likhithpraveenk.storii)](https://shields.rbtlog.dev/com.likhithpraveenk.storii)
![GitHub all releases](https://img.shields.io/github/downloads/likhithpraveenk/storii/total?logo=github&label=Github%20Downloads)
[![IzzyOnDroid Yearly Downloads](https://img.shields.io/badge/dynamic/json?url=https://dlstats.izzyondroid.org/iod-stats-collector/stats/basic/yearly/rolling.json&query=$.['com.likhithpraveenk.storii']&label=IzzyOnDroid%20Downloads&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAA4VBMVEXn9cuv7wDB9iGp4x2k5gKh3B6k3SyAxAGd4ASo6gCv5SCW2gHA7UTB6V+EwiOw3lK36zC+422d1yO78SWs3kfR7JhQiw2751G7+QCz8gCKzgGq3zay5DSm2jrF9jZLfwmNyiC77zXO7oaYzjW37CLj9Lze8LLA43uz3mK19ACR1QBcnRO78R6ExBek1kbE8FLI6nSPu0jH5YJxtQ2b1RiAmz53uwF7pitZkAeX1w7I72TY8KTO8HXD7La+0pKizWBzhExqjytpmR+UzSTA5Ctzy3uv1nOv3gyF3UuCsDRHcEx7M2pHAAAAS3RSTlP//////////////////////////////////////////////////////////////////////////////////////////////////wDLGfCsAAAB9ElEQVRIx72W53biMBCFhY0L7g0bTAktQEwgdMhuerbO+z/Q2sBiY0uKcvacnX8a3Y/R8YyuQPDJQP8KoExcro6ZC6C4TQXQx/oLABV3cfozgBgL/AWY9ScAsR7oBCD2AmSAoD8A+J3cWYECdBEaVm2z+U1hAuDx4fr6a08PGuuf6cmys5QvMEz0c12zhPWaAYBq9emp9/DlTrMUXsBOaw5Yjl5elrG+u9tYAxbAtjeL+Z3Wdl83Ovfr3BQyYAZBoLXbHDfQ2hykTSEAAIu+2LRcl4tD6UCm67jPCvD4/ON5YRhGpzOdrlar74fT5IcvOxDD0Xg0nvU7hjGVttv+0vYyAgyQdNgeey3Hce5DSZqN9GZmvzh8UO0F3thsiY4gqGoUtuL2AeaKpom5brVMryEKvCyXZVX0urd0wOxy4qwh8jxfLlcqZafpYoH0MzQGnNI/6CulOASFc/NWlZ17ADEG3oWjvn5TEvjbfJuyrnFaSfdyrK/f1Gp1tTAHF750aqgUJUCsr5UizFUv3EeQwmOFekmVmABDCiNVlqNwOwEqcM75vp+s/asrKpAmdxM/Gbnfuz0j8OYnPw2v9AqZ5Nt+f7hikwkw2T3Fc2l2jzdcst3DpwGCnvQ+EPUEu8c/STSAqMfZPeX5IQK0J+a//zn5MP4Am7ISN/4mSV8AAAAASUVORK5CYII=)](https://apt.izzysoft.de/packages/com.likhithpraveenk.storii)
[![Weblate project translated](https://img.shields.io/weblate/progress/storii?logo=weblate&logoColor=white)](https://hosted.weblate.org/engage/storii/)

### Download & Release Info

![F-Droid Version](https://img.shields.io/f-droid/v/com.likhithpraveenk.storii?logo=fdroid&color=blue&style=for-the-badge)
[![IzzyOnDroid Version](https://img.shields.io/f-droid/v/com.likhithpraveenk.storii?baseUrl=https://apt.izzysoft.de/fdroid&label=IzzyOnDroid&color=blue&style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAA4VBMVEXn9cuv7wDB9iGp4x2k5gKh3B6k3SyAxAGd4ASo6gCv5SCW2gHA7UTB6V+EwiOw3lK36zC+422d1yO78SWs3kfR7JhQiw2751G7+QCz8gCKzgGq3zay5DSm2jrF9jZLfwmNyiC77zXO7oaYzjW37CLj9Lze8LLA43uz3mK19ACR1QBcnRO78R6ExBek1kbE8FLI6nSPu0jH5YJxtQ2b1RiAmz53uwF7pitZkAeX1w7I72TY8KTO8HXD7La+0pKizWBzhExqjytpmR+UzSTA5Ctzy3uv1nOv3gyF3UuCsDRHcEx7M2pHAAAAS3RSTlP//////////////////////////////////////////////////////////////////////////////////////////////////wDLGfCsAAAB9ElEQVRIx72W53biMBCFhY0L7g0bTAktQEwgdMhuerbO+z/Q2sBiY0uKcvacnX8a3Y/R8YyuQPDJQP8KoExcro6ZC6C4TQXQx/oLABV3cfozgBgL/AWY9ScAsR7oBCD2AmSAoD8A+J3cWYECdBEaVm2z+U1hAuDx4fr6a08PGuuf6cmys5QvMEz0c12zhPWaAYBq9emp9/DlTrMUXsBOaw5Yjl5elrG+u9tYAxbAtjeL+Z3Wdl83Ovfr3BQyYAZBoLXbHDfQ2hykTSEAAIu+2LRcl4tD6UCm67jPCvD4/ON5YRhGpzOdrlar74fT5IcvOxDD0Xg0nvU7hjGVttv+0vYyAgyQdNgeey3Hce5DSZqN9GZmvzh8UO0F3thsiY4gqGoUtuL2AeaKpom5brVMryEKvCyXZVX0urd0wOxy4qwh8jxfLlcqZafpYoH0MzQGnNI/6CulOASFc/NWlZ17ADEG3oWjvn5TEvjbfJuyrnFaSfdyrK/f1Gp1tTAHF750aqgUJUCsr5UizFUv3EeQwmOFekmVmABDCiNVlqNwOwEqcM75vp+s/asrKpAmdxM/Gbnfuz0j8OYnPw2v9AqZ5Nt+f7hikwkw2T3Fc2l2jzdcst3DpwGCnvQ+EPUEu8c/STSAqMfZPeX5IQK0J+a//zn5MP4Am7ISN/4mSV8AAAAASUVORK5CYII=)](https://apt.izzysoft.de/fdroid/index/apk/com.likhithpraveenk.storii)
[![GitHub Version](https://img.shields.io/github/v/release/likhithpraveenk/storii.svg?logo=github&label=GitHub&color=blue&style=for-the-badge)](https://github.com/likhithpraveenk/storii/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=for-the-badge&logo=gnu)](https://www.gnu.org/licenses/gpl-3.0)

[<img src="assets/get-it-on-fdroid.png" alt="Get it on F-Droid" height="50">](https://f-droid.org/packages/com.likhithpraveenk.storii)
[<img src="assets/IzzyOnDroidButtonGreyBorder_nofont.png" alt="Get it on IzzyOnDroid" height="50">](https://apt.izzysoft.de/packages/com.likhithpraveenk.storii)
[<img src="assets/get_it_on_github_badge.png" alt="Get it on GitHub" height="50">](https://github.com/likhithpraveenk/storii/releases/latest)
[<img src="assets/badge_obtainium.png" alt="Get it on Obtainium" height="50">](https://apps.obtainium.imranr.dev/redirect.html?r=obtainium://add/https://github.com/likhithpraveenk/storii)

>  **Disclaimer:** This is an unofficial Audiobookshelf client. It is neither affiliated with nor endorsed by the Audiobookshelf project or its maintainers.

## Features

- Audiobooks & Podcasts streaming with background playback and progress sync
- Offline downloads - fully functional download manager with pause/resume, search, and sort
- Multi-user, multi-server and OIDC support with persistent sessions
- Personalized home shelves: continue listening, recent series, newest authors, etc.
- Advanced library browsing with filters, sorting, and series grouping
- Search across books, series, authors, narrators, tags, and genres
- Customizable player: sleep timer, speed control, seek buttons, chapter navigation, listening history, bookmarks, OS notification controls, and configurable skip-back after interruptions
- Playback queue: supporting collections & playlists
- Appearance settings: system/light/dark themes, dynamic colors, pure black mode, custom fonts, font scaling
- Navigation customization: reorder tabs, choose startup screen, label behavior
- Server admin tools (admin users): trigger library scans, re-scan/re-match items

## Demo

[Watch demo](https://youtube.com/shorts/ngYgcCmK-cE)

## Screenshots

|                                                                                                                         |                                                                                                                          |                                                                                                                      |                                                                                                                              |
| :---------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------: |
|   <img src="metadata/android/en-US/images/phoneScreenshots/1.jpg" width="200" alt="library view showing audiobooks">    | <img src="metadata/android/en-US/images/phoneScreenshots/5.jpg" width="200" alt="audiobook detail screen with chapters"> | <img src="metadata/android/en-US/images/phoneScreenshots/4.jpg" width="200" alt="series view listing related books"> | <img src="metadata/android/en-US/images/phoneScreenshots/2.jpg" width="200" alt="now playing screen with playback controls"> |
| <img src="metadata/android/en-US/images/phoneScreenshots/3.jpg" width="200" alt="now playing screen with big controls"> |     <img src="metadata/android/en-US/images/phoneScreenshots/6.jpg" width="200" alt="home screen with mini player">      |        <img src="metadata/android/en-US/images/phoneScreenshots/7.jpg" width="200" alt="appearance settings">        |          <img src="metadata/android/en-US/images/phoneScreenshots/8.jpg" width="200" alt="customization settings">           |

## Feature Comparison

| Feature                               | Storii | Official ABS app |
| ------------------------------------- | :----: | :--------------: |
| Audiobook & Podcast streaming         |   ✅   |        ✅        |
| Offline downloads                     |   ✅   |        ✅        |
| Sleep timer                           |   ✅   |        ✅        |
| Playback speed control                |   ✅   |        ✅        |
| Chapter navigation                    |   ✅   |        ✅        |
| Bookmarks                             |   ✅   |        ✅        |
| Multi-server support                  |   ✅   |        ✅        |
| Multi-user / OIDC                     |   ✅   |        ✅        |
| Library browsing (filter/sort/series) |   ✅   |        ✅        |
| Listening history                     |   ✅   |        ✅        |
| Custom themes & fonts                 |   ✅   |        ❌        |
| Dynamic colors (Material You)         |   ✅   |        ❌        |
| Navigation customization              |   ✅   |        ❌        |
| Collections / Playlists               |   ✅   |        ✅        |
| Equalizer                             |   💡   |        ❓        |
| Server management / admin             |   ⚠️   |        ❌        |
| eBook reader                          |   💡   |        ✅        |
| Chromecast                            |   💡   |        ✅        |
| Android Auto                          |   💡   |        ✅        |
| iOS support [^1]                      |   ⚠️   |        ✅        |
| Desktop apps                          |   💡   |        ❌        |

> ✅ Supported &nbsp; ❌ **Not** supported &nbsp; 🔜 Planned &nbsp; 💡 On Request &nbsp; ⚠️ Partial

[^1]: An IPA can be provided for sideloading. App Store version not planned

## Tech Stack

| Layer          | Technologies                                                 |
| -------------- | ------------------------------------------------------------ |
| **State**      | Riverpod                                                     |
| **Networking** | Dio (REST), Socket.IO (real‑time)                            |
| **Audio**      | just_audio, audio_service, audio_session                     |
| **Local Data** | Hive CE, Flutter Secure Storage                              |
| **Routing**    | GoRouter                                                     |
| **Code Gen**   | Freezed, json_serializable, riverpod_generator, build_runner |

## Acknowledgments

- **[Audiobookshelf](https://github.com/advplyr/audiobookshelf)**: The open-source, self-hosted audiobook and podcast server this app is built for
- **[Finamp](https://github.com/unicornsonlsd/finamp)**: Inspiration for settings architecture
- **[yaabsa](https://github.com/Vito0912/yaabsa)**: Bootstrapped the initial app structure

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a PR.

## Translations

Do you wish to use the app in your language? Help translate on [Weblate/Storii](https://hosted.weblate.org/engage/storii/).

[![Translation status](https://hosted.weblate.org/widget/storii/app/multi-auto.svg)](https://hosted.weblate.org/engage/storii/)

Thanks to [Weblate](https://weblate.org/) for making this project's translations possible through their free, libre hosting.

## License

[![GPLv3-or-later](https://www.gnu.org/graphics/gplv3-or-later.svg)](LICENSE.txt)

```txt
Storii - an Audiobookshelf client
Copyright (C) 2026 Likhith Praveen K

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.
```
