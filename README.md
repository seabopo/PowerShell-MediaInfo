# PowerShell-MediaInfo

This PowerShell module uses [MediaInfo](https://mediaarea.net/en/MediaInfo) library, Copyright (c) 2002-2026 
[MediaArea.net SARL](info@mediaarea.net).

[MediaInfo](https://mediaarea.net/en/MediaInfo/Download) is a cross-platform tool used to view or extract the 
metadata (ID3/iTunes media data, Encoding information, etc.) of audio and video files.

This tool is open-source software [licensed under a BSD-style license)](https://mediaarea.net/en/MediaInfo/License)
and is available for free on [MediaInfo](https://mediaarea.net/en/MediaInfo/Download). A copy of this the 
MediaInfo license is included with this module.

```
MediaInfo License Disclaimer:

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
  - Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
  - Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

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
