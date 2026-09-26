# PowerShell-MediaInfo

This product uses [MediaInfo](https://mediaarea.net/en/MediaInfo) library, Copyright (c) 2002-2026
[MediaArea.net SARL](mailto:info@mediaarea.net).

[MediaInfo](https://mediaarea.net/en/MediaInfo/Download) is a cross-platform tool used to view or extract the 
metadata (ID3/iTunes media data, Encoding information, etc.) of audio and video files.

## Licensing

This module's own code is licensed under the [MIT License](LICENSE).

MediaInfo is open-source software licensed under a [BSD-style license](https://mediaarea.net/en/MediaInfo/License)
and is available for free from [MediaArea](https://mediaarea.net/en/MediaInfo/Download). This module does
**not** bundle or redistribute MediaInfo. You install it separately, and the module calls the `mediainfo`
executable on your PATH. For attribution, the following files are included with this module:

- [MEDIAINFO_LICENSE](MEDIAINFO_LICENSE): the full MediaInfo(Lib) license, with its third-party library list and contributors.
- [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md): license texts and links for MediaInfo's dependencies (ZenLib, zlib, TinyXML-2, libcurl, libmms, Qt, wxWidgets).

## Installing the PowerShell Module
The po.MediaInfo PowerShell Module has only been tested with PowerShell 7.4 and above.

Install the po.MediaInfo PowerShell Module with PSResourceGet, which comes with PowerShell 7.4 and later:
```
Install-PSResource -Name po.MediaInfo -Repository PSGallery -Scope CurrentUser
```

Install the [PowerShell-Toolkit](https://github.com/seabopo/PowerShell-Toolkit) PowerShell Module, a dependency for po.MediaInfo.
```
Install-PSResource -Name po.Toolkit -Repository PSGallery -Scope CurrentUser
```

"Untrusted repository" prompt: PSGallery is untrusted by default. Add -TrustRepository to Install-PSResource to skip it.

Updating later: use Update-PSResource -Name po.MediaInfo.

## Installing MediaInfo

On MacOS you can download MediaInfo from the App store, or you can install it using Homebrew with the
following command:  
```
    $ brew install media-info
```

On Windows, the MediaInfo can be installed using Chocolatey with the
following command:  
```
    $ choco install mediainfo
```

Users of all operating systems can [download](https://mediaarea.net/en/MediaInfo/Download) the latest binary 
from the [MediaInfo project site](https://mediaarea.net/en/MediaInfo/).

When installing MediaInfo using Homebrew or Chocolatey the binary paths
will automatically be added to the operating system PATH environment variable.
If MediaInfo was installed manually you must add the path to the system
PATH environment variable for the PowerShell module to work.

Please note that this module is only tested against MediaInfo version 26.05.

For additional information see https://github.com/seabopo/PowerShell-MediaInfo

## Usage

See the files in the [sample-code](https://github.com/seabopo/PowerShell-MediaInfo/tree/main/sample-code) 
project directory for usage examples.
