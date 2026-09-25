# Third-Party Notices

The po.MediaInfo PowerShell module (Copyright (c) 2025 seabopo, MIT License, see `LICENSE`) is a
wrapper around the MediaInfo command-line application.

**This module does not include, bundle, or redistribute MediaInfo or any of its libraries.** You
install MediaInfo separately (Homebrew, Chocolatey, the App Store, or a direct download from
MediaArea), and the module calls the `mediainfo` executable found on your system PATH. The notices
below give attribution and tell you which licenses apply to the software this module depends on
at runtime.

This product uses [MediaInfo](https://mediaarea.net/en/MediaInfo) library, Copyright (c) 2002-2026
[MediaArea.net SARL](mailto:info@mediaarea.net).

| Component | Role | License | Upstream |
|-----------|------|---------|----------|
| MediaInfo (CLI) | Command-line application invoked by this module | BSD-2-Clause | https://github.com/MediaArea/MediaInfo |
| MediaInfoLib | Core metadata library used by MediaInfo | BSD-2-Clause | https://github.com/MediaArea/MediaInfoLib |
| ZenLib | Base classes library | zlib | https://github.com/MediaArea/ZenLib |
| zlib | gzip decompression (optional) | zlib | https://zlib.net/zlib_license.html |
| TinyXML-2 | XML parser (optional) | zlib | https://github.com/leethomason/tinyxml2 |
| libcurl | FTP, FTPS, SFTP, HTTP, HTTPS (optional) | curl (MIT-style) | https://curl.se/docs/copyright.html |
| libmms | MMS streaming (optional) | LGPL-2.1 | https://sourceforge.net/projects/libmms/ |
| Qt | GUI (optional, not used by the CLI) | LGPL-3.0 / GPL / commercial | https://doc.qt.io/qt-6/licensing.html |
| wxWidgets | GUI (optional, not used by the CLI) | wxWindows Library Licence | https://www.wxwidgets.org/about/licence/ |
| C++ standard library | Runtime (libstdc++, libc++, Visual C++, etc.) | Varies by platform | Provided by the OS or compiler toolchain |

Which optional libraries your MediaInfo build includes depends on how it was built and packaged.

---

## MediaInfo / MediaInfoLib

See [`MEDIAINFO_LICENSE`](MEDIAINFO_LICENSE) for the full MediaInfo(Lib) license as published at
https://mediaarea.net/en/MediaInfo/License. That file also has the alternate binary attribution
clause, the third-party library list, and the contributor list.

---

## ZenLib

```
Copyright (c) 2002-2025 MediaArea.net SARL. All rights reserved.

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.
```

---

## zlib

```
(C) 1995-2026 Jean-loup Gailly and Mark Adler

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

Jean-loup Gailly        Mark Adler
jloup@gzip.org          madler@alumni.caltech.edu
```

---

## TinyXML-2

```
Original code by Lee Thomason (www.grinninglizard.com)

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any
damages arising from the use of this software.

Permission is granted to anyone to use this software for any
purpose, including commercial applications, and to alter it and
redistribute it freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must
not claim that you wrote the original software. If you use this
software in a product, an acknowledgment in the product documentation
would be appreciated but is not required.

2. Altered source versions must be plainly marked as such, and
must not be misrepresented as being the original software.

3. This notice may not be removed or altered from any source
distribution.
```

---

## libcurl

```
COPYRIGHT AND PERMISSION NOTICE

Copyright (c) 1996 - 2026, Daniel Stenberg, <daniel@haxx.se>, and many
contributors, see the THANKS file.

All rights reserved.

Permission to use, copy, modify, and distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright
notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of a copyright holder shall not
be used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization of the copyright holder.
```

---

## libmms, Qt, wxWidgets

These are optional MediaInfo dependencies released under copyleft or GUI-toolkit licenses:
libmms under LGPL-2.1, Qt under LGPL-3.0/GPL/commercial, and wxWidgets under the wxWindows
Library Licence. This module does not redistribute them, and the Qt and wxWidgets GUI toolkits
are not used by the MediaInfo command-line application. For their license terms, see the
upstream links in the table above.
