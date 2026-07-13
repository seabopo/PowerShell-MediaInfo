# PowerShell-MediaInfo

This PowerShell module requires [MediaInfo](https://mediaarea.net/en/MediaInfo/Download) to be installed.

[MediaInfo](https://mediaarea.net/en/MediaInfo/Download) is a cross-platform tool used to view or extract the 
metadata (ID3/iTunes media data, Encoding information, etc.) of audio and video files.

This tool is open-source software [licensed under a BSD-style license)](https://mediaarea.net/en/MediaInfo/License)
and is available for free on [MediaInfo](https://mediaarea.net/en/MediaInfo/Download).

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
